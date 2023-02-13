<<<<<<< HEAD
﻿$(function(){
	
	//Skip Navigation
	$('#pbSkipNavi a').click(function() {
		var clickHref = $(this).attr("href");
		$(clickHref).first().attr("tabindex",0).focus();
	});
	
	//화면 확대축소
	if(!$('.zoomBtn').length){
		var zoomLevel=100;
		
		$('.zoomIn').click(function() { zoomPage(5, $(this)); return false;});
		$('.zoomOut').click(function() { zoomPage(-5, $(this)); return false;});
		$('.zoomReset').click(function() { zoomPage(0, $(this)); return false;});
		
		function zoomPage(step, trigger){
			if(zoomLevel>=200 && step>0 ) { 
				alert('최대 200%까지 확대보기가 가능합니다. 더 이상 확대할 수 없습니다.');
				//$('.zoomReset').trigger('click');
				return;
			}
			if(zoomLevel<=75 && step<0) {
				alert('75%까지 화면 축소보기가 가능합니다. 더 이상 축소할 수 없습니다.');
				//$('.zoomReset').trigger('click');
				return;
			}

			if(step==0){
				zoomLevel=100;
			} else {
				zoomLevel=zoomLevel+step;
			}
			
			if (jQuery.browser.mozilla){
				$('body').css({ transform: 'scale('+(zoomLevel/100)+')', transformOrigin: '50% 0'});
			} else {
				//IE,크롬,사파리,오페라
				$('body').css({zoom: zoomLevel/100});
			}
			
			//줌레벨에 따른 화면비율변경
			if(zoomLevel>100){
				$('body').css({ width:(zoomLevel)+'%'});
			} else {
				$('body').css({ width:'100%'});
			}
		}
	};
	
	//위로이동
	btnGoTop();
	
	//GNB
	if( $('#GNB').length){
		$('#GNB').megaMenu();
	};
	
	//LNB
	if( $('.accordion').length){
		$('.accordion').AccordionVertical();
	};
	
	//LNB 접고 펼치기
	if( $('.btnFold').length){
		$('.btnFold').click(LNB_FoldUnfold);
	};
	
	//텝메뉴
	if ( $('.tbMenuSub').length){
		$('.tbMenuSub').each(function(){
			$(this).tabMENU();
		});
	};
	
	// Place Holder
	$('input, textarea').placeholder({customClass:'myPlaceholder'});
	
	//틀고정 테이블
	tblHEAD_Fixed();
	
	//테이블 셀 사이즈
	TBL_tblList();
	TBL_tblDataRow();
	
	//조회날짜선택
	DatePickerSET();
	
	//결과테이블 인쇄하기
	$('[id^=doPrint]').click(function(e){
		e.preventDefault();
		$('body').attr('id','setPrint');
		//$(this).parents().find('.alignBox').addClass('printIt');
		$(this).parents().find('.tblBackground').addClass('printIt');
		window.print();
	});
	
	//영수증 인쇄하기
	receiptPRINT();
	
	//레이어(layerSizeL) 높이 조정
	resizeLayerSizeL();
	
	//이용안내 레이어팝업
	if($('#popLayerUseGuideLink').length){
		$('#popLayerUseGuideLink').popup();
	}
	
	//사이트맵 회원권한메뉴(비로그인 상태) 링크삭제
	siteMapOnlyMember();
});


/* ----- 서브메뉴 접고 펼치기 ----- */
function LNB_FoldUnfold(){
	var $boxWrapper = $('#container > .fixedWidth');
	var $leftBOX    = $boxWrapper.find('.sectionLeft');
	var $rightBOX   = $boxWrapper.find('.sectionRight');
	
	//원래상태로
	if( $boxWrapper.is('.stateWide')){
		$(this).removeClass('hide');
		$boxWrapper.removeClass('stateWide');
		$leftBOX.animate({ width:'260',opacity:'1'},300 ).find('.accordion, .leftSignBox').show();
		
		//우측컨텐츠를 감싸는 DIV 모두 원래 사이즈로
		$rightBOX.find('.onlyWideView').animate({ width:'720',paddingLeft:''},300 );
		$rightBOX.find('.contentWrap').animate({ width:'980'},300 );
		$rightBOX.animate({ width:'750'},300 )
	}
	//왼쪽메뉴 숨기고,컨텐츠영역 넓힘
	else {
		$(this).addClass('hide');
		$boxWrapper.addClass('stateWide');
		$leftBOX.animate({ width:'0',opacity:'0'},300 ).find('.accordion, .leftSignBox').hide();
		
		//우측컨텐츠를 감싸는 DIV를 동시에 움직여야함
		$rightBOX.find('.onlyWideView').animate({ width:'950',paddingLeft:'30'},300 );
		$rightBOX.find('.contentWrap').animate({ width:'980'},300 );
		$rightBOX.animate({ width:'1010'},300 );
	}
	return false;
}

/* ----- 틀고정 테이블 ----- */
function tblHEAD_Fixed(){
	if( !$('.tblBackground').length ) return;
	$('.tBodyScroll').each(function(){
		$(this).scroll(function(){
			var xPoint = $(this).scrollLeft(); //divBodyScroll의 x좌표가 움직인 거리
			$(this).parent().find('.tHeadScroll').scrollLeft(xPoint); //가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 함
		});
	});
}

/* ----- 테이블 ----- */
function TBL_tblList(){
	if(!$('.tblList').length) return;
	
	//사파리 브라우저 셀 넓이 조정을 위해 사용함
	if($.browser.safari){
		$('.tblList tr>*').each(function(i){
			var colwidth = $('.tblList').find('col').eq(i).width()+'%';
			$('.tblList').find('tr:first>*').eq(i).css('width',colwidth);
		});
	}
	
	//체크박스 클릭시 행선택
	$('.tblList').find('td>input[type=checkbox]').click(function(){
		if($(this).is(':checked') == true){
			$(this).parents('tr').addClass('checkedItem');
		}
		if($(this).is(':checked') == false){
			$(this).parents('tr').removeClass('checkedItem');
		}
	});
	
	//라디오박스 클릭시 행선택
	$('.tblList').find('td>input[type=radio]').click(function(){
		$(this).parents('tr').addClass('checkedItem').siblings('tr').removeClass('checkedItem');
	});
}

function TBL_tblDataRow(){
	if(!$('.tblDataRow').length) return;
	
	//사파리 브라우저 셀 넓이 조정을 위해 사용함
	if($.browser.safari){
		$('.tblDataRow tr').each(function(i){
			var colwidthTd = $('.tblDataRow').find('col').eq(i).width()+'%';
			$('.tblDataRow').find('tr:first>*').eq(i).css('width',colwidthTd);
		});
	}
}


/* ----- 조회날짜선택 ----- */
function DatePickerSET(){
	if(!$('.datePickerUI').length) return;
	
	var datePickerOptions = { dateFormat:'yy-mm-dd', changeMonth:true, changeYear:true, showButtonPanel:true, yearRange:'c-1:c+0',};
	$('#startDate').datepicker(datePickerOptions);
	$('#endDate').datepicker(datePickerOptions);
	
	$.widget("ui.datePickerBTN", {
		_init: function() {
			var $el = this.element;
			$el.datepicker(this.options);
			
			if (this.options && this.options.trigger) {
				$(this.options.trigger).bind("click", function () {
					$el.datepicker("show");
					return false;
				});
			}
		}
	});

	$('#startDate').datePickerBTN({trigger:'#btnStartDate'});
	$('#endDate').datePickerBTN({trigger:'#btnFinishDate'});
};

/* ----- 팝업 ----- */
function OpenWindow(url,intWidth,intHeight){
	window.open(url,"_blank","width="+intWidth+",height="+intHeight+",resizable=0,scrollbars=yes");
}

/* ----- 영수증 인쇄하기 ----- */
function receiptPRINT(){
	if(!$('#receiptPop').length) return;
	
	var $ReceiptWrap = $('#receiptPop');
	var $ReceiptBoxs = $ReceiptWrap.find('.printReceipt');
	var $ReceiptH    = $ReceiptWrap.find('.printReceipt:first-child').height();
	
	//인쇄준비
	$('<style type=\"text\/css\">@media print{@page{size:portrait;}}<\/style>').appendTo('head');
	$ReceiptWrap.css({ height:$ReceiptH});
	if( $ReceiptBoxs.length > 1){
		$ReceiptBoxs.css({ paddingBottom:'50px'});
		$ReceiptWrap.find('.printReceipt:last-child').css({ paddingBottom:'0'});
	}
	
	//인쇄하기 버튼
	$('#printReseipt').click(function(){
		window.print();
	});
}

/* ----- 위로이동 ----- */
function btnGoTop(){
	if(!$('.btnGoTop').length) return;
	
	topBtn();
	function topBtn(){
		var browserWidth = $(window).width();
		var contentWidth = 1010;
		var leftSpace = 20;
		var leftPosition = (browserWidth - contentWidth)*1/2 + contentWidth + leftSpace;
		$('.btnGoTop').css({left: leftPosition});
	};
	
	$(window).on('resize',function(){
		topBtn();
	});

	$(window).scroll(function(){
		if ($(this).scrollTop() > 100) {
			$('.btnGoTop').fadeIn();
		} else {
			$('.btnGoTop').fadeOut();
		}
	});

	$('.btnGoTop').click(function(){
		$('html, body').animate({scrollTop:0},300);
		return false;
	});
}

/* ----- 레이어(layerSizeL) 높이 조정 ----- */
function resizeLayerSizeL(){
	if(!$('.layerSizeL').length) return;
	
	var layerL_height = $(window).height()*.8;
	var layerL_scrollBox = (layerL_height - 135);
	
	$('.layerSizeL').css('height',layerL_height);
	
	var scrollDIV = $('.layerSizeL').find('.scrollBox');
	if($(scrollDIV).length){
		$(scrollDIV).css('height',layerL_scrollBox);
	}
}

/* ----- 회원권한 메뉴(비로그인 상태 링크삭제)  ----- */
//GNB
function onlyMemberService(){
	var $memberServiceArea = $('.gnbBox').find('.onlyMemberService');
	var $serviceLink = $memberServiceArea.find('.dep2 a');
	
	if(! $memberServiceArea.length) return;
	$serviceLink.each(function(){
		$(this).replaceWith('<strong>'+ $(this).html()+'</strong>');
	});
}
//Site map
function siteMapOnlyMember(){
	var $memberServiceArea = $('.menuGroup').find('.onlyMemberService');
	var $serviceLink = $memberServiceArea.find('li>a');
	
	if(! $memberServiceArea.length) return;
	$serviceLink.each(function(){
		$(this).replaceWith('<span>'+ $(this).html()+'</span>');
	});
}

/* ----- 패밀리사이트 ----- */
function popup(ob){
	if(ob.selectedIndex <= 0){ return false; }
	window.open(ob.options[ob.selectedIndex].value,'_blank','')
}

/* --------------------
 *  GNB
 * --------------------- */
(function($){
	$.fn.megaMenu = function(){
		return this.each(function(){
			
			//회원서비스 로그인전 Tag변경
			onlyMemberService();
			
			var _self = $(this);
			var $menuGroup = $(this).find('ul');
			var $subMenu = $(this).find('.dep2:not(:animated)');
			var $subBG   = $(this).find('.dep2BG:not(:animated)');
			
			//메뉴길이에 맞게 BG높이 조절하기
			var biggestHeight = 0;
			setBgHeight();
			function setBgHeight(){
				_self.find('.dep2').each(function(){
					if($(this).height() > biggestHeight){
						biggestHeight = $(this).height();
					}
				}).height(biggestHeight);
			};

			//마우스 이벤트
			$menuGroup.mouseenter(function(){
				//서브메뉴 보임
				$subBG.addClass('over').stop().animate(
						{height:biggestHeight+20},
						{duration:200,
						 complete:function(){ $subMenu.stop().slideDown('fast'); }
				});
				
				//depth2에 마우스 오버시 해당 depth1 활성화
				var $eachDepth2 = $(this).find('>li .dep2');
				$eachDepth2.on('mouseenter',function(){
					$(this).parents('li').siblings().removeClass('on');
					$(this).parents('li').addClass('on');
				}).on('mouseleave',function(){
					$(this).parents('li').removeClass('on');
				});
				
			});
			$( _self, $subBG ).mouseleave(function(){
				$subBG.removeClass('over')
				$subBG.stop().animate({height:'0'},50);
				$subMenu.hide();
			});
			
			//닫기버튼
			$(this).find('.btnGnbClose').click(function(){
				$subBG.removeClass('over')
				$subBG.stop().animate({height:'0'},50);
				$subMenu.hide();
				return false;
			});
			
			//포커스 이벤트
			$menuGroup.focusin(function(){
				$subBG.addClass('over').stop().animate({height:biggestHeight+20},180);
				$subMenu.stop().slideDown('fast');
				
				//depth1에 포커스인되면 해당 depth1 활성화
				var $eachDepth1 = $(this).find('>li>a');
				$eachDepth1.on('focusin',function(){
					$(this).parents('li').addClass('on');
					$(this).parents('li').siblings().removeClass('on');
				});
				
				//depth1에 포커스인되면 해당 depth1 활성화
				var $eachDepth2 = $(this).find('>li .dep2');
				$eachDepth2.on('focusin',function(){
					$(this).parents('li').siblings().removeClass('on');
					$(this).parents('li').addClass('on');
					
					//depth2 링크에 포커스인이면 활성화
					$(this).find('a').on('focusin',function(){
						$(this).addClass('hover');
					}).on('focusout',function(){
						$(this).removeClass('hover');
					});
					
				}).on('focusout',function(){
					$(this).parents('li').removeClass('on');
				});
			});
			
			//포커스가 빠져나가면 서브메뉴 닫힘
			var $last  = $menuGroup.find('.dep2:last').find('a:last');
			var $outSideFocus = $('#header').find('.utilMenu');
			$last.focusout(function(){
				$subBG.removeClass('over')
				$subBG.stop().animate({height:'0'},50);
				$subMenu.hide();
			});
			$outSideFocus.focusin(function(){
				$menuGroup.find('>li').removeClass('on');
				$subBG.removeClass('over')
				$subBG.stop().animate({height:'0'},50);
				$subMenu.hide();
			});
		});
	};
})(jQuery);

/* --------------------
 * 아코디언(LNB)
 * --------------------- */
(function($){
	$.fn.AccordionVertical = function(){
		return this.each(function(){
			
			var _this = $(this);
			var dep1 = _this.find('>li>a');
			var dep2 = _this.find('>li>ul>li>a');
			
			// .current로 메뉴 활성화
			if( $(_this.find('.current')).length ){
				$('.current').find('>ul').show();
				if( $('.current').parents('li>ul').length ){
					$('.current').closest('.depthBox').addClass('on');
					$('.current').parents('ul>li');
					$('.current').parents('ul>li').find('>ul').show();
				}
			}
			
			function subToggle(){
				var _this = $(this);
				_this.parent().siblings().find('>ul').slideUp(300);
				_this.parent().addClass('on');
				
				if( _this.siblings('ul').length){
					if( _this.siblings('ul').is(':visible')){
						_this.parent().removeClass('on');
						_this.siblings('ul').slideUp('fast');
					} else {
						_this.parent().siblings().removeClass('on');
						_this.siblings('ul').slideDown(300);
					}
					return false;
				} else {
					//서브메뉴 없음
					_this.parent().siblings().removeClass('on');
				}
			}
			
			$(dep1).click(subToggle);
			$(dep2).click(subToggle);
		});
	};
})(jQuery);

/* --------------------
 *  TAB
 * --------------------- */
(function($){
	$.fn.tabMENU = function(){
		return this.each(function(){
			var tAnchor  = $(this).find('>li>a');
			var tWrapper = $(this).parent('div');
			var tConts   = tWrapper.find('>div');
			
			$(tConts).hide();
			
			//로딩 후 활성화
			var currentMenu = $(this).find('>li.on a').attr('href');
			$(currentMenu).show();
			
			//클릭 시
			$(tAnchor).click(function(){
				var obj = $(this).parent();
				obj.addClass('on').siblings().removeClass('on');
				
				var clickedHref = $(this).attr('href');
				if( obj.is('.on') == true ){
					$(tConts).hide();
					$(clickedHref).show();
				} else {
					$(clickedHref).hide();
				}
				return false;
			});
		});
	};
})(jQuery);

/* --------------------
 *  Loading Layer
 * --------------------- */
(function($){
	/*!
	 * Center-Loader PACKAGED v1.0.0
	 * http://plugins.rohitkhatri.com/center-loader/
	 * MIT License
	 * by Rohit Khatri
	 */
	$.fn.loader = function(action,spinner) {
		var action = action || 'show';
		if(action === 'show') {
			if(this.find('.loader').length == 0) {
				parent_position = this.css('position');
				this.css('position','relative');
				paddingTop = parseInt(this.css('padding-top'));
				paddingRight = parseInt(this.css('padding-right'));
				paddingBottom = parseInt(this.css('padding-bottom'));
				paddingLeft = parseInt(this.css('padding-left'));
				width = this.innerWidth();
				height = this.innerHeight();

				$loader = $('<div class="loader"></div>').css({
					'position': 'fixed',
					'top': 0,
					'left': 0,
					'width': '100%',
					'height': '100%',
					'z-index':1000,
					'background-color': 'rgba(0,0,0,0.2)',
					'border-radius': ''
				});

				$loader.attr('parent_position',parent_position);

				$spinner = $(spinner).css({
					'position': 'absolute',
					'top': '50%',
					'left': '50%',
					'color': '#000',
					'margin-top': '-'+paddingTop+'px',
					'margin-right': '-'+paddingRight+'px',
					'margin-bottom': '-'+paddingBottom+'px',
					'margin-left': '-'+paddingLeft+'px'
				});

				$loader.html($spinner);
				this.prepend($loader);
				marginTop = $spinner.height()/2;
				marginLeft = +$spinner.width()/2;
				$spinner.css({
					'margin-top': '-'+marginTop+'px',
					'margin-left': '-'+marginLeft+'px'
				});
			}
		} else if(action === 'hide') {
			this.css('position',this.find('.loader').attr('parent_position'));
			this.find('.loader').remove();
		}
	};

})(jQuery);
=======
﻿$(function(){
	
	//Skip Navigation
	$('#pbSkipNavi a').click(function() {
		var clickHref = $(this).attr("href");
		$(clickHref).first().attr("tabindex",0).focus();
	});
	
	//화면 확대축소
	if(!$('.zoomBtn').length){
		var zoomLevel=100;
		
		$('.zoomIn').click(function() { zoomPage(5, $(this)); return false;});
		$('.zoomOut').click(function() { zoomPage(-5, $(this)); return false;});
		$('.zoomReset').click(function() { zoomPage(0, $(this)); return false;});
		
		function zoomPage(step, trigger){
			if(zoomLevel>=200 && step>0 ) { 
				alert('최대 200%까지 확대보기가 가능합니다. 더 이상 확대할 수 없습니다.');
				//$('.zoomReset').trigger('click');
				return;
			}
			if(zoomLevel<=75 && step<0) {
				alert('75%까지 화면 축소보기가 가능합니다. 더 이상 축소할 수 없습니다.');
				//$('.zoomReset').trigger('click');
				return;
			}

			if(step==0){
				zoomLevel=100;
			} else {
				zoomLevel=zoomLevel+step;
			}
			
			if (jQuery.browser.mozilla){
				$('body').css({ transform: 'scale('+(zoomLevel/100)+')', transformOrigin: '50% 0'});
			} else {
				//IE,크롬,사파리,오페라
				$('body').css({zoom: zoomLevel/100});
			}
			
			//줌레벨에 따른 화면비율변경
			if(zoomLevel>100){
				$('body').css({ width:(zoomLevel)+'%'});
			} else {
				$('body').css({ width:'100%'});
			}
		}
	};
	
	//위로이동
	btnGoTop();
	
	//GNB
	if( $('#GNB').length){
		$('#GNB').megaMenu();
	};
	
	//LNB
	if( $('.accordion').length){
		$('.accordion').AccordionVertical();
	};
	
	//LNB 접고 펼치기
	if( $('.btnFold').length){
		$('.btnFold').click(LNB_FoldUnfold);
	};
	
	//텝메뉴
	if ( $('.tbMenuSub').length){
		$('.tbMenuSub').each(function(){
			$(this).tabMENU();
		});
	};
	
	// Place Holder
	$('input, textarea').placeholder({customClass:'myPlaceholder'});
	
	//틀고정 테이블
	tblHEAD_Fixed();
	
	//테이블 셀 사이즈
	TBL_tblList();
	TBL_tblDataRow();
	
	//조회날짜선택
	DatePickerSET();
	
	//결과테이블 인쇄하기
	$('[id^=doPrint]').click(function(e){
		e.preventDefault();
		$('body').attr('id','setPrint');
		//$(this).parents().find('.alignBox').addClass('printIt');
		$(this).parents().find('.tblBackground').addClass('printIt');
		window.print();
	});
	
	//영수증 인쇄하기
	receiptPRINT();
	
	//레이어(layerSizeL) 높이 조정
	resizeLayerSizeL();
	
	//이용안내 레이어팝업
	if($('#popLayerUseGuideLink').length){
		$('#popLayerUseGuideLink').popup();
	}
	
	//사이트맵 회원권한메뉴(비로그인 상태) 링크삭제
	siteMapOnlyMember();
});


/* ----- 서브메뉴 접고 펼치기 ----- */
function LNB_FoldUnfold(){
	var $boxWrapper = $('#container > .fixedWidth');
	var $leftBOX    = $boxWrapper.find('.sectionLeft');
	var $rightBOX   = $boxWrapper.find('.sectionRight');
	
	//원래상태로
	if( $boxWrapper.is('.stateWide')){
		$(this).removeClass('hide');
		$boxWrapper.removeClass('stateWide');
		$leftBOX.animate({ width:'260',opacity:'1'},300 ).find('.accordion, .leftSignBox').show();
		
		//우측컨텐츠를 감싸는 DIV 모두 원래 사이즈로
		$rightBOX.find('.onlyWideView').animate({ width:'720',paddingLeft:''},300 );
		$rightBOX.find('.contentWrap').animate({ width:'980'},300 );
		$rightBOX.animate({ width:'750'},300 )
	}
	//왼쪽메뉴 숨기고,컨텐츠영역 넓힘
	else {
		$(this).addClass('hide');
		$boxWrapper.addClass('stateWide');
		$leftBOX.animate({ width:'0',opacity:'0'},300 ).find('.accordion, .leftSignBox').hide();
		
		//우측컨텐츠를 감싸는 DIV를 동시에 움직여야함
		$rightBOX.find('.onlyWideView').animate({ width:'950',paddingLeft:'30'},300 );
		$rightBOX.find('.contentWrap').animate({ width:'980'},300 );
		$rightBOX.animate({ width:'1010'},300 );
	}
	return false;
}

/* ----- 틀고정 테이블 ----- */
function tblHEAD_Fixed(){
	if( !$('.tblBackground').length ) return;
	$('.tBodyScroll').each(function(){
		$(this).scroll(function(){
			var xPoint = $(this).scrollLeft(); //divBodyScroll의 x좌표가 움직인 거리
			$(this).parent().find('.tHeadScroll').scrollLeft(xPoint); //가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 함
		});
	});
}

/* ----- 테이블 ----- */
function TBL_tblList(){
	if(!$('.tblList').length) return;
	
	//사파리 브라우저 셀 넓이 조정을 위해 사용함
	if($.browser.safari){
		$('.tblList tr>*').each(function(i){
			var colwidth = $('.tblList').find('col').eq(i).width()+'%';
			$('.tblList').find('tr:first>*').eq(i).css('width',colwidth);
		});
	}
	
	//체크박스 클릭시 행선택
	$('.tblList').find('td>input[type=checkbox]').click(function(){
		if($(this).is(':checked') == true){
			$(this).parents('tr').addClass('checkedItem');
		}
		if($(this).is(':checked') == false){
			$(this).parents('tr').removeClass('checkedItem');
		}
	});
	
	//라디오박스 클릭시 행선택
	$('.tblList').find('td>input[type=radio]').click(function(){
		$(this).parents('tr').addClass('checkedItem').siblings('tr').removeClass('checkedItem');
	});
}

function TBL_tblDataRow(){
	if(!$('.tblDataRow').length) return;
	
	//사파리 브라우저 셀 넓이 조정을 위해 사용함
	if($.browser.safari){
		$('.tblDataRow tr').each(function(i){
			var colwidthTd = $('.tblDataRow').find('col').eq(i).width()+'%';
			$('.tblDataRow').find('tr:first>*').eq(i).css('width',colwidthTd);
		});
	}
}


/* ----- 조회날짜선택 ----- */
function DatePickerSET(){
	if(!$('.datePickerUI').length) return;
	
	var datePickerOptions = { dateFormat:'yy-mm-dd', changeMonth:true, changeYear:true, showButtonPanel:true, yearRange:'c-1:c+0',};
	$('#startDate').datepicker(datePickerOptions);
	$('#endDate').datepicker(datePickerOptions);
	
	$.widget("ui.datePickerBTN", {
		_init: function() {
			var $el = this.element;
			$el.datepicker(this.options);
			
			if (this.options && this.options.trigger) {
				$(this.options.trigger).bind("click", function () {
					$el.datepicker("show");
					return false;
				});
			}
		}
	});

	$('#startDate').datePickerBTN({trigger:'#btnStartDate'});
	$('#endDate').datePickerBTN({trigger:'#btnFinishDate'});
};

/* ----- 팝업 ----- */
function OpenWindow(url,intWidth,intHeight){
	window.open(url,"_blank","width="+intWidth+",height="+intHeight+",resizable=0,scrollbars=yes");
}

/* ----- 영수증 인쇄하기 ----- */
function receiptPRINT(){
	if(!$('#receiptPop').length) return;
	
	var $ReceiptWrap = $('#receiptPop');
	var $ReceiptBoxs = $ReceiptWrap.find('.printReceipt');
	var $ReceiptH    = $ReceiptWrap.find('.printReceipt:first-child').height();
	
	//인쇄준비
	$('<style type=\"text\/css\">@media print{@page{size:portrait;}}<\/style>').appendTo('head');
	$ReceiptWrap.css({ height:$ReceiptH});
	if( $ReceiptBoxs.length > 1){
		$ReceiptBoxs.css({ paddingBottom:'50px'});
		$ReceiptWrap.find('.printReceipt:last-child').css({ paddingBottom:'0'});
	}
	
	//인쇄하기 버튼
	$('#printReseipt').click(function(){
		window.print();
	});
}

/* ----- 위로이동 ----- */
function btnGoTop(){
	if(!$('.btnGoTop').length) return;
	
	topBtn();
	function topBtn(){
		var browserWidth = $(window).width();
		var contentWidth = 1010;
		var leftSpace = 20;
		var leftPosition = (browserWidth - contentWidth)*1/2 + contentWidth + leftSpace;
		$('.btnGoTop').css({left: leftPosition});
	};
	
	$(window).on('resize',function(){
		topBtn();
	});

	$(window).scroll(function(){
		if ($(this).scrollTop() > 100) {
			$('.btnGoTop').fadeIn();
		} else {
			$('.btnGoTop').fadeOut();
		}
	});

	$('.btnGoTop').click(function(){
		$('html, body').animate({scrollTop:0},300);
		return false;
	});
}

/* ----- 레이어(layerSizeL) 높이 조정 ----- */
function resizeLayerSizeL(){
	if(!$('.layerSizeL').length) return;
	
	var layerL_height = $(window).height()*.8;
	var layerL_scrollBox = (layerL_height - 135);
	
	$('.layerSizeL').css('height',layerL_height);
	
	var scrollDIV = $('.layerSizeL').find('.scrollBox');
	if($(scrollDIV).length){
		$(scrollDIV).css('height',layerL_scrollBox);
	}
}

/* ----- 회원권한 메뉴(비로그인 상태 링크삭제)  ----- */
//GNB
function onlyMemberService(){
	var $memberServiceArea = $('.gnbBox').find('.onlyMemberService');
	var $serviceLink = $memberServiceArea.find('.dep2 a');
	
	if(! $memberServiceArea.length) return;
	$serviceLink.each(function(){
		$(this).replaceWith('<strong>'+ $(this).html()+'</strong>');
	});
}
//Site map
function siteMapOnlyMember(){
	var $memberServiceArea = $('.menuGroup').find('.onlyMemberService');
	var $serviceLink = $memberServiceArea.find('li>a');
	
	if(! $memberServiceArea.length) return;
	$serviceLink.each(function(){
		$(this).replaceWith('<span>'+ $(this).html()+'</span>');
	});
}

/* ----- 패밀리사이트 ----- */
function popup(ob){
	if(ob.selectedIndex <= 0){ return false; }
	window.open(ob.options[ob.selectedIndex].value,'_blank','')
}

/* --------------------
 *  GNB
 * --------------------- */
(function($){
	$.fn.megaMenu = function(){
		return this.each(function(){
			
			//회원서비스 로그인전 Tag변경
			onlyMemberService();
			
			var _self = $(this);
			var $menuGroup = $(this).find('ul');
			var $subMenu = $(this).find('.dep2:not(:animated)');
			var $subBG   = $(this).find('.dep2BG:not(:animated)');
			
			//메뉴길이에 맞게 BG높이 조절하기
			var biggestHeight = 0;
			setBgHeight();
			function setBgHeight(){
				_self.find('.dep2').each(function(){
					if($(this).height() > biggestHeight){
						biggestHeight = $(this).height();
					}
				}).height(biggestHeight);
			};

			//마우스 이벤트
			$menuGroup.mouseenter(function(){
				//서브메뉴 보임
				$subBG.addClass('over').stop().animate(
						{height:biggestHeight+20},
						{duration:200,
						 complete:function(){ $subMenu.stop().slideDown('fast'); }
				});
				
				//depth2에 마우스 오버시 해당 depth1 활성화
				var $eachDepth2 = $(this).find('>li .dep2');
				$eachDepth2.on('mouseenter',function(){
					$(this).parents('li').siblings().removeClass('on');
					$(this).parents('li').addClass('on');
				}).on('mouseleave',function(){
					$(this).parents('li').removeClass('on');
				});
				
			});
			$( _self, $subBG ).mouseleave(function(){
				$subBG.removeClass('over')
				$subBG.stop().animate({height:'0'},50);
				$subMenu.hide();
			});
			
			//닫기버튼
			$(this).find('.btnGnbClose').click(function(){
				$subBG.removeClass('over')
				$subBG.stop().animate({height:'0'},50);
				$subMenu.hide();
				return false;
			});
			
			//포커스 이벤트
			$menuGroup.focusin(function(){
				$subBG.addClass('over').stop().animate({height:biggestHeight+20},180);
				$subMenu.stop().slideDown('fast');
				
				//depth1에 포커스인되면 해당 depth1 활성화
				var $eachDepth1 = $(this).find('>li>a');
				$eachDepth1.on('focusin',function(){
					$(this).parents('li').addClass('on');
					$(this).parents('li').siblings().removeClass('on');
				});
				
				//depth1에 포커스인되면 해당 depth1 활성화
				var $eachDepth2 = $(this).find('>li .dep2');
				$eachDepth2.on('focusin',function(){
					$(this).parents('li').siblings().removeClass('on');
					$(this).parents('li').addClass('on');
					
					//depth2 링크에 포커스인이면 활성화
					$(this).find('a').on('focusin',function(){
						$(this).addClass('hover');
					}).on('focusout',function(){
						$(this).removeClass('hover');
					});
					
				}).on('focusout',function(){
					$(this).parents('li').removeClass('on');
				});
			});
			
			//포커스가 빠져나가면 서브메뉴 닫힘
			var $last  = $menuGroup.find('.dep2:last').find('a:last');
			var $outSideFocus = $('#header').find('.utilMenu');
			$last.focusout(function(){
				$subBG.removeClass('over')
				$subBG.stop().animate({height:'0'},50);
				$subMenu.hide();
			});
			$outSideFocus.focusin(function(){
				$menuGroup.find('>li').removeClass('on');
				$subBG.removeClass('over')
				$subBG.stop().animate({height:'0'},50);
				$subMenu.hide();
			});
		});
	};
})(jQuery);

/* --------------------
 * 아코디언(LNB)
 * --------------------- */
(function($){
	$.fn.AccordionVertical = function(){
		return this.each(function(){
			
			var _this = $(this);
			var dep1 = _this.find('>li>a');
			var dep2 = _this.find('>li>ul>li>a');
			
			// .current로 메뉴 활성화
			if( $(_this.find('.current')).length ){
				$('.current').find('>ul').show();
				if( $('.current').parents('li>ul').length ){
					$('.current').closest('.depthBox').addClass('on');
					$('.current').parents('ul>li');
					$('.current').parents('ul>li').find('>ul').show();
				}
			}
			
			function subToggle(){
				var _this = $(this);
				_this.parent().siblings().find('>ul').slideUp(300);
				_this.parent().addClass('on');
				
				if( _this.siblings('ul').length){
					if( _this.siblings('ul').is(':visible')){
						_this.parent().removeClass('on');
						_this.siblings('ul').slideUp('fast');
					} else {
						_this.parent().siblings().removeClass('on');
						_this.siblings('ul').slideDown(300);
					}
					return false;
				} else {
					//서브메뉴 없음
					_this.parent().siblings().removeClass('on');
				}
			}
			
			$(dep1).click(subToggle);
			$(dep2).click(subToggle);
		});
	};
})(jQuery);

/* --------------------
 *  TAB
 * --------------------- */
(function($){
	$.fn.tabMENU = function(){
		return this.each(function(){
			var tAnchor  = $(this).find('>li>a');
			var tWrapper = $(this).parent('div');
			var tConts   = tWrapper.find('>div');
			
			$(tConts).hide();
			
			//로딩 후 활성화
			var currentMenu = $(this).find('>li.on a').attr('href');
			$(currentMenu).show();
			
			//클릭 시
			$(tAnchor).click(function(){
				var obj = $(this).parent();
				obj.addClass('on').siblings().removeClass('on');
				
				var clickedHref = $(this).attr('href');
				if( obj.is('.on') == true ){
					$(tConts).hide();
					$(clickedHref).show();
				} else {
					$(clickedHref).hide();
				}
				return false;
			});
		});
	};
})(jQuery);

/* --------------------
 *  Loading Layer
 * --------------------- */
(function($){
	/*!
	 * Center-Loader PACKAGED v1.0.0
	 * http://plugins.rohitkhatri.com/center-loader/
	 * MIT License
	 * by Rohit Khatri
	 */
	$.fn.loader = function(action,spinner) {
		var action = action || 'show';
		if(action === 'show') {
			if(this.find('.loader').length == 0) {
				parent_position = this.css('position');
				this.css('position','relative');
				paddingTop = parseInt(this.css('padding-top'));
				paddingRight = parseInt(this.css('padding-right'));
				paddingBottom = parseInt(this.css('padding-bottom'));
				paddingLeft = parseInt(this.css('padding-left'));
				width = this.innerWidth();
				height = this.innerHeight();

				$loader = $('<div class="loader"></div>').css({
					'position': 'fixed',
					'top': 0,
					'left': 0,
					'width': '100%',
					'height': '100%',
					'z-index':1000,
					'background-color': 'rgba(0,0,0,0.2)',
					'border-radius': ''
				});

				$loader.attr('parent_position',parent_position);

				$spinner = $(spinner).css({
					'position': 'absolute',
					'top': '50%',
					'left': '50%',
					'color': '#000',
					'margin-top': '-'+paddingTop+'px',
					'margin-right': '-'+paddingRight+'px',
					'margin-bottom': '-'+paddingBottom+'px',
					'margin-left': '-'+paddingLeft+'px'
				});

				$loader.html($spinner);
				this.prepend($loader);
				marginTop = $spinner.height()/2;
				marginLeft = +$spinner.width()/2;
				$spinner.css({
					'margin-top': '-'+marginTop+'px',
					'margin-left': '-'+marginLeft+'px'
				});
			}
		} else if(action === 'hide') {
			this.css('position',this.find('.loader').attr('parent_position'));
			this.find('.loader').remove();
		}
	};

})(jQuery);
>>>>>>> refs/heads/202204
