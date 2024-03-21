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
$value['eid']             = $_POST['eid'];
$value['niadu']           = $_POST['niadu'];
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
    foreach ($value['eid'] as $vid) {
        $employee = $CM->get_employee_data($vid);
        $attdance = $CM->GET_ATTENDANCE_DATA($employee['presenttype']);
        $holidays = $CM->get_holidays_data($value['niadu']);
        for ($i = 0; $i <= $datelen; $i++) {
            //-----------------可先存至陣列的值--------------
            $attendno =  $employee['presenttype'];
            $attendname = $employee['presentname'];
            $nddate2 = date('Ymd', strtotime($sdate . ' +' . $i . ' day'));
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
            $md_nddate2 = date('md', strtotime($sdate . ' +' . $i . ' day')); //取這天的月日
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
                            if ($employee['starttype']) {
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
                            if ($employee['starttype']) {
                                $daka = 1;
                            }
                        }
                    }
                }
            }
            //-----------------計算班別、補班日--------------
            $ea_data = array(
                'employeid'                => $employee['employid'],
                'employename'              => $employee['employname'],
                'ndyear'                   => $value['niadu'],
                'ndyear2'                  => intval($value['niadu']) + 1911,
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
                'memo'                     => $memo
            );
            $db->query_data($ea_db, $ea_data, 'INSERT');
        }
    }
    $_html_status = '2';
    $_html_msg = '生成成功';
}

$json_array['html_msg']     = $_html_msg ? $_html_msg : ''; //訊息
$json_array['html_href']    = $_html_href ? $_html_href : ''; //連結
$json_array['html_status']  = $_html_status ? $_html_status : ''; //確定後要執行的JS
$json_array['html_content'] = $_html_content ? $_html_content : ''; //輸出內容

echo json_encode($json_array, 256);
