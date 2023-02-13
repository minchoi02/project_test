$(function(){

	//탭메뉴
	fn_TabMenu();

	//아코디언 패널
	fn_panelAccordion();

	//메인 : 배너 (왼쪽)
	if($('#mainBanner').length){
		var $mainOwlTop = $('#mainBanner');
		$mainOwlTop.owlCarousel({
			loop:true,
			nav:true,
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
	if ( $('.mainMenuLink').length){
		var $mainOwlLink = $('.mainMenuLink');
		$mainOwlLink.owlCarousel({
			mouseDrag:false,
			dots:true,
			nav:false,
			margin:0,
			items:1
		});
	}

	//메인 : 배너 (하단 오른쪽)
	fn_bnrList();

	//메인 : 공지-복지 핫이슈
	MAIN_newsBoard();

	//전체 약관 펼치기/접기
	checkBoxFold();

	//소통과 알림 : 달력 펼치기/접기
	calendarToggle();

	//조직도 상세내용 보기 show/hide
	fn_OrganizationInfo();
});

/* 공통 : 상단 통합검색 */
function TOP_topSearch(){
	var _btnSearch = $('.headerSrchBox .btnSearchTop');
	_btnSearch.off('click').on('click',function(e){
		e.preventDefault()
		var searchLAYER = $(this).next('.topSearchBox');
		if( searchLAYER.is(':hidden')){
			$(this).next('.topSearchBox').show();
		} else {
			$(this).next('.topSearchBox').hide();
		}
	});
}
/* 공통 : GNB */
function TOP_GobalNav(){
	var _GNB = $('.gnbBox');
	var hasSubMenu = _GNB.find('li > div');
	if( hasSubMenu.length ){ hasSubMenu.parent('li').addClass('hasSub'); } //서브메뉴 표시 아이콘 추가

	var $menuON = _GNB.find('.on');
	if( $menuON.length ){
		$menuON.parents('li').addClass('active');
		$menuON.parents('li').find('> a').addClass('on');
	}
	_GNB.find('.active > div').slideDown('fast');

	var $UL_A = _GNB.find('li>a');
	$UL_A.on('click',function(e){
		if ( $(this).next('div').length){ e.preventDefault(); }

		//siblings
		var _siblings = $(this).parent().siblings();
		_siblings.removeClass('active');
		_siblings.find('a').removeClass('on');
		_siblings.find('>div').hide();

		//this
		$(this).addClass('on');
		$(this).parent().addClass('active');

		var nextUL = $(this).next('div');
		if (nextUL.length && nextUL.is(':hidden')){
			$(this).next('div').slideDown();
		} else if (nextUL.length && nextUL.is(':visible')){
			$(this).next('div').hide();
			$(this).parent().removeClass('active');
			$(this).removeClass('on');
		}
	});

	var scroll_LOCK  = function(){ $('html').addClass('scrollLock'); }
	var scroll_RESET = function(){ $('html').removeClass('scrollLock'); }

	$('.btnGNB').on('click',function(e){
		e.preventDefault();

		scroll_LOCK();
		$('.gnbWrapper').show();
		$(this).parents('.headerWrapper').addClass('open');
	});

	$('.btnCloseMenu').on('click',function(e){
		e.preventDefault();

		scroll_RESET();
		$('.gnbWrapper').hide();
		$(this).parents('.headerWrapper').removeClass('open');
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

/* 탭메뉴 */
function fn_TabMenu(){
	var tabMENU = $('.tabMenu');
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

/* 전체 약관 펼치기/접기 */
function checkBoxFold(){
	$('.checkBoxTop > .btnTermsToggle').on('click',function(){
		var termsBox = $(this).parent().siblings('.memBody');

		if(termsBox.is(':hidden')){
			termsBox.show();
			$(this).text('전체 약관 닫기');
		} else {
			termsBox.hide();
			$(this).text('전체 약관 보기');
		}
	});
}

/* 소통과 알림 : 달력 펼치기/접기 */
function calendarToggle(){
	$('.calendarClose > .btnTypeBasic').on('click',function(){
		var calendarTable = $(this).parents().find('.calendarWrap');

		if(calendarTable.is(':hidden')){
			calendarTable.show();
			$(this).find('.hidden').text('달력 접기');
		} else {
			calendarTable.hide();
			$(this).find('.hidden').text('달력  펼치기');
		}
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

/** ------------------------------------------
 *  LNB (sly.js 실행)
 *  - node_lnb :
 *  - currentIndex  :
 * -------------------------------------------
 */
function LNB_MenuActive(){
	if(! $('.sliderFrame').length){return;}

	$('.sliderFrame').each(function(){
		var dataText = $(this).attr('data-idx');

		var $frame = $(this);
		var $wrap  = $frame.parent();
		$frame.sly({
			horizontal: 1,
			itemNav: 'forceCentered',
			smart: 1,
			activateMiddle: 1,
			activateOn: 'click',
			mouseDragging: 1,
			touchDragging: 1,
			releaseSwing: 1,
			startAt: dataText,
			scrollBar: false,//$wrap.find('.scrollbar'),
			scrollBy: 1,
			speed: 300,
			elasticBounds: 1,
			easing: 'easeOutExpo',
			dragHandle: 1,
			dynamicHandle: 1,
			clickBar: 1,

			// Buttons
			prev: $wrap.find('.btnPrev'),
			next: $wrap.find('.btnNext')
		});

		$(window).resize(function(e) {
			$frame.sly('reload');
		});
	});
}
