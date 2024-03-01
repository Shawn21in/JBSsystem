$(function () {
    $('#ensureBtn').on('click', function () {
        let niandu = $('input[name=niandu]').val();
        let AD = parseInt(niandu) + 1911;
        console.log(niandu)
        console.log(AD)
        $('input[name=niandu]').prop('readonly', true)
        $('#addBtn').show()
        $('input[name^=holiday]').attr('min', AD + '-01-01');
        $('input[name^=holiday]').attr('max', AD + '-12-31');
        $(this).attr('disabled', true)
    })
    $('#addBtn').on('click', function () {
        let appdata = $('.invisible_table>tbody').html();
        $('.datalist').append(appdata);
    })
    $(document).on('click', '.data_del', function () {
        $(this).closest('tr').remove();
    })
})