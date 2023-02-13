	/* Star Zoom Control */
	var Browser = { a : navigator.userAgent.toLowerCase() };
	Browser = {
			ie : false,
			ie6 : Browser.a.indexOf('msie 6') != -1,
			ie7 : Browser.a.indexOf('msie 7') != -1,
			ie8 : Browser.a.indexOf('msie 8') != -1,
			opera : !!window.opera,
			safari : Browser.a.indexOf('safari') != -1,
			safari3 : Browser.a.indexOf('applewebkit/5') != -1,
			mac : Browser.a.indexOf('mac') != -1,
			chrome : Browser.a.indexOf('chrome') != -1,
			firefox : Browser.a.indexOf('firefox') != -1
		};

	// 기본 Zoom
	var nowZoom = 100;
	// 최대 Zoom
	var maxZoom = 120;
	// 최소 Zoom
	var minZoom = 90;
	// 조절 비율
	var setZoom = 5;

	// 화면크기 확대
	var jsBrowseSizeUp = function() {

		if( Browser.chrome ) {
			if( nowZoom < maxZoom ) {
				nowZoom += setZoom; // 5%씩 증가
				document.body.style.zoom = nowZoom + "%";
			}
			else{
				alert('최대 확대입니다.');
			}
		}
		else if( Browser.opera ) {
			alert('오페라는 화면크기 기능을 지원하지 않습니다.\n브라우저 내의 확대/축소 기능을 이용하시기 바랍니다.');
		}
		else if( Browser.safari || Browser.safari3 || Browser.mac ) {
			alert('사파리, 맥은 화면크기 기능을 지원하지 않습니다.\n브라우저 내의 확대/축소 기능을 이용하시기 바랍니다.');
		}
		else if( Browser.firefox ) {
			alert('파이어폭스는 화면크기 기능을 지원하지 않습니다.\n브라우저 내의 확대/축소 기능을 이용하시기 바랍니다.');
		}
		else {
			if( nowZoom < maxZoom ) {
				nowZoom += setZoom; //5%씩 증가
				document.body.style.position = "relative";
				document.body.style.zoom = nowZoom + "%";
			}
			else{
				alert('최대 확대입니다.');
			}
		}
	};

	// 화면크기 축소
	var jsBrowseSizeDown = function() {

		if( Browser.chrome ) {
			if( nowZoom > minZoom ) {
				nowZoom -= setZoom; //5%씩 증가
				document.body.style.zoom = nowZoom + "%";
			}
			else{
				alert('최소 축소입니다.');
			}
		}
		else if( Browser.opera ) {
			alert('오페라는 화면크기 기능을 지원하지 않습니다.\n브라우저 내의 확대/축소 기능을 이용하시기 바랍니다.');
		}
		else if( Browser.safari || Browser.safari3 || Browser.mac  ) {
			alert('사파리, 맥은 화면크기 기능을 지원하지 않습니다.\n브라우저 내의 확대/축소 기능을 이용하시기 바랍니다.');
		}
		else if( Browser.firefox ) {
			alert('파이어폭스는 화면크기 기능을 지원하지 않습니다.\n브라우저 내의 확대/축소 기능을 이용하시기 바랍니다.');
		}
		else {
			if( nowZoom > minZoom ) {
				nowZoom -= setZoom; //5%씩 증가
				document.body.style.position = "relative";
				document.body.style.zoom = nowZoom + "%";
			}
			else{
				alert('최소 축소입니다.');
			}
		}
	};

	// 화면크기 원래대로(100%)
	var jsBrowseSizeDefault = function() {
		nowZoom = 100;
		document.body.style.zoom = nowZoom + "%";
	};
	/* End Zoom Control */

//즐겨 찾기 추가
function addFavorite()
{
window.external.AddFavorite('http://www.bokjiro.go.kr', '복지로 함께 만드는 복지');
}

//시작 페이지로 설정
function set_start()
{
document.body.style.behavior='url(#default#homepage)';
document.body.setHomePage('http://www.bokjiro.go.kr');
}
function myMenuShow( idx ) {
		if(idx) {
			var obj;

			obj = document.getElementById(idx);
			if (obj.style.display == "none"){
				obj.style.display = "";
			} else {
				obj.style.display = "none";
			}
		}
		return;
	}
	function setMyMenu(value,name) {
		var icnt = 0;
		for(var i = 1; i < document.all["myMenu"].length; i++) {
			if( document.all["myMenu"][i].checked == true){
				icnt++;
			}
			if( icnt == 4) {
				alert('3개 까지만 선택하실 수 있습니다.');
				for(var j = 1; j < document.all["myMenu"].length; j++) {
					if( value == document.all["myMenu"][j].value) {
						document.all["myMenu"][j].checked = false;
					}
				}
				return;
			} else {
			}
		}
	}
	function choiceMymenu() {
		SetCookie("mymenu_url2", "",0);
		SetCookie("mymenu_name2", "",0);
		SetCookie("mymenu_url3", "",0);
		SetCookie("mymenu_name3", "",0);
		var icnt = 1;
		for(var j = 1; j < document.all["myMenu"].length; j++) {
			if( document.all["myMenu"][j].checked == true) {
				SetCookie("mymenu_url"+icnt, (document.all["myMenu"][j].value.split(","))[0],30);
				SetCookie("mymenu_name"+icnt, (document.all["myMenu"][j].value.split(","))[1],30);
				icnt++;
			}
		}
		myMenuShow('myMenu');
		drawMymenu();
	}

	function drawMymenu() {
		var mymenu_url1 = GetCookie("mymenu_url1");
		var mymenu_url2 = GetCookie("mymenu_url2");
		var mymenu_url3 = GetCookie("mymenu_url3");

		var mymenu_name1 = GetCookie("mymenu_name1");
		var mymenu_name2 = GetCookie("mymenu_name2");
		var mymenu_name3 = GetCookie("mymenu_name3");

		//alert(mymenu_url1);
		if( mymenu_url1 != undefined)
			document.all["myme"].innerHTML = "";
		if( mymenu_url1 != undefined)
			document.all["myme"].innerHTML += "<a href='"+mymenu_url1+"'><span>"+mymenu_name1+"</span></a>";
		if( mymenu_url2 != undefined)
			document.all["myme"].innerHTML += "<a href='"+mymenu_url2+"'><span>"+mymenu_name2+"</span></a>";
		if( mymenu_url3 != undefined)
			document.all["myme"].innerHTML += "<a href='"+mymenu_url3+"'><span>"+mymenu_name3+"</span></a>";
	}
	function fn_egov_login_gogossing(readYn, data_sid, board_sid, vieworregi, returl, failurl) {
		if(confirm('로그인이 필요합니다.\로그인 하시겠습니까?')) {
			SetCookie("data_sid",data_sid,1);
			SetCookie("board_sid",board_sid,1);
			SetCookie("vieworregi",vieworregi,1);
			if( returl.indexOf("\?") > -1) {
				SetCookie("returl",returl.substring(0, returl.indexOf("\?")).replace("\#printArea",""),1);
			} else {
				SetCookie("returl",returl.replace("\#printArea",""),1);
			}
			SetCookie("failurl",failurl,1);

			location.href = "/invitesomeone/login.do";
		}
	}

	//스크랩 등록
	function fn_scrap_regist() {
		if (confirm("현재 화면을 스크랩 하시겠습니까?")) {
			var sfrm = document.scrapBoard;
			sfrm.tmp_field1.value = location.href;
			sfrm.returnUrl.value = (location.href.replace("http://","")).replace(location.host,"");
			sfrm.submit();
		}
	}

	//스크랩 등록 submit 처리 2011.05.02 boke
	function fn_scrap_regist_new() {
		if (confirm("현재 화면을 스크랩 하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
	//로그인 페이지 submit 처리 2011.05.02 boke
	function fn_egov_login_process_new(data_sid, board_sid, vieworregi, returl, failurl) {
		if(confirm('로그인이 필요합니다.\로그인 하시겠습니까?')) {
			SetCookie("data_sid",data_sid,1);
			SetCookie("board_sid",board_sid,1);
			SetCookie("vieworregi",vieworregi,1);
			if( returl.indexOf("\?") > -1) {
				SetCookie("returl",returl.substring(0, returl.indexOf("\?")).replace("\#printArea",""),1);
			} else {
				SetCookie("returl",returl.replace("\#printArea",""),1);
			}
			SetCookie("failurl",failurl,1);

			//location.href = "/invitesomeone/login.do";
			return true;
		} else {
			return false;
		}
	}

	function actionupdateMemberUseNo()
	{
		if( confirm( "복지로 회원을 탈퇴하시겠습니까?\r\n회원탈퇴하시면 이벤트 응모, 댓글 등록 등 일부 서비스 사용에 제한이 있을 수 있습니다.")){
			location.href = "/etc/updateMemberUseNo.do";
		}
	}

	// SNS로 보내기
	function sendSNS(sns){
		var link;
		var localHref = location.href;

		if(sns == "facebook"){
			link = "http://www.facebook.com/share.php" + "?u=" + encodeURIComponent(localHref);
			window.open(link);
		}
		else if(sns == "twitter"){
			link = "http://twitter.com/share" + "?url=" + encodeURIComponent(localHref) + "&amp;text=" + encodeURIComponent('${replaceTitle} : 복지로');
			window.open(link);
		}else if(sns == "kakao"){
			link = "https://stroy.kakao.com/share?url=" + encodeURIComponent(localHref);
			window.open(link);
		}
	}

	/**
	 * 키보드보안(TouchEnKey) 파라미터 적용
	 * [적용방법 : "class='etcclass datatype-?'"]
	 *  - Numeric or Digit : datatype-n
	 *  - Alpha : datatype-a
	 *  - Email : datatype-e
	 *  - Money : datatype-c (,. 허용)
	 *  - 영문이름 : datatype-name
	 *  - 한글만 : datatype-h
	 *  - 조합 : datatype-an (Alpha or Numeric)
	 */
	function gfn_setTouchEnKeyParam() {
		var tags = jQuery('input[class*=datatype],textarea[class*=datatype]');
		var optionStr = "";
		jQuery.each(tags, function(idx, tag) {
			optionStr = "";
			jQuery.each(jQuery(tag).attr("class").split(" "), function(idx, val) {
				if(val.indexOf("datatype") > -1) {
					optionStr = val.split("-")[1];
				}
			});

			if(!gfn_isBlank(optionStr)) {
				jQuery(tag).attr("datatype", optionStr);
				//TouchEnKey_ReScan(); // 키보드보안에서 DOM 을 다시 스캔

				//Non-ActiveX 키보드 보안 설정
				npPfsStartup(null, false, true, false, false, "npkencrypt", "on");
			}
		});
	}

	/**
	 * null 또는 빈값 체크(StringUtils의 isBlank와 동일)
	 *
	 * @param obj
	 * @return
	 */
	function gfn_isBlank(obj) {
		return (!obj || jQuery.trim(obj) === "");
	}
