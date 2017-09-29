var CURRENT_URL = window.location.href.split('#')[0].split('?')[0],
	$SIDEBAR_MENU = $('#sidebar-menu'),
    $BODY = $('#bodyMenu'),
    //$MENU_TOGGLE = $('#menu_toggle'),
    //$SIDEBAR_FOOTER = $('.sidebar-footer'),
    //$LEFT_COL = $('.left_col'),
    //$RIGHT_COL = $('.right_col'),
    //$NAV_MENU = $('.nav_menu'),
    //$FOOTER = $('footer');

 
    
    
    
 // Sidebar
function init_sidebar() {

  $SIDEBAR_MENU.find('a').on('click', function(ev) {
	  console.log('clicked - sidebar_menu');
        var $li = $(this).parent();

        if ($li.is('.active')) {
            $li.removeClass('active active-sm');
        } else {
            // prevent closing menu if we are on child menu
            if (!$li.parent().is('.child_menu')) {
                $SIDEBAR_MENU.find('li').removeClass('active active-sm');
                $SIDEBAR_MENU.find('li ul').slideUp();
            }else
            {
				if ( $BODY.is( ".nav-sm" ) )
				{
					$SIDEBAR_MENU.find( "li" ).removeClass( "active active-sm" );
					$SIDEBAR_MENU.find( "li ul" ).slideUp();
				}
			}
            $li.addClass('active');
        }
    });

	// check active menu
	$SIDEBAR_MENU.find('a[href="' + CURRENT_URL + '"]').parent('li').addClass('current-page');

	$SIDEBAR_MENU.find('a').filter(function () {
		return this.href == CURRENT_URL;
	}).parent('li').addClass('current-page').parents('ul').slideDown(function() {
		
	}).parent().addClass('active');

	// fixed sidebar
	if ($.fn.mCustomScrollbar) {
		$('.menu_fixed').mCustomScrollbar({
			autoHideScrollbar: true,
			theme: 'minimal',
			mouseWheel:{ preventDefault: true }
		});
	}
};
// /Sidebar

    
    
    
    
    
    
    
    
    
    
//在此作一些初使化
/*
 一般用于加载完图片等
 $(window).load(function() {  
        alert("hello again");  
});  
 //dom加载完就执行
 $(function(){  
    // do something  
});  
 
 */
    
    

$(function(){
	init_sidebar();
});