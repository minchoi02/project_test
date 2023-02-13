
function isPC() {
 var $winWidth = $(window).width();
 if($winWidth > 1024) {
  return true;
 } else {
  return false;
 }
}

// URL 파라미터 불러오기
var getUrlParameter = function getUrlParameter(sParam) {
 var sPageURL = decodeURIComponent(window.location.search.substring(1)),
 sURLVariables = sPageURL.split('&'),
 sParameterName,
 i;
  for (i = 0; i < sURLVariables.length; i++) { 
  sParameterName = sURLVariables[i].split('=');
  if (sParameterName[0] === sParam) {
   return sParameterName[1] === undefined ? true : sParameterName[1];
  }
 }
};

// 헤더 및 GNB 관련 공통 스크립트
$(function() {
 var $gnb = $(".btm");
 var $gnbTrigger = $("#gnbTrigger");
 var $logo = $("#logo");
 var mask = $(".mask");
 var allMenu = $("#all-menu");
 var mnuEasing = "easeInOutExpo";
 
 // GNB 활성화
 $("#nav > li").each(function() {
   var $currIndex = menuTop - 1;
  if(isPC() === true) {
  if($(this).index() == $currIndex) $(this).addClass('open');
  }
 });
 // GNB 비활성화
 function gnbdeActive() {
  $("#nav > li").removeClass('open');
  $("#nav > li > ul").removeAttr('style');
  $gnbTrigger.removeClass('open');
  $("body").removeClass('lock');
 }
 // GNB 마우스오버
 $("#nav > li").mouseenter(function() {
  var $option = {
    'display':'block',
    'top':'86px',
    'opacity':'0'
   }
  if(isPC() === true) {
   if(!$(this).hasClass('on')) {
    $(this).addClass('on');
    if($(this).find('div.menu-item').length > 0) {
     $(this).find('div.menu-item').css($option);
     TweenMax.to($(this).find('div.menu-item'), 0.25, {'opacity':1, 'top':'86px'});
    }
   }
  }
 });
 // GNB 마우스아웃
 $("#nav > li").mouseleave(function() {
  var $idx = $(this).index();
  var $option = {
    'display':'',
    'top':'',
    'opacity':''
   }
  if(isPC() === true) {
   $(this).removeClass('on');
   if($(this).find('div.menu-item').length > 0) {
    TweenMax.to($(this).find('div.menu-item'), 0.25, {'opacity':0, 'top':'86px', onComplete:function() {
     $("#nav > li").eq($idx).find('div.menu-item').css($option);
    }});
   }
  }
 });
 
 
 // GNB 클릭
 $("#nav > li > a").click(function(e) {
  if(isPC() === false) {
   if(!$(this).parent().hasClass('open')) {
    if($(this).next('div.menu-item').length > 0) {
     e.preventDefault();
     $("#nav > li div.menu-item").stop().slideUp(250);
     $("#nav > li").removeClass('open');
     $(this).parent().addClass('open');
     $(this).next('div.menu-item').stop().slideDown(350, 'easeInOutExpo');
    }
   } else {
    if($(this).next('div.menu-item').length > 0) {
     e.preventDefault();
     $(this).parent().removeClass('open');
     $(this).next('div.menu-item').stop().slideUp(250);
    }
   }
  }
 });
 // 모바일메뉴 토글버튼 클릭
 $gnbTrigger.click(function() {
  if(!TweenMax.isTweening($gnb)) {
   if(!$(this).hasClass('open')) {
    $(this).addClass('open');
    $("body").addClass('lock');
    mask.css({'opacity':'0.65', 'height':'100%'});
    TweenMax.to($gnb, 0.5, {right:'0px', ease:Expo.easeInOut, onComplete:function() {
    //$logo.stop().fadeIn(200);
    
    }});
   } else {
    $(this).removeClass('open');
    $("body").removeClass('lock');
    mask.css({'opacity':'0', 'height':'0'});
    TweenMax.to($gnb, 0.5, {right:'-100%', ease:Expo.easeInOut});
    //$logo.stop().fadeOut(100);
    
   }
  }
 });
 
 mask.click(function() {
        $("#gnbTrigger").removeClass('open');
  $("body").removeClass('lock');
  mask.css({'opacity':'0', 'height':'0'});
  TweenMax.to($gnb, 0.5, {right:'-300px', ease:Expo.easeInOut});
    });

 // 윈도우 리사이징 처리
 $(window).bind('resize', function() {
  var $winWidth = $(this).width();
  if($winWidth > 1024) {
   $logo.removeAttr('style');
   $gnb.removeAttr('style');
   gnbdeActive();
  } else {
   if(!$gnbTrigger.hasClass('open')) {
    $logo.removeAttr('style');
   }
  }
 });
 
 
});

// 게시판 카테고리 탭 (2019-04-23 추가)
$(function() {
    
    // 카테고리 링크 클릭시
    $(document).on('click', '.sub_tab > a', function() {
        
            if(!$(this).hasClass('open')) {
                $(this).addClass('open');
                $(this).next('ul#tab_menu').css('display','block');
            } else {
                $(this).removeClass('open');
                $(this).next('ul#tab_menu').css('display','none');
            }
        
    });
 
 // 카테고리 링크 클릭시
    $(document).on('click', '#bo_list .board_tab_spec > a', function() {
        
            if(!$(this).hasClass('open')) {
                $(this).addClass('open');
                $(this).next('ul.tab').css('display','block');
            } else {
                $(this).removeClass('open');
                $(this).next('ul.tab').css('display','none');
            }
        
    });
    
});

/* ----------------- 메뉴 관련 스크립트 ----------------- */
/*$(document).ready(function() {
 var subNavi = $("#subnav");
 var allMenu = $("#all-menu");
 var mnuEasing = "easeInOutExpo";
 
 if(isPC() === true) {
  // 메인메뉴 마우스 올렸을 시 서브메뉴 표출
  $("#nav > li").mouseenter(function() {
   var mnuIndex = $(this).index();
 
   subNavi.find('.menu-item').removeClass('active');
   subNavi.find('.menu-item').eq(mnuIndex).addClass('active');
   if(!subNavi.hasClass('show')) subNavi.addClass('show');
  });
 
  // 헤더에서 마우스 뗐을 시 서브메뉴 전체 숨김
  $("#header").mouseleave(function() {
   subNavi.removeClass('show');
  });
 }
 
 // 모바일메뉴 GNB 클릭
 $("#nav > li").click(function(e) {
  if(isPC() === false) {
   if(!$(this).parent().hasClass('open')) {
    subNavi.find('.menu-item').removeClass('active');
   subNavi.find('.menu-item').eq(mnuIndex).addClass('active');
   if(!subNavi.hasClass('show')) subNavi.addClass('show');
   } else {
    if($(this).next('ul').length > 0) {
     e.preventDefault();
     $(this).parent().removeClass('open');
     $(this).next('ul').stop().slideUp(250);
    }
   }
  }
 });
 
 // 전체메뉴 열기
 function allMenuOpen() {
  if(!allMenu.hasClass('open')) {
   allMenu.addClass('open');
   allMenu.find('.menu-layer').removeAttr('style');
   allMenu.find('.menu-layer').css({top:'-100%', opacity:'0'});
   allMenu.fadeIn(400);
   allMenu.find('.menu-layer').stop().animate({top:'50%', opacity:'1'}, 800, mnuEasing);
   $("body").addClass('fixed');
  }
 }
 // 전체메뉴 닫기
 function allMenuClose() {
  allMenu.removeClass('open');
  allMenu.find('.menu-layer').stop().animate({top:'-100%', opacity:'0'}, 600, mnuEasing);
  allMenu.fadeOut(1000);
  $("body").removeClass('fixed');
 }
 // 전체메뉴 열기 버튼 클릭
 $("#header .btn-allmenu").click(function() {
  allMenuOpen();
 });
 // 전체메뉴 닫기 버튼 클릭
 $("#all-menu .btnClose").click(function() {
  allMenuClose();
 });
 // 마스크영역 클릭시 전체메뉴 닫기
 $("#all-menu .mask").click(function() {
  allMenuClose();
 });
});*/
/* ----------------- 스크롤 헤더 고정 ----------------- */
$(window).scroll(function() {
 if(isPC() === true) {
  var scroll_h = $(this).scrollTop();
  var hd_h = $("#header > .top").outerHeight();
 
 
  if(scroll_h > hd_h) {
   if(!$("body").hasClass('scroll')) $("body").addClass('scrollfix');
  } else {
   $("body").removeClass('scrollfix')
  }
 }
});
/* ----------------- 메뉴 및 탭 활성화 스크립트 ----------------- */
$(document).ready(function() {
 var depth1 = menuTop - 1;
 var depth2 = menuSub - 1;
 $("#nav > li").eq(depth1).addClass('on123');
 $(".menu-item").eq(depth1).find('ul').children().eq(depth2).addClass('on');
 $("#tab_menu[data-role=menu]").children().eq(depth2).addClass('active');
});
/* ----------------- 메인페이지 전용 스크립트 ----------------- */

$(function() {
 $(".faq-list > li > .question").click(function() {
  if(!$(this).parent().hasClass('open')) {
   $(".faq-list > li").removeClass('open');
   $(".faq-list > li > .answer").stop().slideUp(300);
   $(this).parent().addClass('open');
   $(this).siblings('.answer').stop().slideDown(300);
  } else {
   $(this).parent().removeClass('open');
   $(this).siblings('.answer').stop().slideUp(300);
  }
 });
});

$(function() {
    var lang = $(".lang_area");

    $(".lang_wrap > ul > li > a").click(function() {
        lang.removeClass("open");
        $(".lang_wrap > ul > li > a").removeClass("open")
        if ($(".lang_area").is(":visible")) {
            lang.slideUp(300);
        } else {
            $(".lang_wrap > ul > li > a").addClass("open")
            lang.slideDown(300);
        }
    });
	
	$(".family > a").click(function() {
		if(!$(this).siblings('.dropdown').is(':visible')) {
			$(this).siblings('.dropdown').stop(true,false).slideDown(700);
		} else {
			$(this).siblings('.dropdown').stop(true,false).slideUp(700);
		}
	});
	
	$(".family2 > a").click(function() {
		if(!$(this).siblings('.dropdown').is(':visible')) {
			$(this).siblings('.dropdown').stop(true,false).slideDown(700);
		} else {
			$(this).siblings('.dropdown').stop(true,false).slideUp(700);
		}
	});
	
});

// 윈도우 이벤트
$(window).load(function() {
	var elem = $(".scrollreveal");
	var sty = {
		'opacity':'0',
		'transition':'none'
		}

	elem.css(sty);

	$("html, body").animate({scrollTop:'10'}, 10, function() {
		$("html, body").animate({scrollTop:'0'}, 0);
	});

	// 스크롤시 애니메이션 처리
	$(window).bind('scroll', function() {
		var winWidth = $(this).width();
		var winTop = $(this).scrollTop();
		var winHeight = $(this).height();
		var docHeight = $(document).height();
		var hdHeight = $("#header").height();
		var elemHeight;
		var showDelay = 0;
	
		if(winWidth > 1024) {	
			if(winTop >= hdHeight) {
				if(!$("#header").hasClass('fixed')) {
					$("#header").addClass('fixed');
					$("#scrollTop").stop(true,false).fadeIn(300);
					$("#scrollTop_shop").stop(true,false).fadeIn(300);
				}
			} else {
				$("#header").removeClass('fixed');
				$("#scrollTop").stop(true,false).fadeOut(300);
				$("#scrollTop_shop").stop(true,false).fadeOut(300);
			}
		}

		elem.each(function() {
			var etop = $(this).offset().top;
			var eh = $(this).height();
			var delay = $(this).data('delay');

			if(delay == null) { delay = 100; }

			if(winTop >=  etop - winHeight) {
				if(!$(this).hasClass('animated')) {
					var aniOptions;
					var styR = {
							'position':'relative',
							'top':'30px'
						}
					var sty = {
							'top':'30px'
						}

					if($(this).css('position') == 'static') {
						aniOptions = {
							'opacity':'1',
							'top':'0'
						}

						$(this).css(styR);
					} else if($(this).css('position') == 'absolute') {
						aniOptions = {
							'opacity':'1',
						}
					} else {
						aniOptions = {
							'opacity':'1',
							'top':'0'
						}
						$(this).css(sty);
					}

					showDelay += delay;
					$(this).stop().delay(showDelay).animate(aniOptions, 500, function() {
						var sty = {
								'position':'',
								'top':'',
								'opacity':'',
								'transition':''
							}
						$(this).css(sty);
					});
					$(this).addClass('animated');
				}
			}
		});
	});
});
// 페이지 로딩
$(window).load(function() {
	$("#page-loader").fadeOut(600, function() {
		$("#page-loader").delay(100).remove();
	});
});