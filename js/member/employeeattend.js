$(function () {
    $("#search_eid").chosen({
        width: "50%",
        search_contains: true,
    });
    $("#gen_ed").chosen({
        width: "45%",
        search_contains: true,
    });
    $("#gen_ed2").chosen({
        width: "45%",
        search_contains: true,
    });

    $(".drag_me").draggable({
        axis: "x",
        drag: function (event, ui) {
            $('.table-scroll').css('cursor', 'grabbing');
            var element = $(".table-scroll")[0];
            console.log(element.scrollWidth)
            console.log(element.scrollLeft)
            console.log(element.clientWidth)
            // 判斷是否已經滑到最右側
            if (element.scrollWidth - element.scrollLeft <= element.clientWidth + 1) {
                $(".table-scroll").scrollLeft(element.scrollWidth);
                $(".drag_me").css('left', '0px');
                return false;
            }
            // 判斷是否已經滑到最左側
            if (element.scrollLeft === 0) {
                $(".table-scroll").scrollLeft(1);
                $(".drag_me").css('left', '0px');
                return false;
            }
            // 根據拖動的距離計算滾動的偏移量
            var scrollOffset = ui.position.left - ui.originalPosition.left;
            // 在表格滾動區域上應用滾動偏移量
            $(".table-scroll").scrollLeft($(".table-scroll").scrollLeft() - scrollOffset);
        },
        stop: function (event, ui) {
            $('.table-scroll').css('cursor', 'grab');
        }
    });
    $('#gen_niandu').on('change', function () {
        let year = parseInt($(this).val()) + 1911;
        $('input[name=startdate]').val(year + "-01-01")
        $('input[name=enddate]').val(year + "-12-31")
        // console.log(year);
        $('#daterange').daterangepicker({
            startDate: "01/01/" + year,
            endDate: "12/31/" + year,
            minDate: "01/01/" + year,
            maxDate: "12/31/" + year,
            locale: {
                cancelLabel: 'Clear'
            }
        }, function (start, end, label) {
            $('input[name=startdate]').val(start.format('YYYY-MM-DD'))
            $('input[name=enddate]').val(end.format('YYYY-MM-DD'))
            // console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
        });
    })
    $('#daterange').on('cancel.daterangepicker', function (ev, picker) {
        $(this).val('');
    });
    //查詢出勤曆
    $('input[name=eid]').on('change', function () {
        let Form_Data = new Array();
        let eid = $(this).val();
        let eid_array = { "name": "eid", "value": eid };
        let niandu = $('input[name=niandu]').val();
        let niandu_array = { "name": "niandu", "value": niandu };
        let token = $('input[name=token]').val();
        let token_array = { "name": "token", "value": token };
        if (niandu == '') {
            swal.fire({
                title: "請先填入年度",
                icon: "info"
            })
            $(this).prop('checked', false);
            return false;
        }
        Form_Data.push(eid_array)
        Form_Data.push(niandu_array)
        Form_Data.push(token_array)
        // console.log(Form_Data);

        $.ajax({
            url: 'ajax/search_date.php',
            type: "POST",
            data: Form_Data,
            beforeSend: function () {
                Swal.fire({
                    title: "查詢中...",
                    html: `
                            <div class="card-body d-flex align-items-center justify-content-center" style="height: 160px">
                                <div class="sk-chase">
                                    <div class="sk-chase-dot"></div>
                                    <div class="sk-chase-dot"></div>
                                    <div class="sk-chase-dot"></div>
                                    <div class="sk-chase-dot"></div>
                                    <div class="sk-chase-dot"></div>
                                    <div class="sk-chase-dot"></div>
                                </div>
                            </div>
                            `,
                    showConfirmButton: false,
                    isDismissed: true
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                Swal.close()
                Swal.fire({
                    title: "線上取得失敗，請重新試一次！",
                });
            },
            success: function (data, textStatus, jqXHR) {
                var _msg = JSON.parse(data);
                // console.log(_msg.html_content)
                Swal.close()
                if (_msg.html_status == '1') {
                    $('input[name=eid]').closest('tr').addClass('table-secondary')
                    $('input[name=eid]').closest('tr').removeClass('table-primary')
                    $('input[name=eid]:checked').prop('checked', false);
                    $('.mon').html('');
                    swal.fire({
                        title: "訊息",
                        text: _msg.html_msg,
                        icon: 'error'
                    });
                } else {
                    let attdlist = Object.values(_msg.html_content['attdlist'])
                    for (let i = 1; i <= 12; i++) {
                        let content = Object.values(_msg.html_content[i])
                        let month_html = '';
                        content.forEach(function (value, index, array) {
                            month_html += '<tr>';
                            month_html += '<th>';
                            month_html += value.ndweektype;
                            month_html += '<input class="form-control" type="hidden" style="width:unset" name="eid[]" value="' + value.attendname + '" readonly>';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += value.nddate;
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<select class="form-control" name="attendday[]" style="width:unset">';
                            month_html += '<option value="工作日"' + (value.attendday == '工作日' ? 'selected' : '') + '>工作日</option>';
                            month_html += '<option value="休息日"' + (value.attendday == '休息日' ? 'selected' : '') + '>休息日</option>';
                            month_html += '<option value="例假日"' + (value.attendday == '例假日' ? 'selected' : '') + '>例假日</option>';
                            month_html += '<option value="國定日"' + (value.attendday == '國定日' ? 'selected' : '') + '>國定日</option>';
                            month_html += '<option value="空班日"' + (value.attendday == '空班日' ? 'selected' : '') + '>空班日</option>';
                            month_html += '</select>';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<label class="switch switch-primary switch-pill form-control-label">'
                            month_html += '<input type="checkbox" class="switch-input form-check-input" name="isearly[]" value="1" ' + (value.isearly == '1' ? 'checked' : '') + '>'
                            month_html += '<span class="switch-label"></span>';
                            month_html += '<span class="switch-handle"></span>';
                            month_html += '</label>';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<select class="form-control" name="attendno[]" style="width:unset">';
                            attdlist.forEach(function (value2, index2, array2) {
                                month_html += '<option value="' + value2.attendanceno + '"' + (value2.attendanceno == value.attendno ? 'selected' : '') + '>' + value2.attendanceno + '-' + value2.attendancename + '</option>';
                            })
                            month_html += '</select>';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="attendname[]" value="' + value.attendname + '" readonly>';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<label class="switch switch-primary switch-pill form-control-label">'
                            month_html += '<input type="checkbox" class="switch-input form-check-input" name="daka[]" value="1" ' + (value.daka == '1' ? 'checked' : '') + '>'
                            month_html += '<span class="switch-label"></span>';
                            month_html += '<span class="switch-handle"></span>';
                            month_html += '</label>';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="ontime[]" value="' + value.ontime + '">';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="offtime[]" value="' + value.offtime + '">';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="restime1[]" value="' + value.restime1 + '">';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="restime2[]" value="' + value.restime2 + '">';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="addontime[]" value="' + value.addontime + '">';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="addofftime[]" value="' + value.addofftime + '">';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="latemins[]" value="' + value.latemins + '">';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="worktime[]" value="' + value.worktime + '">';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="jiabantime[]" value="' + value.jiabantime + '">';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="qingjiatime[]" value="' + value.qingjiatime + '">';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="absencename[]" value="' + value.absencename + '">';
                            month_html += '</th>';
                            month_html += '<th>';
                            month_html += '<input class="form-control" type="text" style="width:unset" name="memo[]" value="' + value.memo + '">';
                            month_html += '</th>';
                            month_html += '</tr>';
                        })
                        $('.month' + i).html(month_html);
                    }
                    $('input[name=eid]').closest('tr').addClass('table-secondary')
                    $('input[name=eid]').closest('tr').removeClass('table-primary')
                    $('input[name=eid]:checked').closest('tr').addClass('table-primary')
                    $('input[name=eid]:checked').closest('tr').removeClass('table-secondary')
                    swal.fire({
                        title: "訊息",
                        text: _msg.html_msg,
                        icon: 'success'
                    }).then((result) => {
                        $('#heading2 button').trigger('click');
                    });
                }

            }
        })

    })
    //切換月份
    $('input[name=month]').on('change', function () {
        let i = $(this).val();
        $('.mon').hide();
        $('.month' + i).show();
    })
    //產生員工出勤曆
    $('.subBtn').on('click', function () {
        if (form_check('generate_date')) {
            let field = $('#generate_date');
            let Form_Data = new Array();
            let token = $('input[name=token]').val();
            let token_array = { "name": "token", "value": token };
            Form_Data = field.serializeArray();
            Form_Data.push(token_array)
            $.ajax({
                url: 'ajax/generate_date.php',
                type: "POST",
                data: Form_Data,
                beforeSend: function () {
                    Swal.fire({
                        title: "生成中...",
                        html: `
                        <div class="card-body d-flex align-items-center justify-content-center" style="height: 160px">
                            <div class="sk-chase">
                                <div class="sk-chase-dot"></div>
                                <div class="sk-chase-dot"></div>
                                <div class="sk-chase-dot"></div>
                                <div class="sk-chase-dot"></div>
                                <div class="sk-chase-dot"></div>
                                <div class="sk-chase-dot"></div>
                            </div>
                        </div>
                        `,
                        showConfirmButton: false,
                        isDismissed: true
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    Swal.close()
                    Swal.fire({
                        title: "線上取得失敗，請重新試一次！",
                    });
                },
                success: function (data, textStatus, jqXHR) {
                    var _msg = JSON.parse(data);
                    console.log(_msg.html_content)
                    Swal.close()
                    if (_msg.html_status == '1') {
                        swal.fire({
                            title: "訊息",
                            text: _msg.html_msg,
                            icon: 'error'
                        });
                    } else {
                        swal.fire({
                            title: "訊息",
                            text: _msg.html_msg,
                            icon: 'success'
                        }).then((result) => {
                            location.reload();
                        });
                    }

                }
            })
        }
    })
})