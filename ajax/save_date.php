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
$value['eid']       = $_POST['eid'];
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

$json_array['html_msg']     = $_html_msg ? $_html_msg : ''; //訊息
$json_array['html_href']    = $_html_href ? $_html_href : ''; //連結
$json_array['html_status']  = $_html_status ? $_html_status : ''; //確定後要執行的JS
$json_array['html_content'] = $_html_content ? $_html_content : ''; //輸出內容

echo json_encode($json_array, 256);
