/** ------------------------------------------
 *  @퍼블리싱 작업용
 *   개발에서 사용안하는 파일입니다
 * -------------------------------------------
 */

$(function(){
	$('#header').load('../inc/inc_header.html', function(){
		GNB_Megamenu(); //메가메뉴
		COMMN_zoomInOut(); //화면크기 확대-축소
	});

	$('#footer').load('../inc/inc_footer.html', function(){
		organizationsLink(); //푸터 슬라이더
	});
});