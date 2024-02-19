<?php 
require_once(__DIR__.'/include/web.config.php');

if( $_Login ) {
	
	header("Location:login.php"); exit;
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
						<img src="images/img/companyicon.png" alt="企業的圖示icon" class="titleicon">
						<h1 class="headtitle">企業註冊</h1>
					</div>
				</div>
				<div class="infomationContainer">
					<form id="form_com" onSubmit="return false;">
						<h2 class="secondaryTitle">公司資訊</h2>
						<div class="inputContainer">
							<div class="inputBox">
								<div>
									<label class="label"><span class="impmark">*</span>公司名稱</label>
									<input type="text" name="com_name" class="input check" maxlength="10"  placeholder="請輸入公司名稱(必填)" required>
								</div>
								<div>
									<label class="label"><span class="impmark">*</span>公司統編</label>
									<input type="text" name="com_id" class="input check"  maxlength="20"  placeholder="請輸入公司統編(必填)" required>								
								</div>
							</div>
							<div class="inputBox">
								<div>
									<label class="label"><span class="impmark">*</span>公司電話</label>
									<input type="text" name="com_tel" class="input check" maxlength="20" placeholder="請輸入公司電話(必填)" required>
								</div>
								<div>
									<label class="label"><span class="impmark">*</span>公司地址</label>
									<input type="text" name="com_address" class="input adressinput check" maxlength="60"  placeholder="請輸入公司地址(必填)" required>
								</div>
							</div>
							<div class="inputBox">
								<div>
									<label class="label">申請人姓名</label>
									<input type="text" name="agent_name" maxlength="10" class="input"  placeholder="申請人姓名">									
								</div>
								<div>
									<label class="label">申請人電話</label>
									<input type="text" name="agent_tel" maxlength="20" class="input"  placeholder="申請人電話">
								</div>
							</div>
						</div>
						<h2 class="secondaryTitle">平台資訊</h2>
						<div class="inputContainer">
							<div class="inputBox">
								<div>
									<label class="label"><span class="impmark">*</span>信箱</label>
									<input id="email" name="email" type="email" maxlength="68" class="input check" placeholder="請輸入信箱" required>
								</div>
								<p class="inputifo">需發送帳號開通設定資訊至信箱，請輸入正確的電子郵件</p>
							</div>
							<div class="inputBox">
								<div>
									<label class="label"><span class="impmark">*</span>帳號</label>
									<input type="text" name="account" maxlength="50" class="input check" oninput="value=value.replace(/[^\a-\z\A-\Z0-9]/g,'')"  placeholder="設定帳號" required>
								</div>
								<p class="inputifo">請輸入6~12位的英文加數字</p>
							</div>
							<div class="inputBox">
								<div>
									<label class="label"><span class="impmark">*</span>密碼</label>
									<input type="password" name="password" class="input check" placeholder="設定密碼" required>
								</div>
								<div>
									<label class="label"><span class="impmark">*</span>確認密碼</label>
									<input type="password" name="repassword" class="input check"  placeholder="確認密碼" required>
								</div>
							</div>
						</div>
						<div class="inputContainer">
							<h3 class="thirdTittle">方案</h3>
							<div class="inputBox radioBox">
								<div>
									<label class="container">單次計價方案
										<input type="radio" name="Plan" value="0" checked>
										<span class="radiocheckmark"></span>
									</label>
								</div>
								<div>
									<label class="container">月租基礎方案
										<input type="radio"	name="Plan" value="1">
										<span class="radiocheckmark"></span>
									</label>
								</div>
								<div>
									<label class="container">月租升級方案
										<input type="radio" name="Plan" value="2">
										<span class="radiocheckmark"></span>
									</label>
								</div>
							</div>
							<h3 class="thirdTittle">付款方式</h3>
							<div class="inputBox radioBox">
								<div>
									<label class="container">臨櫃匯款
										<input type="radio" name="Pay_Type" value="0" checked>
										<span class="radiocheckmark"></span>
									</label>
								</div>
							</div>
							<h3 class="thirdTittle">發票資訊</h3>
							<div class="inputBox">
								<div>
									<label class="container">二聯式發票
										<input type="radio" name="Invoice_Type" value="0" checked>
										<span class="radiocheckmark"></span>
									</label>
								</div>
								<div>
									<label class="container">三聯式發票
										<input type="radio" name="Invoice_Type" value="1">
										<span class="radiocheckmark"></span>
									</label>
								</div>
							</div>
							<div class="inputBox">
								<label class="label">發票寄送地址</label>
								<input type="text" class="input adressinput" maxlength="150" name="Invoice_Address">
							</div>
						</div>
						<div class="btnBox">
							<button type="button" class="mainButton registBtn" data-type="regist_com" href="#">註冊會員</button>
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