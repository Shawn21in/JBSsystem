<?php 
require_once(__DIR__.'/include/web.config.php');
//-----------------------------------------
//判斷目前是否為登入狀態，且判斷是否有使用該頁面的權限

if( $_Login ) {
	switch($_state){
		case 'company':
			JSAH("請切換成消費者帳號後再填問卷",'com_index.php');exit;
		break;
		case 'member':
		break;
		default:
			header("Location:index.php"); exit;
		break;
	}
}else{
	$_SESSION['BackUrl'] = "survey.php?c=".$_GET['c'];
	header("Location:login_customer.php"); exit;
}
$Input 	= GDC( $_GET['c'] , 'survey');
$verify = $Input['v'];
$survey 	= $CM->GET_SURVEY_DATA($verify);  //問卷資料
$sq_list 	= $CM->GET_SQ_LIST_DATA($verify); //問卷題目資料
$db 	= new MySQL();
$db->Where = " WHERE Company_ID='".$survey['Data']['Survey_CID']."'";
$db->query_sql($company_db, 'Company_Name,Company_CTEL');
if( $row = $db->query_fetch() ){
	$com_name = $row['Company_Name'];
	$com_ctel = $row['Company_CTEL'];
}
if(empty($survey['Data'])){
	JSAH('問卷不存在，將導回首頁','cust_index.php');
}
$start_date = $survey['Data']['Survey_Start_date'];
$end_date = $survey['Data']['Survey_End_date'];
if(strtotime($start_date)>strtotime('now')||strtotime($end_date)<strtotime('now')){
	JSAH('不好意思，目前問卷尚未開放！','cust_index.php');
}
$db->Where = " WHERE SR_MID='".$_MemberData['Member_ID']."' && SR_SID='".$verify."'";
$db->query_sql($sr_db, '*');
if( $row = $db->query_fetch() ){
	JSAH('你已經填過這份問卷囉！！將導回首頁','cust_index.php');
}
$coupon   = $CM->GET_COUPON_DATA($survey['Data']['Survey_Coup_ID']);
//-----------------------------------------

$_html 			= $CM->GET_WEB_SETTING( "Setting_Index01,Setting_Index02" );

$_currentNav = '0'; 
//-----------------------------SEO-------------------------------------------
$_setting_['WO_Keywords'] 		.= $_html['SEO']['WO_Keywords'];
$_setting_['WO_Description'] 	.= $_html['SEO']['WO_Description'];

$_setting_['WO_Keywords'] 		.= $_ProductList['SEO']['WO_Keywords'];
$_setting_['WO_Description'] 	.= $_ProductList['SEO']['WO_Description'];

$_setting_['WO_Keywords'] 		.= $_BannerList['SEO']['WO_Keywords'];
$_setting_['WO_Description'] 	.= $_BannerList['SEO']['WO_Description'];
//---------------------------------------------------------------------------

$_Title 	= '公版問卷';

?>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
	<?php require('head.php') ?>
	<link rel="stylesheet" type="text/css" href="stylesheets/index.css?v=<?=$version?>" />
	<link rel="stylesheet" href="stylesheets/css/afterlogin_cust/index.css">
	<link rel="stylesheet" href="stylesheets/css/afterlogin_cust/questionnaire.css">
	<link rel="stylesheet" href="stylesheets/css/afterlogin_cust/general.css">
	<link rel="stylesheet" href="stylesheets/css/afterlogin_cust/queries.css">
	<script src="https://unpkg.com/htmx.org@1.9.9" integrity="sha384-QFjmbokDn2DjBjq+fM+8LUIVrAgqcNW2s0PjAxHETgRn9l4fvX31ZxDxvwQnyMOX" crossorigin="anonymous"></script>
	<script
      type="module"src="https://unpkg.com/ionicons@5.4.0/dist/ionicons/ionicons.esm.js">
    </script>
    <script
      nomodule=""src="https://unpkg.com/ionicons@5.4.0/dist/ionicons/ionicons.js">
    </script>
</head>


	

<body>

	<?php require('cust_header.php') ?>
	<section class="sectionQuestionaire">

		<div class="questionnaireContainer" style="background-color:<?php echo $survey['Data']['Survey_Bg_Color']; ?>">
			<div class="questionnaireHeader">
				<div class="questionnaireHeaderBox">
					<img src="upload/userfiles/images/<?php echo $survey['Data']['Survey_Logo']; ?>" alt="logo圖" class="questionnaireLogo">
					<h2 class="questionnaireCompany">
						<!-- 公司  -->
						<?php echo $com_name; ?>公司
					</h2>
				</div>
				<h2 class="questionnaireTitle" style="color:<?php echo $survey['Data']['Survey_Title_Color']; ?>">
					<!-- 標題  -->
					<?php echo $survey['Data']['Survey_Title']; ?>
				</h2>
				<p class="questionnaireContent">
					<!-- 帶入副標題 -->
					<?php echo $survey['Data']['Survey_Subtitle']; ?>
				</p>
				<p class="questionnaireinfomaiton">
					<!-- 帶入問卷及折扣券使用資訊 -->
					<?php echo  $survey['Data']['Survey_Coup_Info']; ?>
				</p>
			</div>
			<form class="qusetionnaireBody" id="form1" method="post"  >
				<input type="hidden" name="surveyid" value="<?php echo $verify ?>">
				<input type="hidden" name="coupid" value="<?php echo $survey['Data']['Survey_CoupID']; ?>">
				<input type="hidden" name="qa_content" value="">
				<?php foreach($sq_list as $key => $value){ ?>
					<div class="questionBox">
						<p class="question"><?php echo $key.'.'.$value['SQ_Title'] ?></p>
						<?php $answer_json = json_decode($value['SQ_Content']); ?>

						<?php if($value['SQ_Type']=='radio'){ //答案類別為單選題?>
							<input name="question_number" type="hidden" value="<?php echo $value['SQ_ID']; ?>" data-intype="radio">
							<?php foreach($answer_json as $key2 => $value2){ ?>
								<div class="answerlist">
									<label class="container"><?php echo $value2; ?>
										<input type="radio" name="answer<?php echo $key; ?>"  value="<?php echo $value2; ?>">
										<span class="radiocheckmark questionnaiteradiockmark"></span>
									</label>
								</div>
							<?php } ?>

						<?php }elseif($value['SQ_Type']=='checkbox'){ //答案類別為多選題?>
							<input name="question_number" type="hidden" value="<?php echo $value['SQ_ID']; ?>" data-intype="checkbox">
							<?php foreach($answer_json as $key2 => $value2){ ?>
								<div class="answerlist">
									<label class="container"><?php echo $value2; ?>
										<input type="checkbox" name="answer<?php echo $key; ?>"  value="<?php echo $value2; ?>">
										<span class="checkmark"></span>
									</label>
								</div>
							<?php } ?>

						<?php }elseif($value['SQ_Type']=='select'){ //答案類別為下拉式選單?>
							<input name="question_number" type="hidden" value="<?php echo $value['SQ_ID']; ?>" data-intype="select">
							<div class="answerlist">
								<select class="questionaieSelect" name="answer<?php echo $key; ?>">
									<?php foreach($answer_json as $key2 => $value2){ ?>
											<option value="<?php echo $value2; ?>"><?php echo $value2; ?></option>
									<?php } ?>
								</select>
							</div>
						<?php } ?>	
					</div>
				<?php } ?>
			</form>
			<div class="questionaireFooter">
				<p class="questionnaireEnding">非常感謝您花時間填寫這份問卷，我們將以您的回饋為依據不斷改進服務品質。</p>
				<div class="questionaireFooterInfoBox">
					<!-- 帶入企業公司名稱 -->
					<span class="questionaireCompanyinfo"><?php echo $com_name; ?></span>
					<a href="<?php echo $survey['Data']['Survey_Link']; ?>" class="questionnairefooterLink">
						<!-- 帶入連結標題 -->
						<?php echo $survey['Data']['Survey_Link_Title']; ?>
					</a>
					<!-- 帶入公司電話 -->
					<span class="questionaireCompanyinfo">聯絡電話:<?php echo $com_ctel; ?></span>
				</div>
			</div>
		</div>

		<div class="centerBtnBox topspace">
			<!-- <a href="javascript:void(0)" class="prebtn">上一步</a> -->
			<a href="javascript:void(0)" class="nextbtn surveysubBtn" data-type="survey_submit">提交</a>
		</div>
	</section>
	<?php require('cust_footer.php') ?>
	</body>
</html>