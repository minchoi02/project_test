<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c75dc780302043a6e2451e96541b1a&libraries=services"></script>
<script>

function goList(){
	$("#frm").attr("action", "/welfare_facility/b_1/list.do");
	$("#frm").submit();
}

$(document).ready(function(){
	var mapContainer = document.getElementById('mapView'), // 지도를 표시할 div 
	mapOption = {
	    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  

	//지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	//주소로 좌표를 검색합니다
	geocoder.addressSearch('${view.ADDR1} ${view.ADDR2}', function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	 if (status === daum.maps.services.Status.OK) {

	    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new daum.maps.Marker({
	        map: map,
	        position: coords
	    });

	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new daum.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">${view.NAME}</div>'
	    });
	    infowindow.open(map, marker);

	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	});
	
	$("#comment_pwd").keydown(function(event) {
		if (event.keyCode == 13) {
			event.preventDefault();
			$("#okBtn").click();
		}
	});
	
	
	$("#insertBtn").click(function() {
		
		if( !valCheck('fname', '이름을 입력해주세요.') ) return;
		if( !valCheck('pwd', '비밀번호를 입력해주세요.') ) return;		
		if( !valCheck('content', '내용을 입력해주세요.') ) return;	
		
		var checkCaptcha = false;
		
		if ( $('#captcha_input').val() == "" ) {
            alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
            $("#captcha_input").focus();
            return;
	     } else {
	            $.ajax({
                   url: '/validateCaptcha.do',
                   type: 'POST',
                   dataType: 'text',
                   data: 'captcha_input=' + $('#captcha_input').val(),
                   async: false,      
                   success: function(resp) {
                         if(resp.indexOf("Y") != -1){
                        	 
                         }else{
                        	 alert("보안문자 입력 값이 일치하지 않습니다. 새로운 문자를 다시 입력해주세요.");
                        	 reloadCaptcha();
	                         $('#captcha_input').val('');
	                         checkCaptcha = true;
	                        return;
                         }
                         
                   }
	            });
	     }
		
		if(checkCaptcha){
			return;
		}
		
		var write_mod = $("#write_mod").val();
		
		if(write_mod == "update"){
			if(confirm('수정하시겠습니까?')){
				
				var comment_seq = $("#comment_seq").val();
				var name = $("#fname").val();
				var pwd = $("#pwd").val();
				var content = $("#content").val();
				var captcha_input = $("#captcha_input").val();
				
				$.ajax({
				    url: "/welfare_facility/comment_update.do",
				    data: "seq="+encodeURI(comment_seq)+"&name="+encodeURI(name)+"&pwd="+encodeURI(pwd)+"&content="+encodeURI(content)+"&gubun=facility&captcha_input="+captcha_input,
				    type : "GET",
				    error: function(){
				    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
				    },
				    success: function(data){			    	
				    	if(data.view != null){
				    		$("#name_"+data.view.SEQ).html(data.view.NAME);
				    		$("#content_"+data.view.SEQ).html(data.view.CONTENT);			    		
				    	}else{
				    		alert("비밀번호가 틀립니다.");
				    		//return;
				    	}
				    	
				    	$("#fname").val("");
			    		$("#pwd").val("");
			    		$("#content").val("");
			    		$("#captcha_input").val("");
				    	
				    	$("#write_mod").val("write");
				    	$("#btn_text").html("등록");
				    	
				    }
				    
				});
			}
		}else{
			if(confirm('등록하시겠습니까?')){
				
				var p_seq = "${view.SEQ}";
				var name = $("#fname").val();
				var pwd = $("#pwd").val();
				var content = $("#content").val();
				var captcha_input = $("#captcha_input").val();
				
				$.ajax({
				    url: "/welfare_facility/comment_insert.do",
				    data: "p_seq="+p_seq+"&name="+encodeURI(name)+"&pwd="+encodeURI(pwd)+"&content="+encodeURI(content)+"&gubun=facility&captcha_input="+captcha_input,
				    type : "GET",
				    error: function(){
				    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
				    },
				    success: function(data){			    	
				    	if(data.view != null){
				    		var html = '';
				    			html+= '<li id="li_' + data.view.SEQ + '">';
				    			html+= '<dt><span id="name_' + data.view.SEQ + '">' + data.view.NAME + '</span>(' + data.view.REG_DATE + ')';
								html+= "<a href=\"javascript:goViewPop('"+ data.view.SEQ +"', 'modify')\">수정</a><a href=\"javascript:goViewPop('"+ data.view.SEQ +"', 'del')\">삭제</a>";
								html+= '</dt>';
								html+= '<dd id="content_'+ data.view.SEQ +'">' + data.view.CONTENT + '</dd>';
								html+= '</li>';
				    		$("#commentUl").append(html);
				    		var count_span = Number($("#count_span").html());
				    		$("#count_span").html(count_span + 1);
				    		
				    		$("#fname").val("");
				    		$("#pwd").val("");
				    		$("#content").val("");
				    		$("#captcha_input").val("");						
				    	}
				    	
				    	
				    }
				    
				});
			}
		}
		
		
		
	});
	
	$("input:password[numberOnly]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	    if($(this).val().length != 4){
	    	$("#pwdInfo").html("! 숫자 4자리");
	    }else{
	    	$("#pwdInfo").html("");
	    }
	});
	
	
	$("#okBtn").on("click", function() {
		
		var seq = $("#comment_seq").val();
		var pwd = $("#comment_pwd").val();
		
		$.ajax({
		    url: "/welfare_facility/comment_pwd_check.do",
		    data: "seq="+seq+"&pwd="+pwd,
		    type : "GET",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(data){	
		    	
		    	$("#comment_pwd").val("");
				$("#canBtn").click();
				
				if(data == "1"){
					var mod = $("#mod").val();
					if(mod == "del"){
						$.ajax({
						    url: "/welfare_facility/comment_del_ajax.do",
						    data: "seq="+seq+"&pwd="+encodeURI(pwd),
						    type : "GET",
						    error: function(){
						    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
						    },
						    success: function(result){
						    	$("#li_"+seq).remove();
						    	var count_span = Number($("#count_span").html());
					    		$("#count_span").html(count_span - 1);
								alert("삭제되었습니다.");
								return;
						    }
						});	
					}else{
						// 비밀번호 체크 성공 후 수정하기 기능 진행 시작						
						$.ajax({
						    url: "/welfare_facility/comment_modify_get_data_ajax.do",
						    data: "seq="+seq+"&pwd="+encodeURI(pwd),
						    type : "GET",
						    error: function(){
						    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
						    },
						    success: function(mapView){
						    	console.log(mapView.view.SEQ);
						    	console.log(mapView.view.NAME);
						    	console.log(mapView.view.PWD);
						    	console.log(mapView.view.CONTENT);
						    	
						    	$("#fname").val(mapView.view.NAME);
						    	$("#pwd").val(mapView.view.PWD);
						    	$("#content").val(mapView.view.CONTENT);
						    	$("#write_mod").val("update");
						    	$("#btn_text").html("수정");
						    	
						    	/* $("#li_"+seq).remove();
						    	var count_span = Number($("#count_span").html());
					    		$("#count_span").html(count_span - 1);
								alert("삭제되었습니다.");
								return; */
						    }
						});	
					}
				}else{
					alert("비밀번호가 틀립니다.");
					$("#comment_pwd").val("");
				}
		    }
		});
	});
	
	
});


function imgRefresh(){
    $("#captchaImg").attr("src", "/captchaImage.do?id=" + Math.random());
}

function reloadCaptcha(){
	var timeData = new Date();
	var reloadNum = timeData.getTime();
	var captchaUrl = '/captchaImage.do';
	$('#captchaImg').attr('src',captchaUrl+'?'+reloadNum);
}

function playAudio(){
	var timeData = new Date();
	var reloadNum = timeData.getTime();
	var browserInfo = navigator.userAgent.toLowerCase();
	if((browserInfo.indexOf("msie") >= 0 || browserInfo.indexOf("trident") >= 0)){
		var htmlString = '<object type="audio/x-wav" data="/captchaAudio.do?' + reloadNum + '" width="0" height="0"><param name="src" value="/captchaAudio.do?' + reloadNum +'"/><param name="autostart" value="true" /><param name="controller" value="false" /></object>';
		document.getElementById('audioPlayer').innerHTML = htmlString;
		document.getElementById('captcha_input').focus();
	}else if(browserInfo.indexOf("chrome") >= 0 || browserInfo.indexOf("firefox") >= 0 || browserInfo.indexOf("safari") >= 0){
		var htmlString = '<audio controls autoplay style="height:0px;width:0px;"><source src="/captchaAudio.do?' + reloadNum + '" type="audio/wav"></audio>';
		document.getElementById('audioPlayer').innerHTML = htmlString;
		document.getElementById('captcha_input').focus();
	}else{
		// 예외처리 필요
	}
}

function goViewPop(seq, mod){
	$("#mod").val(mod);
	$("#comment_seq").val(seq);
	layerPopUp(this, '#layerPassword');
}

function favorite(){
	$.ajax({
	    url: "/welfare_facility/favorite.do",
	    data: "facility_seq=${view.SEQ}&gubun=facility",
	    type : "GET",
	    error: function(){
	    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
	    },
	    success: function(result){
			if(result == 1){
				var cnt = Number($("#favorite_cnt").html());
				cnt++;				
				$("#good_area").html("<a href=\"javascript:favorite_cancel();\" class='good_check' style='margin-left: 10px;'>좋아요 : <span id='favorite_cnt'>" + cnt + "</span></a>");
			}else{
				alert("잘못된 접근입니다.");
			}
	    }
	});	
}

function favorite_cancel(){
	$.ajax({
	    url: "/welfare_facility/favorite_cancel.do",
	    data: "facility_seq=${view.SEQ}&gubun=facility",
	    type : "GET",
	    error: function(){
	    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
	    },
	    success: function(result){
			if(result == 1){
				var cnt = Number($("#favorite_cnt").html());
				cnt--;				
				$("#good_area").html("<a href=\"javascript:favorite();\" class='good' style='margin-left: 10px;'>좋아요 : <span id='favorite_cnt'>" + cnt + "</span></a>");
			}else{
				alert("잘못된 접근입니다.");
			}
	    }
	});	
}


</script>
<form id="frm" name="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/list.do">
	<input type="hidden" name="page" id="page" value="${bean.page}" />
	<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
	
	<input type="hidden" name="seq" id="seq" value="${bean.seq}" />

	<input type="hidden" name="search_kind_seq" id="frm_search_kind_seq" value="${bean.search_kind_seq}" />	
	<input type="hidden" name="search_area_seq" id="frm_search_area_seq" value="${bean.search_area_seq}" />
	<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
	
	<input type="hidden" name="write_mod" id="write_mod" value="write" /> 
</form>
					<div class="contsArea welfareSearch">

						<div class="welfareTop">
							<p class="contsSubTit tyBullet">${view.NAME}</p>
							<c:if test="${not empty view.DOMAIN}">
								<a href="http://${view.DOMAIN}" class="homePageGo" target="_blank">홈페이지 바로가기</a>
							</c:if>
							<span id="good_area">
							<c:if test="${userSession.SEQ != null}">
								<c:if test="${view.MEMBER_FAVORITE_CNT < 1}">
									<a href="javascript:favorite();" class="good" style="margin-left: 10px;">좋아요 : <span id="favorite_cnt">${view.FAVORITE_CNT}</span></a>
								</c:if>
								<c:if test="${view.MEMBER_FAVORITE_CNT > 0}">
									<a href="javascript:favorite_cancel();" class="good_check" style="margin-left: 10px;">좋아요 : <span id="favorite_cnt">${view.FAVORITE_CNT}</span></a> 
								</c:if>
							</c:if>
							<c:if test="${userSession.SEQ == null}">
								<a href="javascript:alert('\'좋아요\'는 정보드림 회원로그인 후 참여 가능합니다.');" class="good" style="margin-left: 10px;">좋아요 : <span id="favorite_cnt">${view.FAVORITE_CNT}</span></a>
							</c:if>
							</span>
						</div>
						<!-- view -->
						<div class="commList welfareView">
							<table class="boardTypeCol type02">
								<caption>구인정보 목록이며 지역, 시설유형, 전화번호, 팩스번호, 주소 정보 제공합니다.</caption>
								<colgroup>
									<col style="width: 100px"/>
									<col style="width: 364px"/>
									<col style="width: 100px"/>
									<col style="width: 365px"/>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">지역</th>
										<td>${view.AREA} </td>
										<th scope="row">기관유형</th>
										<td>${view.KIND}</td>
									</tr>
									<tr>
										<th scope="row">전화번호</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.TEL1}">
													Tel. ${view.TEL1}-${view.TEL2}-${view.TEL3}
												</c:when>
												<c:otherwise>
													-
												</c:otherwise>
											</c:choose>
										</td>
										<th scope="row">팩스번호</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.FAX1}">
													Fax. ${view.FAX1}-${view.FAX2}-${view.FAX3}
												</c:when>
												<c:otherwise>
													-
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th scope="row">주소</th>
										<td colspan="3">
										<c:if test="${not empty ZIP_CD}">
										(${view.ZIP_CD})
										</c:if>
										${view.ADDR1} ${view.ADDR2}</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="mapView" id="mapView" style="width: 930px; height: 450px;">
							<!-- <img src="/assets/user/images/@map01.png" alt="행복한우리복지관 장애인평생교육원 지도"> -->
						</div>
						<!--//view -->

						<div class="btnArea">
							<a href="javascript:goList();" class="btnTypeBasic sizeM"><span>목록보기</span></a>
						</div>
						
						<!-- 코멘트 190214 -->
						<div class="commentList">
							<p class="tit">댓글 (<span id="count_span">${comment_count}</span>)개</p>
							<ul id="commentUl">
								<c:forEach var="list" items="${comment_list}">
								<li id="li_${list.SEQ}">
									<dt><span id="name_${list.SEQ}">${list.NAME}</span>(<fmt:formatDate value="${list.REG_DATE}" pattern="yyyy-MM-dd" />)
										<a href="javascript:goViewPop('${list.SEQ}', 'modify')">수정</a><a href="javascript:goViewPop('${list.SEQ}', 'del')">삭제</a>
									</dt>
									<dd id="content_${list.SEQ}">${list.CONTENT}</dd>
								</li>
								</c:forEach>
							</ul>

							<div class="commentBox">
								<table class="commentForm">
									<caption>코멘트 입력정보이며, 이름, 비밀번호, 스팸필터링, 내용을 입력합니다.</caption>
									<colgroup>
										<col style="width:70px">
										<col style="width: *">
										<col style="width:60px">										
										<col style="width:505px">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="fname">이름</label></th>
											<td>
												<div class="type01">
													<input type="text" id="fname" name="name" value="${userSession.NAME}">
												</div>
											</td>
											<th scope="row"><label for="pwd">비밀번호</label></th>
											<td>
												<div class="type01">
													<input type="password" id="pwd" name="pwd" maxlength="4" numberOnly>
													<p class="infoNoti" id="pwdInfo">! 숫자 4자리</p>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="captcha">스팸방지</label></th>
											<td colspan="3" class="captchaArea">
												 <!-- <span class="captcha"><img src="../common/images/@captcha.png" alt=""></span>
												 <input type="text" id="captcha">
												 <button type="button" class="btnTypeBasic colorGray"><span>새로고침</span></button> -->
												 
												 <a href="#none" onclick="playAudio();"><img src="/assets/user/images/common/audio.png" class="vm" style="width: 35px; height: 37px" alt="보안문자 음성 듣기"/></a>
												 <span class="captcha">											 	
												 	<img src="/captchaImage.do" id="captchaImg" class="vm" style="width: 148px; height: 36px" alt="보안문자 이미지">
												 </span>
												 <input type="text" id="captcha_input" name="captcha_input" title="보안문자 입력하기">
												 <button type="button" id="reload" onclick="javascript:reloadCaptcha();" class="btnTypeBasic colorGray"><span>새로고침</span></button>
												 <div id="audioPlayer" style="display: none;"></div>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="comment">내용</label></th>
											<td colspan="3" class="comment">
												<textarea id="content" name="content" rows="5" cols="75"></textarea>
												<button type="button" class="btnTypeBasic colorBlue" id="insertBtn"><span id="btn_text">등록</span></button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 코멘트 190214 //-->
					</div>
					
<form name="viewFrm" id="viewFrm" method="post">
	<input type="hidden" name="seq" id="comment_seq" />
	<input type="hidden" name="mod" id="mod" />
	<!-- 레이어 팝업 -->
	<div class="layerWrapper confirmPassword" id="layerPassword">
		<div class="layerBox">
			<div class="layerHeader">
				<strong>비밀번호 확인</strong>
			</div>
			<div class="layerBody">
				<div class="innerBox">
					<p class="formbox">
						<label for="pwd">비밀번호 4자리를 입력해주세요.</label><input type="password" name="pwd" id="comment_pwd" title="비밀번호 입력">
					</p>
					<div class="btnWrapper">
						<button type="button" id="okBtn"  class="btnTypeBasic colorBlueGray sizeS"><span>확인</span></button>
						<button type="button" id="canBtn" class="btnTypeBasic colorGray sizeS btnCloseLayer"><span>취소</span></button><!-- 닫기기능 .btnCloseLayer -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //레이어팝업 -->
</form>