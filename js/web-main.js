var Exec_Url = 'web_post.php';

var allow_file = new Array('jpg', 'jpeg', 'png', 'gif', 'doc', 'docx', 'pdf', 'ppt', 'pptx', 'xls', 'xlsx', 'csv');

function Post_JS( FormData, ExecUrl, Field ){
	
	loading('open');
	
	$.post( ExecUrl, FormData 
		,function( data ){console.log(data);
			
			loading('close');
			
			if( data.html_msg != '' && data.html_msg != null ){
				swal.fire({
					title: "訊息",
					text: data.html_msg,
				}).then((result) => {
					if( data.html_eval != '' && data.html_eval != null ){
					
						setTimeout(data.html_eval, 1);
					}else if( data.html_href != '' && data.html_href != null ){
						
						window.location.href = data.html_href;
					}
				});
				
				
				return false;
			}
			
			if( data.html_href != '' && data.html_href != null ){
				
				window.location.href = data.html_href;
				return false;
			}

			if( data.html_content != '' && data.html_content != null ){
				
				$(Field).html(data.html_content);
				
				return false;
			}
			
			if( data.html_eval != '' && data.html_eval != null ){
				
				setTimeout(data.html_eval, 1);
				return false;
			}
		},'json'
	);
}

function Ajax_Post( FormData, ExecUrl, Field ){
	
	loading('open');
		
	$.ajax({
		url: ExecUrl,
		data: FormData,
		type: "POST",
		dataType: 'json',
		mimeType:"multipart/form-data",
		contentType: false,
		cache: false,
		processData:false,
		success: function(data){
				
			loading('close');
											
			if( data.html_msg != '' && data.html_msg != null ){
				
				alert(data.html_msg);
				if( data.html_eval != '' && data.html_eval != null ){
					
					setTimeout(data.html_eval, 1);
				}else if( data.html_href != '' && data.html_href != null ){
					
					window.location.href = data.html_href;
				}
				
				return false;
			}
			
			if( data.html_href != '' && data.html_href != null ){
				
				window.location.href = data.html_href;
				return false;
			}

			if( data.html_content != '' && data.html_content != null ){
				
				$(Field).html(data.html_content);
				
				return false;
			}
			
			if( data.html_eval != '' && data.html_eval != null ){
				
				setTimeout(data.html_eval, 1);
				return false;
			}
		},
		error:function(xhr, ajaxOptions, thrownError){ 
			
			alert(thrownError);
		}
	});
}

//網址刷新
function Reload(){
	
	window.location.reload();
}

var myVar;

function loading( Type ){
	
	if( Type == 'open' ){
		
		myVar = setTimeout(loading_show, 1);//12秒
		//$(document).Loading({ _action : true });
		
	}else if( Type == 'close' ){
		
		$(document).Loading({ _action : false });	
		
		clearTimeout(myVar);	
	}	
}

function loading_show(){
	
	$(document).Loading({ _action : true });
}

function loading_longtime(){
	
	$(".tc_box").BoxWindow({
		_msg: '讀取太久, 請重新登入',//訊息
		_url: 'index.php'
	});
}

function reimg(){
	
	var _this = $('.reimg');
	var src   = _this.attr('src').split("?");
	
	_this.attr('src', src[0]+'?code=' + Math.random());
}

function logout(){
	
	var Form_Data = '_type=mlogout';
		
	Post_JS(Form_Data, Exec_Url);
}

function Ajax_Chk( _this ){
		
	var msg		 		= '';
	var type	 		= _this.attr('check-type') ? _this.attr('check-type') : '';//資料第一種類
	var id	  	 		= _this.attr('check-id') ? _this.attr('check-id') : '';//主鍵
	var field			= _this.attr('check-field') ? _this.attr('check-field') : '';//更新欄位
	var data_new 		= _this.val() ? _this.val() : '';//資料值
	var data_old 		= _this.attr('check-data') ? _this.attr('check-data') : '';//資料舊值
	var sn 		 		= _this.attr('check-sn') ? _this.attr('check-sn') : '';//資料序號
	var datatype 		= _this.attr('check-datatype') ? _this.attr('check-datatype') : '';//資料第二種類
	
	var Min 	 		= _this.attr('check-min') ? _this.attr('check-min') : '';//資料最小值
	var Max 	 		= _this.attr('check-max') ? _this.attr('check-max') : '';//資料最大值
	
	var name 	 		= _this.attr('check-name') ? _this.attr('check-name') : '';//資料名稱
	
	var connectfield 	= _this.attr('check-connectfield') ? _this.attr('check-connectfield') : '';//相互作用欄位
	
	if( datatype == 'datestart' && connectfield != '' ){
		
		var datatime	= $('#'+connectfield).val();
		var name2		= checkin($('#'+connectfield).attr('check-name'));
		if( data_new > datatime && datatime != 0 ){
			
			msg = name+'要小於'+name2;
		}
	}else if( datatype == 'dateend' && connectfield != '' ){
		
		var datatime 	= $('#'+connectfield).val();
		var name2		= checkin($('#'+connectfield).attr('check-name'));
		if( data_new < datatime ){
			
			msg = name+'要大於'+name2;
		}
	}else if( type == 'number' ){
		
		var r_number = /^[\-0-9]+$/;
		if( !r_number.test(data_new) ){
						
			msg = '請輸入數字';
		}else if( parseInt(data_new) < Min && Min != '' ){
			
			msg = '數字不能小於 ( ' + Min+ ' )';
		}else if( parseInt(data_new) > Max && Max != '' ){
			
			msg = '數字不能大於 ( ' + Max + ' )';
		}
	}else if( type == 'checkbox' || type == 'checkboxs' ){
		
		data_new = _this.prop('checked');//資料值
		data_old = data_new ? false : true;//資料值
	}
			
	if( msg != '' ){//錯誤訊息印出
		
		if( type != 'checkbox' ){
			
			_this.val(data_old);
		}
		
		$(".tc_box").BoxWindow({
			_msg: msg,//訊息
			//_focus: _this
		});
	}else if( data_new != data_old ){//不一樣值才執行
		
		if( ( checkin(id) != '' && checkin(field) != '' ) || checkin(type) == 'norepeat' ){//有主鍵和欄位才執行或者判斷不重複
		
			var Form_Data = new FormData();
	
			Form_Data.append('_type', 'Table_Data_Change');
			Form_Data.append('_type1', type);
			Form_Data.append('id', id);
			Form_Data.append('field', field);
			Form_Data.append('data', data_new);
			
			loading('open');
			
			$.ajax({
				url: Exec_Url,
				data: Form_Data,
				type: "POST",
				dataType: 'json',
				mimeType:"multipart/form-data",
				contentType: false,
				cache: false,
				processData:false,
				success: function(data){
					
					loading('close');
					
					if( data.html_msg != '' ){
					
						$(".tc_box").BoxWindow({
							_msg: data.html_msg,
						});
						
						_this.val(data_old);
					}else{
						
						if( type != 'norepeat' ){
							
							_this.attr('check-data', data_new);
						}
					}
					
					if( data.html_eval != '' && data.html_eval != null ){
				
						setTimeout(data.html_eval, 1);
					}
				},
				error:function(xhr, ajaxOptions, thrownError){ 
					
					loading('close');
					
					$(".tc_box").BoxWindow({
						_msg: thrownError,
					});
				}
			});
		}
	}
}
/*
function Datetimepicker( Field, Format ){
	
	if( !checkin( Format ) ){
		
		Format = 'YYYY-MM-DD HH:mm:ss';
	}
	
	$(Field).datetimepicker({
		ignoreReadonly: true,
		format: Format,
		locale: 'zh-tw'
	}).on("dp.hide",function (e) {
								
		Ajax_Chk($(this));
		//$(this).data("DateTimePicker").hide();
		//$(this).data("DateTimePicker").maxDate(e.date);
	}).on("dp.change",function(e) {
		
		$('#Lunar').append().attr("value","OP" );
	});
}
*/

function GetDateStr(AddDayCount) {

    var dd = new Date();

    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期

    var y = dd.getFullYear();

    var m = dd.getMonth()+1;//获取当前月份的日期

    var d = dd.getDate();

    return y+"-"+m+"-"+d;

}


function Datetimepicker( Field, Format , type , dateLimit){
	
	if( !checkin( Format ) ){
		
		Format = 'YYYY-MM-DD HH:mm:ss';
	}
	
	Today=new Date();
	realtime = Today.getFullYear()+'-'+(Today.getMonth()+1)+'-'+Today.getDate();
	
	if($(Field).data("DateTimePicker") !== undefined){
		$(Field).data("DateTimePicker").destroy();
	}
	
	if( dateLimit == true ) {
		
		_minDate = GetDateStr(-1);
		//_minDate = Today.getFullYear()+'-'+(Today.getMonth()+1)+'-'+Today.getDate();
	}
	
	if(type == 'week'){
		
		$(Field).datetimepicker({
			ignoreReadonly: true,
			format: Format,
			locale: 'zh-tw',
			maxDate : realtime,
			calendarWeeks:true,
		}).on("dp.hide",function (e) {
									
		}).on("dp.change",function(e) {
			Ajax_Chk($(this));
		});
	}else{
		
		if( dateLimit ){
			
			$(Field).datetimepicker({
				ignoreReadonly: true,
				format: Format,
				minDate : _minDate,
				locale: 'zh-tw',
			}).on("dp.hide",function (e) {
										
			}).on("dp.change",function(e) {
				Ajax_Chk($(this));
			});
			
		}else{
			$(Field).datetimepicker({
				ignoreReadonly: true,
				format: Format,
				locale: 'zh-tw',
			}).on("dp.hide",function (e) {
										
			}).on("dp.change",function(e) {
				Ajax_Chk($(this));
			});	
		}
		
	}
}
$(document).ready(function(e) {
	$(document).on("keypress", "form", function (e) {
		var code = e.keyCode || e.which;
		if (code == 13) {
			e.preventDefault();
			return false;
		}
	});
	$('.fsubmit').click(function() {
		
		var type  = $(this).attr('data-type');
		var field = '#'+$(this).closest('form').attr('id');
		if( CheckInput(field) ){
						
			var Form_Data = '';
			
			Form_Data += $(field).serialize();
			Form_Data += '&_type=' + type;

			Post_JS(Form_Data, Exec_Url);
		}
	});
	$('.msgBtn').click(function() {
		if(form_check('form1')){
			var type  = $(this).attr('data-type');
			var field = $('#form1');		
			var Form_Data = '';
			Form_Data += field.serialize();
			Form_Data += '&_type=' + type;
			Post_JS(Form_Data, Exec_Url);
		}
	});
	//帳號註冊
	$('.registBtn').click(function() {
		var type  = $(this).attr('data-type');
		var field = $(this).closest('form');		
		var Form_Data = '';
		Form_Data += field.serialize();
		Form_Data += '&_type=' + type;
		Post_JS(Form_Data, Exec_Url);
	});
	//會員資料修改
	$('.save_btn').click(function() {
		var type  = $(this).attr('data-type');
		var field = $(this).closest('form');		
		var Form_Data = '';
		Form_Data += field.serialize();
		Form_Data += '&_type=' + type;
		// console.log(field.serialize());
		Post_JS(Form_Data, Exec_Url);
	});
	//會員資料修改
	$('.planBtn').click(function() {
		var type  = $(this).attr('data-type');
		var field = $(this).closest('form');		
		var Form_Data = '';
		Form_Data += field.serialize();
		Form_Data += '&_type=' + type;
		// console.log(field.serialize());
		Post_JS(Form_Data, Exec_Url);
	});
	//公版問卷生成
	$('.survey_outputBtn').click(function() { 
		var type  = $(this).attr('data-type');
		var field = $('#form1');		
		var Form_Data = '';
		var qa_array = new Array();
		$('.questionBox').each(function(key, value) {  //將問卷的題目和答案包在qa_array裡，再將其轉成json放入input[name=]
			var qa_object = {}; // 使用物件而不是陣列
		  
			qa_object['question'] = $(value).find('input[name=question]').val();
			qa_object['intype'] = $(value).find('input[name=question]').data('intype');
			var qa_array_2 = [];
			if(qa_object['intype']=='radio'||qa_object['intype']=='checkbox'){
				$(value).find('input[name=answer]').each(function(key2, value2) {
					qa_array_2[key2] = $(value2).val();
				});
			}else{
				$(value).find('select[name=answer] option').each(function(key2, value2) {
					qa_array_2[key2] = $(value2).val();
				});
			}

		  
			qa_object['answer'] = qa_array_2;
			qa_array[key] = qa_object;
		});
		var qa_json = JSON.stringify(qa_array);
		// console.log($('input[name=allcontent]').val());
		// console.log(qa_json);
		$('input[name=allcontent]').val(qa_json);
		Form_Data += field.serialize();
		Form_Data += '&_type=' + type;
		Post_JS(Form_Data, Exec_Url);
	});

	//自訂問卷生成
	$('.survey_outputCBtn').click(function() { 
		var type  = $(this).attr('data-type');
		var field = $('#form1');		
		var Form_Data = '';
		Form_Data += field.serialize();
		Form_Data += '&_type=' + type;
		Post_JS(Form_Data, Exec_Url);
	});

	//問卷填寫送出
	$('.surveysubBtn').click(function() { 
		var type  = $(this).attr('data-type');
		var field = $('#form1');		
		var Form_Data = '';
		var flag = 0;
		var qa_array = new Array();
		$('.questionBox').each(function(key, value) {  //將問卷的題目和答案包在qa_array裡，再將其轉成json放入input[name=qa_content]
			var qa_object = {}; // 使用物件而不是陣列
		  
			qa_object['question_number'] = $(value).find('input[name=question_number]').val();
			qa_object['intype'] = $(value).find('input[name=question_number]').data('intype');
			var qa_array_2 = [];
			switch(qa_object['intype']){
				case 'select':
					if($(value).find('option:selected').length<1){
						flag = 1;
					}else{
						$(value).find('option:selected').each(function(key2, value2) {
							qa_array_2[key2] = $(value2).val();
						})
					}
				break;
				case 'radio':
					if($(value).find('input:checked').length<1){
						flag = 1;
					}else{
						qa_array_2[0] = $(value).find('input:checked').val();
					}
				break;
				case 'checkbox':
					if($(value).find('input:checked').length<1){
						flag = 1;
					}else{
						$(value).find('input:checked').each(function(key2, value2) {
							qa_array_2[key2] = $(value2).val();
						});
					}
				break;
				default:
					flag = 1;
				break;
			}
			if(flag==1){
				swal.fire({
					title: "訊息",
					text: "請檢查是否每一道題皆有作答！",
					icon: "error"
				})
				return false;
			}
			qa_object['answer'] = qa_array_2;
			qa_array[key] = qa_object;
		});
		if(flag==0){
			var qa_json = JSON.stringify(qa_array);
			$('input[name=qa_content]').val(qa_json);
			
			Form_Data += field.serialize();
			Form_Data += '&_type=' + type;
			// console.log(Form_Data);
			Post_JS(Form_Data, Exec_Url);			
		}
	});
	//問卷投放
	$('.launchBtn').click(function() {
		var type  = $(this).attr('data-type');
		var field = $('#form1');		
		var Form_Data = '';
		Form_Data += field.serialize();
		Form_Data += '&_type=' + type;
		Post_JS(Form_Data, Exec_Url);
	});

	//折扣卷生成
	$('.coupon_outputBtn').click(function() {
		var type  = $(this).attr('data-type');
		var field = $('#form1');		
		var Form_Data = '';
		if(form_check('form1')){
			Form_Data += field.serialize();
			Form_Data += '&_type=' + type;
			var formData = new FormData($("#form1")[0]);
			$.ajax({
				url: 'ajax/coupon_add.php',
				contentType: false,
				async: false,
				type: "POST",
				cache: false,
				processData: false,
				data: formData,
				error: function (jqXHR, textStatus, errorThrown) {
					// console.log("FAIL: " + errorThrown); //看錯誤訊息
					alert('上傳錯誤！')
				},
				success: function (data, textStatus, jqXHR) {
					var _msg = JSON.parse(data);
					swal.fire({
						title: "訊息",
						text: _msg[0],
					}).then((result) => {
						if(_msg[1]!=''){
							location.href=_msg[1];
						}
					});
				}
			})
		}
	});

	//折扣卷編輯
	$('.coupon_editBtn').click(function() {
		if(form_check('form1')){
			var formData = new FormData($("#form1")[0]);
			$.ajax({
				url: 'ajax/coupon_edit.php',
				contentType: false,
				async: false,
				type: "POST",
				cache: false,
				processData: false,
				data: formData,
				error: function (jqXHR, textStatus, errorThrown) {
					// console.log("FAIL: " + errorThrown); //看錯誤訊息
					alert('上傳錯誤！')
				},
				success: function (data, textStatus, jqXHR) {
					var _msg = JSON.parse(data);
					swal.fire({
						title: "訊息",
						text: _msg[0],
					}).then((result) => {
						if(_msg[1]!=''){
							if(_msg[1]=='reload'){
								location.reload();
							}else{
								location.href=_msg[1];
							}
						}
					});
				}
			})
		}
	})
	//折扣卷刪除
	$('.coupon_delBtn').click(function() {
		if(confirm('確認要刪除嗎?')){
			var formData = new FormData($("#form1")[0]);
			console.log(formData);
			$.ajax({
				url: 'ajax/coupon_del.php',
				contentType: false,
				async: false,
				type: "POST",
				cache: false,
				processData: false,
				data: formData,
				error: function (jqXHR, textStatus, errorThrown) {
					alert('刪除失敗，請重新試一次！')
					location.reload();
				},
				success: function (data, textStatus, jqXHR) {
					var _msg = JSON.parse(data);
					swal.fire({
						title: "訊息",
						text: _msg[0],
					}).then((result) => {
						if(_msg[1]!=''){
							if(_msg[1]=='reload'){
								location.reload();
							}else{
								location.href=_msg[1];
							}
						}
					});
				}
			})
		}else{
			console.log('ok');
		}

	})
	//使用折扣卷
	$('.coupon_useBtn').click(function() {
		var type  = $(this).attr('data-type');
		var field = $(this).closest('form');		
		var Form_Data = '';
		Form_Data += field.serialize();
		Form_Data += '&_type=' + type;
		// console.log(field.serialize());
		Post_JS(Form_Data, Exec_Url);
	});
	$('.logout').click(function(){
		var Form_Data = '';
		Form_Data += '&_type=mlogout';	
		Post_JS(Form_Data, Exec_Url);	
	});
	// 將 form_check 函數提取到全域範圍
    window.form_check = function (selector){	
	//檢查Form有required屬性元件是否過檢查機制
		var form = document.getElementById(selector);
		var isValid = form.reportValidity();
		if (!isValid) {
			// 尋找第一個未通過驗證的元素
			var invalidElement = $(form).find(':invalid');
			var invalid_list = '';
			var invalid_other = false;
			if (invalidElement) {
				invalidElement.each(function(key,value){
					if($(value).closest('.otherclass').length>0){
						invalid_other = true;
					}else{
						invalid_list += $(value).data('name')+'<br/>';
					}
				})
				if(invalid_other){
					invalid_list += "請檢查每個題目、答案及選項類型是否已填完";
				}
				Swal.fire({
					title: "請確認是否填寫↓",
					html: invalid_list,
					icon: "error"
				});
			}
			return false;
		}else{
			return true;
		}
	}
	
	$('#search_key').keypress(function(e){
	
		code = (e.keyCode ? e.keyCode : e.which);

		if (code == 13)

		{
			var search_key = $('#search_key').val();
			if (search_key != '') {
				location.href = 'search.php?searchkey=' + search_key;
			}
		}			
	});


	
	$('.search_btn_mobile').click(function(){
		
		var search_key = $('#search_key_mobile').val();
		var search_index = $(this).attr("data-index");
		
		if( checkin(search_key) != ''){
			
			location.href = 'search.php?searchkey='+search_key;	
		}else{
			
			alert('請輸入搜尋條件');	
		}
			
	});
	
});


function Chk_FBShare( url, href ){
	
	if( confirm('是否發送到FaceBook?') ){
		
		FBShare(url);
		window.location.href = href;
	}else{
		
		window.location.href = href;	
	}
}

function FBShare( url ){
	
	var url = 'http://www.facebook.com/sharer/sharer.php?u=' + url;
	window.open(url, '_blank');
}

function Url_Open( url, target){
	
	if( checkin(target) == '' ){
		
		target = '_blank';
	}
	
	window.open(url, '_blank');
}

var auth2;
var myVar;
function initClient(){
	
	gapi.load('auth2', function(){

		auth2 = gapi.auth2.init({
			client_id: '973960356855-dldk204r0g4mndi0sk8lif5517e560vg.apps.googleusercontent.com',
		});
		
		auth2.attachClickHandler('signin-button', {}, onSuccess, onFailure);
	});
}

function onSuccess(user){
	
	var profile = user.getBasicProfile();
	
	var Form_Data = 'id=' +profile.getId()+ '&name=' +profile.getName()+ '&email=' +profile.getEmail()+ '&_type=googlelogin';
	
	Post_JS(Form_Data, Exec_Url);
}

function onFailure(error){
	
	console.log(error);
}

function getUrlVal( url, str ){
	
	var strUrl = url;
	var getPara, ParaVal;
	
	if ( strUrl.indexOf("?") != -1 ) {
		
		var getSearch = strUrl.split("?");
		getPara = getSearch[1].split("&");
		
		for( i = 0; i < getPara.length; i++ ) {
			
			ParaVal = getPara[i].split("=");
			
			if( ParaVal[0] == str ){
				
				return ParaVal[1];
			}
		}
	}
}


function CREAT_CKEDITOR( Field, Height ){
	
	if( !checkin( Height ) ){
		
		Height = 400;
	}
	
	var editor = CKEDITOR.replace( Field, {
		enterMode 					: CKEDITOR.ENTER_BR,
		height 						: Height,
		toolbar						: 'APPToolbar',
        filebrowserImageUploadUrl 	: 'system/plugins/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
		//可上傳圖檔
	});
	
	return editor;
}

//判斷是否為空值
function checkin( val ){
	
	if( val == '' || val == null ){
		
		val = '';
	}
	
	return val;
}

function Acc_Chk(){
	
	var _account 	= $("input[name=reg_email]").val();
	
	$.ajax({
		url: 'ajax/Chk_Acc.php',
		data: 'reg_email='+_account,
		type: "POST",
		dataType: 'json',
		success: function(data){
				
			if( data.Msg != '' && data.Msg != null ){
				
				alert( data.Msg );
				$("input[name=reg_email]").focus();
				$("input[name=acc_chk]").val( 0 );
				$(".prompt_acc_alert").html('※此信箱已被使用');
				$( ".prompt_acc_alert" ).removeClass( "green" ).addClass( "red" );
				return false;
			}else{
				
				$( ".prompt_acc_alert" ).removeClass( "red" ).addClass( "green" );
				$(".prompt_acc_alert").html('※此信箱可以使用');
				$("input[name=acc_chk]").val( 1 );
			}
		},
		error:function(xhr, ajaxOptions, thrownError){ 
			
			alert(thrownError);
		}
	});
}


$(document).on('click', '.goback', function(){
	
	history.go(-1);
});




window.fbAsyncInit = function() {
	FB.init({
	  appId      : '1023821328084600',
	  cookie     : true,
	  xfbml      : true,
	  version    : 'v6.0'
	});
	  
	FB.AppEvents.logPageView();   
  
};
(function(d, s, id){
 var js, fjs = d.getElementsByTagName(s)[0];
 if (d.getElementById(id)) {return;}
 js = d.createElement(s); js.id = id;
 js.src = "https://connect.facebook.net/en_US/sdk.js";
 fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function hidden() {

	var FormData = '_type=hidden';

	$.post(Exec_Url, FormData, function(data) {
		window.location.href = data.html_href;
	}, 'json');
}

function FBLogin(){
	
	FB.login(function(response) {
			
		if (response.authResponse) {
			
			FB.api('/me','GET',{"fields":"id,name,email"},
				function(response) {
					
					FBLoginPost(response);
				}
			);
		}
	}, {
	  scope: 'email',
	  auth_type: 'rerequest'
	});
}

function FBLoginPost(response){
	
	var Form_Data = 'id=' +response.id+ '&name=' +response.name+ '&email=' +response.email+'&_type=fblogin';
	
	Post_JS(Form_Data, Exec_Url);
}