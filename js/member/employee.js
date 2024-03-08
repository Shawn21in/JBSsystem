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
})