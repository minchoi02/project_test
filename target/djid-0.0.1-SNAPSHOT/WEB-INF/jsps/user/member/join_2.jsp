<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>

function validateEmail(email) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}

// 아이디 검증
function chkId(str){
	var idReg = /^[a-z]+[a-z0-9]{5,14}$/g;       
	return idReg.test( str );
}

// 영문,숫자,특수문자 혼합하여 8자리~20자리 이내.(비밀번호 표준)
function chkPwd(str){
	var pw = str;
 	var num = pw.search(/[0-9]/g);
 	var eng = pw.search(/[a-z]/ig);
 	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 

 	if(pw.length < 8 || pw.length > 20){
  		alert("비밀번호를 8자리 ~ 20자리 이내로 입력해주세요.");
  		return false;
 	}

 	if(pw.search(/₩s/) != -1){
  		alert("비밀번호는 공백업이 입력해주세요.");
  		return false;
 	} 
 	
 	if(num < 0 || eng < 0 || spe < 0 ){
  		alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
  		return false;
 	}
 	return true;
}


$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	/*
	* 회원 등록 버튼
	*/
	$("#insertBtn").click(function() {
		
		if( !valCheck('id', '아이디를 입력해주세요.') ) return;
		if ( $("#check_yn").val() == "N" ){
			alert("아이디 중복체크를 해주세요."); return;
		}
		if( !valCheck('pwd', '비밀번호를 입력해주세요.') ) return;
		if( !valCheck('pwd2', '비밀번호 확인을 입력해주세요.') ) return;
		if( $("#pwd").val() != $("#pwd2").val() ){
			alert("비밀번호를 확인해주세요."); $("#pwd2").focus(); return;
		}
		
		// 비밀번호 검증 추가
		if ( !chkPwd($.trim($("#pwd").val())) ){
			 $('#pwd').val('');
			 $('#pwd').focus(); return false;
		}
		
		if( !valCheck('fname', '이름을 입력해주세요.') ) return;	
		//if( !valCheck('tel1', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel3', '연락처를 입력해주세요.') ) return;
		if( !valCheck('email1', '이메일을 입력해주세요.') ) return;
		
		if( $("#email_sel").val() == "" && $("#email_str").val() == "" ){
			if( !valCheck('email_str', '이메일을 입력해주세요.') ) return;
		}
		
		var email = "";
		if( $("#email_sel").val() == "" ){			
			email = $("#email1").val() + "@" + $("#email_str").val();
			if(!validateEmail(email)){
				alert("이메일 형식이 맞지 않습니다."); return;
			}
		}else{
			email = $("#email1").val() + "@" + $("#email_sel").val();
			if(!validateEmail(email)){
				alert("이메일 형식이 맞지 않습니다."); return;
			}
		}
		
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
		
		if(confirm('등록하시겠습니까?')){
			$("#email").val(email);
			$("#frm").prop("action", "/member/join_2_insert.do");
			$("#frm").submit();
		}
		
	});
	
	$("#cancelBtn").click(function() {
		$("#frm")[0].reset();
	});
	
	/*
	* 아이디 변경시 중복체크 해제
	*/	
	$("#email_sel").change(function() {
		var email2 = $(this).val();
		if(email2 == ""){
			$("#email_str").show();
		}else{
			$("#email_str").hide();
		}
	});
	
	/*
	* 아이디 변경시 중복체크 해제
	*/	
	$("#layer_id").change(function() {
		$("#check_yn").val("N");
	});
	
	$("#id").change(function() {
		$("#check_yn").val("N");
	});
	
	
	/*
	* 아이디 중복 체크
	*/
	$("#check_id").click(function() {
		
		if( !valCheck('layer_id', '아이디를 입력해주세요.') ) return;
		if(!chkId($("#layer_id").val())){
			$("#layer_id").focus();
			alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			return;
		}
		$.ajax({
		    url: "/admin/001/check_id_ajax.do?id=" + $("#layer_id").val(),
		    type : "GET",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(data){			    	
		    	if(data){
		    		//alert("사용 가능한 아이디입니다.");
		    		//$("#pwd").focus();
		    		$("#check_yn").val("Y");
		    		$("#layer_id_p").html("입력하신 아이디 : " + $("#layer_id").val());
		    		$("#layer_id_valid").html("- 사용 가능한 아이디입니다.");
		    		$("#layer_id_valid").removeClass("validationNo");
		    		$("#layer_id_valid").addClass("validationNo");
		    		$("#layer_id_p").css("display", "");
		    		$("#layer_id_valid").css("display", "");
		    	}else{
		    		$("#layer_id_p").html("입력하신 아이디 : " + $("#layer_id").val());
		    		$("#layer_id").val("");
		    		$("#layer_id").focus();
		    		$("#check_yn").val("N");		    		
		    		$("#layer_id_valid").html("- 사용이 불가능한 아이디입니다.");
		    		$("#layer_id_valid").removeClass("validationNo");
		    		$("#layer_id_valid").addClass("validationNo");
		    		$("#layer_id_p").css("display", "");
		    		$("#layer_id_valid").css("display", "");
		    	}
		    }
		});
		
		
	});
	
	$("#layer_id_ok").click(function() {
		if( $("#layer_id").val() == "" ){
			$("#layer_id").focus();
			alert("아이디를 입력해주세요.");
			return;
		}
		if(!chkId($("#layer_id").val())){
			$("#layer_id").focus();
			alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			return;
		}
		if( $("#check_yn").val() == "N" ){
			$("#layer_id").focus();
			alert("아이디 중복확인을 해주세요."); return;
		}
		$("#id").val( $("#layer_id").val() );
		$("#layer_id_cancel").click();
	});
	
	$("#layer_id_cancel").click(function() {
		
	});
	
	$("#pwd, #pwd2").keyup(function() {
		if( $("#pwd").val() != $("#pwd2").val()){
			$("#pwd_valid").removeClass("validationNo");
			$("#pwd_valid").addClass("validationNo");
			$("#pwd_valid").html("! 비밀번호가 일치 하지 않습니다");
		}else if( $("#pwd").val() == "" || $("#pwd2").val() == "" ){
			$("#pwd_valid").html("");
		}else{
			$("#pwd_valid").removeClass("validationNo");
			$("#pwd_valid").addClass("validationNo");
			$("#pwd_valid").html("비밀번호가 일치합니다.");
		}
		
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
</script>

			<form name="frm" id="frm" method="post" method="post" enctype="multipart/form-data" accept-charset="utf-8">
				
					<input type="hidden" name="email" id="email"/>
					<input type="hidden" name="check_yn" id="check_yn" value="N" />
			
					<div class="contsArea member">
						<h2><img src="/assets/user/images/member_title02.png" alt="회원가입 정보드림 홈페이지에 가입하시면 모든 서비스를 편리하게 이용하실 수 있습니다."></h2>
						<div class="innerBoxMem">
							<p class="h3tit">회원정보입력<span>(전체 필수항목)</span></p>
							<table class="memberForm">
								<caption>회원가입 입력정보이며 아이디,비밀번호,비밀번호확인,이름,회원구분,휴대폰,이메일,스팸필터링 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width:95px">
									<col style="width: *">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="id">아이디</label></th>
										<td>
											<div class="type01">
												<input type="text" id="id" name="id" onclick="layerPopUp(this,'#layerPassword');" maxlength="20" size="20" readonly="readonly">
												<p class="infoNoti">6~15자의 영문자로 시작하는 영문/숫자를 조합하여 입력</p>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="pwd">비밀번호</label></th>
										<td>
											<div class="type01">
												<input type="password" id="pwd" name="pwd" maxlength="20" size="20">
												<p class="infoNoti">8~20자의 영문/숫자/특수문자를 조합하여 입력</p>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="pwd2">비밀번호 확인</label></th>
										<td>
											<div class="type01">
												<input type="password" id="pwd2" name="pwd2" maxlength="20" size="20">
												<p id="pwd_valid" class="validationNo"></p>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="fname">이름</label></th>
										<td>
											<div class="type01">
												<input type="text" id="fname" name="name" maxlength="10" size="10">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="member">회원구분</label></th>
										<td>
											<div class="type02">
												<select name="person_gubun" id="person_gubun" title="회원 구분 선택">
													<option value="장애인본인">장애인본인</option>
													<option value="장애인가족">장애인가족</option>
													<option value="관련종사자">관련종사자</option>
													<option value="관련학과학생">관련학과학생</option>
													<option value="기타(비장애인)">기타(비장애인)</option>
												</select>
												<select name="age" id="age" title="연령대 선택">
													<option value="10대">10대</option>
													<option value="20대">20대</option>
													<option value="30대">30대</option>
													<option value="40대">40대</option>
													<option value="50대">50대</option>
													<option value="60대~">60대~</option>
												</select>
												<span class="type03">
													<em>성별</em>
													<label for="sex_1">
														<input type="radio" name="sex" id="sex_1" value="남자" checked="checked"> 남
													</label>
													<label for="sex_2">
														<input type="radio" name="sex" id="sex_2" value="여자"> 여
													</label>
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="fname">가입경로</label></th>
										<td>
											<div class="type02">
												<select name="social" id="social" title="회원 구분 선택">
													<option value="SNS">SNS</option>
													<option value="포털사이트검색">포털사이트검색</option>
													<option value="지인소개">지인소개</option>
													<option value="기타">기타</option>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="cellPhone">휴대폰</label></th>
										<td>
											<div class="typePhone">
												<select id="tel1" name="tel1" title="휴대폰 앞자리 선택">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
												</select>
												<input type="text" name="tel2" id="tel2" title="휴대폰 가운데  4자리">
												<input type="text" name="tel3" id="tel3" title="휴대폰 마지막 4자리">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="email">이메일</label></th>
										<td>
											<div class="typeEmail">
												<input type="text" id="email1" name="email1" title="이메일 아이디 입력">
												<i>@</i>
												<select title="주소 선택" id="email_sel">
													<option value="" title="직접입력">직접입력</option>
													<option value="naver.com" title="naver.com">naver.com</option>
													<option value="nate.com" title="nate.com">nate.com</option>
													<option value="gmail.com" title="gmail.com">gmail.com</option>
													<option value="hanmail.net" title="hanmail.net">hanmail.net</option>
													<option value="hotmail.com" title="hotmail.com">hotmail.com</option>
												</select>
												<input type="text" id="email_str" title="이메일 주소 직접 입력">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="captcha">자동등록방지</label></th>
										<td class="captchaArea">
											<a href="#none" onclick="playAudio();"><img src="/assets/user/images/common/audio.png" class="vm" style="width: 35px; height: 37px" alt="보안문자 음성 듣기"/>
											 <span class="captcha">											 	
											 	<img src="/captchaImage.do" id="captchaImg" class="vm" style="width: 148px; height: 36px" alt="보안문자 이미지">
											 </span>
											 <input type="text" id="captcha_input" name="captcha_input" title="보안문자 입력하기">
											 <button type="button" id="reload" onclick="javascript:reloadCaptcha();" class="btnTypeBasic colorGray"><span>새로고침</span></button>
											 <div id="audioPlayer" style="display: none;"></div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btnArea">
								<button type="button" id="insertBtn" class="btnTypeBasic sizeM"><span>가입완료</span></button>
								<button type="button" id="cancelBtn" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
							</div>
						</div>
					</div>
			</form>
					
					
					
	<!-- 레이어 팝업 -->

	<div class="layerWrapper confirmPassword" id="layerPassword">
		<div class="layerBox">
			<div class="layerHeader">
				<strong>아이디 중복확인</strong>
			</div>
			<div class="layerBody">
				<div class="innerBox">
					<p class="formbox member">
						<label for="inputPassword">사용을 원하시는 아이디를 입력해 주세요.</label>
						<input type="text" id="layer_id" name="layer_id">
						<button type="button" class="btnTypeBasic" id="check_id"><span>중복확인</span></button>
					</p>
					<div class="validationW">
						<p id="layer_id_p" style="display: none;">입력하신 아이디 : </p>
						<p id="layer_id_valid" style="display: none;" class="validationNo">- 사용할수 없는 아이디 입니다</p>
					</div>
					<div class="btnWrapper">
						<button type="button" id="layer_id_ok" class="btnTypeBasic colorBlueGray sizeS"><span>확인</span></button>
						<button type="button" id="layer_id_cancel" class="btnTypeBasic colorGray sizeS btnCloseLayer"><span>취소</span></button><!-- 닫기기능 .btnCloseLayer -->
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- //레이어팝업 -->