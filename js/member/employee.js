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
    $('select[name=presenttype]').on('change', function () {
        let n = $(this).find('option:selected').data('type');
        // console.log(n)
        $('input[name=presentname]').val(n);
    })
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
    $(".datepicker-tw").datepicker({
        language: 'zh-TW',
        maxViewModel: 1,
        autoclose: true,
        clearBtn: true,
    })
})