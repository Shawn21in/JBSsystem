$(function () {
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
    $('select[name=attendanceno]').on('change', function () {
        let n = $(this).find('option:selected').data('type');
        // console.log(n)
        $('input[name=attendancename]').val(n);
    })
    $(".datepicker-tw").datepicker({
        language: 'zh-TW',
        maxViewModel: 1,
        autoclose: true,
    })
})