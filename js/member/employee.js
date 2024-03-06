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
    $("#bornday2").datepicker({
        language: 'zh-TW',
        maxViewModel: 1,
        autoclose: true,
    })
})