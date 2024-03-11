$(function () {

    // ----------------------基本資料設定----------------------

    $('select[name=partno]').on('change', function () {
        let n = $(this).find('option:selected').data('type');
        // console.log(n)
        $('input[name=partname]').val(n);
    })
    $('select[name=appno]').on('change', function () {
        let n = $(this).find('option:selected').data('type');
        // console.log(n)
        $('input[name=appname]').val(n);
    })
    $('select[name=presenttype]').on('change', function () {
        let n = $(this).find('option:selected').data('type');
        // console.log(n)
        $('input[name=presentname]').val(n);
    })
    $(".datepicker-tw").datepicker({
        language: 'zh-TW',
        maxViewModel: 1,
        autoclose: true,
        clearBtn: true,
    })

    // ----------------------薪資設定----------------------

    $('select[name=bankno]').on('change', function () {
        let n = $(this).find('option:selected').data('type');
        // console.log(n)
        $('input[name=bankname]').val(n);
    })
    $('select[name=bankno2]').on('change', function () {
        let n = $(this).find('option:selected').data('type');
        // console.log(n)
        $('input[name=bankname2]').val(n);
    })
    $('input[name=sandtype]').on('change', function () {
        let st = $(this).val();
        switch (st) {
            case '1':
                $('#monthmny').prop('readonly', false)
                $('#daymny').prop('readonly', false)
                break;
            case '2':
                $('#monthmny').prop('readonly', true)
                $('#daymny').prop('readonly', false)
                break;
            case '3':
                $('#monthmny').prop('readonly', true)
                $('#daymny').prop('readonly', true)
                break;
        }
    })
    $('#monthmny,#daymny,#hourmny,#standardday,#standardhour').focusout(function () {
        let sday = $('#standardday').val();
        let shour = $('#standardhour').val();
        if (sday != '') {
            $('#daymny').val(Math.round($('#monthmny').val() / sday))
            if (shour != '') {
                $('#hourmny').val(Math.round($('#daymny').val() / shour))
            }
        }
    })

    // ----------------------加班設定----------------------

    $('input[name=overtime]').on('change', function () {
        let k = $(this).val();
        // console.log(t)
        if (k == '1') {
            $('input[name=jiabanbudashi]').prop('readonly', false);
        } else {
            $('input[name=jiabanbudashi]').prop('readonly', true);
        }
    })
    $('input[name=otway]').on('change', function () {
        let t = $(this).val();
        let k = $('input[name=jiabanbudadan]').prop('checked');
        let j = $('input[name=overtime]:checked').val();
        if (t == '2') {
            $('input[name=overtime]').prop('disabled', false);
            $('input[name=jiabanbudadan]').prop('disabled', true);
            $('.otdiv').css('opacity', '0.5');
            if (j == '1') {
                $('input[name=jiabanbudashi]').prop('readonly', false);
            }
        } else {
            $('input[name=jiabanbudadan]').prop('disabled', false);
            $('.otdiv').css('opacity', '');
            if (k) {
                $('input[name=overtime]').prop('disabled', false);
            } else {
                $('input[name=jiabanbudashi]').prop('readonly', true);
                $('input[name=overtime]').prop('disabled', true);
            }
        }
    })
    $('input[name=jiabanbudadan]').on('click', function () {
        let k = $(this).prop('checked');
        let j = $('input[name=overtime]:checked').val();
        if (k) {
            $('input[name=overtime]').prop('disabled', false);
            if (j == '1') {
                $('input[name=jiabanbudashi]').prop('readonly', false);
            }
        } else {
            $('input[name=jiabanbudashi]').prop('readonly', true);
            $('input[name=overtime]').prop('disabled', true);
        }
    })
})