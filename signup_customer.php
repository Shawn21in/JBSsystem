<?php 
require_once(__DIR__.'/include/web.config.php');

if( $_Login ) {
	
	header("Location:index.php"); exit;
}

require_once('plugins/line_login/config.php');

$Line = new LineController();

$Line_Url= $Line->lineLogin();//產生LINE登入連結


$_Title 	= "會員登入";
?>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
	<head>
		<?php require('head.php') ?>
		<link rel="stylesheet" type="text/css" href="stylesheets/layout.css?v=<?=$version?>" />
		<link rel="stylesheet" href="stylesheets/css/general.css">
		<link rel="stylesheet" href="stylesheets/css/signup.css">
		<link rel="stylesheet" href="stylesheets/css/queries.css">
		<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	</head>



	<body class="signupBody">
		<?php require('mobile_aside.php') ?>
		<div class="Wrapper">
			<div class="Wrapper__mask"></div>
			<?php require('header.php') ?>
				<section class="sectionMain">
					<div class="headtitleContainer">
						<div class="headtitleBox">
							<img src="images/img/customericon.png" alt="企業的圖示icon" class="titleicon">
							<h1 class="headtitle">消費者註冊</h1>
						</div>
					</div>
					<div class="infomationContainer">
						<form id="form_com" onSubmit="return false;">
							<h2 class="secondaryTitle">平台資訊</h2>
							<div class="inputContainer">
								<div class="inputBox">
									<div>
										<label class="label"><span class="impmark">*</span>信箱</label>
										<input id="email" name="reg_email" maxlength="68" type="email" class="input" placeholder="請輸入信箱">
									</div>
									<p class="inputifo">需發送帳號開通設定資訊至信箱，請輸入正確的電子郵件</p>
								</div>
								<div class="inputBox">
									<div>
										<label class="label"><span class="impmark">*</span>帳號</label>
										<input type="text" name="reg_account" maxlength="50" class="input" oninput="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')" placeholder="設定帳號">
									</div>
									<p class="inputifo">請輸入6~12位的英文加數字</p>
								</div>
								<div class="inputBox">
									<div>
										<label class="label"><span class="impmark">*</span>密碼</label>
										<input type="password" name="reg_password" class="input" placeholder="設定密碼">
									</div>
									<div>
										<label class="label"><span class="impmark">*</span>確認密碼</label>
										<input type="password" name="reg_repassword" class="input" placeholder="確認密碼">
									</div>
								</div>
							</div>
							<h2 class="secondaryTitle">個人資訊</h2>
							<div class="inputContainer">
								<div class="inputBox">
									<div>
										<label class="label"><span class="impmark">*</span>姓名</label>
										<input type="text" class="input check" maxlength="50" name="reg_name" data-name="姓名">
									</div>
									<div>
										<label class="label"><span class="impmark">*</span>電話</label>
										<input type="text" class="input check" maxlength="16" name="reg_tel" data-name="電話">
									</div>
								</div>
								<div class="inputBox radioBox genderBox">
									<label class="label"><span class="impmark">*</span>性別</label>
									<div>
										<label class="container">女性
											<input type="radio" name="reg_sex" value="女" checked>
											<span class="radiocheckmark"></span>
										</label>
									</div>
									<div>
										<label class="container">男性
											<input type="radio" name="reg_sex" value="男">
											<span class="radiocheckmark"></span>
										</label>
									</div>
								</div>
								<div class="inputBox"id="twzipcode">
									<label class="label"><span class="impmark">*</span>地區</label>
									<div data-role="county"></div>
									<div data-role="district"></div>
								</div>
							</div>
							<div class="btnBox">
								<button class="mainButton registBtn" data-type="regist_cust" href="#">註冊會員</button>
							</div>
						</form>
					</div>
				</section>
			<?php require('footer.php') ?>
			<?php /*$RC = new ReCaptcha(); echo $RC->Call_Init( "#recaptchaResponse" , "contact");*/ ?>
		</div>
		
	</body>
</html>
<script>

	$(document).ready(function() {
		
		$( ".login_formcode img" ).click(function(){
		
			$( this ).attr('src' , 'formcode/formcode.php');
		});
	});
	$(function(){
		$("#twzipcode").twzipcodeC({
			css: ["select","select"],
			countyName: 'reg_city',
			districtName: 'reg_county',
			zipcodeIntoDistrict: true
		});
	})
</script>