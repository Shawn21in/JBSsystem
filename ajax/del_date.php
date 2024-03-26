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
$value['employeid']       = $_POST['employeid'];
$value['month']         = $_POST['month'];
$value['niandu']         = $_POST['niandu'];
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

$json_array['html_msg']     = $_html_msg ? $_html_msg : ''; //訊息
$json_array['html_href']    = $_html_href ? $_html_href : ''; //連結
$json_array['html_status']  = $_html_status ? $_html_status : ''; //確定後要執行的JS
$json_array['html_content'] = $_html_content ? $_html_content : ''; //輸出內容

echo json_encode($json_array, 256);
