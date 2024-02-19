<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1"  /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author"  content="華越資通,www.bm888.com.tw" />
<meta name="keywords" Lang="EN" content="<?=$_setting_['WO_Keywords']?>"/>
<meta name="keywords" Lang="zh-TW" content="<?=$_setting_['WO_Keywords']?>" />
<meta name="Description" Content="<?=$_setting_['WO_Description']?>"/>
<meta name="COPYRIGHT" content="Copyright (c) by 華越資通,www.bm888.com.tw">
<title><?=$_Title.' - '.$_setting_['WO_Title']?></title>
<meta name="apple-mobile-web-app-capable" content="yes" />
<link href="images/image/favicon.ico" rel="shortcut icon"/>

<meta property="og:title" content="<?=$_Title.' - '.$_setting_['WO_Title']?>">
<meta property="og:image" content="<?=$_setting_['title_Img']?>">
<!-- 多一個讓他傳網站形象圖片的欄位，如果那一頁沒有圖片可以抓的話，就抓這張網站形象圖-->
<meta property="og:description" content="<?=$_setting_['WO_Description']?>">
<meta property="og:type" content="website">


<!--日期行事曆插件-->
<!-- <link rel="stylesheet" href="js/bootstrap/3.2.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="js/datetimepicker/bootstrap-datetimepicker.min.css" /> -->
<!---->

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC:300,600" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="stylesheets/cssreset.css" /> -->
<script src="js/jquery-1.11.1.min.js"></script>



<!-- <link rel="stylesheet" type="text/css" href="stylesheets/base.css?v=<?=$version?>" /> -->
<?php require('style.php') ?>
<link rel="stylesheet" type="text/css" href="stylesheets/web-fonts-with-css/css/all.css" />
<script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>


<link rel="stylesheet" type="text/css" href="./slick/slick.css">
<link rel="stylesheet" type="text/css" href="./slick/slick-theme.css">
<script type="text/javascript" src="slick/slick.js"></script>

<script src="js/ani.js?v=<?=$version?>"></script>
<script src="js/web-main.js?v=<?=$version?>"></script>
<script src="js/web-cart.js?v=<?=$version?>"></script>
<script src="js/web-checkinput.js"></script>
<script src="js/jquery-loading.js"></script>
<script src="system/assets/jquery/jquery-address.js"></script>

<!--日期行事曆插件-->
<script type="text/javascript" src="js/datetimepicker/moment.min.js"></script>
<script type="text/javascript" src="js/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/datetimepicker/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="js/datetimepicker/locale/zh-tw.js"></script>
<!-- 彈窗 -->
<script src="system/plugins/AlertifyJS-master/build/alertify.min.js?v=<?=$version?>" ></script>
<link rel="stylesheet" href="system/plugins/AlertifyJS-master/build/css/alertify.min.css?v=<?=$version?>" />
<link rel="stylesheet" href="system/plugins/AlertifyJS-master/build/css/themes/default.min.css?v=<?=$version?>" />
<!---->
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-86884090-16"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-86884090-16');
</script>


<script type="application/ld+json">
{
  "@context": "http://schema.org",
  "@type": "Store",
  "url": "<?=WEB_URL?>",
  "name": "<?=$_setting_['WO_Title']?>",
  "description": "<?=$_setting_['WO_Description']?>",
  "image": {
        "@type": "ImageObject",
        "url": "<?=WEB_URL?>images\/logo.png"
    },
  "openingHours": "Mo-Fr 07:00-23:00",
  "priceRange" : "　",
  "email": "<?=$_setting_['WO_Email']?>",
  "telephone": "<?=$_setting_['WO_Tel']?>",
  "address": "<?=$_setting_['WO_Zip']." ".$_setting_['WO_Addr'].$_setting_['WO_Addr1'].$_setting_['WO_Addr2']?>"

}
</script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
<script
      type="module"src="https://unpkg.com/ionicons@5.4.0/dist/ionicons/ionicons.esm.js">
    </script>
    <script
      nomodule=""src="https://unpkg.com/ionicons@5.4.0/dist/ionicons/ionicons.js">
    </script>
<script>
  var upload_files_ext_array = [<?php echo $upload_files_js; ?>];
  var upload_files_max_size = <?php echo $upload_files['max_size'] ;?>//KB
  </script>
<!--台灣城市選擇插件-->
<script src="js/twzipcode/twzipcode.min.js"></script><!--適用投放問卷插件-->
<script src="js/twzipcode/cust.twzipcode.min.js"></script><!--適用會員註冊插件-->
<!--彈跳視窗插件-->
<script src="js/sweetalert.js" ></script>
