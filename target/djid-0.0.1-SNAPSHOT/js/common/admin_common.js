(function($){

	$(function() {
		$(".datepicker").datepicker({
			dateFormat:'yy-mm-dd',
			changeMonth: true,
			changeYear: true
		  });
	});
    
	$(document).ready(function(){

		/* Smooth Scroll */
        $('a.pagelink').click(function(){
			$('html, body').animate({
				scrollTop: $( $(this).attr('href') ).offset().top - 50
			}, 500);
			return false;
		});

		/* Smooth Scroll */
        $('a.tablink').click(function(){
			$('html, body').animate({
				scrollTop: $( $(this).attr('href') ).offset().top - 150
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