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
				<section class="sectionMain sectionLogin">
					<div class="loginInputContainer">
						<img src="images/img/cidtlogoLogin.png" alt="企業logo" class="companyLoginLogo">
						<form class="inputContainerLogin" name="forms" id="forms" onSubmit="return false;">
							<div class="headtitleContainer loginheadtitleContainer">
								<a href="login.php" class="headerlogin ">
									<img src="images/img/Bcompanyicon.png" alt="企業的圖示icon" class="titleicon">
									企業登入
								</a>
								<a href="login_customer.php" class="headerlogin loginactive">
									<img src="images/img/customericon.png" alt="企業的圖示icon" class="titleicon">
									消費者登入
								</a>
							</div>
							<div class="inputBox">
								<div>
									<label class="label"><span class="impmark">*</span>帳號</label>
									<input type="text" class="input" placeholder="輸入電子信箱" name="login_acc">
								</div>
							</div>
							<div class="inputBox">
								<div>
									<label class="label"><span class="impmark">*</span>密碼</label>
									<input type="password" class="input" name="login_pwd">
								</div>
							</div>
							<div class="fotrgetLinkBox">
								<a href="forgot.php?i=cust" class="forgetLink">忘記密碼？</a>
							</div>
							<div class="btnBox btnBox2">
								<a href="signup_customer.php" class="signupBtn">註冊</a>
								<button href="#" class="mainButton fsubmit" data-type="member_login">登入</button>
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

</script>