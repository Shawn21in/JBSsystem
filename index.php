<?php 
require_once(__DIR__.'/include/web.config.php');
if( $_Login ) {
	switch($_state){
		case 'company':
			header("Location:com_index.php"); exit;
		break;
		case 'member':
			header("Location:cust_index.php"); exit;
		break;
	}
}
$_html 			= $CM->GET_WEB_SETTING( "Setting_Index01,Setting_Index02" );

//-----------------------------SEO-------------------------------------------
$_setting_['WO_Keywords'] 		.= $_html['SEO']['WO_Keywords'];
$_setting_['WO_Description'] 	.= $_html['SEO']['WO_Description'];

$_setting_['WO_Keywords'] 		.= $_ProductList['SEO']['WO_Keywords'];
$_setting_['WO_Description'] 	.= $_ProductList['SEO']['WO_Description'];

$_setting_['WO_Keywords'] 		.= $_BannerList['SEO']['WO_Keywords'];
$_setting_['WO_Description'] 	.= $_BannerList['SEO']['WO_Description'];
//---------------------------------------------------------------------------

$_Title 	= '首頁';
?>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
	<?php require('head.php') ?>
	<link rel="stylesheet" type="text/css" href="stylesheets/index.css?v=<?=$version?>" />
	<link rel="stylesheet" href="stylesheets/css/general.css">
	<link rel="stylesheet" href="stylesheets/css/style.css">
	<link rel="stylesheet" href="stylesheets/css/queries.css">
</head>


	

<body>
	<?php require('mobile_aside.php') ?>
		<div class="Wrapper">
			<div class="Wrapper__mask"></div>
			
			<?php //require('header.php') ?>
			<header>
				<div class="secondaryNav">
					<div class="secondaryNavBox">
						<a href="signup_customer.php" class="navlink">消費者註冊</a>
						<a href="signup.php" class="navlink">企業註冊</a>
						<a href="login.php" class="navlink">登入</a>
					</div>
				</div>
				<div class="navBox">
					<div class="Navcontainer">
						<div>
							<a href="index.php"><img src="images/img/Ai2BiLOGO.png" alt="logo" class="logo"></a>
							<div class="nav-toggle" id="navToggle">
								<img id="navClosed" class="navIcon" src="https://www.richardmiddleton.me/wp-content/themes/richardcodes/assets/img/hamburger.svg" alt="hamburger menu">
								<img id="navOpen" class="navIcon hidden" src="https://www.richardmiddleton.me/wp-content/themes/richardcodes/assets/img/close.svg" alt="close hamburger">
							</div>
						</div>
						<nav>
							<ul>
								<li><a href="#stepSection">功能介紹</a></li>
								<li><a href="#payment">價格方案</a></li>
								<li><a href="contact.php">聯絡我們</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="herosection">
					<div class="herocontainer">
						<img src="images/img/Portal.png" alt="手機app畫面與logo" class="banner">
						<div class="herocontent">
							<div>
								<ul class="herocontentList">
									<li><ion-icon name="checkmark-outline" class="checkmark"></ion-icon>市場洞察</li>
									<span>
										替企業找出路
									</span>
									<li><ion-icon name="checkmark-outline" class="checkmark"></ion-icon>經營精準</li>
									<span>
										替企業經營找方法
									</span>
									<li><ion-icon name="checkmark-outline" class="checkmark"></ion-icon>競爭力提升</li>
									<span>
										替企業了解目前經營盲點
									</span>
								</ul>
							</div>
							<span>
								Ai2Bi問卷洞察平台助力企業，深入了解客戶需求、提升產品品質，有效制定營銷策略，提升企業競爭力。
							</span>
							<div class="btnBox">
								<a href="signup.php" class="heroBtn">申請會員</a>
							</div>
						</div>
					</div>
					<h1 class="h1">革新問卷設計，<br>AI生成問卷平台助您輕鬆搞定!</h1>
				</div>
			</header>
			<section class="sectionFunction" id="stepSection">
				<div class="functionContainer">
					<div class="functionBox">
						<h2 class="functionTitle">・智慧生成問卷</h2>
						<p class="functionContent">借助先進的AI技術，我們的平台能夠根據您的需求智能生成問卷，節省您寶貴的時間。不再煩惱從零開始，只需幾個簡單的步驟，即可獲得專業而精準的問卷。</p>
					</div>
					<div>
						<img src="images/img/aisurvey.png" alt="ai生成問卷示意圖" class="functionImg">
					</div>
				</div>
				<div class="functionContainer functionContainerSec">
					<div>
						<img src="images/img/survey.png" alt="ai生成問卷示意圖" class="functionImg">
					</div>
					<div class="functionBox">
						<h2 class="functionTitle2">・提供多款公版問卷</h2>
						<p class="functionContent standardFunctionContent">不同於傳統問卷平台的固定模板，我們提供實用的問卷選項，讓您根據具體需求及使用情境使用。</p>
						<div class="functionTitle3Box">
							<h3 class="functionTitle3">服務滿意度</h3>
							<p class="functionContent3">顧客對產品與服務之滿意度</p>
						</div>
						<div class="functionTitle3Box">
							<h3 class="functionTitle3">客戶足跡調查</h3>
							<p class="functionContent3">顧客從何而來、何時來、怎麼來、內容偏好</p>
						</div>
						<div class="functionTitle3Box">
							<h3 class="functionTitle3">商業旅程調查</h3>
							<p class="functionContent3">商業旅程是指透過問卷中的前、中、後三大區塊，使企業經營者能全面了解客戶與企業互動的步驟和感知。商業旅程地圖有助於評估洞察報告、影響力、問題與機會的發現，並促使企業經營者優化預算、精力，以實現對客戶體驗的改變。</p>
						</div>
					</div>
				</div>
				<div class="functionContainer">
					<div class="functionBox">
						<h2 class="functionTitle">・折扣券發放</h2>
						<p class="functionContent">通過每次生成問卷，我們可以同時發布一張折扣券至平台，鼓勵參與問卷填寫的用戶前往各家店鋪，有效提升店家的曝光度。這個策略不僅激勵了用戶參與問卷，更成功的促使了店家之間的互通，為各家店鋪帶來了更多的機會與可見性。</p>
						<img src="images/img/coupon.png" alt="ai生成問卷示意圖" class="couponImg">
						<div class="decoLinkBox">
							<img src="images/img/decoline.png" alt="裝飾線條" class="decoline">
						</div>
					</div>
				</div>
			</section>
			<section class="Sectiondatainfo">
				<div class="functionContainer datainfoContainer">
					<div class="functionBox">
						<h2 class="functionTitle">・數據分析</h2>
					</div>
				</div>
				<div class="datainfoImgBox">
					<div>
						<img src="images/img/table1.png" alt="" class="datainfoImg">
					</div>
					<div>
						<img src="images/img/table2.png" alt="" class="datainfoImg">
					</div>
					<div>
						<img src="images/img/table3.png" alt="" class="datainfoImg">
					</div>
				</div>
				<div class="lineBox1"><div class="line1"></span></div>
				<div class="lineBox2"><span class="line1"></span></div>
			</section>
			<section class="Sectionpayment" id="payment">
				<div class="functionContainer paymentContainer">
					<div class="functionBox">
						<h2 class="functionTitle">・訂閱方案</h2>
					</div>
				</div>
				<div class="datainfoImgBox">
					<img src="images/img/payment1.png" alt="" class="datainfoImg">
					<img src="images/img/payment2.png" alt="" class="datainfoImg">
					<img src="images/img/payment3.png" alt="" class="datainfoImg">
				</div>
				<div class="btnBox">
					<a href="signup.php" class="heroBtn">立即註冊</a>
				</div>
			</section>
			<?php require('footer.php') ?>
		</div>
	</body>
	</script>
</html>