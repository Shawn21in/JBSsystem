function CheckInput( Field ){
	
	var _msg = _focus = '';
	var _type = _val = _min = _max = data = '';
	$(Field+' input').each(function(index, element) {
		
		_focus = $(this);
		
		if( _focus.attr('disabled') == false || _focus.attr('disabled') == null ){
			
			_msg	= checkin(_focus.attr('msg'));
			
			_type 	= checkin(_focus.attr('input-type'));
			_val  	= checkin(_focus.val());
			_min 	= checkin(_focus.attr('input-min'));
			_max 	= checkin(_focus.attr('input-max'));
			_minlen	= checkin(_focus.attr('minlength'));
			_maxlen	= checkin(_focus.attr('maxlength'));
			_data 	= checkin(_focus.attr('input-data'));
			_name 	= checkin(_focus.attr('input-name'));
			
			if( _msg != '' && _val == '' ){
				
				return false;
			}else if( _type == 'number' ){
				
				if( _val != '' ){
					
					var r_number = /^[\-0-9]+$/;
					if( !r_number.test(_val) ){
					//_val = parseInt(_val);
					//alert(_val);
					//if( isNaN(_val) ){
						
						_msg = '請輸入 0 - 9 數字';
						return false;
					}else if( parseInt(_val) < _min && _min != '' ){
						
						_msg = '數字不能小於 ( ' + _min + ' )';
						return false;
					}else if( parseInt(_val) > _max && _max != '' ){
						
						_msg = '數字不能大於 ( ' + _max + ' )';
						return false;
					}
				}else{
					
					_focus.val(0);
				}
			}else if( _type == 'date' ){
					
					var reg = /^(\d{4})-(\d{2})-(\d{2})$/;  
					//var arr = reg.exec(_val);
					
					if( !reg.test(_val)&&RegExp.$2<=12&&RegExp.$3<=31){
						
						_msg = '請輸入正確的格式(YYYY-MM-DD)';
						return false;
					}
					
			//---台灣身分證格式		
			}else if( _type == 'twid' ){
				

				  tab = "ABCDEFGHJKLMNPQRSTUVXYWZIO"                     
				  A1 = new Array (1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3 );
				  A2 = new Array (0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5 );
				  Mx = new Array (9,8,7,6,5,4,3,2,1,1);

				  if ( _val.length != 10 ) {
					  
					  _msg = '請輸入正確的身分證格式';
					  return false;
				  }
				  i = tab.indexOf( _val.charAt(0) );
				  if ( i == -1 ) {
					  
					  _msg = '請輸入正確的身分證格式';
					  return false;
				  }
				  sum = A1[i] + A2[i]*9;

				  for ( i=1; i<10; i++ ) {
					v = parseInt( _val.charAt(i) );
					if ( isNaN(v) ) {
					  
					  _msg = '請輸入正確的身分證格式';
					  return false;
				  }
					sum = sum + v * Mx[i];
				  }
				  if ( sum % 10 != 0 ) {
					  
					  _msg = '請輸入正確的身分證格式';
					  return false;
				  }
				  
			//---僅能輸入中文名	  
			}else if( _type == 'chinesename' ){
				
					var reg = /[^\u4e00-\u9fa5]/;
					
					if( reg.test(_val) ){
						_msg = '請輸入中文名稱';
						return false;
					}
					/*
					if( _val.match("小姐") || _val.match("先生") ){
						
						_msg = '請輸入您的本名，請勿輸入(先生/小姐)!';
						return false;
					}*/
					
			//---家電、手機僅判斷數字			
			}else if( _type == 'tel' ){
				
				if( _val != '' ){
					
					var r_number = /^[\-0-9]+$/;
					if( !r_number.test(_val) ){
						
						_msg = '請輸入 0 - 9 數字';
						return false;
					}else if( _val.length < _minlen && _minlen != '' ){
						
						_msg = '電話碼數過少';
						return false;
					}else if( _val.length > _maxlen && _maxlen != '' ){
						
						_msg = '電話碼數過多';
						return false;
					}
				}else{
					
					_focus.val('');
				}
			}else if( _type == 'repassword' ){
				
				var re_val = $('#' +_focus.attr('input-re-id')).val();
				
				if( _val.length < _min && _min != '' ){
						
					_msg = '密碼長度過少';
					return false;
				}else if( _val.length > _max && _max != '' ){
					
					_msg = '密碼長度過多';
					return false;
				}else if( _val != re_val ){
					
					_msg = '密碼與密碼確認不一樣';
					return false;
				}
				
			//---判斷radio button 有無勾選
			}else if( _type == 'radio' ){
				
				var che = $('input:radio[name='+_name+']:checked').val();
				
				if( che == null ) {
					
					_msg = '請勾選性別';
					return false;
				}
			
			
			}else if( _type == 'checkbox' ){
				
				if( !_focus.prop('checked') ) return false;
			}else if( _val != '' ){
				
				if( _type == 'aznumber' ){//只能英文數字
					
					var r_test = /^[a-zA-Z0-9]+$/;
					
					if( !r_test.test(_val) ){
						
						_msg = '只能輸入英文數字';
						return false;
					}
				}else if( _type == 'email' ){
					
					var r_test = /^[0-9a-zA-Z]([-._]*[0-9a-zA-Z])*@[0-9a-zA-Z]([-._]*[0-9a-zA-Z])*\.+[a-zA-Z]+$/;
					
					if( !r_test.test(_val) ){
						
						_msg = '請輸入正確的email';
						return false;
					}
				}
			}
		
			_msg = '';
		}
	});
	
	if( _msg == '' ){
		
		$(Field+' select').each(function(index, element) {
			
			_focus = $(this);
			
			if( _focus.attr('disabled') == false || _focus.attr('disabled') == null ){
				
				_msg = checkin(_focus.attr('msg'));
				
				_val = checkin(_focus.val());
				
				if( _msg != '' && ( _val == '' || _val == 0 ) ){
					
					return false;
				}
				
				_msg = '';
			}
		});
	}
	
	if( _msg == '' ){
		
		$(Field+' textarea').each(function(index, element) {
			
			_focus = $(this);
			
			if( _focus.attr('disabled') == false || _focus.attr('disabled') == null ){
				
				_msg = checkin(_focus.attr('msg'));
				
				_val = checkin(_focus.val());
				
				if( _msg != '' && ( _val == '' || _val == 0 ) ){
					
					return false;
				}
				
				_msg = '';
			}
		});
	}
	
	if( _msg != '' ){
		
		if( _data != '' ){
			
			_focus.val(_data);
		}
		
		_focus.focus();
		
		alert(_msg);
		return false;
	}
	
	return true;
}

//判斷是否為空值
function checkin( val ){
	
	if( val == '' || val == null ){
		
		val = '';
	}
	
	return val;
}
