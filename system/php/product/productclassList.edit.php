<?php if( !function_exists('Chk_Login') ) header('Location: ../index.php'); ?>

<div class="abgne_tab">
    <ul class="tabs">
        <li><a href="javascript:void(0)" for-id="tab1">基本資料</a></li>
    </ul>
    <div class="tab_container">
    
		<div id="tab1" class="tab_content">
        
            <form id="menu_edit_form" class="form-horizontal">
            
            <?php foreach( $_html_ as $key => $val ){ 
			
				$table_sn = 'tabsn'.$key;
			?>
				<div class="Table_border <?=$table_sn?>">
                
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><?=$table_info[$Main_Key]['Comment']?></label>
                        <div class="col-sm-9">
                            <input type="text" id="<?=$Main_TablePre?>_ID" class="col-xs-12 col-sm-5" value="<?=$val[$Main_Key]?>" disabled="disabled">
                        </div>
                    </div>
                    
					<?php 
                    //-----------------------------------------//
                    if( !empty($Menu_Lv_Arr) ){ 
                    
                        $Arr_Name = $Main_TablePre.'_UpMID';
                        
                        echo $_TF->html_select('第 ' .$menu_lv_states[($val[$Main_TablePre.'_Lv'] - 1)]. ' 層分類', '', $Arr_Name, $val, '', $Menu_Lv_Arr, 'NO_FIRST_OPTION');
                    }
                    //-----------------------------------------//
                    $Arr_Name = $Main_TablePre.'_Name';
                    
                    echo $_TF->html_text($table_info[$Arr_Name]['Comment'], '', '', $table_info[$Arr_Name]['Field_Length'], $Arr_Name, $val, '請輸入'.$table_info[$Arr_Name]['Comment'], 1);	
					//-----------------------------------------//
                    // $Arr_Name = $Main_TablePre.'_Nameen';
                    
                    // echo $_TF->html_text($table_info[$Arr_Name]['Comment'], '', '', $table_info[$Arr_Name]['Field_Length'], $Arr_Name, $val, '', 1);
					//-----------------------------------------//
                    $Arr_Name = $Main_TablePre.'_Sort';
                    
                    echo $_TF->html_number($table_info[$Arr_Name]['Comment'], '', '(ex. 0 ~ 99999)', $table_info[$Arr_Name]['Field_Length'], $Arr_Name, $val, '', 1, 0, 99999);
					//-----------------------------------------//
                    $Arr_Name = $Main_TablePre.'_Open';
                    
					echo $_TF->html_checkbox($table_info[$Arr_Name]['Comment'], '', $Arr_Name, $val, '', 1);
                    ?>
                </div>
            <?php } ?> 
                <div class="clear_both form-actions">
                    <button id="saveb" class="btn btn-info" type="button" onclick="menu_edit_form()">
                        <i class="ace-icon fa fa-check bigger-110"></i>儲存
                    </button>&nbsp;&nbsp;&nbsp; 
                            
                    <button id="rsetb" class="btn btn" type="reset">
                        <i class="ace-icon fa fa-check bigger-110"></i>重設
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>