/** ------------------------------------------
 *  @퍼블리싱 작업용
 *   개발에서 사용안하는 파일입니다
 * -------------------------------------------
 */

$(function(){
	$('#header').load('../inc/inc_header.html', function(){
		//공통 : 상단 통합검색
		TOP_topSearch();

		//공통 : GNB
		TOP_GobalNav();

		//LNB 메뉴 슬라이드
		LNB_MenuActive();
	});

	$('#footer').load('../inc/inc_footer.html');
});