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

// 영문,숫자,특수문자 혼합하여 8자리~20자리 이내.(비밀번호 표준)
function chkPwd(str){
	var pw = str;
 	var num = pw.search(/[0-9]/g);
 	var eng = pw.search(/[a-z]/ig);
 	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 

 	if(pw.length < 8 || pw.length > 20){
  		alert("8자리 ~ 20자리 이내로 입력해주세요.");
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
	
	$("#pwd").change(function() {
		$("#change_pwd").val("OK");
	});
	
	$("#pwd2").change(function() {
		$("#change_pwd").val("OK");
	});
	
	/*
	* 회원 수정 버튼
	*/
	$("#updateBtn").click(function() {
		
		if( !valCheck('now_pwd', '현재 비밀번호를 입력해주세요.') ) return;
		
		if( $("#change_pwd").val() == "OK" ){
			if( !valCheck('pwd', '비밀번호를 입력하세요') ) return;
			if( !valCheck('pwd2', '비밀번호 확인을 입력하세요') ) return;
			
			if( $("#pwd").val() != $("#pwd2").val() ){
				alert("비밀번호를 확인해주세요."); $("#pwd2").focus(); return;
			}
			
			// 비밀번호 검증 추가
			if ( !chkPwd($.trim($("#pwd").val())) ){
				alert('비밀번호를 확인하세요.₩n(영문,숫자를 혼합하여 8~20자 이내)');
				 $('#pwd').val('');
				 $('#pwd').focus(); return false;
			}
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
		
		if($("#pwd").val() == "" && $("#pwd2").val() == ""){
			$("#change_pwd").val("N");
		}
		
		
		if(confirm('수정하시겠습니까?')){
			$("#email").val(email);
			$("#frm").prop("action", "/member/update.do");
			$("#frm").submit();
		}
		
	});
	
	$("#cancelBtn").click(function() {
		location.href="/main.do";
	});
	
	$("#email_sel").change(function() {
		var email2 = $(this).val();
		if(email2 == ""){
			$("#email_str").show();
		}else{
			$("#email_str").hide();
		}
	});

	$("#pwd, #pwd2").keyup(function() {
		if( $("#pwd").val() != $("#pwd2").val()){
			$("#pwd_valid").removeClass("validationOk");
			$("#pwd_valid").addClass("validationNo");
			$("#pwd_valid").html("! 비밀번호가 일치 하지 않습니다");
		}else if( $("#pwd").val() == "" || $("#pwd2").val() == "" ){
			$("#pwd_valid").html("");
		}else{
			$("#pwd_valid").removeClass("validationNo");
			$("#pwd_valid").addClass("validationOk");
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
		<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/update.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
							
					<input type="hidden" name="change_pwd" id="change_pwd" value="N"/>
					<input type="hidden" name="email" id="email" value="" />
					
					<div class="contsArea member">
						<div class="innerBoxMem modify">
							<p class="h3tit">회원정보 수정</p>
							<table class="memberForm">
								<caption>회원가입 수정 정보이며 현재 비밀번호, 새비밀번호,비밀번호확인,이름,회원구분,휴대폰,이메일,스팸필터링 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width:95px">
									<col style="width: *">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="us_id">아이디</label></th>
										<td>
											<div class="type01">
												${view.ID}							
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="now_pwd">현재 비밀번호</label></th>
										<td>
											<div class="type01">
												<input type="password" name="now_pwd" id="now_pwd" value="" maxlength="20" size="20">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="pwd">새비밀번호</label></th>
										<td>
											<div class="type01">
												<input type="password" name="pwd" id="pwd" value="" maxlength="20" size="20" placeholder="비밀번호를 변경하시려면 입력해주세요.">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="pwd2">비밀번호 확인</label></th>
										<td>
											<div class="type01">
												<input type="password" name="pwd2" id="pwd2" maxlength="20" size="20" placeholder="비밀번호를 변경하시려면 입력해주세요.">
												<p id="pwd_valid" class="validationNo"></p>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="fname">이름</label></th>
										<td>
											<div class="type01">
												<input type="text" name="name" id="fname" value="${view.NAME}" maxlength="10" size="10">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="person_gubun">회원구분</label></th>
										<td>
											<div class="type02">
												<select name="person_gubun" id="person_gubun">
													<option value="장애인본인" <c:if test="${view.GUBUN eq '장애인본인'}">selected</c:if>>장애인본인</option>
													<option value="장애인가족" <c:if test="${view.GUBUN eq '장애인가족'}">selected</c:if>>장애인가족</option>
													<option value="관련종사자" <c:if test="${view.GUBUN eq '관련종사자'}">selected</c:if>>관련종사자</option>
													<option value="관련학과학생" <c:if test="${view.GUBUN eq '관련학과학생'}">selected</c:if>>관련학과학생</option>
													<option value="기타(비장애인)" <c:if test="${view.GUBUN eq '기타(비장애인)'}">selected</c:if>>기타(비장애인)</option>
												</select>
												<select name="age" id="age" title="연령 선택">
													<option value="10대" <c:if test="${view.AGE eq '10대'}">selected</c:if>>10대</option>
													<option value="20대" <c:if test="${view.AGE eq '20대'}">selected</c:if>>20대</option>
													<option value="30대" <c:if test="${view.AGE eq '30대'}">selected</c:if>>30대</option>
													<option value="40대" <c:if test="${view.AGE eq '40대'}">selected</c:if>>40대</option>
													<option value="50대" <c:if test="${view.AGE eq '50대'}">selected</c:if>>50대</option>
													<option value="60대~" <c:if test="${view.AGE eq '60대~'}">selected</c:if>>60대~</option>
												</select>
												<span class="type03">
													<em>성별</em>
													<label for="sex_1">
														<input type="radio" name="sex" id="sex_1" value="남자" <c:if test="${view.SEX eq '남자'}">checked="checked"</c:if>> 남
													</label>
													<label for="sex_2">
														<input type="radio" name="sex" id="sex_2" value="여자" <c:if test="${view.SEX eq '여자'}">checked="checked"</c:if>> 여
													</label>
												</span>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="tel1">휴대폰</label></th>
										<td>
											<div class="typePhone">
												<select id="tel1" name="tel1" title="휴대폰 앞자리 선택">
													<option value="010" <c:if test="${view.TEL1 eq '010'}">selected</c:if>>010</option>
													<option value="011" <c:if test="${view.TEL1 eq '011'}">selected</c:if>>011</option>
													<option value="016" <c:if test="${view.TEL1 eq '016'}">selected</c:if>>016</option>
													<option value="017" <c:if test="${view.TEL1 eq '017'}">selected</c:if>>017</option>
													<option value="018" <c:if test="${view.TEL1 eq '018'}">selected</c:if>>018</option>
												</select>
												<input type="text" name="tel2" id="tel2" title="휴대폰 가운데  4자리" value="${view.TEL2}" maxlength="6" size="6">
												<input type="text" name="tel3" id="tel3" title="휴대폰 마지막 4자리" value="${view.TEL3}" maxlength="6" size="6">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="email">이메일</label></th>
										<td>
											<div class="typeEmail">
												<input type="text" id="email1" name="email1" value="${view.EMAIL1}">
												<i>@</i>
												<select title="주소 선택" id="email_sel">
													<option value="" title="직접입력">직접입력</option>
													<option value="naver.com" title="naver.com">naver.com</option>
													<option value="nate.com" title="nate.com">nate.com</option>
													<option value="gmail.com" title="gmail.com">gmail.com</option>
													<option value="hanmail.net" title="hanmail.net">hanmail.net</option>
													<option value="hotmail.com" title="hotmail.com">hotmail.com</option>
												</select>
												<input type="text" id="email_str" title="이메일 주소 직접 입력" value="${view.EMAIL2}">
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
								<button type="button" id="updateBtn" class="btnTypeBasic sizeM"><span>수정</span></button>
								<button type="button" id="cancelBtn" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
							</div>
						</div>
					</div>
			</form>