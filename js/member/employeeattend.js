$(function () {
    $("#search_eid").chosen({
        width: "50%",
        search_contains: true,
    });
    $("#gen_ed").chosen({
        width: "100%",
        search_contains: true,
    });

    $(".table").draggable({
        axis: "x",
        drag: function (event, ui) {
            $('.table-scroll').css('cursor', 'grabbing');
            var element = $(".table-scroll")[0];
            // console.log(element.scrollWidth)
            // console.log(element.scrollLeft)
            // console.log(element.clientWidth)
            // 判斷是否已經滑到最右側
            if (element.scrollWidth - element.scrollLeft <= element.clientWidth + 1) {
                $(".table-scroll").scrollLeft(element.clientWidth + 70);
                $(".table").css('left', '0px');
                return false;
            }
            // 判斷是否已經滑到最左側
            if (element.scrollLeft === 0) {
                $(".table-scroll").scrollLeft(1);
                $(".table").css('left', '0px');
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
    $('#niadu').on('change', function () {
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
    $('#searchBtn').on('click', function () {
        if (form_check('form1')) {
            let field = $('#form1');
            let Form_Data = new Array();
            let token = $('input[name=token]').val();
            let token_array = { "name": "token", "value": token };
            Form_Data = field.serializeArray();
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
                    console.log(_msg.html_content)
                    Swal.close()
                    if (_msg.html_status == '1') {
                        swal.fire({
                            title: "訊息",
                            text: _msg.html_msg,
                            icon: 'error'
                        });
                    } else {
                        for (let i = 1; i <= 12; i++) {
                            let content = Object.values(_msg.html_content[i])
                            let month_html = '';
                            content.forEach(function (value, index, array) {
                                month_html += '<tr>';
                                month_html += '<th scope="col">';
                                month_html += value.ndweektype;
                                month_html += '</th>';
                                month_html += '<th scope="col">';
                                month_html += value.nddate;
                                month_html += '</th>';
                                month_html += '<th scope="col">';
                                month_html += '<select class="form-control" name="attendday[]" style="width:unset">';
                                month_html += '<option value="工作日"' + (value.attendday == '工作日' ? 'selected' : '') + '>工作日</option>';
                                month_html += '<option value="休息日"' + (value.attendday == '休息日' ? 'selected' : '') + '>休息日</option>';
                                month_html += '<option value="例假日"' + (value.attendday == '例假日' ? 'selected' : '') + '>例假日</option>';
                                month_html += '<option value="國定日"' + (value.attendday == '國定日' ? 'selected' : '') + '>國定日</option>';
                                month_html += '<option value="空班日"' + (value.attendday == '空班日' ? 'selected' : '') + '>空班日</option>';
                                month_html += '</select>';
                                month_html += '</th>';
                                month_html += '<th scope="col">';
                                month_html += '<label class="switch switch-primary switch-pill form-control-label">'
                                month_html += '<input type="checkbox" class="switch-input form-check-input" name="isearly[]" value="1" ' + (value.isearly == '1' ? 'checked' : '') + '>'
                                month_html += '<span class="switch-label"></span>';
                                month_html += '<span class="switch-handle"></span>';
                                month_html += '</label>';
                                month_html += '</th>';
                                month_html += '<th scope="col">';
                                month_html += value.nddate;
                                month_html += '</th>';
                                month_html += '<th scope="col">';
                                month_html += value.attendname;
                                month_html += '</th>';
                                month_html += '</tr>';
                            })
                            $('.month' + i).html(month_html);
                        }

                        swal.fire({
                            title: "訊息",
                            text: _msg.html_msg,
                            icon: 'success'
                        });
                    }

                }
            })
        }
    })
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
                    // console.log(_msg.html_content)
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