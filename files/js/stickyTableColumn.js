$(document).ready(function() {
    $(window).off('scroll').on('scroll', function(){
         //delay(function(){
            stickyColumn();
        //}, 100);
    });

});

function stickyColumn() {
    var offset = $('#data tbody tr > td:last-child:visible').offset().top + 1;

    var $header = $('#data thead tr > th:first-child');
    var $footer = $('#data tfoot tr > td:first-child');
    var $cells = $('#data tbody tr > td:first-child');

    var scrollTop = $(window).scrollTop();
    var scrollLeft = $(window).scrollLeft();

    if( scrollLeft > 5 ) {
        var top = offset - scrollTop;
        var row = 0;
        $header.css('top', $('#data thead').offset().top - scrollTop );
        $header.css('padding-top', $('#data thead').height() - 19 );

        $footer.css('top', $('#data tfoot').offset().top - scrollTop - 1 );
        $footer.css('padding-top', $('#data tfoot').height() - 20 );

        $cells.show();

        $cells.each(function() {
            if( $(this).is(":visible") ) {
                $(this).css( "top", top );
                $(this).removeClass("odd").removeClass("even");
                if( row%2 == 0 )
                    $(this).addClass("odd")
                else
                    $(this).addClass("even")

                top += 20;
                row += 1;
            }
        });

        $header.show();
        $footer.show();
    } else if( scrollLeft <= 5 && $cells.is(':visible') ) {
        $header.hide();
        $footer.hide();
        $cells.hide();
    }
}