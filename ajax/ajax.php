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
    $_html_status = '1';
}
$_POST = arr_filter($_POST); //簡易輸入過濾
$_type  = $_POST['_type']; //主執行case
$is_verify = $_MemberData['Company_Verify'] == $_POST['token'] ? true : false; //檢查token，是否從正常管道寄送資料
//判斷POST參數是否正確
if ($is_verify == false) {
    $_html_msg = '資料錯誤';
    $_html_status = '1';
} else {
    switch ($_type) {
        case 'employeeattend_save':
            $value['eid']       = $_POST['eid'];
            $value['employeid']       = $_POST['employeid'];
            $value['month']         = $_POST['month'];
            $value['niandu']         = $_POST['niandu'];
            //判斷POST參數是否正確
            foreach ($value as $key => $val) {
                if (empty($val)) {
                    $_html_msg = '資料錯誤';
                    $_html_status = '1';
                    break;
                }
            }
            if (empty($_html_msg)) {
                $value['absencename'] = $_POST['absencename'];
                $value['addofftime'] = $_POST['addofftime'];
                $value['addontime'] = $_POST['addontime'];
                $value['attendday'] = $_POST['attendday'];
                $value['attendname'] = $_POST['attendname'];
                $value['attendno'] = $_POST['attendno'];
                $value['isnearly'] = $_POST['isnearly'];
                $value['daka'] = $_POST['daka'];
                $value['jiabantime'] = $_POST['jiabantime'];
                $value['latemins'] = $_POST['latemins'];
                $value['memo'] = $_POST['memo'];
                $value['offtime'] = $_POST['offtime'];
                $value['ontime'] = $_POST['ontime'];
                $value['qingjiatime'] = $_POST['qingjiatime'];
                $value['restime1'] = $_POST['restime1'];
                $value['restime2'] = $_POST['restime2'];
                $value['worktime'] = $_POST['worktime'];
                $len = count($value['attendno']);
                for ($i = 0; $i < $len; $i++) {
                    //-----------------可先存至陣列的值--------------
                    $absencename =  $value['absencename'][$i];
                    $addofftime =  $value['addofftime'][$i];
                    $addontime =  $value['addontime'][$i];
                    $attendday =  $value['attendday'][$i];
                    $attendname =  $value['attendname'][$i];
                    $attendno =  $value['attendno'][$i];
                    $isnearly =  isset($value['isnearly'][$i]) ? '1' : '0';
                    $daka =  isset($value['daka'][$i]) ? '1' : '0';
                    $jiabantime =  $value['jiabantime'][$i];
                    $latemins =  $value['latemins'][$i];
                    $memo =  $value['memo'][$i];
                    $offtime =  $value['offtime'][$i];
                    $ontime =  $value['ontime'][$i];
                    $qingjiatime =  $value['qingjiatime'][$i];
                    $restime1 =  $value['restime1'][$i];
                    $restime2 =  $value['restime2'][$i];
                    $worktime =  $value['worktime'][$i];
                    //-----------------可先存至陣列的值--------------
                    $ea_data = array(
                        'ontime'                   => $ontime,
                        'offtime'                  => $offtime,
                        'attendno'                 => $attendno,
                        'attendname'               => $attendname,
                        'daka'                     => $daka,
                        'isnearly'                 => $isnearly,
                        'jiaritype'                => $attendday == '工作日' ? 0 : 1,
                        'jiabantime'               => $jiabantime,
                        'latemins'                 => $latemins,
                        'restime1'                 => $restime1,
                        'restime2'                 => $restime2,
                        'attendday'                => $attendday,
                        'memo'                     => $memo,
                        'qingjiatime'              => $qingjiatime,
                        'worktime'                 => $worktime,
                        'addontime'                => $addontime,
                        'addofftime'               => $addofftime,
                        'absencename'              => $absencename
                    );
                    $db2 = new MySQL();
                    $db2->Where = " WHERE  employeid = '" . $value['employeid'] . "' AND eid ='" . $value['eid'][$i] . "'";
                    $db2->query_sql($ea_db, '*');
                    if ($row = $db2->query_fetch()) {
                        $db2->query_data($ea_db, $ea_data, 'UPDATE');
                    }
                }
                $_html_status = '2';
                $_html_msg = '儲存成功';
            }
            break;
        case 'employeeattend_del':
            $value['employeid']       = $_POST['employeid'];
            $value['month']         = $_POST['month'];
            $value['niandu']         = $_POST['niandu'];
            //判斷POST參數是否正確
            foreach ($value as $key => $val) {
                if (empty($val)) {
                    $_html_msg = '資料錯誤';
                    $_html_status = '1';
                    break;
                }
            }
            if (empty($_html_msg)) {
                $ym = $value['month'] < 10 ? $value['niandu'] . '0' . $value['month'] : $value['niandu'] . $value['month'];
                $db2 = new MySQL();
                $db2->Where = " WHERE  employeid = '" . $value['employeid'] . "' AND ndyear ='" . $value['niandu'] . "' AND nddate BETWEEN '" . $ym . "00' AND '" . $ym . "31'";
                $db2->query_delete($ea_db);
                if (!empty($db->Error)) {
                    $_html_status = '1';
                    $_html_msg = '刪除失敗，請稍後嘗試';
                } else {
                    $_html_status = '2';
                    $_html_msg = '刪除成功';
                }
            }
            break;
        case 'employeeattend_search':
            $value['niandu']        = intval($_POST['niandu']);
            $value['eid']           = $_POST['eid'];
            //判斷POST參數是否正確
            foreach ($value as $key => $val) {
                if (empty($val)) {
                    $_html_msg = '資料錯誤';
                    $_html_status = '1';
                    break;
                }
            }

            if (empty($_html_msg)) {
                $employee = $CM->get_employee_data($value['eid']);
                $ea = $CM->get_employeeattend_list($employee['employid'], $value['niandu']);
                $attd_list = $CM->GET_ATTENDANCE_LIST();
                if (!empty($ea)) {
                    for ($i = 1; $i <= 12; $i++) { //1~12月
                        $j = $i < 10 ? '0' . $i : $i; //1~9月須於前方加上0
                        $arr_date = array_map(function ($v) {
                            global $j;
                            return date('m', strtotime($v['nddate2'])) == $j ? $v : null;
                        }, $ea);
                        $exist_date = array_filter($arr_date, function ($v) {
                            return !empty($v);
                        });
                        $date[$i] = $exist_date;
                    }
                    $date['attdlist'] = $attd_list;
                    $_html_content = $date;
                    $_html_status = '2';
                    $_html_msg = '取得成功';
                } else {
                    $_html_msg = '該年度尚未有任何資料';
                    $_html_status = '1';
                }
            }
            break;
        case 'employeeattend_generate':
            $value['start_eid']       = $_POST['start_eid'];
            $value['end_eid']         = $_POST['end_eid'];
            $value['gen_niandu']      = $_POST['gen_niandu'];
            $value['startdate']       = $_POST['startdate'];
            $value['enddate']         = $_POST['enddate'];
            //判斷POST參數是否正確
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
                $_html_status = '2';
                $_html_msg = '生成成功';
            }
            break;
        case 'employeeattend_attendswitch':
            $value['eid']           = intval($_POST['eid']);
            $value['attendno']     =  $_POST['attendno'];
            $value['employeid']    = $_POST['employeid'];
            //判斷POST參數是否正確
            foreach ($value as $key => $val) {
                if (empty($val)) {
                    $_html_msg = '資料錯誤';
                    $_html_status = '1';
                    break;
                }
            }

            if (empty($_html_msg)) {
                $employee = $CM->get_employee_data($value['employeid']);
                $ea = $CM->get_employeeattend_data($value['eid']);
                $ea = $CM->get_employeeattend_data($value['eid']);
                $attd = $CM->GET_ATTENDANCE_DATA($value['attendno']);
                if (!empty($ea)) {
                    $arr_week = array_map(function ($v) {
                        global $ea;
                        return $v['week'] == $ea['ndweektype'] ? $v : null;
                    }, $attd);
                    $exist_week = array_filter($arr_week, function ($v) {
                        return !empty($v);
                    });
                    foreach ($exist_week as $ew) {
                        $back_content = $ew;
                    }
                    $back_content['starttype'] = $employee['starttype'];
                    $_html_content =  $back_content;
                    $_html_status = '2';
                    $_html_msg = '取得成功';
                } else {
                    $_html_msg = '該班別尚未有任何資料';
                    $_html_status = '1';
                }
            }
            break;
    }
}

$json_array['html_msg']     = $_html_msg ? $_html_msg : ''; //訊息
$json_array['html_href']    = $_html_href ? $_html_href : ''; //連結
$json_array['html_status']  = $_html_status ? $_html_status : ''; //確定後要執行的JS
$json_array['html_content'] = $_html_content ? $_html_content : ''; //輸出內容

echo json_encode($json_array, 256);
