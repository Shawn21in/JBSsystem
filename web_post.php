<?php
require_once(__DIR__.'/include/web.config.php');

if(!isset($_POST['_type'])) {
	
	header("Location:index.php"); exit;
}

$json_array = array();
	
$_Type  = $_POST['_type'];//主執行case

$_POST = arr_filter($_POST);//簡易輸入過濾

ob_start();

if( !empty($_Type) ){
	
	$db 	= new MySQL();
	
	$Upload = new Upload();
	
	$sdate 	= date('Y-m-d H:i:s');
	
	switch( $_Type ){

		//帳號註冊-公司
		case "regist_com":
			$_html_msg = '';
			$_html_msg_array = array(); 
			$value = array();
			$Value['account'] 		= trim($_POST['account']);//名字
			$Value['password'] 		= trim($_POST['password']);//電話
			$Value['repassword'] 	= trim($_POST['repassword']);//電話
			$Value['Email'] 		= trim($_POST['email']);//信箱
			$Value['company_name'] 	= trim($_POST['com_name']);
			$Value['com_id'] 		= trim($_POST['com_id']);
			$Value['company_tel'] 	= trim($_POST['com_tel']);
			$Value['com_address']   = trim($_POST['com_address']);
			$Value['Verify'] 	= 'CT'.strtoupper(dechex(time()));
			foreach( $Value as $key => $val ){
				if( empty($val) ) {
					array_push($_html_msg_array,'資料填寫不完整');
					break;
				}
			}
			if(!preg_match('/^[a-zA-Z0-9]{6,12}$/',$Value['account'])){
				array_push($_html_msg_array,'帳號請輸入6~12位的英文加數字，請重新確認！');
			}
			if($Value['password']!=$Value['repassword']){
				array_push($_html_msg_array,'密碼與確認密碼不相同，請重新確認！');
			}
			if(!empty($_html_msg_array) ){ //判斷資料完整度
				foreach($_html_msg_array as $hma){
					$_html_msg = $hma;
					break;
				}
			}else{
				$Value['agent_tel'] 	= trim($_POST['agent_tel']);
				$Value['agent_name']   	= trim($_POST['agent_name']);
				$Value['Plan']			= trim($_POST['Plan']);
				$Value['Pay_type']		= trim($_POST['Pay_Type']);
				$Value['Invoice_Address'] = trim($_POST['Invoice_Address']);
				$Value['Invoice_Type']  = trim($_POST['Invoice_Type']);
				$acc = $Value['account'];
				$email = $Value['Email'];
				$com_id = $Value['com_id'];
				$pwd = md5(Turnencode(trim($Value['password'] ), 'password'));
				$db->Where = " WHERE  Company_Acc = '" .$db->val_check($acc). "' OR Company_email = '" .$db->val_check($email). "' OR Company_EDITORIAL = '" .$db->val_check($com_id). "' ";
				$db->query_sql($company_db, '*');
				if( $row = $db->query_fetch() ){
					$_html_msg = '經檢測，已發現有相同的資料，請重新檢查帳號、信箱和統編是否已經申請過';
					break;
				}else{
					$SN = date('Ymd');
					$SN = 'C'.substr($SN, -6);
					$Company_ID = GET_NEW_ID($company_db, 'Company_ID', $SN, 4);
					if( empty($Company_ID) ) {
						$_html_msg 	= '企業編號取得失敗，請重新操作!';
						break;
					}
					$Indepflag = true;
					while($Indepflag){
						$Indep_SN = GET_RAND_ID(1,'upper').GET_RAND_ID(2,'num');
						$db->Where = " WHERE  Company_IndepID = '" .$Indep_SN. "'";
						$db->query_sql($company_db, '*');
						if( $row = $db->query_fetch() ){
							$Indepflag = true;
						}else{
							$Indepflag = false;
						}
					}

					$db_data = array(
						'Company_ID'				=>$Company_ID,
						'Company_Acc'				=>$acc,
						'Company_PW' 				=>$pwd ,
						'Company_NAME' 				=>$Value['company_name'],
						'Company_EDITORIAL'			=>$com_id,
						'Company_CTEL'				=>$Value['company_tel'],
						'Company_ADDRESS'			=>$Value['com_address'],
						'Company_PER'				=>$Value['agent_name'],
						'Company_TEL' 				=>$Value['agent_tel'],
						'Company_EMAIL' 			=>$Value['Email'],
						'Company_IndepID'			=>$Indep_SN,
						'Company_Plan'				=>$Value['Plan'],
						'Company_Pay_Type'			=>$Value['Pay_type'],
						'Company_Invoice_Address'	=>$Value['Invoice_Address'],
						'Company_Invoice_Type'		=>$Value['Invoice_Type'],
						'Company_Verify'			=>$Value['Verify'],
						'Company_NDATE'				=>$sdate
					);
									
					$db->query_data('web_company', $db_data, 'INSERT');
					if( !empty($db->Error) ){
							
						$_html_msg 	= '註冊失敗，請重新整理後再試試';
					}else{
						$FromName = !empty($_setting_['WO_SendName']) ? $_setting_['WO_SendName'] : '本網站';
					
						//收件人姓名 收件人信箱
						$mailto = array(
							$Value['Name'] => $Value['Email']
						);
													
						$sbody = get_MailBody('emailauth',$Value['Verify'].'&type=company');
						

						//寄給客戶
						$Send_TF = SendMail($_setting_, '您在 '.$FromName. ' 有進行企業註冊, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);

						$_html_msg 	= '註冊成功！請進行Email認證後開通';
						
						// if( !empty($_setting_['WO_Email']) ){
							
							// $mailto = array(
							// 	$FromName => $_setting_['WO_Email']
							// );
							// $sbody = get_MailBody('admin_contact',$Value['Verify']);
						
							// //寄給管理者
							// $Send_TF = SendMail($_setting_, '您有新的企業註冊, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);
						// }
						
						$_html_href = 'register_finish.php?c='.OEncrypt('v='.$Company_ID , 'register_finish');
					}
				}
			}
		break;
		
		//帳號註冊-消費者
		case "regist_cust":
			$_html_msg = '';
			$_html_msg_array = array(); 
			$value = array();
			$Value['reg_account'] 		= trim($_POST['reg_account']);//名字
			$Value['reg_password'] 		= trim($_POST['reg_password']);//電話
			$Value['reg_repassword'] 	= trim($_POST['reg_repassword']);//電話
			$Value['reg_email'] 		= trim($_POST['reg_email']);//信箱
			$Value['reg_name'] 			= trim($_POST['reg_name']);
			$Value['reg_tel'] 			= trim($_POST['reg_tel']);
			$Value['reg_city'] 			= trim($_POST['reg_city']);
			$Value['reg_county'] 		= trim($_POST['reg_county']);
			$Value['reg_sex'] 			= trim($_POST['reg_sex']);
			$Value['Verify'] 			= 'CT'.strtoupper(dechex(time()));
			foreach( $Value as $key => $val ){
				if( empty($val) ) {
					array_push($_html_msg_array,'資料填寫不完整');
					break;
				}
			}
			if(!preg_match('/^[a-zA-Z0-9]{6,12}$/',$Value['reg_account'])){
				array_push($_html_msg_array,'帳號請輸入6~12位的英文加數字，請重新確認！');
			}
			if($Value['reg_password']!=$Value['reg_repassword']){
				array_push($_html_msg_array,'密碼與確認密碼不相同，請重新確認！');
			}
			if(!empty($_html_msg_array) ){ //判斷資料完整度
				foreach($_html_msg_array as $hma){
					$_html_msg = $hma;
					break;
				}
			}else{
				$acc = $Value['reg_account'];
				$email = $Value['reg_email'];
				$pwd = md5(Turnencode(trim($Value['reg_password'] ), 'password'));
				$db->Where = " WHERE  Member_Acc = '" .$db->val_check($acc). "' OR Member_email = '" .$db->val_check($email). "'";
				$db->query_sql($member_db, '*');
				if( $row = $db->query_fetch() ){
					$_html_msg = '經檢測，已發現有相同的資料，請重新檢查帳號是否已經申請過';
					break;
				}else{
					$SN = date('Ymd');
					$SN = 'M'.substr($SN, -6);
					$Member_ID = GET_NEW_ID($member_db, 'Member_ID', $SN, 4);
					if( empty($Member_ID) ) {
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
					if( !empty($db->Error) ){
							
						$_html_msg 	= '註冊失敗，請重新整理後再試試';
					}else{
						
						
						$FromName = !empty($_setting_['WO_SendName']) ? $_setting_['WO_SendName'] : '本網站';
					
						//收件人姓名 收件人信箱
						$mailto = array(
							$Value['Name'] => $Value['reg_email']
						);
													
						$sbody = get_MailBody('emailauth',$Value['Verify'].'&type=member');
						

						//寄給客戶
						$Send_TF = SendMail($_setting_, '您在 '.$FromName. ' 有進行會員註冊, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);

						$_html_msg 	= '註冊成功！請進行Email認證後開通';
						
						// if( !empty($_setting_['WO_Email']) ){
							
						// 	$mailto = array(
						// 		$FromName => $_setting_['WO_Email']
						// 	);
						// 	$sbody = get_MailBody('admin_contact',$Value['Verify']);
						
						// 	//寄給管理者
						// 	$Send_TF = SendMail($_setting_, '您有新的會員註冊, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);
						// }
						
						$_html_href = 'register_finish.php?c='.OEncrypt('v='.$Member_ID , 'register_finish');
					}
				}
			}
		break;

		//會員資料修改-公司
		case "com_edit":
			if( $_Login ) {
				switch($_state){
					case 'company':
					break;
					break;
					case 'member':
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
				}
			}else{
				$_html_msg = '請先登入帳號！';
				$_html_href ="index.php";
				break;
			}
			$_html_msg = '';
			$_html_msg_array = array(); 
			$value = array();
			$Value['account'] 		= trim($_POST['account']);//帳號
			$Value['Email'] 		= trim($_POST['email']);//信箱
			$Value['company_name'] 	= trim($_POST['com_name']);
			$Value['com_id'] 		= trim($_POST['com_id']);
			$Value['company_tel'] 	= trim($_POST['com_tel']);
			$Value['com_address']   = trim($_POST['com_address']);
			$Value['Verify'] 	= 'CT'.strtoupper(dechex(time()));
			foreach( $Value as $key => $val ){
				if( empty($val) ) {
					array_push($_html_msg_array,'資料填寫不完整');
					break;
				}
			}
			$Value['password'] 			= md5(Turnencode(trim($_POST['password']), 'password'));
			$Value['repassword'] 		= md5(Turnencode(trim($_POST['repassword']), 'password'));	
			if($Value['password']!=$Value['repassword']){
				array_push($_html_msg_array,'密碼與確認密碼不相同，請重新確認！');
			}
			if(!preg_match('/^[a-zA-Z0-9]{6,12}$/',$Value['account'])){
				array_push($_html_msg_array,'帳號請輸入6~12位的英文加數字，請重新確認！');
			}
			$db->Where = " WHERE  Company_ID != '" .$_MemberData['Company_ID']. "' AND (Company_Email='".$db->val_check($Value['Email'])."' OR Company_Acc='".$db->val_check($Value['account'])."' OR Company_EDITORIAL='".$db->val_check($Value['com_id'])."')";
			$db->query_sql($company_db, '*');
			if( $row = $db->query_fetch() ){
				array_push($_html_msg_array,'帳號、電子郵件或統編已經有其他帳號申請了，請重新更換一個！');
			}
			
			if(!empty($_html_msg_array) ){ //判斷資料完整度
				foreach($_html_msg_array as $hma){
					$_html_msg = $hma;
					break;
				}
			}else{
				$Value['agent_tel'] 	= trim($_POST['agent_tel']);
				$Value['agent_name']   	= trim($_POST['agent_name']);
				$acc = $Value['account'];
				$email = $Value['Email'];
				$com_id = $Value['com_id'];
				$pwd = !empty($_POST['password'])?$Value['password']:$_MemberData['Company_PW'];
				$db->Where = " WHERE  Company_ID = '" .$_MemberData['Company_ID']. "'";
				$db->query_sql($company_db, '*');
				if( $row = $db->query_fetch() ){
					$db_data = array(
						'Company_Acc' 				=>$Value['account'] ,
						'Company_PW' 				=>$pwd ,
						'Company_NAME' 				=>$Value['company_name'],
						'Company_EDITORIAL'			=>$com_id,
						'Company_CTEL'				=>$Value['company_tel'],
						'Company_ADDRESS'			=>$Value['com_address'],
						'Company_PER'				=>$Value['agent_name'],
						'Company_TEL' 				=>$Value['agent_tel'],
						'Company_EMAIL' 			=>$Value['Email'],
						'Company_EDATE'				=>$sdate
					);
					$db->query_data('web_company', $db_data, 'UPDATE');
					if( !empty($db->Error) ){	
						$_html_msg 	= '修改失敗，請重新整理後再試試';
					}else{
						$_html_msg 	= '修改成功！';
						$_html_href = 'com_profile.php';
					}
				}
			}
		break;
		//會員資料修改-消費者
		case "mem_edit":
			if( $_Login ) {
				switch($_state){
					case 'company':
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
					case 'member':
					break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
				}
			}else{
				$_html_msg = '請先登入帳號！';
				$_html_href ="index.php";
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
			foreach( $Value as $key => $val ){
				if( empty($val) ) {
					array_push($_html_msg_array,'資料填寫不完整');
					break;
				}
			}
			$Value['password'] 			= md5(Turnencode(trim($_POST['password']), 'password'));
			$Value['repassword'] 		= md5(Turnencode(trim($_POST['repassword']), 'password'));	
			if($Value['password']!=$Value['repassword']){
				array_push($_html_msg_array,'密碼與確認密碼不相同，請重新確認！');
			}
			if(!preg_match('/^[a-zA-Z0-9]{6,12}$/',$Value['acc'])){
				array_push($_html_msg_array,'帳號請輸入6~12位的英文加數字，請重新確認！');
			}
			$db->Where = " WHERE  Member_ID != '" .$_MemberData['Member_ID']. "' AND (Member_Email='".$db->val_check($Value['email'])."' OR Member_Acc='".$db->val_check($Value['acc'])."')";
			$db->query_sql($member_db, '*');
			if( $row = $db->query_fetch() ){
				array_push($_html_msg_array,'帳號或是電子郵件已經有其他帳號申請了，請重新更換一個！');
			}
			if(!empty($_html_msg_array) ){ //判斷資料完整度
				foreach($_html_msg_array as $hma){
					$_html_msg = $hma;
					break;
				}
			}else{
				$pwd = !empty($_POST['password'])?$Value['password']:$_MemberData['Member_Pwd'];
				$db->Where = " WHERE  Member_ID = '" .$_MemberData['Member_ID']. "'";
				$db->query_sql($member_db, '*');
				if( $row = $db->query_fetch() ){
					$db_data = array(
						'Member_Acc' 				=>$Value['acc'] ,
						'Member_Pwd' 				=>$pwd ,
						'Member_Name' 				=>$Value['name'],
						'Member_Mobile' 			=>$Value['mobile'],
						'Member_Email' 				=>$Value['email'],
						'Member_Sex' 				=>$Value['sex'],
						'Member_City' 				=>$Value['city'],
						'Member_County' 			=>$Value['county'],
					);
					$db->query_data($member_db, $db_data, 'UPDATE');
					if( !empty($db->Error) ){	
						$_html_msg 	= '修改失敗，請重新整理後再試試';
					}else{
						$_html_msg 	= '修改成功！';
						$_html_href = 'cust_profile.php';
					}
				}
			}
		break;
		case "plan_change":
			if( $_Login ) {
				switch($_state){
					case 'company':
					break;
					break;
					case 'member':
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
				}
			}else{
				$_html_msg = '請先登入帳號！';
				$_html_href ="index.php";
				break;
			}
			$_html_msg = '';
			$_html_msg_array = array(); 
			$value = array();
			$Value['invoice_address'] 	= trim($_POST['invoice_address']);
			foreach( $Value as $key => $val ){
				if( empty($val) ) {
					array_push($_html_msg_array,'資料填寫不完整');
					break;
				}
			}
			if(!empty($_html_msg_array) ){ //判斷資料完整度
				foreach($_html_msg_array as $hma){
					$_html_msg = $hma;
					break;
				}
			}else{
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
				if( !empty($db->Error) ){
					$_html_msg 	= '提交失敗，請稍等一下再提交!';
					break;
				}else{
					$_html_msg 	= '提交成功！';
					$_html_href = 'com_profile.php';
				}
			}
		break;

		case "msg_save":
			
			$_html_msg 	= '';
			$Value 		= array();
			
			$Value['Name'] 		= substr(trim($_POST['con_name']), 0, 30);//名字
			$Value['Tel'] 		= substr(trim($_POST['tel']), 0, 20);//電話
			$Value['Email'] 	= trim($_POST['email']);//信箱
			$Value['Content'] 	= trim($_POST['content']);
			$Value['Verify'] 	= 'CT'.strtoupper(dechex(time()));
			
			// $Value['formcodes'] 	= trim($_POST['formcodes']);
			//$formscode 			= $_SESSION[$_Website]['website']['formcode'];//驗證碼

			$_html_msg = '';
			/*
			if( strtolower($Value['formcodes']) != strtolower($formscode) || empty($Value['formcodes']) || empty($formscode) ){
				
				$_html_msg 	= '驗證碼錯誤';
				break;
			}
			*/
			foreach( $Value as $key => $val ){
				
				if( empty($val) ) {
					
					$_html_msg 	= '資料填寫不完整';
					break;
				}
			}
				
			if( empty($_html_msg) ){
														
				$db_data = array(
					'CT_Name'		=>$Value['Name'],
					'CT_Tel' 		=>$Value['Tel'],
					'CT_Email' 		=>$Value['Email'],
					'CT_Content'	=>$Value['Content'],
					'CT_Verify'		=>$Value['Verify'],
					'CT_Sdate'		=>$sdate
				);
								
				$db->query_data('web_contact', $db_data, 'INSERT');
								
				if( !empty($db->Error) ){
						
					$_html_msg 	= '留言失敗, 請重新操作';
				}else{
																
					$FromName = !empty($_setting_['WO_SendName']) ? $_setting_['WO_SendName'] : '本網站';
					
					//收件人姓名 收件人信箱
					// $mailto = array(
					// 	$Value['Name'] => $Value['Email']
					// );
												
					// $sbody = get_MailBody('custom_contact',$Value['Verify']);
					
					
					//寄給客戶
					// $Send_TF = SendMail($_setting_, '您在 '.$FromName. ' 留言內容, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);

					$_html_msg 	= '留言成功， 我們會盡快與您聯絡';
					
					if( !empty($_setting_['WO_Email']) ){
						
						$mailto = array(
							$FromName => $_setting_['WO_Email']
						);
						$sbody = get_MailBody('admin_contact',$Value['Verify']);
					
						//寄給管理者
						$Send_TF = SendMail($_setting_, '您有新的留言內容, 此信件為系統發出信件，請勿直接回覆', $sbody, $mailto);
					}
				}
			}
			
			$_html_href = 'contact.php';
		break;
		
		case "member_login":
			
			if( empty($_POST['login_acc']) || empty($_POST['login_pwd']) ){
				
				$_html_msg 	= '請輸入帳號密碼。';
				break;
			}
			
			$acc 		= $_POST['login_acc'];
			
			$pwd = md5(Turnencode(trim($_POST['login_pwd']), 'password'));
			
			//-----------------------recaptcha------------------------------------
			
			if( 0 && !empty($_POST['recaptchaResponse']) ) {
			
				$RC = new ReCaptcha();
				$RC->Verify( $_POST['recaptchaResponse'] );
				
				if( $RC->rs != "success" ) {
				
					$_html_msg 	= '驗證碼連接失敗';
					break;
				}
			}
			//-------------------------------------------------------------------
			
			ob_start();
			
			if( empty($_html_msg) ) {
			
				$db->Where = " WHERE (BINARY Member_Acc = '" .$db->val_check($acc). "' OR BINARY Member_Email = '" .$db->val_check($acc). "') AND  (BINARY Member_Pwd = '" .$db->val_check($pwd). "' OR BINARY Member_RePwd = '" .$db->val_check($pwd). "')";
				$db->query_sql($member_db, 'Member_Open, Member_ID, Member_Name');
				if( $row = $db->query_fetch() ){
					
					if( $row['Member_Open'] != 1 ){
						
						$_html_msg 	= '帳號未啟用';
					}else{
						$db->query_data( $member_db , array('Member_Pwd' => $pwd,'Member_RePwd'=>'','Member_Is_RePwd'=>0), 'UPDATE');
						$_html_msg 	= '歡迎 ' .$row['Member_Name']. ' 回來';
						$_SESSION[$_Website]['website']['member_id']    = $row['Member_ID'];
						$_SESSION[$_Website]['website']['type']    		= 'customer';
						if(!empty($_SESSION['BackUrl'])){
							$_html_href = $_SESSION['BackUrl'];
						}else{
							$_html_href = 'index.php';
						}
					}
				}else{
					
					$_html_msg 	= '帳號或密碼輸入錯誤';
					$_html_eval = 'Reload()';
				}
			}
			
			
			ob_end_clean(); 
			
			
		break;
		
		case "company_login":
			
			if( empty($_POST['login_acc']) || empty($_POST['login_pwd']) ){
				
				$_html_msg 	= '請輸入帳號密碼。';
				break;
			}
			
			$acc 		= $_POST['login_acc'];
			
			$pwd = md5(Turnencode(trim($_POST['login_pwd']), 'password'));
			
			//-----------------------recaptcha------------------------------------
			
			if( 0 && !empty($_POST['recaptchaResponse']) ) {
			
				$RC = new ReCaptcha();
				$RC->Verify( $_POST['recaptchaResponse'] );
				
				if( $RC->rs != "success" ) {
				
					$_html_msg 	= '驗證碼連接失敗';
					break;
				}
			}
			//-------------------------------------------------------------------
			
			ob_start();
			
			if( empty($_html_msg) ) {
			
				$db->Where = " WHERE (BINARY Company_Acc = '" .$db->val_check($acc). "' OR BINARY Company_Email = '" .$db->val_check($acc). "') AND (BINARY Company_PW = '" .$db->val_check($pwd). "' OR BINARY Company_RePwd = '" .$db->val_check($pwd). "')";
				$db->query_sql($company_db, 'Company_Open, Company_ID, Company_Name');
				if( $row = $db->query_fetch() ){
					
					if( $row['Company_Open'] != 1 ){
						
						$_html_msg 	= '帳號未啟用';
					}else{
						$db->query_data( $company_db , array('Company_PW' => $pwd,'Company_RePwd'=>'','Company_Is_RePwd'=>0), 'UPDATE');
						$_html_msg 	= '歡迎 ' .$row['Company_Name']. ' 回來';
						$_SESSION[$_Website]['website']['company_id']    = $row['Company_ID'];
						$_SESSION[$_Website]['website']['type']    = 'company';
						$_html_href = 'index.php';
						
					}
				}else{
					
					$_html_msg 	= '帳號或密碼輸入錯誤';
					$_html_eval = 'Reload()';
				}
			}
			
			
			ob_end_clean(); 
			
			
		break;
		
		case "fblogin":
			
			$id				= trim($_POST['id']);//FB的id
			$acc			= trim($_POST['email']);
			$email			= trim($_POST['email']);
			$name			= trim($_POST['name']);
			
			
			//--------------------------------------
			$_html_msg 		= '';
			$member_db 		= 'web_member';
			
			if( empty($id) || empty($acc) ){
				
				$_html_msg 	= 'FB登入失敗';
				break;
            }
			
			if( $acc == 'undefined' ){
				
				$_html_msg 	= '請勾選提供電子郵件資訊， 如無法做修改， 請到facebook將應用程式移除， 再次登入。';
				break;
            }
			
			if( empty($_html_msg) ) {
				
				$db = new MySQL();
				$db->Where = " WHERE Member_Acc = '" .$db->val_check($id). "' AND Member_FBID = '" .$db->val_check($id). "'";
				$db->query_sql($member_db, '*');
				
				//直接登入
				if( $row = $db->query_fetch() ) { 
					
					if( $row['Member_Open'] != 1 ){
						
						$_html_msg 	= '帳號未啟用';
						break;
					}else{
						
						$_html_msg 	= '歡迎 ' .$row['Member_Name']. ' 回來';
						$_SESSION[$_Website]['website']['member_id']    = $row['Member_ID'];
						$_SESSION[$_Website]['website']['member_name']  = $row['Member_Name'];
						
						$_html_href = 'index.php';
					}
					
				//第一次登入	
				}else{		
	

					$SN = 'M'.substr( date('Ymd') , -6);
					$Member_ID = GET_NEW_ID($member_db, 'Member_ID', $SN, 4);
					
					if( empty($Member_ID) ) {
						
						$_html_msg 	= '編號產生失敗，請重新操作。';
						break;
					}
					
					if( empty($_html_msg) ) {
						
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
					
						if( !empty($db->Error) ){
								
							$_html_msg 	= '加入失敗, 請重新操作';
							break;
						}else{
							
							$_html_msg 	= '歡迎 ' .$name. ' 回來';
							$_SESSION[$_Website]['website']['member_id']    	= $Member_ID;
							$_html_href = 'index.php';
							break;
						}
					}
				}
				
				//撈購物車ID
				$ord_db = new MySQL();
				$ord_db->Where ="Where Ord_UID='".$_SESSION[$_Website]['website']['member_id']."'";
				$ord_db->query_sql('web_ordert_sn', 'Ord_Sn');
				
				$Cust_Order_ID = $_SESSION[$_Website]['website']['order_Sn'];
				
				if( $ord_sn = $ord_db->query_fetch() ){
					
					$Old_Order_ID = $ord_sn['Ord_Sn'];
					
					//登入前購物車已有物品
					if( !empty($Cust_Order_ID) ) {
						
						$db = new MySQL();
						$SC	= new ShopCart();
						//遊客ORDER
						$db->Where = " WHERE Ordertm_Sn = '" .$Cust_Order_ID. "'";
						$db->query_sql( $SC->Tabletd, 'Product_ID,Ordertd_Count');
						
						while($row = $db->query_fetch()){
							
							$Pro_ID 	= $row['Product_ID'];
							$Pro_Count 	= $row['Ordertd_Count'];
							$SC->Check_OrderPro( $Old_Order_ID, $Pro_ID, $Pro_Count ,'login'); //將遊客購物車存進原有購物車
						}
					}
					
					$_SESSION[$_Website]['website']['order_Sn'] = $Old_Order_ID;
				
				//會員無歷史購物車
				}else if( !empty($Cust_Order_ID) ){
					
					$db->Where = "Where Ord_Sn = '".$Cust_Order_ID."'";				
					$db->query_data( "web_ordert_sn" , array('Ord_UID' => $_SESSION[$_Website]['website']['member_id']), 'UPDATE');
				}
			}
		break;
		
		
		case "mlogout":
			
			unset($_SESSION[$_Website]['website']);
			
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
			
			if( !empty($_POST['recaptchaResponse']) ) {
			
				$RC = new ReCaptcha();
				$RC->Verify( $_POST['recaptchaResponse'] );
				
				if( $RC->rs != "success" ) {
				
					$_html_msg 	= '驗證碼連接失敗';
					break;
				}
			}
			//-------------------------------------------------------------------
			
			if( !empty($_POST['memed_pwd']) && !empty($_POST['memed_repwd']) ) {
				
				$Value['new_pwd'] 			= md5(Turnencode(trim($_POST['memed_pwd']), 'password'));
				$Value['new_repwd'] 		= md5(Turnencode(trim($_POST['memed_repwd']), 'password'));	
				
				if( $Value['new_pwd'] != $Value['new_repwd'] ) {
					
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
			foreach( $Value as $key => $val ){
				
				if( empty($val) ) {
					
					$_html_msg 	= '資料填寫不完全';
					break;
				}
			}

			if( empty($_html_msg) ){

				if( $Change_PWD ) {
					
					$db_data = array(
						'Member_Pwd'		=>$Value['new_pwd'],
						'Member_Name'		=>$Value['member_name'],
						'Member_Mobile' 	=>$Value['member_mobile'],
						'Member_City' 		=>$Value['member_city'],
						'Member_County'		=>$Value['member_county'],
						'Member_Address'	=>$Value['member_address'],
						'Member_Edate'		=>$sdate,
					);	
				}else{
					
					$db_data = array(
						'Member_Name'		=>$Value['member_name'],
						'Member_Mobile' 	=>$Value['member_mobile'],
						'Member_City' 		=>$Value['member_city'],
						'Member_County'		=>$Value['member_county'],
						'Member_Address'	=>$Value['member_address'],
						'Member_Edate'		=>$sdate,
					);	
				}
				
				$db->Where = "Where Member_ID = '".$db->val_check($Value['Member_ID'])."'";				
				$db->query_data( $member_db , $db_data, 'UPDATE');
								
				if( !empty($db->Error) ){
						
					$_html_msg 	= '會員資料修改失敗, 請重新操作';
					break;
				}else{

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
				
			
			foreach( $Value as $key => $val ){
				
				if( empty($val) ) {
					
					$_html_msg 	= '資料填寫不完整';
					break;
				}
			}
			
			if( empty($_html_msg) ){
				
				$db_data = array(
				
					'Orderm_card5no' => $Value['pay_code'],
					'Orderm_payTime' => $Value['pay_date']
				);
				
				$db->Where = "Where Orderm_ID = '".$db->val_check($Value['oid'])."'";		
				$db->query_data( "web_ordermain" , $db_data , 'UPDATE');
								
				if( !empty($db->Error) ){
						
					$_html_msg 	= '上傳失敗, 請重新操作';
				}else{
					
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
			
			global $member_db,$_setting_;
			
			$Value 				= array();
			$_html_msg 			= '';

			//$Value['forgot_formcode'] 	= trim($_POST['forgot_formcode']);
			$Value['forgot_email'] 		= trim($_POST['forgot_email']);
			$Value['target']			= trim($_POST['target']);
			//$formscode 	= $_SESSION[$_Website]['website']['formcode'];//驗證碼	
			
			//-----------------------recaptcha------------------------------------
			
			if( !empty($_POST['recaptchaResponse']) ) {
			
				$RC = new ReCaptcha();
				$RC->Verify( $_POST['recaptchaResponse'] );
				
				if( $RC->rs != "success" ) {
				
					$_html_msg 	= '驗證碼連接失敗';
					break;
				}
			}
			//-------------------------------------------------------------------
			

			//判斷空值
			foreach( $Value as $key => $val ){
				
				if( empty($val) ) {
					
					$_html_msg 	= '資料填寫不完全';
					break;
				}
			}
			
			if( !empty($_html_msg) ) break;
			/*
			if( strtolower($formscode) != strtolower($Value['forgot_formcode']) || empty($formscode) || empty($Value['forgot_formcode']) ){
				
				$_html_msg 	= '驗證碼錯誤';
				break;
			}*/
			switch ($Value['target']){
				case "com":
					$db 				= new MySQL();
					$db->Where = "Where Company_Email ='".$db->val_check($Value['forgot_email'])."'";
					$db->query_sql( $company_db, 'Company_ID,Company_Name');
					
					if($row = $db->query_fetch()){
						$re_pwd	     = rand(10000000,99999999);
						$re_pwd_save = md5(Turnencode(trim($re_pwd), 'password'));
						$FromName = !empty($_setting_['WO_SendName']) ? $_setting_['WO_SendName'] : '本網站';

						//收件人姓名 收件人信箱
						$mailto = array(
							$row['Company_Name'] => $Value['forgot_email']
						);
													
						$sbody = get_MailBody( 'forgetpw_member_resend', $re_pwd );
						
						//寄給客戶
						$Send_TF = SendMail( $_setting_, '【'.$FromName. ' 】 忘記密碼申請通知信。', $sbody, $mailto);
						
						if( $Send_TF ){

							$_html_msg 	= '申請成功，請至信箱查看。';

							$_html_href = 'login.php';

						}else{
							
							$_html_msg 	= '申請信寄送失敗，請確認EMAIL輸入正確。';
							$_html_href = 'forgot.php?i='.$Value['target'];
						}
					}else{
						
						$_html_msg 	= '查無此信箱，請確認後再行輸入。';
						$_html_href = 'forgot.php?i='.$Value['target'];
					}
					if( $Send_TF ){
						$db->Where = "Where Company_Email ='".$db->val_check($Value['forgot_email'])."'";
						$db->query_data( $company_db , array('Company_RePwd' => $re_pwd_save,'Company_Is_RePwd'=>1), 'UPDATE');
					}
					break;
				case "cust":
					$db 				= new MySQL();
					$db->Where = "Where Member_Email ='".$db->val_check($Value['forgot_email'])."'";
					$db->query_sql( $member_db, 'Member_ID,Member_Name');
					
					if($row = $db->query_fetch()){
						$re_pwd	     = rand(10000000,99999999);
						$re_pwd_save = md5(Turnencode(trim($re_pwd), 'password'));
						$FromName = !empty($_setting_['WO_SendName']) ? $_setting_['WO_SendName'] : '本網站';

						//收件人姓名 收件人信箱
						$mailto = array(
							$row['Member_Name'] => $Value['forgot_email']
						);
													
						$sbody = get_MailBody( 'forgetpw_member_resend', $re_pwd );
						
						//寄給客戶
						$Send_TF = SendMail( $_setting_, '【'.$FromName. ' 】 忘記密碼申請通知信。', $sbody, $mailto);
						
						if( $Send_TF ){

							$_html_msg 	= '申請成功，請至信箱查看。';

							$_html_href = 'login.php';

						}else{
							
							$_html_msg 	= '申請信寄送失敗，請確認EMAIL輸入正確。';
							$_html_href = 'forgot.php?i='.$Value['target'];
						}
					}else{
						
						$_html_msg 	= '查無此信箱，請確認後再行輸入。';
						$_html_href = 'forgot.php?i='.$Value['target'];
					}
					if( $Send_TF ){
						$db->Where = "Where Member_Email ='".$db->val_check($Value['forgot_email'])."'";
						$db->query_data( $member_db , array('Member_RePwd' => $re_pwd_save,'Member_Is_RePwd'=>1), 'UPDATE');
					}
					break;
				default:
					$_html_msg 	= '資料異常，請確認後再行輸入';
					$_html_href = 'forgot.php?i='.$Value['target'];
				break;
			}


		break;

		case "forget_pwedit":
			
			global $member_db;
			
			$Value = array();
			
			$Value['forgot_pwd'] 		= md5(Turnencode(trim($_POST['forgot_pwd']), 'password'));
			$Value['forgot_repwd'] 		= md5(Turnencode(trim($_POST['forgot_repwd']), 'password'));	
			$Value['memID'] 			= trim($_POST['mem_id']);	
			
			if( $Value['pwd'] != $Value['repwd'] ) {
				
				$_html_msg 	= '輸入之密碼不相同';
				break;
			}
			
			//判斷空值
			foreach( $Value as $key => $val ){
				
				if( empty($val) ) {
					
					$_html_msg 	= '資料填寫不完全';
					break;
				}
			}
			
			$_html_msg 			= '';
			$db 				= new MySQL();

			if( empty($_html_msg) ){
				
				$db->Where = "Where Member_ID = '".$Value['memID']."'";				
				$db->query_data( $member_db , array('Member_Pwd' => $Value['forgot_pwd']), 'UPDATE');
								
				if( !empty($db->Error) ){
						
					$_html_msg 	= '修改失敗, 請重新操作';
				}else{

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
		//公版問卷生成--企業方
		case "survey_generate_standard":
			if( $_Login ) {
				switch($_state){
					case 'company':
					break;
					break;
					case 'member':
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
				}
			}else{
				$_html_msg = '請先登入帳號！';
				$_html_href ="index.php";
				break;
			}
			$_html_msg = '';
			$_html_msg_array = array(); 
			$value = array();
			$Value['title'] 		= trim($_POST['title']);//標題
			$Value['subtitle'] 		= trim($_POST['subtitle']);//標題
			$Value['title_color'] 		= trim($_POST['title_color']);//標題色系
			$Value['background_color'] 		= trim($_POST['background_color']);//背景色系
			$Value['industry'] 	= trim($_POST['industry']);//產業類別
			$Value['business'] 		= trim($_POST['business']);//商業類型
			$Value['version']   = trim($_POST['version']);//公版類型
			$Value['tag'] 	= trim($_POST['tag']);//產業標籤
			$Value['coup_id'] 		= trim($_POST['coup_id']);//投放折價卷
			$Value['allcontent'] = json_decode($_POST['allcontent']);//所有問卷題目及資料
			$Value['launch_number'] 	= trim($_POST['launch_number']);//投放數量
			$Value['coupnum'] 	= trim($_POST['coupnum']);//折扣卷數量
			$Value['start_date'] 	= trim($_POST['start_date']);//開始日期
			$Value['end_date'] 	= trim($_POST['end_date']);//結束日期
			$Value['target'] 	= trim($_POST['target']);//問卷投放對象類型(會員或者excel資料)
			foreach( $Value as $key => $val ){
				if( empty($val) ) {
					array_push($_html_msg_array,'資料填寫不完整');
					break;
				}
			}
			if(!isJson($Value['allcontent'])){  //判斷資料是否為json格式
				array_push($_html_msg_array,'題目和答案資料接收異常');
				break;
			}
							
			if(!empty($_POST['exceldata'])&&$Value['target']=='excel'){
				$Value['exceldata'] = json_decode($_POST['exceldata']);//excel匯入資料
				if(!isJson($Value['exceldata'])){  //判斷資料是否為json格式
					array_push($_html_msg_array,'EXcel資料接收異常');
					break;
				}
			}
			if(!empty($_html_msg_array) ){ //判斷資料完整度
				foreach($_html_msg_array as $hma){
					$_html_msg = $hma;
					break;
				}
			}else{
				$Value['allowed_white'] 	= trim($_POST['allowed_white']);//投放對象拓展(0為只投符合資料的對象，1為可投放非符合資料的對象)
				$Value['sex'] 	= trim($_POST['sex']);//投放對象性別
				$Value['city'] 	= trim($_POST['city']);//投放對象城市
				$Value['area'] 	= trim($_POST['area']);//投放對象地區
				$Value['link']   = trim($_POST['link']);//尾部連結資訊
				$Value['link_title'] 	= trim($_POST['link_title']);//尾部連結
				$Value['coup_info'] 	= trim($_POST['coup_info']);//折扣卷資訊
				$Value['is_edit']   = trim($_POST['is_edit']);//是否有修改
				if (!empty($_SESSION['postdata']['uploadedFile'])){
					$file_array= pathinfo($_SESSION['postdata']['uploadedFile']['name']);
				    $file_name = md5($file_array['filename'].time());
					# 檢查檔案是否已經存在
					if (file_exists('upload/userfiles/images/' .$file_name)){
						$_html_msg = '圖片儲存錯誤，請重新測試。';
						break;
					} elseif(!in_array($file_array['extension'],$upload_files['images'])){
						$_html_msg = '圖片格式錯誤，請重新上傳。';
						break;
					} elseif(intval($_SESSION['postdata']['uploadedFile']['size']/1024)>$upload_files['max_size']){
						$_html_msg = '圖片容量過大，請重新上傳。檔案不可超過：'.$upload_files['max_size'].'KB';
						break;
					} else {
						//------------------------------圖片上傳------------------------------
						$dataUrl = $_SESSION['postdata']['uploadedFileDataUrl'];
						// 將 Data URL 轉換成為圖片並保存到伺服器
						$save_file_name = $file_name.'.'.$file_array['extension'];
						$dest = 'upload/userfiles/images/' . $save_file_name;
						$dataUrl = $_SESSION['postdata']['uploadedFileDataUrl'];
						$imgData = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $dataUrl));
						file_put_contents($dest, $imgData);
					}
				} else {
					$save_file_name = 'ai2biRobot.png';
				}

				//------------------------------資料庫儲存-----------------------------
				$SN = date('Ymd');
				$SN = 'SV'.substr($SN, -6);
				$survey_ID = GET_NEW_ID($survey_db, 'Survey_ID', $SN, 4);
				$_SurveyData = array(
					'Survey_ID'		  => $survey_ID,
					'Survey_CID' 	  => isset($_SESSION[$_Website]['website']['company_id'])?$_SESSION[$_Website]['website']['company_id']:'',
					'Survey_Attr'	  => $Value['is_edit']==0?'Standard':'Custom',
					'Survey_Industry' => $Value['industry'],
					'Survey_Business' => $Value['business'],
					'Survey_Title'    => $Value['title'],
					'Survey_Subtitle' => $Value['subtitle'],
					'Survey_Tag'	  => $Value['tag'],
					'Survey_Version'  => $Value['version'],
					'Survey_Target'	  => $Value['target'],
					'Survey_Allowed_White'	  => $Value['allowed_white'],
					'Survey_Link'	  => $Value['link'],
					'Survey_Link_Title'  => $Value['link_title'],
					'Survey_Logo'	  => $save_file_name,
					'Survey_Bg_Color' => $Value['background_color'],
					'Survey_Title_Color' =>$Value['title_color'],
					'Survey_CoupID'	  => $Value['coup_id'],//投出的折扣卷編號
					'Survey_CoupNum'  => $Value['coupnum'],
					'Survey_Coup_Info'	  => $Value['coup_info'],
					'Survey_Start_date'	  => $Value['start_date'],
					'Survey_End_date'	  => $Value['end_date'],
					'Survey_Open'	  => 1,
					'Survey_Sdate'	  => $sdate,
				);
				$db->query_data('web_survey', $_SurveyData, 'INSERT');
				if( !empty($db->Error) ){
					$_html_msg 	= '問卷製作失敗，請重新操作!';
					break;
				}
				if($Value['target']=='member'){
					$_SurveyLaunchData = array(
						'SL_SID' 	  => $survey_ID,
						'SL_Sex'	  => $Value['sex'],
						'SL_City' 	  => $Value['city'],
						'SL_Area' 	  => $Value['area'],
						'SL_Number'   => $Value['launch_number'],
					);
					$db->query_data('web_survey_launch', $_SurveyLaunchData, 'INSERT');
					if( !empty($db->Error) ){
						$_html_msg 	= '問卷製作失敗，請重新操作!';
						break;
					}
				}elseif($Value['target']=='excel'){
					foreach($Value['exceldata'] as $k => $val){
						if($val->Name==''||$val->Email=='')continue;
						$_CandidateLaunchData = array(
							'Candidate_CID' 	  => isset($_SESSION[$_Website]['website']['company_id'])?$_SESSION[$_Website]['website']['company_id']:'',
							'Candidate_SID'	  	  => $survey_ID,
							'Candidate_Cuname1'   => $val->Name,
							'Candidate_Cuemail'   => $val->Email,
							'Candidate_Enable'    => 1,
							'Candidate_Sdate'     => $sdate,
						);
						$db->query_data($candidate_db, $_CandidateLaunchData, 'INSERT');
						if( !empty($db->Error) ){
							$_html_msg 	= '投放名單製作失敗，請重新操作!';
							break;
						}
					}
					$_SurveyLaunchData = array(
						'SL_SID' 	  => $survey_ID,
						'SL_Number'   => $Value['launch_number'],
					);
					$db->query_data('web_survey_launch', $_SurveyLaunchData, 'INSERT');
					if( !empty($db->Error) ){
						$_html_msg 	= '問卷製作失敗，請重新操作!';
						break;
					}
				}
				
				foreach($Value['allcontent'] as $con){
					$answer_json = json_encode($con->answer,256);
					$_SurveyQuestionData = array(
						'SQ_SID' 	  => $survey_ID,
						'SQ_Type'	  => $con->intype,
						'SQ_Title' 	  => $con->question,
						'SQ_Content'  => $answer_json,
					);
					$db->query_data('web_survey_question', $_SurveyQuestionData, 'INSERT');
				}
				if( !empty($db->Error) ){
					$_html_msg 	= '問卷製作失敗，請重新操作!';
					break;
				}
				if( !empty($db->Error) ){
					$_html_msg 	= '問卷製作失敗，請重新操作!';
				}else{
					unset($_SESSION['postdata']);//清除問卷資料
					$_html_msg 	= '問卷製作成功!';
					$_html_href = 'com_survey_output.php?c='.OEncrypt('v='.$_SurveyData['Survey_ID'] , 'survey_output');
				}
			}
			
		break;
		//自訂問卷生成--企業方
		case "survey_generate_custom":
			if( $_Login ) {
				switch($_state){
					case 'company':
					break;
					break;
					case 'member':
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
				}
			}else{
				$_html_msg = '請先登入帳號！';
				$_html_href ="index.php";
				break;
			}
			$_html_msg = '';
			$_html_msg_array = array(); 
			$value = array();
			$Value['title'] 		= trim($_POST['title']);//標題
			$Value['subtitle'] 		= trim($_POST['subtitle']);//標題
			$Value['title_color'] 		= trim($_POST['title_color']);//標題色系
			$Value['background_color'] 		= trim($_POST['background_color']);//背景色系
			$Value['tag'] 	= trim($_POST['tag']);//產業標籤
			$Value['coup_id'] 		= trim($_POST['coup_id']);//投放折價卷
			$Value['allcontent'] = json_decode($_POST['allcontent']);
			$Value['launch_number'] 	= trim($_POST['launch_number']);//投放數量
			$Value['coupnum'] 	= trim($_POST['coupnum']);//折扣卷數量
			$Value['start_date'] 	= trim($_POST['start_date']);//開始日期
			$Value['end_date'] 	= trim($_POST['end_date']);//結束日期
			$Value['target'] 	= trim($_POST['target']);//問卷投放對象類型(會員或者excel資料)
			foreach( $Value as $key => $val ){
				if( empty($val) ) {
					array_push($_html_msg_array,'資料填寫不完整');
					break;
				}
			}
			if(!isJson($Value['allcontent'])){  //判斷資料是否為json格式
				array_push($_html_msg_array,'題目和答案資料接收異常');
				break;
			}
			if(!empty($_POST['exceldata'])&&$Value['target']=='excel'){
				$Value['exceldata'] = json_decode($_POST['exceldata']);//excel匯入資料
				if(!isJson($Value['exceldata'])){  //判斷資料是否為json格式
					array_push($_html_msg_array,'EXcel資料接收異常');
					break;
				}
			}
			if(!empty($_html_msg_array) ){ //判斷資料完整度
				foreach($_html_msg_array as $hma){
					$_html_msg = $hma;
					break;
				}
			}else{
				$Value['allowed_white'] 	= trim($_POST['allowed_white']);//投放對象拓展(0為只投符合資料的對象，1為可投放非符合資料的對象)
				$Value['sex'] 	= trim($_POST['sex']);//投放對象性別
				$Value['city'] 	= trim($_POST['city']);//投放對象城市
				$Value['area'] 	= trim($_POST['area']);//投放對象地區
				$Value['link']   = trim($_POST['link']);//尾部連結資訊
				$Value['link_title'] 	= trim($_POST['link_title']);//尾部連結
				$Value['coup_info'] 	= trim($_POST['coup_info']);//折扣卷資訊
				if (!empty($_SESSION['postdata']['uploadedFile'])){
					$file_array= pathinfo($_SESSION['postdata']['uploadedFile']['name']);
				    $file_name = md5($file_array['filename'].time());
					# 檢查檔案是否已經存在
					if (file_exists('upload/userfiles/images/' .$file_name)){
						$_html_msg = '圖片儲存錯誤，請重新測試。';
						break;
					} elseif(!in_array($file_array['extension'],$upload_files['images'])){
						$_html_msg = '圖片格式錯誤，請重新上傳。';
						break;
					} elseif(intval($_SESSION['postdata']['uploadedFile']['size']/1024)>$upload_files['max_size']){
						$_html_msg = '圖片容量過大，請重新上傳。檔案不可超過：'.$upload_files['max_size'].'KB';
						break;
					} else {
						//------------------------------圖片上傳------------------------------
						$dataUrl = $_SESSION['postdata']['uploadedFileDataUrl'];
						// 將 Data URL 轉換成為圖片並保存到伺服器
						$save_file_name = $file_name.'.'.$file_array['extension'];
						$dest = 'upload/userfiles/images/' . $save_file_name;
						$dataUrl = $_SESSION['postdata']['uploadedFileDataUrl'];
						$imgData = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $dataUrl));
						file_put_contents($dest, $imgData);
					}
				} else {
					$save_file_name = 'ai2biRobot.png';
				}
				$SN = date('Ymd');
				$SN = 'SV'.substr($SN, -6);
				$survey_ID = GET_NEW_ID($survey_db, 'Survey_ID', $SN, 4);
				//------------------------------資料庫儲存-----------------------------
				$_SurveyData = array(
					'Survey_ID'		  => $survey_ID,
					'Survey_CID' 	  => isset($_SESSION[$_Website]['website']['company_id'])?$_SESSION[$_Website]['website']['company_id']:'',
					'Survey_Attr'	  => 'Custom',
					'Survey_Title'    => $Value['title'],
					'Survey_Subtitle' => $Value['subtitle'],
					'Survey_Tag'	  => $Value['tag'],
					'Survey_Target'	  => $Value['target'],
					'Survey_Allowed_White'	  => $Value['allowed_white'],
					'Survey_Link'	  => $Value['link'],
					'Survey_Link_Title'  => $Value['link_title'],
					'Survey_Logo'	  => $save_file_name,
					'Survey_Bg_Color' => $Value['background_color'],
					'Survey_Title_Color' =>$Value['title_color'],
					'Survey_CoupID'	  => $Value['coup_id'],//投出的折扣卷編號
					'Survey_CoupNum'  => $Value['coupnum'],
					'Survey_Coup_Info'	  => $Value['coup_info'],
					'Survey_Start_date'	  => $Value['start_date'],
					'Survey_End_date'	  => $Value['end_date'],
					'Survey_Open'	  => 1,
					'Survey_Sdate'	  => $sdate,
				);
				$db->query_data('web_survey', $_SurveyData, 'INSERT');
				if( !empty($db->Error) ){
					$_html_msg 	= '問卷製作失敗，請重新操作!';
					break;
				}
				if($Value['target']=='member'){
					$_SurveyLaunchData = array(
						'SL_SID' 	  => $survey_ID,
						'SL_Sex'	  => $Value['sex'],
						'SL_City' 	  => $Value['city'],
						'SL_Area' 	  => $Value['area'],
						'SL_Number'   => $Value['launch_number'],
					);
					$db->query_data('web_survey_launch', $_SurveyLaunchData, 'INSERT');
					if( !empty($db->Error) ){
						$_html_msg 	= '問卷製作失敗，請重新操作!';
						break;
					}
				}elseif($Value['target']=='excel'){
					foreach($Value['exceldata'] as $k => $val){
						if($val->Name==''||$val->Email=='')continue;
						$_CandidateLaunchData = array(
							'Candidate_CID' 	  => isset($_SESSION[$_Website]['website']['company_id'])?$_SESSION[$_Website]['website']['company_id']:'',
							'Candidate_SID'	  	  => $survey_ID,
							'Candidate_Cuname1'   => $val->Name,
							'Candidate_Cuemail'   => $val->Email,
							'Candidate_Enable'    => 1,
							'Candidate_Sdate'     => $sdate,
						);
						$db->query_data($candidate_db, $_CandidateLaunchData, 'INSERT');
						if( !empty($db->Error) ){
							$_html_msg 	= '投放名單製作失敗，請重新操作!';
							break;
						}
					}
					$_SurveyLaunchData = array(
						'SL_SID' 	  => $survey_ID,
						'SL_Number'   => $Value['launch_number'],
					);
					$db->query_data('web_survey_launch', $_SurveyLaunchData, 'INSERT');
					if( !empty($db->Error) ){
						$_html_msg 	= '問卷製作失敗，請重新操作!';
						break;
					}
				}
				foreach($Value['allcontent'] as $con){
					$answer_json = json_encode($con->answer,256);
					$_SurveyQuestionData = array(
						'SQ_SID' 	  => $survey_ID,
						'SQ_Type'	  => $con->intype,
						'SQ_Title' 	  => $con->question,
						'SQ_Content'  => $answer_json,
					);
					$db->query_data('web_survey_question', $_SurveyQuestionData, 'INSERT');
				}
				if( !empty($db->Error) ){
					$_html_msg 	= '問卷製作失敗，請重新操作!';
				}else{
					unset($_SESSION['postdata']);//清除問卷資料
					$_html_msg 	= '問卷製作成功!';
					$_html_href = 'com_survey_output.php?c='.OEncrypt('v='.$_SurveyData['Survey_ID'] , 'survey_output');
				}
			}
			
		break;
		//AI問卷生成--企業方
		case "survey_generate_AI":
			if( $_Login ) {
				switch($_state){
					case 'company':
					break;
					break;
					case 'member':
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
				}
			}else{
				$_html_msg = '請先登入帳號！';
				$_html_href ="index.php";
				break;
			}
			$_html_msg = '';
			$_html_msg_array = array(); 
			$value = array();
			$Value['title'] 		= trim($_POST['title']);//標題
			$Value['subtitle'] 		= trim($_POST['subtitle']);//標題
			$Value['title_color'] 		= trim($_POST['title_color']);//標題色系
			$Value['background_color'] 		= trim($_POST['background_color']);//背景色系
			$Value['tag'] 	= trim($_POST['tag']);//產業標籤
			$Value['coup_id'] 		= trim($_POST['coup_id']);//投放折價卷
			$Value['allcontent'] = json_decode($_POST['allcontent'],true);//所有題目和選項
			$Value['alltype'] = json_decode($_POST['alltype'],true);//所有題目類型
			$Value['launch_number'] 	= trim($_POST['launch_number']);//投放數量
			$Value['coupnum'] 	= trim($_POST['coupnum']);//折扣卷數量
			$Value['start_date'] 	= trim($_POST['start_date']);//開始日期
			$Value['end_date'] 	= trim($_POST['end_date']);//結束日期
			$Value['target'] 	= trim($_POST['target']);//問卷投放對象類型(會員或者excel資料)
			foreach( $Value as $key => $val ){
				if( empty($val) ) {
					array_push($_html_msg_array,'資料填寫不完整');
					break;
				}
			}
			if(!empty($_POST['exceldata'])&&$Value['target']=='excel'){
				$Value['exceldata'] = json_decode($_POST['exceldata']);//excel匯入資料
				if(!isJson($Value['exceldata'])){  //判斷資料是否為json格式
					array_push($_html_msg_array,'EXcel資料接收異常');
					break;
				}
			}
			if(!isJson($Value['allcontent'])){  //判斷資料是否為json格式
				array_push($_html_msg_array,'題目和答案資料接收異常');
				break;
			}
			if(!empty($_html_msg_array) ){ //判斷資料完整度
				foreach($_html_msg_array as $hma){
					$_html_msg = $hma;
					break;
				}
			}else{
				$Value['allowed_white'] 	= trim($_POST['allowed_white']);//投放對象拓展(0為只投符合資料的對象，1為可投放非符合資料的對象)
				$Value['sex'] 	= trim($_POST['sex']);//投放對象性別
				$Value['city'] 	= trim($_POST['city']);//投放對象城市
				$Value['area'] 	= trim($_POST['area']);//投放對象地區
				$Value['link']   = trim($_POST['link']);//尾部連結資訊
				$Value['link_title'] 	= trim($_POST['link_title']);//尾部連結
				$Value['coup_info'] 	= trim($_POST['coup_info']);//折扣卷資訊
				if (!empty($_SESSION['postdata']['uploadedFile'])){
					$file_array= pathinfo($_SESSION['postdata']['uploadedFile']['name']);
				    $file_name = md5($file_array['filename'].time());
					# 檢查檔案是否已經存在
					if (file_exists('upload/userfiles/images/' .$file_name)){
						$_html_msg = '圖片儲存錯誤，請重新測試。';
						break;
					} elseif(!in_array($file_array['extension'],$upload_files['images'])){
						$_html_msg = '圖片格式錯誤，請重新上傳。';
						break;
					} elseif(intval($_SESSION['postdata']['uploadedFile']['size']/1024)>$upload_files['max_size']){
						$_html_msg = '圖片容量過大，請重新上傳。檔案不可超過：'.$upload_files['max_size'].'KB';
						break;
					} else {
						//------------------------------圖片上傳------------------------------
						$dataUrl = $_SESSION['postdata']['uploadedFileDataUrl'];
						// 將 Data URL 轉換成為圖片並保存到伺服器
						$save_file_name = $file_name.'.'.$file_array['extension'];
						$dest = 'upload/userfiles/images/' . $save_file_name;
						$dataUrl = $_SESSION['postdata']['uploadedFileDataUrl'];
						$imgData = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $dataUrl));
						file_put_contents($dest, $imgData);
					}
				} else {
					$save_file_name = 'ai2biRobot.png';
				}
				$SN = date('Ymd');
				$SN = 'SV'.substr($SN, -6);
				$survey_ID = GET_NEW_ID($survey_db, 'Survey_ID', $SN, 4);
				//取公版的最新版本號
				$db->Order_By = "Order By Survey_Version desc";
				$db->Where = " WHERE Survey_Version IS NOT NULL ";
				$db->query_sql($survey_db,'Survey_Version',0,1);
				while($row=$db->query_fetch()){
					$version = $row['Survey_Version'];
				}
				//------------------------------資料庫儲存-----------------------------
				$_SurveyData = array(
					'Survey_ID'		  => $survey_ID,
					'Survey_CID' 	  => isset($_SESSION[$_Website]['website']['company_id'])?$_SESSION[$_Website]['website']['company_id']:'',
					'Survey_Attr'	  => 'AI',
					'Survey_Title'    => $Value['title'],
					'Survey_Subtitle' => $Value['subtitle'],
					'Survey_Tag'	  => $Value['tag'],
					'Survey_Target'	  => $Value['target'],
					'Survey_Version'  => (int)$version+1,
					'Survey_Allowed_White'	  => $Value['allowed_white'],
					'Survey_Link'	  => $Value['link'],
					'Survey_Link_Title'  => $Value['link_title'],
					'Survey_Logo'	  => $save_file_name,
					'Survey_Bg_Color' => $Value['background_color'],
					'Survey_Title_Color' =>$Value['title_color'],
					'Survey_CoupID'	  => $Value['coup_id'],//投出的折扣卷編號
					'Survey_CoupNum'  => $Value['coupnum'],
					'Survey_Coup_Info'	  => $Value['coup_info'],
					'Survey_Start_date'	  => $Value['start_date'],
					'Survey_End_date'	  => $Value['end_date'],
					'Survey_Open'	  => 1,
					'Survey_Sdate'	  => $sdate,
				);
				$db->query_data('web_survey', $_SurveyData, 'INSERT');
				if( !empty($db->Error) ){
					$_html_msg 	= '問卷製作失敗，請重新操作!';
					break;
				}
				if($Value['target']=='member'){
					$_SurveyLaunchData = array(
						'SL_SID' 	  => $survey_ID,
						'SL_Sex'	  => $Value['sex'],
						'SL_City' 	  => $Value['city'],
						'SL_Area' 	  => $Value['area'],
						'SL_Number'   => $Value['launch_number'],
					);
					$db->query_data('web_survey_launch', $_SurveyLaunchData, 'INSERT');
					if( !empty($db->Error) ){
						$_html_msg 	= '問卷製作失敗，請重新操作!';
						break;
					}
				}elseif($Value['target']=='excel'){
					foreach($Value['exceldata'] as $k => $val){
						if($val->Name==''||$val->Email=='')continue;
						$_CandidateLaunchData = array(
							'Candidate_CID' 	  => isset($_SESSION[$_Website]['website']['company_id'])?$_SESSION[$_Website]['website']['company_id']:'',
							'Candidate_SID'	  	  => $survey_ID,
							'Candidate_Cuname1'   => $val->Name,
							'Candidate_Cuemail'   => $val->Email,
							'Candidate_Enable'    => 1,
							'Candidate_Sdate'     => $sdate,
						);
						$db->query_data($candidate_db, $_CandidateLaunchData, 'INSERT');
						if( !empty($db->Error) ){
							$_html_msg 	= '投放名單製作失敗，請重新操作!';
							break;
						}
					}
					$_SurveyLaunchData = array(
						'SL_SID' 	  => $survey_ID,
						'SL_Number'   => $Value['launch_number'],
					);
					$db->query_data('web_survey_launch', $_SurveyLaunchData, 'INSERT');
					if( !empty($db->Error) ){
						$_html_msg 	= '問卷製作失敗，請重新操作!';
						break;
					}
				}
				$num = 0;
				foreach($Value['allcontent'] as $con){
					$answer_json = json_encode($con['answer'],256);
					$_SurveyQuestionData = array(
						'SQ_SID' 	  => $survey_ID,
						'SQ_Type'	  => $Value['alltype'][$num],
						'SQ_Title' 	  => $con['question'],
						'SQ_Content'  => $answer_json,
					);
					$db->query_data('web_survey_question', $_SurveyQuestionData, 'INSERT');
					$num++;
				}
				if( !empty($db->Error) ){
					$_html_msg 	= '問卷製作失敗，請重新操作!';
				}else{
					unset($_SESSION['postdata']);//清除問卷資料
					$_html_msg 	= '問卷製作成功!';
					$_html_href = 'com_survey_output.php?c='.OEncrypt('v='.$_SurveyData['Survey_ID'] , 'survey_output');
				}
			}
			
		break;
		//問卷投放--企業方
		case "survey_launch":
			if( $_Login ) {
				switch($_state){
					case 'company':
					break;
					case 'member':
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
				}
			}else{
				$_html_msg = '請先登入帳號！';
				$_html_href ="index.php";
				break;
			}
			$_html_msg = '';
			$_html_msg_array = array(); 
			$value = array();
			$Value['survey_id'] 		= trim($_POST['surveyid']);//問卷編號
			foreach( $Value as $key => $val ){
				if( empty($val) ) {
					array_push($_html_msg_array,'資料填寫不完整');
					break;
				}
			}
			if(!empty($_html_msg_array) ){ //判斷資料完整度
				foreach($_html_msg_array as $hma){
					$_html_msg = $hma;
					break;
				}
			}

			$survey 	= $CM->GET_SURVEY_DATA($Value['survey_id']);//取得問卷資料
			if($survey['Data']['Survey_CID']==$_MemberData['Company_ID']){

					$db->Where = "Where SL_SID = '".$survey['Data']['Survey_ID']."' AND SL_LaunchDate IS NOT NULL"; //投放判斷以時間為主
					$db->query_sql($sl_db, '*');
					if($row = $db->query_fetch()){
						$_html_msg = '無法重複投放！';
					}else{
						if($survey['Data']['Survey_Target']=='member'){
							$SL = $CM->GET_SL_DATA($survey['Data']['Survey_ID']);//取得投放資料
							$db->Order_By = 'ORDER BY rand() ';//設置為隨機順序
							if($SL['Data']['SL_Sex']=='全部'){
								$sex_where = "";
							}else{
								$sex_where = " AND Member_Sex = '".$SL['Data']['SL_Sex']."' ";
							}
							if($SL['Data']['SL_City']=='全部'){
								$city_where = "";
							}else{
								$city_where = " AND Member_City = '".$SL['Data']['SL_City']."' ";
							}
							if($SL['Data']['SL_Area']=='全部'){
								$county_where = "";
							}else{
								$county_where = " AND Member_County = '".$SL['Data']['SL_Area']."' ";
							}
							$all_where = $sex_where.$city_where.$county_where;
							$db->Where = "Where Member_Open=1 ".$all_where;		
							$db->query_sql($member_db, '*',0,$SL['Data']['SL_Number']);
							$count = 0;
		
							$_DataArray = array();//存入資料表的投放名單
							while($row = $db->query_fetch()){
		
								//存入投放名單中
								$_SurveyLaunchDetailData = array(
									'SLD_SID'		  => $survey['Data']['Survey_ID'],
									'SLD_MID'		  => $row['Member_ID'],
									'SLD_Sdate'	  => $sdate,
								);
								$_DataArray[$count]=$_SurveyLaunchDetailData;
								++$count;
							}
							if(!empty($_DataArray)){
								foreach($_DataArray as $da){
									$db->query_data($sld_db, $da, 'INSERT');	
								}
							}
							if($count==$SL['Data']['SL_Number']){
								$db->Where = "Where SL_SID = '".$survey['Data']['Survey_ID']."'";	
								$_SLDATA = array('SL_LaunchDate'=>$sdate);
								$db->query_data( $sl_db , $_SLDATA, 'UPDATE');
								$_html_msg = '投放申請成功，系統會自動寄信給符合資格的消費者！';
							}else{
								if($survey['Data']['Survey_Allowed_White']=='1'){
									$db->Order_By = 'ORDER BY rand() ';//設置為隨機順序
									// $db->Where = "Where Candidate_CID = '".$survey['Data']['Survey_CID']."' AND Candidate_SID = '".$survey['Data']['Survey_SID']."' AND Candidate_Enable=1";		
									$db->Where = "WHERE 1=1";
									$db->query_sql($candidate_db, '*',0,(int)($SL['Data']['SL_Number']-$count));
									$_DataArray2 = array();//存入資料表的投放名單
									while($row = $db->query_fetch()){
				
										//存入投放名單中
										$_SurveyLaunchDetailData = array(
											'SLD_SID'		  => $survey['Data']['Survey_ID'],
											'SLD_CandID'	  => $row['Candidate_ID'],
											'SLD_Sdate'	      => $sdate,
										);
										$_DataArray2[$count]=$_SurveyLaunchDetailData;
										++$count;
									}
									if(!empty($_DataArray2)){
										foreach($_DataArray2 as $da){
											$db->query_data($sld_db, $da, 'INSERT');	
										}
									}
								}
							
								$db->Where = "Where SL_SID = '".$survey['Data']['Survey_ID']."'";	
								$_SLDATA = array('SL_Number'=>$count,'SL_LaunchDate'=>$sdate);
								$db->query_data( $sl_db , $_SLDATA, 'UPDATE');
								if($count==$SL['Data']['SL_Number']){
									$_html_msg = '投放申請成功，系統會自動寄信給符合資格的消費者！';
								}else{
									$_html_msg = '投放申請成功，系統會自動寄信給符合資格的消費者！現存資料不足預定投放人數，已投放了'.$count.'人';
								}
							}
						}elseif($survey['Data']['Survey_Target']=='excel'){
							$SL = $CM->GET_SL_DATA($survey['Data']['Survey_ID']);//取得投放資料
							$db->Order_By = 'ORDER BY rand() ';//設置為隨機順序
							$db->Where = "Where Candidate_CID = '".$survey['Data']['Survey_CID']."' AND Candidate_SID = '".$survey['Data']['Survey_ID']."' AND Candidate_Enable=1";		
							$db->query_sql($candidate_db, '*',0,(int)($SL['Data']['SL_Number']));
							$count = 0;
							$_DataArray2 = array();//存入資料表的投放名單
							while($row = $db->query_fetch()){
				
								//存入投放名單中
								$_SurveyLaunchDetailData = array(
									'SLD_SID'		  => $survey['Data']['Survey_ID'],
									'SLD_CandID'	  => $row['Candidate_ID'],
									'SLD_Sdate'	      => $sdate,
								);
								$_DataArray2[$count]=$_SurveyLaunchDetailData;
								++$count;
							}
							if(!empty($_DataArray2)){
								foreach($_DataArray2 as $da){
									$db->query_data($sld_db, $da, 'INSERT');	
								}
							}
							$db->Where = "Where SL_SID = '".$survey['Data']['Survey_ID']."'";	
							$_SLDATA = array('SL_Number'=>$count,'SL_LaunchDate'=>$sdate);
							$db->query_data( $sl_db , $_SLDATA, 'UPDATE');
							$_html_msg = '投放申請成功，系統會自動寄信給已匯入的所有名單，共'.$count.'人！';
						}
					}

				
			}else{
				$_html_msg = '問卷和公司不相符，無法投放！';
			}
			
		break;
		//問卷填寫後送出--消費者方
		case "survey_submit":
			if( $_Login ) {
				switch($_state){
					case 'company':
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
					break;
					case 'member':
					break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
				}
			}else{
				$_html_msg = '請先登入帳號！';
				$_html_href ="index.php";
				break;
			}
			$_html_msg = '';
			$_html_msg_array = array(); 
			$value = array();
			$Value['coupid'] 		= trim($_POST['coupid']);//折扣卷編號
			$Value['surveyid'] 		= trim($_POST['surveyid']);//問卷編號
			$Value['qa_content'] = json_decode($_POST['qa_content']);
			foreach( $Value as $key => $val ){
				if( empty($val) ) {
					array_push($_html_msg_array,'資料填寫不完整');
					break;
				}
			}
			if(!isJson($Value['qa_content'])){  //判斷資料是否為json格式
				array_push($_html_msg_array,'題目和答案資料接收異常');
				break;
			}
			if(!empty($_html_msg_array) ){ //判斷資料完整度
				foreach($_html_msg_array as $hma){
					$_html_msg = $hma;
					break;
				}
			}else{
				$survey = $CM->GET_SURVEY_DATA($Value['surveyid']);
				$SN = date('Ymd');
				$SN = 'SR'.substr($SN, -6);
				$SR_ID = GET_NEW_ID($sr_db, 'SR_ID', $SN, 4);
				$_SurveyRecordData = array(
					'SR_ID' 	 	 => $SR_ID,
					'SR_SID' 	 	 => $Value['surveyid'],
					'SR_MID'	  	 => $_MemberData['Member_ID'],
					'SR_Get_Coup_ID' => $Value['coupid'],
					'SR_Ansdate' 	 => $sdate
				);
				$db->query_data($sr_db, $_SurveyRecordData, 'INSERT');
				if( !empty($db->Error) ){
					$_html_msg 	= '提交問卷失敗，請稍等一下再提交!';
					break;
				}
				foreach($Value['qa_content'] as $con){
					$answer_json = json_encode($con->answer,256);
					$_SurveyRecordData = array(
						'SRD_SQID'	  => $con->question_number,
						'SRD_SRID' 	  => $SR_ID,
						'SRD_Type'  => $con->intype,
						'SRD_Answer'  => $con->intype=='select'||$con->intype=='radio'?$answer_json:'',
						'SRD_Muti_Answer'  => $con->intype=='checkbox'?$answer_json:''
					);
					$db->query_data($srd_db, $_SurveyRecordData, 'INSERT');
				}
				if( !empty($db->Error) ){
					$_html_msg 	= '提交問卷失敗，請稍等一下再提交!';
					break;
				}else{
					$db->Where = " WHERE  SR_SID = '" .$db->val_check($Value['surveyid']). "' AND SR_Get_Coup_ID = '" .$db->val_check($Value['coupid']). "'";
					$sr_num = $db->query_count($sr_db, '*');//已填此問卷的人數
					if($survey['Data']['Survey_CoupNum']>=$sr_num){
						// $SN = date('Ymd');
						// $SN = 'CC'.substr($SN, -6);
						$coupon = $CM->GET_COUPON_DATA($Value['coupid']);
						$CC_ID = GET_NEW_ID($cc_db, 'CC_ID', $coupon['Data']['Coupon_IndepID'], 4);
						$_CustomerCouponData = array(
							'CC_ID'		  => $CC_ID,
							'CC_MID'	  => $_MemberData['Member_ID'],
							'CC_Coup_ID'  => $Value['coupid'],
							'CC_Enable'	  => 1,
							'CC_Show'	  => 0,
							'CC_Sdate'	  => $sdate,
						);
						$db->query_data($cc_db, $_CustomerCouponData, 'INSERT');
						//存入投放名單中
						$_CouponLaunchDetailData = array(
							'CLD_SID'		  => $Value['surveyid'],
							'CLD_MID'		  => $_MemberData['Member_ID'],
							'CLD_CoupID'	  => $Value['coupid'],
							'CLD_CCID'		  => $CC_ID,
							'CLD_Sdate'	  => $sdate,
						);
						$db->query_data($cld_db, $_CouponLaunchDetailData, 'INSERT');
						
					}
					$_html_msg 	= '提交問卷成功，若有中獎會發Email通知您！';
					$_html_href = 'cust_index.php';
				}
			}
		break;
		//折扣卷使用
		case 'coupon_use':
			if( $_Login ) {
				switch($_state){
					case 'company':
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
					break;
					case 'member':
					break;
					default:
						$_html_msg = '請先登入帳號！';
						$_html_href ="index.php";
					break;
				}
			}else{
				$_html_msg = '請先登入帳號！';
				$_html_href ="index.php";
				break;
			}
			$_html_msg = '';
			$_html_msg_array = array(); 
			$value = array();
			$Value['cc_id'] 		= trim($_POST['cc_id']);//折扣卷編號
			$cc = $CM->GET_CC_DATA($Value['cc_id']);
			if(empty($cc['Data'])){
				$_html_msg = '資料錯誤';
				break;
			}
			$db->Where = "Where CC_ID = '".$Value['cc_id']."'";
			$db->query_data($cc_db,array('CC_Enable'=> 0),'UPDATE');
			if( !empty($db->Error) ){
				$_html_msg 	= '使用折扣卷失敗！';
				break;
			}else{
				$_html_msg 	= '使用折扣卷成功！';
				$_html_href = 'cust_coupon.php';
			}
		break;
	}
}

if( $_Type != 'mailauth' ){
	
	$json_array['html_msg']     = $_html_msg ? $_html_msg : '';//訊息
	$json_array['html_href']    = $_html_href ? $_html_href : '';//連結
	$json_array['html_eval']    = $_html_eval ? $_html_eval : '';//確定後要執行的JS
	$json_array['html_content'] = $_html_content ? $_html_content : '';//輸出內容
	
	echo json_encode( $json_array );
}
?>