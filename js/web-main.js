var Exec_Url = 'web_post.php';

function Post_JS(FormData, ExecUrl, Field) {
	$.post(ExecUrl, FormData
		, function (data) {

			loading('close');

			if (data.html_msg != '' && data.html_msg != null) {

				swal.fire({
					title: "訊息",
					text: data.html_msg,
				}).then((result) => {
					if (data.html_eval != '' && data.html_eval != null) {

						setTimeout(data.html_eval, 1);
					} else if (data.html_href != '' && data.html_href != null) {

						window.location.href = data.html_href;
					}
				});

				return false;
			}

			if (data.html_href != '' && data.html_href != null) {

				window.location.href = data.html_href;
				return false;
			}

			if (data.html_content != '' && data.html_content != null) {

				$(Field).html(data.html_content);

				return false;
			}

			if (data.html_eval != '' && data.html_eval != null) {

				setTimeout(data.html_eval, 1);
				return false;
			}
		}, 'json'
	);
}

function Ajax_Post(FormData, ExecUrl, Field) {

	loading('open');

	$.ajax({
		url: ExecUrl,
		data: FormData,
		type: "POST",
		dataType: 'json',
		mimeType: "multipart/form-data",
		contentType: false,
		cache: false,
		processData: false,
		success: function (data) {

			loading('close');

			if (data.html_msg != '' && data.html_msg != null) {

				alert(data.html_msg);
				if (data.html_eval != '' && data.html_eval != null) {

					setTimeout(data.html_eval, 1);
				} else if (data.html_href != '' && data.html_href != null) {

					window.location.href = data.html_href;
				}

				return false;
			}

			if (data.html_href != '' && data.html_href != null) {

				window.location.href = data.html_href;
				return false;
			}

			if (data.html_content != '' && data.html_content != null) {

				$(Field).html(data.html_content);

				return false;
			}

			if (data.html_eval != '' && data.html_eval != null) {

				setTimeout(data.html_eval, 1);
				return false;
			}
		},
		error: function (xhr, ajaxOptions, thrownError) {

			alert(thrownError);
		}
	});
}

//網址刷新
function Reload() {

	window.location.reload();
}

function loading(Type) {

	if (Type == 'open') {

		$(document).Loading({ _action: true });
	} else if (Type == 'close') {

		$(document).Loading({ _action: false });
	}
}

$(document).ready(function (e) {

	$('.fsubmit').click(function () {

		var type = $(this).attr('data-type');
		var field = '#' + $(this).closest('form').attr('id');
		if (CheckInput(field)) {

			var Form_Data = '';

			Form_Data += $(field).serialize();
			Form_Data += '&_type=' + type;

			Post_JS(Form_Data, Exec_Url);
		}
	});


	$('.logout').click(function () {
		var Form_Data = '';
		Form_Data += '&_type=mlogout';
		Post_JS(Form_Data, Exec_Url);
	});

});

function noOPEN() {
	alert('尚未開放，敬請期待');
	return false;
}
//刪除資料(部門、班別、員工)
function del_data(ID, CID, Type) {

	if (confirm('確定刪除?')) {
		var FormData = 'id=' + ID + '&_type=' + Type + '&cid=' + CID;

		Post_JS(FormData, Exec_Url);

	}
}
//刪除資料(請假)
function del_data_leave(ID, CID, TIME, Type) {
	if (confirm('確定刪除?')) {
		var FormData = 'id=' + ID + '&_type=' + Type + '&cid=' + CID + '&time=' + TIME;

		Post_JS(FormData, Exec_Url);

	}


}
//判斷是否為空值
function checkin(val) {

	if (val == '' || val == null) {

		val = '';
	}

	return val;
}

//判斷是否為空值
function checkin_Zero(val) {

	if (val == '' || val == null) {

		val = 0;
	}

	return val;
}

function Ajax_Chk(_this) {

	var msg = '';
	var type = _this.attr('check-type') ? _this.attr('check-type') : '';//資料第一種類
	var id = _this.attr('check-id') ? _this.attr('check-id') : '';//主鍵
	var field = _this.attr('check-field') ? _this.attr('check-field') : '';//更新欄位
	var data_new = _this.val() ? _this.val() : '';//資料值
	var data_old = _this.attr('check-data') ? _this.attr('check-data') : '';//資料舊值
	var sn = _this.attr('check-sn') ? _this.attr('check-sn') : '';//資料序號
	var datatype = _this.attr('check-datatype') ? _this.attr('check-datatype') : '';//資料第二種類

	var Min = _this.attr('check-min') ? _this.attr('check-min') : '';//資料最小值
	var Max = _this.attr('check-max') ? _this.attr('check-max') : '';//資料最大值

	var name = _this.attr('check-name') ? _this.attr('check-name') : '';//資料名稱

	var connectfield = _this.attr('check-connectfield') ? _this.attr('check-connectfield') : '';//相互作用欄位

	if (datatype == 'datestart' && connectfield != '') {

		var datatime = $('#' + connectfield).val();
		var name2 = checkin($('#' + connectfield).attr('check-name'));

		if (data_new > datatime && datatime != 0) {

			msg = name + '要小於' + name2;
		}
	} else if (datatype == 'dateend' && connectfield != '') {

		var datatime = $('#' + connectfield).val();
		var name2 = checkin($('#' + connectfield).attr('check-name'));
		if (data_new < datatime) {

			msg = name + '要大於' + name2;
		}
	} else if (type == 'number') {

		var r_number = /^[\-0-9]+$/;
		if (!r_number.test(data_new)) {

			msg = '請輸入數字';
		} else if (parseInt(data_new) < Min && Min != '') {

			msg = '數字不能小於 ( ' + Min + ' )';
		} else if (parseInt(data_new) > Max && Max != '') {

			msg = '數字不能大於 ( ' + Max + ' )';
		}
	} else if (type == 'checkbox' || type == 'checkboxs') {

		data_new = _this.prop('checked');//資料值
		data_old = data_new ? false : true;//資料值
	}

	if (msg != '') {//錯誤訊息印出

		if (type != 'checkbox') {

			_this.val(data_old);
		}
		alert(msg);

	} else if (data_new != data_old) {//不一樣值才執行

		if ((checkin(id) != '' && checkin(field) != '') || checkin(type) == 'norepeat') {//有主鍵和欄位才執行或者判斷不重複

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
				mimeType: "multipart/form-data",
				contentType: false,
				cache: false,
				processData: false,
				success: function (data) {

					loading('close');

					if (data.html_msg != '') {

						$(".tc_box").BoxWindow({
							_msg: data.html_msg,
						});

						_this.val(data_old);
					} else {

						if (type != 'norepeat') {

							_this.attr('check-data', data_new);
						}
					}

					if (data.html_eval != '' && data.html_eval != null) {

						setTimeout(data.html_eval, 1);
					}
				},
				error: function (xhr, ajaxOptions, thrownError) {

					loading('close');

					$(".tc_box").BoxWindow({
						_msg: thrownError,
					});
				}
			});
		}
	}
}

function Datetimepicker(Field, Format, type) {

	if (!checkin(Format)) {

		Format = 'YYYY-MM-DD HH:mm:ss';
	}
	var month = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
	Today = new Date();
	var Year = Today.getFullYear();
	var Month = month[Today.getMonth()];
	var Day = Today.getDate();
	var realtime = Year + '-' + Month + '-' + Day;
	// alert(realtime);
	if (type == 'start_date') {

		$(Field).datetimepicker({
			ignoreReadonly: true,
			format: Format,
			locale: 'zh-tw',
			defaultDate: realtime,
			// maxDate : realtime,
			//calendarWeeks:true,
		}).on("dp.hide", function (e) {

		}).on("dp.change", function (e) {
			Ajax_Chk($(this));
		});

	} else {

		$(Field).datetimepicker({
			ignoreReadonly: true,
			format: Format,
			locale: 'zh-tw',
			defaultDate: realtime,
			// maxDate : realtime,
			//calendarWeeks:true,
		}).on("dp.hide", function (e) {

		}).on("dp.change", function (e) {
			Ajax_Chk($(this));
		});
	}


}