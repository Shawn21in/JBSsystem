$(function () {
    $("#employ").chosen({
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
        let year = toString(parseInt($(this).val()) + 1911);
        $('#daterange').daterangepicker({
            "minDate": "01/01/" + year,
            "maxDate": "12/31/" + year,
            locale: {
                cancelLabel: 'Clear'
            }
        })
    })
    $('#daterange').on('cancel.daterangepicker', function (ev, picker) {
        $(this).val('');
    });
})