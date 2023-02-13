﻿var winWidth = window.innerWidth || document.documentElement.clientWidth;
var conWidth = 1200; //컨텐츠영역 width
var scrolltop = $(window).scrollTop();

function scrollTop_show(){
	var winWidth = window.innerWidth || document.documentElement.clientWidth;
	var btnPosition = (winWidth - conWidth)/2 - 120;
	var topWrapper = $(document).find('.scrollTopWrapper');

	if ( winWidth > 1300 ){
		topWrapper.css('right', btnPosition);
	} else {
		topWrapper.css('right','0');
	}
}
function pageScrollTOP(){
	var topWrapper = $(document).find('.scrollTopWrapper');
	var scrolltop  = $(window).scrollTop();

	if(scrolltop > 0){
		topWrapper.stop().fadeIn();
	} else {
		topWrapper.stop().fadeOut();
	}
}
$(function(){
	//TOP 버튼 추가
	$('.wrapper').append( '<div id="ScrollTopArea" class="scrollTopWrapper"><button type="button" class="toTop">TOP(위로이동)</button></div>' );

	//TOP 버튼 노출
	setTimeout(function(){
		scrollTop_show();
	}, 400)

	$(window).on('resize',function(){
		scrollTop_show();
	});

	window.onscroll = function(){ pageScrollTOP(); };

	$(document).on('click', '#ScrollTopArea > .toTop', function(){
		$('html,body').animate({ scrollTop:0 }, 300);
	});
});

$(function(){
	//IE버전 찾아서 class추가
	if (isIE () === 9) { $(document).find('html').addClass('ie9'); }
	if (isIE () === 10){ $(document).find('html').addClass('ie10'); }

	//레이어 layerPopUp() 마스크 추가
	$('body').append('<div id="uiLayerMask" style="display:none"/>');

	//공통 : 서브 LNB
	LNB_Accordion();

	//탭메뉴
	fn_TabMenu();

	//아코디언 패널
	fn_panelAccordion();

	//radio, checkbox 키보드로 체크하기
	var  focusable_labels = 'input[type=radio]+label, input[type=checkbox]+label';
	var _focusableEls = $(document).find( focusable_labels );
	_focusableEls.attr('tabindex','0').addClass('focus');
	_focusableEls.keypress(function(event){
		var keycode = event.keyCode || event.which;
		if( keycode == '13' ){

			var input_Radio = $(this).find('input[type=radio]');
			var prev_Radio = $(this).prev('input[type=radio]');
			input_Radio.prop("checked", true).attr('checked',true);
			prev_Radio.prop("checked", true).attr('checked',true);

			//체크박스 Type1 : label wrapper
			var input_CheckBox = $(this).find('input[type=checkbox]');
			var input_CheckBox_Chked = input_CheckBox.is(":checked");
			input_CheckBox_Chked ? input_CheckBox.prop('checked', false).attr('checked',false) : input_CheckBox.prop('checked', true).attr('checked',true);

			//체크박스 Type2 : checkbox + label
			var prev_CheckBox = $(this).prev('input[type=checkbox]');
			var prev_CheckBox_Chked = prev_CheckBox.is(":checked");
			prev_CheckBox_Chked ? prev_CheckBox.prop('checked', false).attr('checked',false) : prev_CheckBox.prop('checked', true).attr('checked',true);
		}
	});

	//메인 : 배너 (왼쪽)
	if($('#mainBanner').length){
		var $mainOwl_01 = $('#mainBanner');
		$mainOwl_01.owlCarousel({
			loop:true,
			nav: false,
			mouseDrag:false,
			margin:0,
			items:1,
			autoplay:true,
			autoplayTimeout:5000,
			autoplayHoverPause:true,
			smartSpeed:600
		});
	}

	//메인 : 배너 (오른쪽)
	if ( $('#mainRightLink').length){
		var $mainOwl_02 = $('#mainRightLink');
		$mainOwl_02.owlCarousel({
			mouseDrag:false,
			dots:false,
			nav: true,
			margin:0,
			items:1
		});
	}

	//메인 : 배너 (하단 오른쪽)
	fn_bnrList();

	//메인 : 공지사항 (한줄 롤링)
	MAIN_jqRolling();

	//메인 : 공지-복지 핫이슈
	MAIN_newsBoard();

	//footer 채팅버튼
	fn_ChattingBox();
	$(window).resize(function(){
		fn_ChattingBox();
	});

	//조직도 상세내용 보기 show/hide
	fn_OrganizationInfo();
});


/* 확대축소*/
function COMMN_zoomInOut(){
	var agent = navigator.userAgent.toLowerCase(),
		name = navigator.appName,
		browser = '';

	// MS 계열 브라우저를 구분
	if(name === 'Microsoft Internet Explorer' || agent.indexOf('trident') > -1 || agent.indexOf('edge/') > -1) {
		browser = 'ie';
		if(name === 'Microsoft Internet Explorer') { // IE old version (IE 10 or Lower)
			agent = /msie ([0-9]{1,}[\.0-9]{0,})/.exec(agent);
			browser += parseInt(agent[1]);
		} else { // IE 11+
			if(agent.indexOf('trident') > -1) { // IE 11
				browser += 11;
			} else if(agent.indexOf('edge/') > -1) { // Edge
				browser = 'edge';
			}
		}
	} else if(agent.indexOf('safari') > -1) { // Chrome or Safari
		if(agent.indexOf('opr') > -1) { // Opera
			browser = 'opera';
		} else if(agent.indexOf('chrome') > -1) { // Chrome
			browser = 'chrome';
		} else { // Safari
			browser = 'safari';
		}
	} else if(agent.indexOf('firefox') > -1) { // Firefox
		browser = 'firefox';
	}

	var zoomLevel=100;
	var zoomText = $('.zoomReset > span');
	$('.zoomIn').click(function(e){
		e.preventDefault();
		zoomPage(5, $(this));
		zoomText.text(zoomLevel+'%');
	});
	$('.zoomOut').click(function(e){
		e.preventDefault();
		zoomPage(-5, $(this));
		zoomText.text(zoomLevel+'%');
	});
	$('.zoomReset').click(function(e){
		e.preventDefault();
		zoomPage(0, $(this));
		zoomText.text(zoomLevel+'%');
	});

	function zoomPage(step, trigger){
		if(zoomLevel>=120 && step>0 ) {
			alert('더 이상 확대할 수 없습니다.');
			return;
		}
		if(zoomLevel<=90 && step<0) {
			alert('더 이상 축소할 수 없습니다.');
			return;
		}

		if(step === 0){
			zoomLevel = 100;
		} else {
			zoomLevel = zoomLevel+step;
		}

		if (agent.indexOf('firefox')){
			$('body').css({ transform: 'scale('+(zoomLevel/100)+')', transformOrigin: '50% 0'});
		} else {
			//IE,크롬,사파리,오페라
			$('body').css({zoom: zoomLevel/100});
		}
	}
}

/* 메인 : 공지사항 (한줄 롤링) */
function MAIN_jqRolling(){
	if(!$('#jrolling').length){return;}
	$('#jrolling').jrolling({
		'items': '#jrolling strong',
		'width': '900px',
		'height': '50px',
		'move': 'up',
		'auto': true,
		'delay': 4000, // 초 후에 흐름
		'prev': '.noticeCont .btn-prev',
		'next': '.noticeCont .btn-next',
		'stop': '.noticeCont .btn-stop',
		'play': '.noticeCont .btn-play'
	});
}

/* 메인 : 공지-복지 핫이슈 */
function MAIN_newsBoard(){
	if (!$('.mainNewsIssue').length){return;}
	$('.mainNewsIssue .newsWrapper > .newsTabs').each(function(){
		$(this).on('click',function(e){
			e.preventDefault();
			$(this).parent().addClass('on');
			$(this).parent().siblings().removeClass('on');
		});
	});
}

/* 메인 : 배너 (하단 오른쪽) */
function fn_bnrList(){
	if(!$('.bnrList').length){ return;}

	var owlBnrMain = $('.bnrList');
	owlBnrMain.owlCarousel({
		items:1,
		dots:false,
		loop:true,
		nav: true,
		margin:0,
		autoplay:true,
		autoplayTimeout:5000,
		autoplayHoverPause:true,
		smartSpeed:600
	});

	//자동롤링 시작,정지 버튼
	var _bnrController = $('.bnrListController');
	var _bnrControlBtn = _bnrController.find('button');
	var _btn_owlPlay = _bnrController.find('.owlPlay2');
	var _btn_owlStop = _bnrController.find('.owlStop2');

	_btn_owlPlay.hide();
	_bnrControlBtn.off('click').on('click',function(){
		if ( $(this).is('.owlPlay2')){
			_btn_owlStop.show();
			_btn_owlPlay.hide();
			owlBnrMain.trigger('play.owl.autoplay',[3000]);
		}

		if ( $(this).is('.owlStop2')){
			_btn_owlPlay.show();
			_btn_owlStop.hide();
			owlBnrMain.trigger('stop.owl.autoplay');
		}
	});
}

/* 공통 : footer 배너링크 */
function organizationsLink(){
	if(!$('#organizationsLink').length){ return;}

	var owlBtm = $('#organizationsLink');
	owlBtm.owlCarousel({
		items:6,
		dots:false,
		loop:true,
		nav: true,
		margin:0,
		autoplay:true,
		autoplayTimeout:3000,
		autoplayHoverPause:true
	});

	//자동롤링 시작,정지 버튼
	var _qController = $('.quickLink .btnController');
	var _qControlBtn = _qController.find('button');
	var _btn_owlPlay = _qController.find('.owlPlay');
	var _btn_owlStop = _qController.find('.owlStop');

	_btn_owlPlay.hide();
	_qControlBtn.off('click').on('click',function(){
		if ( $(this).is('.owlPlay')){
			_btn_owlStop.show();
			_btn_owlPlay.hide();
			owlBtm.trigger('play.owl.autoplay',[3000]);
		}

		if ( $(this).is('.owlStop')){
			_btn_owlPlay.show();
			_btn_owlStop.hide();
			owlBtm.trigger('stop.owl.autoplay');
		}
	});
}

/* footer 채팅버튼 */
function fn_ChattingBox(){
	//var winWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	var winWidth = window.innerWidth || document.documentElement.clientWidth;
	var rightPosition = (winWidth - conWidth)/2 - 170; ;
	$(document).find('.chattingBox').css({ 'right': rightPosition, 'opacity':'1'});
}

/* 공통 : GNB */
function GNB_Megamenu(){
	if (! $('.headerFixedBox').length){return;}

	var _Depth01 = $('.gnbDepth01');
	var _Dep2Wrap = _Depth01.find('.dep2Wrapper');
	var biggestH = [];
	var MaxHeight;

	_Dep2Wrap.each(function(){
		var subHeight = $(this).height();
		biggestH.push( subHeight );
		MaxHeight =  Math.max.apply(0, biggestH);
	}).height( MaxHeight + 22 );

	_Depth01.off('mouseenter focusin').on('mouseenter focusin',function(){
		
		if($(".gnbBG").css("display") == "none"){
			/*$('.dep2Wrapper').show();
			$('.gnbBG').height('300').show();*/
			$('.gnbBG').height('300').slideDown();
			$('.dep2Wrapper').slideDown();
			$('.gnbWrapper').addClass('open');
		}		
		
	});

	$('.gnbBG, .gnbWrapper').on('mouseleave',function(){
		
		if($(".gnbBG").css("display") == "block"){
			//$('.dep2Wrapper').hide();
			//$('.gnbBG').hide();
			$('.dep2Wrapper').slideUp();
			$('.gnbBG').slideUp();
			$('.gnbWrapper').removeClass('open');
		}
	});

	$(' .gnbWrapper a:last').on('focusout',function(){
		$('.dep2Wrapper').slideUp();
		$('.gnbBG').slideUp();
		$('.gnbWrapper').removeClass('open');
	});

	function gnbFixed(){
		var winTop = $(window).scrollTop();
		var gnbTop = $('.gnbWrapper').offset().top;

		if( winTop > gnbTop ){
			$('.headerFixedBox').addClass('fixed');
		}
		else if( winTop < 170){
			$('.headerFixedBox').removeClass('fixed');
		}
	}
	$(window).scroll(function(){
		gnbFixed();
	});
}

/* 공통 : 서브 LNB */
function LNB_Accordion(){
	var _lnbDepth = $('.lnbDepth');
	if(!_lnbDepth.length){return;}

	_lnbDepth.each(function(){
		//서브메뉴 찾기 (서브메뉴 아이콘 추가)
		var hasSubMenu = $(this).find('li>ul');
		if(hasSubMenu.length){
			hasSubMenu.parent('li').addClass('hasSub');
		}

		var $menuON = $(this).find('.on');
		if($menuON.length){ $menuON.parents('li').addClass('active');}
		$(this).find('.active > ul').show();

		var $UL_A = $(this).find('li>a');
		$UL_A.on('click',function(e){
			if ( $(this).next('ul').length){
				e.preventDefault();
			}

			//siblings
			var _siblings = $(this).parent().siblings();
			_siblings.removeClass('active');
			_siblings.find('>a').removeClass('on');
			_siblings.find('>ul').hide();

			//this
			$(this).addClass('on');
			$(this).parent().addClass('active');

			var nextUL = $(this).next('ul');
			if (nextUL.length && nextUL.is(':hidden')){
				$(this).next('ul').show();
			} else if (nextUL.length && nextUL.is(':visible')){
				$(this).next('ul').hide();
				$(this).parent().removeClass('active');
			}
		});
	});
}

/* 탭메뉴 */
function fn_TabMenu(){
	var tabMENU = $('.tabMenu,.tabMenuF');
	if(!tabMENU.length){return};

	tabMENU.each(function(){
		var _tabBox = $(this).find('.btnTab');
		var _tabAnc = _tabBox.find('> a');
		var _tabCon = $(this).siblings('.tabContBox');

		if( _tabCon.length){
			//.on 이 없으면 첫번째 tab활성화
			var firstTab = _tabBox.eq(0);
			var firstHref = firstTab.find('a').attr('href');
			var activeTab = $(this).find('.on');
			var activeHref = activeTab.find('a').attr('href');

			if (activeTab.length === 0){
				$(firstTab).addClass('on');
				$(firstHref).addClass('opened');
			} else {
				$(activeHref).addClass('opened');
			}

			_tabAnc.on('click',function(e){
				e.preventDefault();
				//tab
				var _btnTAb = $(this).parent();
				var  consID = $(this).attr('href');
				_btnTAb.addClass('on');
				_btnTAb.siblings().removeClass('on');

				//contents
				var tabID  = $(consID);
				var tabCon = $(this).parents('.tabMenuWrapper').find('.tabContBox');
				tabID.addClass('opened').show();
				tabID.siblings('.tabContBox').removeClass('opened');

				/**
				 * 버스노선도 페이지에서, 탭과 노선도 같이 컨트롤
				 */
				if ($('.busRouteWrapper').length){
					var busRrouteClass = consID.replace(/^#/, '.');
					$('.contsArea').find('.busRoute').hide();
					$('.contsArea').find(busRrouteClass).show();
				}
			});
		}
	});
}

/* 아코디언 패널 */
function fn_panelAccordion(){
	if(! $('.accordionConts').length){return}

	var $pnTitle = $('.accordionConts').find('.panelTitle');
	$pnTitle.each(function(){
		$(this).on('click',function(e){
			e.preventDefault();

			var _siblingsLI = $(this).parent('li').siblings();
			_siblingsLI.find('.hidden').text('내용열기');
			_siblingsLI.find('.panelTitle').removeClass('on');
			_siblingsLI.find('.panelContent').hide();

			if( $(this).is('.on')){
				$(this).removeClass('on');
				$(this).find('.hidden').text('내용열기');
				$(this).next('.panelContent').hide();
			} else {
				$(this).addClass('on');
				$(this).find('.hidden').text('내용닫기');
				$(this).next('.panelContent').show();
			}
		});
	});
}

/* 조직도 상세내용 보기 show-hide */
function fn_OrganizationInfo(){
	var organText = $('a.organText');
	organText.each(function(){
		$(this).on('click',function(e){
			e.preventDefault();
			var organID = $(this).attr('href');

			$(this).parents().find('.organizationInfo').hide();
			$(this).parents().find(organID).show();
		});
	});
}

/* IE버전 찾기 */
function isIE () {
	var myNav = navigator.userAgent.toLowerCase();
	return (myNav.indexOf('msie') != -1) ? parseInt(myNav.split('msie')[1]) : false;
}

/** ------------------------------------------
 *  layerPopUp
 *  - btnOpenPopup : 레이어 열기 버튼
 *  - targetLayer  : 버튼 클릭시 열리는 레이어
 * -------------------------------------------
 */
var layerCounter = 0;
function layerPopUp( btnOpenPopup , targetLayer ){
	var $layerContentBox = $(targetLayer).find('.layerBox'); //기본 레이어 타입
	var scroll_LOCK = function(){
		$('html').addClass('scrollLock');
	}
	var scroll_RESET = function(){
		$('html').removeClass('scrollLock');
	}

	/* 레이어 위치잡기 */
	function setPosition(){
		var _winWidth  = window.innerWidth || document.documentElement.clientWidth;
		var _winHeight = window.innerHeight || document.documentElement.clientHeight;
		var topPosition  = (_winHeight/2);
		var leftPosition = (_winWidth/2);

		_layerTypeBasic();
		function _layerTypeBasic(){
			var targetWidth = $layerContentBox.width();
			var targetHeight = $layerContentBox.height();

			$layerContentBox.css({
				'display':'block',
				'top':topPosition,
				'left':leftPosition,
				'margin-top': -(targetHeight/2),
				'margin-left':-(targetWidth/2)
			});
		}
	}

	/* 레이어 위치잡기 */
	setPosition();
	$(window).resize(function(){  setPosition();  });

	/* 레이어 열기 */
	layerCounter++;
	var _zindex = 9999;
	var _thisIndex = _zindex+layerCounter;

	$(targetLayer).fadeIn(150, function(){
		scroll_LOCK();
		setPosition();

		$('#uiLayerMask').show().addClass('on');
		$(this).css('z-index',_thisIndex);
		$(this).addClass('active');
		$(this).attr('tabindex','0').show().focus();
	});

	/* 레이어 닫기 */
	var btn_close = '.btnCloseLayer';
	var closeBtn = $(targetLayer).find(btn_close);
	$(closeBtn).on('click', function(e){
		e.preventDefault();
		$(targetLayer).find('.layerBox').attr('style','');

		if($(this).data('closeAll') === true){
			var layerAll = $(document).find('.layerWrapper.active');
			$(layerAll).fadeOut().removeClass('active').attr('style','');
			$('#uiLayerMask').hide().removeClass('on');
			layerCounter = 0;
			scroll_RESET();
		}
		else {
			$(targetLayer).fadeOut().removeClass('active').attr('style','');
			$(btnOpenPopup).focus();

			if($('.layerWrapper.active').length === 0){
				layerCounter = 0;
				$('#uiLayerMask').hide().removeClass('on');
				scroll_RESET();
			}
		}
	});

	//버튼이  Anchor일 경우 return false
	var elTagName = $(btnOpenPopup).prop('tagName');
	var tagA = 'A';
	if( elTagName === tagA ){
		if (isIE () === 9 || isIE () === 10) {
			event.returnValue = false;
		} else {
			event.preventDefault();
		}
	}

	// $(btnOpenPopup)가 없는 경우 (버튼클릭 없이 자동실행)
	if( btnOpenPopup === ''){
		$(closeBtn).on('click',function(e){
			$(document).find('#skipNavi').attr('tabindex','0').focus();
		});
	}

	/**
	 * 키보드 사용시 포커스 제어
	 */
	var focusableElementsString = 'a[href], area[href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), button:not([disabled]), object, iframe, [tabindex], [contenteditable]';
	var focusableEls = $(targetLayer).find(focusableElementsString),
		firstFocusableEl = focusableEls.first()[0],
		lastFocusableEl = focusableEls.last()[0],
		KEYCODE_TAB = 9;

	$(targetLayer).on('keydown', function(e) {
		var isTabPressed = (e.key === 'Tab' || e.keyCode === KEYCODE_TAB);

		if (!isTabPressed) { return; }

		if ( e.shiftKey ) /* shift + tab */ {
			if (document.activeElement === firstFocusableEl) {
				lastFocusableEl.focus();
				e.preventDefault();
			}
		} else /* tab */ {
			if (document.activeElement === lastFocusableEl) {
				firstFocusableEl.focus();
				e.preventDefault();
			}
		}
	});
}