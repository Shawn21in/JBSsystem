<?php
require_once(dirname(__DIR__) . '/include/web.config.php');
//-----------------------------------------
$_html_href = '';
$_html_msg = '';
$_html_status = '';
$_html_content = '';
//判斷目前是否為登入狀態，且判斷是否有使用該頁面的權限
if (!$_Login) {
    $_html_msg =  "資料錯誤";
    $_html_status = '0';
}
$_POST = arr_filter($_POST); //簡易輸入過濾
$is_verify = $_MemberData['Company_Verify'] == $_POST['token'] ? true : false; //檢查token，是否從正常管道寄送資料
$value['start_eid']       = $_POST['start_eid'];
$value['end_eid']         = $_POST['end_eid'];
$value['gen_niandu']      = $_POST['gen_niandu'];
$value['startdate']       = $_POST['startdate'];
$value['enddate']         = $_POST['enddate'];
//判斷POST參數是否正確
if ($is_verify == false) {
    $_html_msg = '資料錯誤';
    $_html_status = '';
}
foreach ($value as $key => $val) {
    if (empty($val)) {
        $_html_msg = '資料錯誤';
        $_html_status = '1';
        break;
    }
}
$default = $_POST['default'];
$sdate = $value['startdate'];
$edate = $value['enddate'];
if (!strtotime($sdate) || !strtotime($edate) || strtotime($sdate) > strtotime($edate)) {
    $_html_msg = '資料錯誤';
    $_html_status = '1';
}
if (empty($_html_msg)) {
    $datelen = (strtotime($edate) - strtotime($sdate)) / (60 * 60 * 24);
    $employee_start = $CM->get_employee_data($value['start_eid']); //首個編號
    $employee_end = $CM->get_employee_data($value['end_eid']);     //最後編號
    $db->Where = " WHERE employid BETWEEN '" . $employee_start['employid'] . "' AND '" . $employee_end['employid'] . "'";
    $db->Order_By = "Order By employid asc";
    $db->query_sql($employee_db, '*');
    $employee_arr = array();
    while ($row = $db->query_fetch()) {
        $employee_arr[] = $row;
    }
    foreach ($employee_arr as $vid) {
        $attdance = $CM->GET_ATTENDANCE_DATA($vid['presenttype']);
        $holidays = $CM->get_holidays_data($value['gen_niandu']);
        $workday2 = $vid['workday2'];      //到職日
        $expireday2 =  $vid['expireday2'];   //離職日
        $workday2_st = strtotime($vid['workday2']);
        if ($vid['expireday2'] == '0000-00-00') {
            $expireday2_st = '';
        } else {
            $expireday2_st = strtotime($vid['expireday2']);
        }
        for ($i = 0; $i <= $datelen; $i++) {
            $cday_st =  strtotime($sdate . ' +' . $i . ' day');
            if ($cday_st < $workday2_st) {
                continue;
            }
            if ($expireday2_st && $cday_st > $expireday2_st) {
                continue;
            }
            //-----------------可先存至陣列的值--------------
            $attendno =  $vid['presenttype'];
            $attendname = $vid['presentname'];
            $nddate2 = date('Ymd', $cday_st);
            $nddate = $nddate2 - 19110000;
            $ontime = '';
            $offtime = '';
            $daka = 0;
            $jiaritype = 1;
            $restime1 = '';
            $restime2 = '';
            $attendday = '';
            $memo = '';
            //-----------------可先存至陣列的值--------------
            $md_nddate2 = date('md', $cday_st); //取這天的月日
            $int_ndweektype = date('w', strtotime($nddate2));
            //$week_states的 [7=>日]，但date函數為 [0=>日]。因此當date函數得出0時，自動轉換成7
            $ndweektype_id = $int_ndweektype == 0 ? 7 : $int_ndweektype;
            $ndweektype = $week_states[$ndweektype_id];
            if ($default) {   //如果選擇填入預設時間
                //-----------------計算國定假別--------------
                //計算該天是否有記錄在假別設定中
                $arr_holiday = array_map(function ($v) {
                    global $md_nddate2;
                    return $v['holiday'] == $md_nddate2 ? $v : null;
                }, $holidays);
                $exist_holiday = array_filter($arr_holiday, function ($v) {
                    return !empty($v);
                });
                if (!empty($exist_holiday)) {
                    foreach ($exist_holiday as $eh) {
                        $attendday = $eh['AttendDay'];
                        $memo = $eh['holidayName'];
                    }
                    if ($attendday == '工作日') {
                        $arr_day = array_map(function ($v) {
                            return $v['week'] == "一" ? $v : null;
                        }, $attdance);
                        $exist_day = array_filter($arr_day, function ($v) {
                            return !empty($v);
                        });
                        foreach ($exist_day as $ed) {
                            $ontime = $ed['ontime'];
                            $offtime = $ed['offtime'];
                            $restime1 = $ed['resttime1'];
                            $restime2 = $ed['resttime2'];
                            $jiaritype = 0;
                            if ($vid['starttype']) {
                                $daka = 1;
                            }
                        }
                    }
                }
                //-----------------計算國定假別(含補班日)--------------
                else
                //-----------------計算班別--------------
                {
                    $arr_day = array_map(function ($v) {
                        global $ndweektype;
                        return $v['week'] == $ndweektype ? $v : null;
                    }, $attdance);
                    $exist_day = array_filter($arr_day, function ($v) {
                        return !empty($v);
                    });
                    foreach ($exist_day as $ed) {
                        $attendday = $attendday == '' ? $ed['type'] : $attendday;
                        if ($attendday == '工作日') {
                            $ontime = $ed['ontime'];
                            $offtime = $ed['offtime'];
                            $restime1 = $ed['resttime1'];
                            $restime2 = $ed['resttime2'];
                            $jiaritype = 0;
                            if ($vid['starttype']) {
                                $daka = 1;
                            }
                        }
                    }
                }
            }
            //-----------------計算班別、補班日--------------
            $ea_data = array(
                'employeid'                => $vid['employid'],
                'employename'              => $vid['employname'],
                'ndyear'                   => $value['gen_niandu'],
                'ndyear2'                  => intval($value['gen_niandu']) + 1911,
                'ndweektype'               => $ndweektype,
                'nddate'                   => $nddate,
                'nddate2'                  => $nddate2,
                'ontime'                   => $ontime,
                'offtime'                  => $offtime,
                'attendno'                 => $attendno,
                'attendname'               => $attendname,
                'daka'                     => $daka,
                'jiaritype'                => $jiaritype,
                'restime1'                 => $restime1,
                'restime2'                 => $restime2,
                'attendday'                => $attendday,
                'memo'                     => $memo,
                'addontime'                => '',
                'addofftime'               => '',
                'absencename'              => ''
            );
            $db2 = new MySQL();
            $db2->Where = " WHERE  employeid = '" . $ea_data['employeid'] . "' AND nddate ='" . $nddate . "'";
            $db2->query_sql($ea_db, '*');
            if ($row = $db2->query_fetch()) {
                $db2->query_data($ea_db, $ea_data, 'UPDATE');
            } else {
                $db2->query_data($ea_db, $ea_data, 'INSERT');
            }
            // $db2->query_data($ea_db, $ea_data, 'INSERT');
        }
    }
    $_html_status = '1';
    $_html_msg = '生成成功';
}

$json_array['html_msg']     = $_html_msg ? $_html_msg : ''; //訊息
$json_array['html_href']    = $_html_href ? $_html_href : ''; //連結
$json_array['html_status']  = $_html_status ? $_html_status : ''; //確定後要執行的JS
$json_array['html_content'] = $_html_content ? $_html_content : ''; //輸出內容

echo json_encode($json_array, 256);
