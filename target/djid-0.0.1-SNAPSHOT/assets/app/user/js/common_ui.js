$(function(){
	//탭메뉴
	fn_TabMenu();
});

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
			});
		}
	});
}