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
$is_verify = $_MemberData['Company_Verify'] == $_POST['token'] ? true : false; //檢查token，是否從正常管道寄送資料
$value['niandu']        = intval($_POST['niandu']);
$value['eid']           = $_POST['eid'];
//判斷POST參數是否正確
if ($is_verify == false) {
    $_html_msg = '資料錯誤';
    $_html_status = '1';
}
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

$json_array['html_msg']     = $_html_msg ? $_html_msg : ''; //訊息
$json_array['html_href']    = $_html_href ? $_html_href : ''; //連結
$json_array['html_status']  = $_html_status ? $_html_status : ''; //確定後要執行的JS
$json_array['html_content'] = $_html_content ? $_html_content : ''; //輸出內容

echo json_encode($json_array, 256);
