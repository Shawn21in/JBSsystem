$(function () {
    //左邊按鈕列偵測當前該提示的按鈕
    $(window).on('load', function () {
        let li = $('#sidebar-menu li').not('.has-sub');
        let current_li = li.eq(no);
        current_li.addClass('active');
        current_li.parents('ul').not('#sidebar-menu').addClass('show');
        current_li.parents('li').addClass('active expand');
    })
})