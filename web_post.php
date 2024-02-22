<?php
require_once(__DIR__ . '/include/web.config.php');

if (!isset($_POST['_type'])) {

	header("Location:index.php");
	exit;
}

$json_array = array();

$_Type  = $_POST['_type']; //主執行case

$_POST = arr_filter($_POST); //簡易輸入過濾

ob_start();

if (!empty($_Type)) {

	$db 	= new MySQL();

	$Upload = new Upload();

	$sdate 	= date('Y-m-d H:i:s');

	switch ($_Type) {

			//帳號註冊-公司
		case "regist_com":
			$_html_msg = '';
			$_html_msg_array = array();
			$value = array();
			$Value['account'] 		= trim($_POST['account']); //名字
			$Value['password'] 		= trim($_POST['password']); //電話
			$Value['repassword'] 	= trim($_POST['repassword']); //電話
			$Value['Email'] 		= trim($_POST['email']); //信箱
			$Value['company_name'] 	= trim($_POST['com_name']);
			$Value['com_id'] 		= trim($_POST['com_id']);
			$Value['company_tel'] 	= trim($_POST['com_tel']);
			$Value['com_address']   = trim($_POST['com_address']);
			$Value['Verify'] 	= 'CT' . strtoupper(dechex(time()));
			foreach ($Value as $key => $val) {
				if (empty($val)) {
					array_push($_html_msg_array, '資料填寫不完整');
					break;
				}
			}
			if (!preg_match('/^[a-zA-Z0-9]{6,12}$/', $Value['account'])) {
				array_push($_html_msg_array, '帳號請輸入6~12位的英文加數字，請重新確認！');
			}
			if ($Value['password'] != $Value['repassword']) {
				array_push($_html_msg_array, '密碼與確認密碼不相同，請重新確認！');
			}
			if (!empty($_html_msg_array)) { //判斷資料完整度
				foreach ($_html_msg_array as $hma) {
					$_html_msg = $hma;
					break;
				}
			} else {
				$Value['agent_tel'] 	= trim($_POST['agent_tel']);
				$Value['agent_name']   	= trim($_POST['agent_name']);
				$Value['Plan']			= trim($_POST['Plan']);
				$Value['Pay_type']		= trim($_POST['Pay_Type']);
				$Value['Invoice_Address'] = trim($_POST['Invoice_Address']);
				$Value['Invoice_Type']  = trim($_POST['Invoice_Type']);
				$acc = $Value['account'];
				$email = $Value['Email'];
				$com_id = $Value['com_id'];
				$pwd = md5(Turnencode(trim($Value['password']), 'password'));
				$db->Where = " WHERE  Company_Acc = '" . $db->val_check($acc) . "' OR Company_email = '" . $db->val_check($email) . "' OR Company_EDITORIAL = '" . $db->val_check($com_id) . "' ";
				$db->query_sql($company_db, '*');
				if ($row = $db->query_fetch()) {
					$_html_msg = '經檢測，已發現有相同的資料，請重新檢查帳號、信箱和統編是否已經申請過';
					break;
				} else {
					$SN = date('Ymd');
					$SN = 'C' . substr($SN, -6);
					$Company_ID = GET_NEW_ID($company_db, 'Company_ID', $SN, 4);
					if (empty($Company_ID)) {
						$_html_msg 	= '企業編號取得失敗，請重新操作!';
						break;
					}
					$Indepflag = true;
					while ($Indepflag) {
						$Indep_SN = GET_RAND_ID(1, 'upper') . GET_RAND_ID(2, 'num');
						$db->Where = " WHERE  Company_IndepID = '" . $Indep_SN . "'";
						$db->query_sql($company_db, '*');
						if ($row = $db->query_fetch()) {
							$Indepflag = true;
						} else {
							$Indepflag = false;
						}
					}

					$db_data = array(
						'Company_ID'				=> $Company_ID,
						'Company_Acc'				=> $acc,
						'Company_PW' 				=> $pwd,
						'Company_NAME' 				=> $Value['company_name'],
						'Company_EDITORIAL'			=> $com_id,
						'Company_CTEL'				=> $Value['company_tel'],
						'Company_ADDRESS'			=> $Value['com_address'],
						'Company_PER'				=> $Value['agent_name'],
						'Company_TEL' 				=> $Value['agent_tel'],
						'Company_EMAIL' 			=> $Value['Email'],
						'Company_IndepID'			=> $Indep_SN,
						'Company_Plan'				=> $Value['Plan'],
						'Company_Pay_Type'			=> $Value['Pay_type'],
						'Company_Invoice_Address'	=> $Value['Invoice_Address'],
						'Company_Invoice_Type'		=> $Value['Invoice_Type'],
						'Company_Verify'			=> $Value['Verify'],
						'Company_NDATE'				=> $sdate
					);

					$db->query_data('web_company', $db_data, 'INSERT');
					if (!empty($db->Error)) {

						$_html_msg 	= '註冊失敗，請重新整理後再試試';
					} else {
						$FromName = !empty($_setting_['WO_SendName']) ? $_setting_['WO_SendName'] : '本網站';

						//收件人姓名 收件人信箱
						$mailto = array(
							$Value['Name'] => $Value['Email']
						);

						$sbody = get_MailBody('emailauth', $Value['Verify'] . '&type=company');


						//寄給客戶
						$Send_TF = SendMail($_setting_, '您在 ' . $FromName . ' 有進行企業註冊, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);

						$_html_msg 	= '註冊成功！請進行Email認證後開通';

						// if( !empty($_setting_['WO_Email']) ){

						// $mailto = array(
						// 	$FromName => $_setting_['WO_Email']
						// );
						// $sbody = get_MailBody('admin_contact',$Value['Verify']);

						// //寄給管理者
						// $Send_TF = SendMail($_setting_, '您有新的企業註冊, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);
						// }

						$_html_href = 'register_finish.php?c=' . OEncrypt('v=' . $Company_ID, 'register_finish');
					}
				}
			}
			break;

			//帳號註冊-消費者
		case "regist_cust":
			$_html_msg = '';
			$_html_msg_array = array();
			$value = array();
			$Value['reg_account'] 		= trim($_POST['reg_account']); //名字
			$Value['reg_password'] 		= trim($_POST['reg_password']); //電話
			$Value['reg_repassword'] 	= trim($_POST['reg_repassword']); //電話
			$Value['reg_email'] 		= trim($_POST['reg_email']); //信箱
			$Value['reg_name'] 			= trim($_POST['reg_name']);
			$Value['reg_tel'] 			= trim($_POST['reg_tel']);
			$Value['reg_city'] 			= trim($_POST['reg_city']);
			$Value['reg_county'] 		= trim($_POST['reg_county']);
			$Value['reg_sex'] 			= trim($_POST['reg_sex']);
			$Value['Verify'] 			= 'CT' . strtoupper(dechex(time()));
			foreach ($Value as $key => $val) {
				if (empty($val)) {
					array_push($_html_msg_array, '資料填寫不完整');
					break;
				}
			}
			if (!preg_match('/^[a-zA-Z0-9]{6,12}$/', $Value['reg_account'])) {
				array_push($_html_msg_array, '帳號請輸入6~12位的英文加數字，請重新確認！');
			}
			if ($Value['reg_password'] != $Value['reg_repassword']) {
				array_push($_html_msg_array, '密碼與確認密碼不相同，請重新確認！');
			}
			if (!empty($_html_msg_array)) { //判斷資料完整度
				foreach ($_html_msg_array as $hma) {
					$_html_msg = $hma;
					break;
				}
			} else {
				$acc = $Value['reg_account'];
				$email = $Value['reg_email'];
				$pwd = md5(Turnencode(trim($Value['reg_password']), 'password'));
				$db->Where = " WHERE  Member_Acc = '" . $db->val_check($acc) . "' OR Member_email = '" . $db->val_check($email) . "'";
				$db->query_sql($member_db, '*');
				if ($row = $db->query_fetch()) {
					$_html_msg = '經檢測，已發現有相同的資料，請重新檢查帳號是否已經申請過';
					break;
				} else {
					$SN = date('Ymd');
					$SN = 'M' . substr($SN, -6);
					$Member_ID = GET_NEW_ID($member_db, 'Member_ID', $SN, 4);
					if (empty($Member_ID)) {
						$_html_msg 	= '會員編號取得失敗，請重新操作!';
						break;
					}
					$_MemberData = array(
						'Member_ID'			=> $Member_ID,
						'Member_Acc'		=> $acc,
						'Member_Pwd' 		=> $pwd,
						'Member_Name' 		=> $Value['reg_name'],
						'Member_Email' 		=> $Value['reg_email'],
						'Member_Mobile'		=> $Value['reg_tel'],
						'Member_City'		=> $Value['reg_city'],
						'Member_County'		=> $Value['reg_county'],
						'Member_Sex'		=> $Value['reg_sex'],
						'Member_Open'		=> 0,
						'Member_Verify'		=> $Value['Verify'],
						'Member_Sdate'		=> date('Y-m-d H:i:s', time()), //$sdate
					);

					$db->query_data('web_member', $_MemberData, 'INSERT');
					if (!empty($db->Error)) {

						$_html_msg 	= '註冊失敗，請重新整理後再試試';
					} else {


						$FromName = !empty($_setting_['WO_SendName']) ? $_setting_['WO_SendName'] : '本網站';

						//收件人姓名 收件人信箱
						$mailto = array(
							$Value['Name'] => $Value['reg_email']
						);

						$sbody = get_MailBody('emailauth', $Value['Verify'] . '&type=member');


						//寄給客戶
						$Send_TF = SendMail($_setting_, '您在 ' . $FromName . ' 有進行會員註冊, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);

						$_html_msg 	= '註冊成功！請進行Email認證後開通';

						// if( !empty($_setting_['WO_Email']) ){

						// 	$mailto = array(
						// 		$FromName => $_setting_['WO_Email']
						// 	);
						// 	$sbody = get_MailBody('admin_contact',$Value['Verify']);

						// 	//寄給管理者
						// 	$Send_TF = SendMail($_setting_, '您有新的會員註冊, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);
						// }

						$_html_href = 'register_finish.php?c=' . OEncrypt('v=' . $Member_ID, 'register_finish');
					}
				}
			}
			break;

			//會員資料修改-公司
		case "com_edit":
			if ($_Login) {
				switch ($_state) {
					case 'company':
						break;
						break;
					case 'member':
						$_html_msg = '請先登入帳號！';
						$_html_href = "index.php";
						break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href = "index.php";
						break;
				}
			} else {
				$_html_msg = '請先登入帳號！';
				$_html_href = "index.php";
				break;
			}
			$_html_msg = '';
			$_html_msg_array = array();
			$value = array();
			$Value['account'] 		= trim($_POST['account']); //帳號
			$Value['Email'] 		= trim($_POST['email']); //信箱
			$Value['company_name'] 	= trim($_POST['com_name']);
			$Value['com_id'] 		= trim($_POST['com_id']);
			$Value['company_tel'] 	= trim($_POST['com_tel']);
			$Value['com_address']   = trim($_POST['com_address']);
			$Value['Verify'] 	= 'CT' . strtoupper(dechex(time()));
			foreach ($Value as $key => $val) {
				if (empty($val)) {
					array_push($_html_msg_array, '資料填寫不完整');
					break;
				}
			}
			$Value['password'] 			= md5(Turnencode(trim($_POST['password']), 'password'));
			$Value['repassword'] 		= md5(Turnencode(trim($_POST['repassword']), 'password'));
			if ($Value['password'] != $Value['repassword']) {
				array_push($_html_msg_array, '密碼與確認密碼不相同，請重新確認！');
			}
			if (!preg_match('/^[a-zA-Z0-9]{6,12}$/', $Value['account'])) {
				array_push($_html_msg_array, '帳號請輸入6~12位的英文加數字，請重新確認！');
			}
			$db->Where = " WHERE  Company_ID != '" . $_MemberData['Company_ID'] . "' AND (Company_Email='" . $db->val_check($Value['Email']) . "' OR Company_Acc='" . $db->val_check($Value['account']) . "' OR Company_EDITORIAL='" . $db->val_check($Value['com_id']) . "')";
			$db->query_sql($company_db, '*');
			if ($row = $db->query_fetch()) {
				array_push($_html_msg_array, '帳號、電子郵件或統編已經有其他帳號申請了，請重新更換一個！');
			}

			if (!empty($_html_msg_array)) { //判斷資料完整度
				foreach ($_html_msg_array as $hma) {
					$_html_msg = $hma;
					break;
				}
			} else {
				$Value['agent_tel'] 	= trim($_POST['agent_tel']);
				$Value['agent_name']   	= trim($_POST['agent_name']);
				$acc = $Value['account'];
				$email = $Value['Email'];
				$com_id = $Value['com_id'];
				$pwd = !empty($_POST['password']) ? $Value['password'] : $_MemberData['Company_PW'];
				$db->Where = " WHERE  Company_ID = '" . $_MemberData['Company_ID'] . "'";
				$db->query_sql($company_db, '*');
				if ($row = $db->query_fetch()) {
					$db_data = array(
						'Company_Acc' 				=> $Value['account'],
						'Company_PW' 				=> $pwd,
						'Company_NAME' 				=> $Value['company_name'],
						'Company_EDITORIAL'			=> $com_id,
						'Company_CTEL'				=> $Value['company_tel'],
						'Company_ADDRESS'			=> $Value['com_address'],
						'Company_PER'				=> $Value['agent_name'],
						'Company_TEL' 				=> $Value['agent_tel'],
						'Company_EMAIL' 			=> $Value['Email'],
						'Company_EDATE'				=> $sdate
					);
					$db->query_data('web_company', $db_data, 'UPDATE');
					if (!empty($db->Error)) {
						$_html_msg 	= '修改失敗，請重新整理後再試試';
					} else {
						$_html_msg 	= '修改成功！';
						$_html_href = 'com_profile.php';
					}
				}
			}
			break;
			//會員資料修改-消費者
		case "mem_edit":
			if ($_Login) {
				switch ($_state) {
					case 'company':
						$_html_msg = '請先登入帳號！';
						$_html_href = "index.php";
						break;
					case 'member':
						break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href = "index.php";
						break;
				}
			} else {
				$_html_msg = '請先登入帳號！';
				$_html_href = "index.php";
				break;
			}
			$_html_msg = '';
			$_html_msg_array = array();
			$value = array();
			$Value['email'] 	= trim($_POST['email']);
			$Value['acc'] 		= trim($_POST['acc']);
			$Value['name'] 		= trim($_POST['name']);
			$Value['mobile'] 	= trim($_POST['mobile']);
			$Value['sex'] 		= trim($_POST['sex']);
			$Value['city']   	= trim($_POST['city']);
			$Value['county']   	= trim($_POST['area']);
			foreach ($Value as $key => $val) {
				if (empty($val)) {
					array_push($_html_msg_array, '資料填寫不完整');
					break;
				}
			}
			$Value['password'] 			= md5(Turnencode(trim($_POST['password']), 'password'));
			$Value['repassword'] 		= md5(Turnencode(trim($_POST['repassword']), 'password'));
			if ($Value['password'] != $Value['repassword']) {
				array_push($_html_msg_array, '密碼與確認密碼不相同，請重新確認！');
			}
			if (!preg_match('/^[a-zA-Z0-9]{6,12}$/', $Value['acc'])) {
				array_push($_html_msg_array, '帳號請輸入6~12位的英文加數字，請重新確認！');
			}
			$db->Where = " WHERE  Member_ID != '" . $_MemberData['Member_ID'] . "' AND (Member_Email='" . $db->val_check($Value['email']) . "' OR Member_Acc='" . $db->val_check($Value['acc']) . "')";
			$db->query_sql($member_db, '*');
			if ($row = $db->query_fetch()) {
				array_push($_html_msg_array, '帳號或是電子郵件已經有其他帳號申請了，請重新更換一個！');
			}
			if (!empty($_html_msg_array)) { //判斷資料完整度
				foreach ($_html_msg_array as $hma) {
					$_html_msg = $hma;
					break;
				}
			} else {
				$pwd = !empty($_POST['password']) ? $Value['password'] : $_MemberData['Member_Pwd'];
				$db->Where = " WHERE  Member_ID = '" . $_MemberData['Member_ID'] . "'";
				$db->query_sql($member_db, '*');
				if ($row = $db->query_fetch()) {
					$db_data = array(
						'Member_Acc' 				=> $Value['acc'],
						'Member_Pwd' 				=> $pwd,
						'Member_Name' 				=> $Value['name'],
						'Member_Mobile' 			=> $Value['mobile'],
						'Member_Email' 				=> $Value['email'],
						'Member_Sex' 				=> $Value['sex'],
						'Member_City' 				=> $Value['city'],
						'Member_County' 			=> $Value['county'],
					);
					$db->query_data($member_db, $db_data, 'UPDATE');
					if (!empty($db->Error)) {
						$_html_msg 	= '修改失敗，請重新整理後再試試';
					} else {
						$_html_msg 	= '修改成功！';
						$_html_href = 'cust_profile.php';
					}
				}
			}
			break;
		case "plan_change":
			if ($_Login) {
				switch ($_state) {
					case 'company':
						break;
						break;
					case 'member':
						$_html_msg = '請先登入帳號！';
						$_html_href = "index.php";
						break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href = "index.php";
						break;
				}
			} else {
				$_html_msg = '請先登入帳號！';
				$_html_href = "index.php";
				break;
			}
			$_html_msg = '';
			$_html_msg_array = array();
			$value = array();
			$Value['invoice_address'] 	= trim($_POST['invoice_address']);
			foreach ($Value as $key => $val) {
				if (empty($val)) {
					array_push($_html_msg_array, '資料填寫不完整');
					break;
				}
			}
			if (!empty($_html_msg_array)) { //判斷資料完整度
				foreach ($_html_msg_array as $hma) {
					$_html_msg = $hma;
					break;
				}
			} else {
				$Value['invoice_type'] 		= trim($_POST['invoice_type']);
				$Value['plan'] 		= trim($_POST['plan']);
				$_CompanyPlanData = array(
					'CS_CID' 	 	 		=> $_MemberData['Company_ID'],
					'CS_Plan'	  	 		=> $Value['plan'],
					'CS_Invoice_type' 		=> $Value['invoice_type'],
					'CS_Invoice_Address' 	=> $Value['invoice_address'],
					'CS_Is_Pay' 			=> 0,
					'CS_Sdate' 	 			=> $sdate
				);
				$db->query_data($cs_db, $_CompanyPlanData, 'INSERT');
				if (!empty($db->Error)) {
					$_html_msg 	= '提交失敗，請稍等一下再提交!';
					break;
				} else {
					$_html_msg 	= '提交成功！';
					$_html_href = 'com_profile.php';
				}
			}
			break;

		case "msg_save":

			$_html_msg 	= '';
			$Value 		= array();

			$Value['Name'] 		= substr(trim($_POST['con_name']), 0, 30); //名字
			$Value['Tel'] 		= substr(trim($_POST['tel']), 0, 20); //電話
			$Value['Email'] 	= trim($_POST['email']); //信箱
			$Value['Content'] 	= trim($_POST['content']);
			$Value['Verify'] 	= 'CT' . strtoupper(dechex(time()));

			// $Value['formcodes'] 	= trim($_POST['formcodes']);
			//$formscode 			= $_SESSION[$_Website]['website']['formcode'];//驗證碼

			$_html_msg = '';
			/*
			if( strtolower($Value['formcodes']) != strtolower($formscode) || empty($Value['formcodes']) || empty($formscode) ){
				
				$_html_msg 	= '驗證碼錯誤';
				break;
			}
			*/
			foreach ($Value as $key => $val) {

				if (empty($val)) {

					$_html_msg 	= '資料填寫不完整';
					break;
				}
			}

			if (empty($_html_msg)) {

				$db_data = array(
					'CT_Name'		=> $Value['Name'],
					'CT_Tel' 		=> $Value['Tel'],
					'CT_Email' 		=> $Value['Email'],
					'CT_Content'	=> $Value['Content'],
					'CT_Verify'		=> $Value['Verify'],
					'CT_Sdate'		=> $sdate
				);

				$db->query_data('web_contact', $db_data, 'INSERT');

				if (!empty($db->Error)) {

					$_html_msg 	= '留言失敗, 請重新操作';
				} else {

					$FromName = !empty($_setting_['WO_SendName']) ? $_setting_['WO_SendName'] : '本網站';

					//收件人姓名 收件人信箱
					// $mailto = array(
					// 	$Value['Name'] => $Value['Email']
					// );

					// $sbody = get_MailBody('custom_contact',$Value['Verify']);


					//寄給客戶
					// $Send_TF = SendMail($_setting_, '您在 '.$FromName. ' 留言內容, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);

					$_html_msg 	= '留言成功， 我們會盡快與您聯絡';

					if (!empty($_setting_['WO_Email'])) {

						$mailto = array(
							$FromName => $_setting_['WO_Email']
						);
						$sbody = get_MailBody('admin_contact', $Value['Verify']);

						//寄給管理者
						$Send_TF = SendMail($_setting_, '您有新的留言內容, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);
					}
				}
			}

			$_html_href = 'contact.php';
			break;

		case "mlogin":


			$acc 		= $_POST['acc'];

			$pwd = md5(Turnencode(trim($_POST['pwd']), 'password'));
			//-----------------------CAPTCHA ------------------------------------
			$capcha = trim($_POST['capcha']);

			$formsigncode 	= trim($_POST['formsigncode']);

			if ($formsigncode != $_SESSION['website']['formsigncode'] || empty($formsigncode)) {

				$_html_msg 	= '驗證錯誤, 請重新操作';
				break;
			}

			if (empty($acc) || empty($pwd)) {

				$_html_msg 	= '帳號和密碼請勿空白, 請重新操作';
				break;
			}

			if ($capcha != $_SESSION['string']) {

				$_html_msg 	= '驗證碼錯誤, 請重新輸入';
				break;
			}
			//-----------------------recaptcha------------------------------------

			// if( 0 && !empty($_POST['recaptchaResponse']) ) {

			// 	$RC = new ReCaptcha();
			// 	$RC->Verify( $_POST['recaptchaResponse'] );

			// 	if( $RC->rs != "success" ) {

			// 		$_html_msg 	= '驗證碼連接失敗';
			// 		break;
			// 	}
			// }
			//-------------------------------------------------------------------

			ob_start();

			if (empty($_html_msg)) {

				$db->Where = " WHERE (BINARY Company_Acc = '" . $db->val_check($acc) . "' OR BINARY Company_Email = '" . $db->val_check($acc) . "') AND (BINARY Company_PW = '" . $db->val_check($pwd) . "' OR BINARY Company_RePwd = '" . $db->val_check($pwd) . "')";
				$db->query_sql($company_db, 'Company_Open, Company_ID, Company_Name');
				if ($row = $db->query_fetch()) {

					if ($row['Company_Open'] != 1) {

						$_html_msg 	= '帳號未啟用';
					} else {
						$db->query_data($company_db, array('Company_PW' => $pwd, 'Company_RePwd' => '', 'Company_Is_RePwd' => 0), 'UPDATE');
						$_html_msg 	= '歡迎 ' . $row['Company_Name'] . ' 回來';
						$_SESSION[$_Website]['website']['company_id']    = $row['Company_ID'];
						$_SESSION[$_Website]['website']['type']    = 'company';
						$_html_href = 'member.php';
					}
				} else {

					$_html_msg 	= '帳號或密碼輸入錯誤';
					$_html_eval = 'Reload()';
				}
			}


			ob_end_clean();


			break;

		case "fblogin":

			$id				= trim($_POST['id']); //FB的id
			$acc			= trim($_POST['email']);
			$email			= trim($_POST['email']);
			$name			= trim($_POST['name']);


			//--------------------------------------
			$_html_msg 		= '';
			$member_db 		= 'web_member';

			if (empty($id) || empty($acc)) {

				$_html_msg 	= 'FB登入失敗';
				break;
			}

			if ($acc == 'undefined') {

				$_html_msg 	= '請勾選提供電子郵件資訊， 如無法做修改， 請到facebook將應用程式移除， 再次登入。';
				break;
			}

			if (empty($_html_msg)) {

				$db = new MySQL();
				$db->Where = " WHERE Member_Acc = '" . $db->val_check($id) . "' AND Member_FBID = '" . $db->val_check($id) . "'";
				$db->query_sql($member_db, '*');

				//直接登入
				if ($row = $db->query_fetch()) {

					if ($row['Member_Open'] != 1) {

						$_html_msg 	= '帳號未啟用';
						break;
					} else {

						$_html_msg 	= '歡迎 ' . $row['Member_Name'] . ' 回來';
						$_SESSION[$_Website]['website']['member_id']    = $row['Member_ID'];
						$_SESSION[$_Website]['website']['member_name']  = $row['Member_Name'];

						$_html_href = 'index.php';
					}

					//第一次登入	
				} else {


					$SN = 'M' . substr(date('Ymd'), -6);
					$Member_ID = GET_NEW_ID($member_db, 'Member_ID', $SN, 4);

					if (empty($Member_ID)) {

						$_html_msg 	= '編號產生失敗，請重新操作。';
						break;
					}

					if (empty($_html_msg)) {

						$db = new MySQL();

						$db_data = array(
							'Member_ID'			=> $Member_ID,
							'Member_Acc'		=> $id,
							'Member_Pwd' 		=> $pwd,
							'Member_Name' 		=> $name,
							'Member_Email' 		=> $acc,
							'Member_Open'		=> 1,
							'Member_Sdate'		=> $sdate,
							'Member_FBID'		=> $id,
						);

						$db->query_data($member_db, $db_data, 'INSERT');

						if (!empty($db->Error)) {

							$_html_msg 	= '加入失敗, 請重新操作';
							break;
						} else {

							$_html_msg 	= '歡迎 ' . $name . ' 回來';
							$_SESSION[$_Website]['website']['member_id']    	= $Member_ID;
							$_html_href = 'index.php';
							break;
						}
					}
				}

				//撈購物車ID
				$ord_db = new MySQL();
				$ord_db->Where = "Where Ord_UID='" . $_SESSION[$_Website]['website']['member_id'] . "'";
				$ord_db->query_sql('web_ordert_sn', 'Ord_Sn');

				$Cust_Order_ID = $_SESSION[$_Website]['website']['order_Sn'];

				if ($ord_sn = $ord_db->query_fetch()) {

					$Old_Order_ID = $ord_sn['Ord_Sn'];

					//登入前購物車已有物品
					if (!empty($Cust_Order_ID)) {

						$db = new MySQL();
						$SC	= new ShopCart();
						//遊客ORDER
						$db->Where = " WHERE Ordertm_Sn = '" . $Cust_Order_ID . "'";
						$db->query_sql($SC->Tabletd, 'Product_ID,Ordertd_Count');

						while ($row = $db->query_fetch()) {

							$Pro_ID 	= $row['Product_ID'];
							$Pro_Count 	= $row['Ordertd_Count'];
							$SC->Check_OrderPro($Old_Order_ID, $Pro_ID, $Pro_Count, 'login'); //將遊客購物車存進原有購物車
						}
					}

					$_SESSION[$_Website]['website']['order_Sn'] = $Old_Order_ID;

					//會員無歷史購物車
				} else if (!empty($Cust_Order_ID)) {

					$db->Where = "Where Ord_Sn = '" . $Cust_Order_ID . "'";
					$db->query_data("web_ordert_sn", array('Ord_UID' => $_SESSION[$_Website]['website']['member_id']), 'UPDATE');
				}
			}
			break;


		case "mlogout":

			// unset($_SESSION[$_Website]['website']);

			$_html_msg 	= '成功登出，歡迎再次光臨。';
			$_html_href = 'index.php';

			break;

			//---會員資料修改
		case "member_edit":

			global $_MemberData;

			$_html_msg 			= '';
			$db 				= new MySQL();
			$Change_PWD 		= false;
			$Value 				= array();

			//-----------------------recaptcha------------------------------------

			if (!empty($_POST['recaptchaResponse'])) {

				$RC = new ReCaptcha();
				$RC->Verify($_POST['recaptchaResponse']);

				if ($RC->rs != "success") {

					$_html_msg 	= '驗證碼連接失敗';
					break;
				}
			}
			//-------------------------------------------------------------------

			if (!empty($_POST['memed_pwd']) && !empty($_POST['memed_repwd'])) {

				$Value['new_pwd'] 			= md5(Turnencode(trim($_POST['memed_pwd']), 'password'));
				$Value['new_repwd'] 		= md5(Turnencode(trim($_POST['memed_repwd']), 'password'));

				if ($Value['new_pwd'] != $Value['new_repwd']) {

					$_html_msg 	= '輸入之確認密碼與密碼不相同';
					break;
				}

				$Change_PWD 				= true;
			}


			$Value['Member_ID'] 		= trim($_MemberData['Member_ID']);
			$Value['member_name']		= trim($_POST['mem_name']);
			$Value['member_mobile'] 	= trim($_POST['mem_mobile']);
			$Value['member_city'] 		= trim($_POST['mem_city']);
			$Value['member_county'] 	= trim($_POST['mem_county']);
			$Value['member_address']	= trim($_POST['mem_address']);
			//$Value['formcodes'] 		= trim($_POST['formcodes']);
			//$formscode 					= $_SESSION[$_Website]['website']['formcode'];//驗證碼
			/*
			if( strtolower($Value['formcodes']) != strtolower($formscode) || empty($Value['formcodes']) || empty($formscode) ){
				
				$_html_msg 	= '驗證碼錯誤';
				break;
			}*/

			//判斷空值
			foreach ($Value as $key => $val) {

				if (empty($val)) {

					$_html_msg 	= '資料填寫不完全';
					break;
				}
			}

			if (empty($_html_msg)) {

				if ($Change_PWD) {

					$db_data = array(
						'Member_Pwd'		=> $Value['new_pwd'],
						'Member_Name'		=> $Value['member_name'],
						'Member_Mobile' 	=> $Value['member_mobile'],
						'Member_City' 		=> $Value['member_city'],
						'Member_County'		=> $Value['member_county'],
						'Member_Address'	=> $Value['member_address'],
						'Member_Edate'		=> $sdate,
					);
				} else {

					$db_data = array(
						'Member_Name'		=> $Value['member_name'],
						'Member_Mobile' 	=> $Value['member_mobile'],
						'Member_City' 		=> $Value['member_city'],
						'Member_County'		=> $Value['member_county'],
						'Member_Address'	=> $Value['member_address'],
						'Member_Edate'		=> $sdate,
					);
				}

				$db->Where = "Where Member_ID = '" . $db->val_check($Value['Member_ID']) . "'";
				$db->query_data($member_db, $db_data, 'UPDATE');

				if (!empty($db->Error)) {

					$_html_msg 	= '會員資料修改失敗, 請重新操作';
					break;
				} else {

					$_html_msg 	= '會員資料修改成功';
					$_html_href = 'member.php';
				}
			}

			break;

			//---匯款帳號回傳
		case "pay_dataUpdate":

			global $_setting_;

			$_html_msg 			= '';
			$db 				= new MySQL();
			$Value 				= array();

			$Value['pay_code'] 		= trim($_POST['pay_code']);
			$Value['pay_date'] 		= trim($_POST['pay_date']);
			$Value['oid'] 			= trim($_POST['oid']);


			foreach ($Value as $key => $val) {

				if (empty($val)) {

					$_html_msg 	= '資料填寫不完整';
					break;
				}
			}

			if (empty($_html_msg)) {

				$db_data = array(

					'Orderm_card5no' => $Value['pay_code'],
					'Orderm_payTime' => $Value['pay_date']
				);

				$db->Where = "Where Orderm_ID = '" . $db->val_check($Value['oid']) . "'";
				$db->query_data("web_ordermain", $db_data, 'UPDATE');

				if (!empty($db->Error)) {

					$_html_msg 	= '上傳失敗, 請重新操作';
				} else {

					$FromName = !empty($_setting_['WO_SendName']) ? $_setting_['WO_SendName'] : '本網站';

					$mailto = array(
						$FromName => $_setting_['WO_Email']
					);

					$sbody = '提醒您！您有一筆訂單已回填匯款帳號。';

					//寄給管理者
					$Send_TF = SendMail($_setting_, $sbody, $sbody, $mailto);

					$_html_eval = 'Reload()';
					$_html_msg 	= '匯款資訊更新成功';
				}
			}

			break;

			//---忘記密碼
		case "send_forget_pw":

			global $member_db, $_setting_;

			$Value 				= array();
			$_html_msg 			= '';

			//$Value['forgot_formcode'] 	= trim($_POST['forgot_formcode']);
			$Value['forgot_email'] 		= trim($_POST['forgot_email']);
			$Value['target']			= trim($_POST['target']);
			//$formscode 	= $_SESSION[$_Website]['website']['formcode'];//驗證碼	

			//-----------------------recaptcha------------------------------------

			if (!empty($_POST['recaptchaResponse'])) {

				$RC = new ReCaptcha();
				$RC->Verify($_POST['recaptchaResponse']);

				if ($RC->rs != "success") {

					$_html_msg 	= '驗證碼連接失敗';
					break;
				}
			}
			//-------------------------------------------------------------------


			//判斷空值
			foreach ($Value as $key => $val) {

				if (empty($val)) {

					$_html_msg 	= '資料填寫不完全';
					break;
				}
			}

			if (!empty($_html_msg)) break;
			/*
			if( strtolower($formscode) != strtolower($Value['forgot_formcode']) || empty($formscode) || empty($Value['forgot_formcode']) ){
				
				$_html_msg 	= '驗證碼錯誤';
				break;
			}*/
			switch ($Value['target']) {
				case "com":
					$db 				= new MySQL();
					$db->Where = "Where Company_Email ='" . $db->val_check($Value['forgot_email']) . "'";
					$db->query_sql($company_db, 'Company_ID,Company_Name');

					if ($row = $db->query_fetch()) {
						$re_pwd	     = rand(10000000, 99999999);
						$re_pwd_save = md5(Turnencode(trim($re_pwd), 'password'));
						$FromName = !empty($_setting_['WO_SendName']) ? $_setting_['WO_SendName'] : '本網站';

						//收件人姓名 收件人信箱
						$mailto = array(
							$row['Company_Name'] => $Value['forgot_email']
						);

						$sbody = get_MailBody('forgetpw_member_resend', $re_pwd);

						//寄給客戶
						$Send_TF = SendMail($_setting_, '【' . $FromName . ' 】 忘記密碼申請通知信。', $sbody, $mailto);

						if ($Send_TF) {

							$_html_msg 	= '申請成功，請至信箱查看。';

							$_html_href = 'login.php';
						} else {

							$_html_msg 	= '申請信寄送失敗，請確認EMAIL輸入正確。';
							$_html_href = 'forgot.php?i=' . $Value['target'];
						}
					} else {

						$_html_msg 	= '查無此信箱，請確認後再行輸入。';
						$_html_href = 'forgot.php?i=' . $Value['target'];
					}
					if ($Send_TF) {
						$db->Where = "Where Company_Email ='" . $db->val_check($Value['forgot_email']) . "'";
						$db->query_data($company_db, array('Company_RePwd' => $re_pwd_save, 'Company_Is_RePwd' => 1), 'UPDATE');
					}
					break;
				case "cust":
					$db 				= new MySQL();
					$db->Where = "Where Member_Email ='" . $db->val_check($Value['forgot_email']) . "'";
					$db->query_sql($member_db, 'Member_ID,Member_Name');

					if ($row = $db->query_fetch()) {
						$re_pwd	     = rand(10000000, 99999999);
						$re_pwd_save = md5(Turnencode(trim($re_pwd), 'password'));
						$FromName = !empty($_setting_['WO_SendName']) ? $_setting_['WO_SendName'] : '本網站';

						//收件人姓名 收件人信箱
						$mailto = array(
							$row['Member_Name'] => $Value['forgot_email']
						);

						$sbody = get_MailBody('forgetpw_member_resend', $re_pwd);

						//寄給客戶
						$Send_TF = SendMail($_setting_, '【' . $FromName . ' 】 忘記密碼申請通知信。', $sbody, $mailto);

						if ($Send_TF) {

							$_html_msg 	= '申請成功，請至信箱查看。';

							$_html_href = 'login.php';
						} else {

							$_html_msg 	= '申請信寄送失敗，請確認EMAIL輸入正確。';
							$_html_href = 'forgot.php?i=' . $Value['target'];
						}
					} else {

						$_html_msg 	= '查無此信箱，請確認後再行輸入。';
						$_html_href = 'forgot.php?i=' . $Value['target'];
					}
					if ($Send_TF) {
						$db->Where = "Where Member_Email ='" . $db->val_check($Value['forgot_email']) . "'";
						$db->query_data($member_db, array('Member_RePwd' => $re_pwd_save, 'Member_Is_RePwd' => 1), 'UPDATE');
					}
					break;
				default:
					$_html_msg 	= '資料異常，請確認後再行輸入';
					$_html_href = 'forgot.php?i=' . $Value['target'];
					break;
			}


			break;

		case "forget_pwedit":

			global $member_db;

			$Value = array();

			$Value['forgot_pwd'] 		= md5(Turnencode(trim($_POST['forgot_pwd']), 'password'));
			$Value['forgot_repwd'] 		= md5(Turnencode(trim($_POST['forgot_repwd']), 'password'));
			$Value['memID'] 			= trim($_POST['mem_id']);

			if ($Value['pwd'] != $Value['repwd']) {

				$_html_msg 	= '輸入之密碼不相同';
				break;
			}

			//判斷空值
			foreach ($Value as $key => $val) {

				if (empty($val)) {

					$_html_msg 	= '資料填寫不完全';
					break;
				}
			}

			$_html_msg 			= '';
			$db 				= new MySQL();

			if (empty($_html_msg)) {

				$db->Where = "Where Member_ID = '" . $Value['memID'] . "'";
				$db->query_data($member_db, array('Member_Pwd' => $Value['forgot_pwd']), 'UPDATE');

				if (!empty($db->Error)) {

					$_html_msg 	= '修改失敗, 請重新操作';
				} else {

					$_html_msg 	= '修改成功，請使用新密碼登入';
					$_html_href = 'login.php';
				}
			}

			break;

		case "hidden": //24hr不顯示

			$tomorrow = date('Y-m-d', strtotime('+1 days'));
			$sub = strtotime($tomorrow) - time(); //距離明天時間
			setcookie("hidden", "1", time() + $sub, '/');

			break;
	}
}

if ($_Type != 'mailauth') {

	$json_array['html_msg']     = $_html_msg ? $_html_msg : ''; //訊息
	$json_array['html_href']    = $_html_href ? $_html_href : ''; //連結
	$json_array['html_eval']    = $_html_eval ? $_html_eval : ''; //確定後要執行的JS
	$json_array['html_content'] = $_html_content ? $_html_content : ''; //輸出內容

	echo json_encode($json_array);
}
