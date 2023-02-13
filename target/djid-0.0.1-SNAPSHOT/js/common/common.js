(function($){
	/* Store View Tab Menu */
    function init_tabs() {
		$(".tab_unit").css("display","none");
		if (!$('ul.unit_tab').length) { return; }
		$('div.tab_unit_wrap').each(function() {
			$(this).find('.tab_unit:first').fadeIn();
		});
		$('ul.unit_tab a').click(function() {
			if (!$(this).hasClass('current')) {
				$(this).addClass('current').parent('li').siblings('li').find('a.current').removeClass('current');
				$($(this).attr('title')).fadeIn().siblings('.tab_unit').hide();
			}
			this.blur();
			return false;
		});
	}

	$(document).ready(function(){
		init_tabs()

		// menu icon states, opening main nav
		$('#menu-icon, .shadow').click(function(){
			$('#menu-icon').parents('.mnubtn').toggleClass('open');
			$('body').toggleClass('mnuopen');
			if($('#header').hasClass("open")){
				$('#header').removeClass('open');
				$('.shadow').fadeOut();
			}else{
				$('#header').addClass('open');
				$('.shadow').fadeIn();
			}
		});

		$('.userbox .usericon').click(function(){
			$(this).parent().find('div.overmnu').toggle();
		});

		/* Smooth Scroll */
        $('a.pagelink').click(function(){
			$('html, body').animate({
				scrollTop: $( $(this).attr('href') ).offset().top - 50
			}, 500);
			return false;
		});

		/* Smooth Scroll2 */
        $('a.tablink').click(function(){
			$('html, body').animate({
				scrollTop: $( $(this).attr('href') ).offset().top - 100
			}, 500);
			return false;
		});

		/* movTop */
		$(window).scroll(function () {
			if ($(this).scrollTop() > 100) {
				$('#wrapper').addClass("scrollOn");
			} else {
				$('#wrapper').removeClass("scrollOn");
			}
		});
	});
})(jQuery)