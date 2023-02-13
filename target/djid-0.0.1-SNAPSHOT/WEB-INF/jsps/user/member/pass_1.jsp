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

//영문,숫자,특수문자 혼합하여 8자리~20자리 이내.(비밀번호 표준)
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

	var board_name = "${bean.board_name}";
	
	$("#updateBtn").click(function() {
		
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
		
		var formData = $("#frm").serialize();
		
		$.ajax({
			type: "POST",
            url: '/member/findPwdUpdate.do',
            data: formData,
            success: function() {
				$("#input_num_div").hide();
				$("#ok_pass_div").show();
				$("#new_pass_div").hide();
            }
         });
		
	});
	
	/*
	* 확인 버튼
	*/
	$("#okBtn").click(function() {
		
		if( !valCheck('fname', '이름을 입력해주세요.') ) return;
		if( !valCheck('id', '아이디를 입력해주세요.') ) return;
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
		
		var rdmNum = ""+(Math.floor(Math.random() * 999999)+1);
		var rdLen = rdmNum.length;
		if(rdLen < 6){
			for(var i=rdLen; i<6; i++){
				rdmNum = "0"+rdmNum;
			}				
		}
		$("input[name=sRdm_Num]").val(rdmNum);
		
		//alert("메일이 전송 중입니다.");
		$("#okBtn").hide();
		
		$.ajax({
		    type : "GET",
            url: '/member/findPwd.do?name=' + encodeURI($('#fname').val()) + "&email=" + email + "&id=" + $("#id").val() + "&sRdm_Num="+$("input[name=sRdm_Num]").val(),
            success: function(list) {
				if(list == null || list.length < 1){
					$("#input_num_div").hide();
					$("#ok_pass_div").hide();
					$("#new_pass_div").hide();
					$("#okBtn").show();
					alert("일치하는 정보가 없습니다.");
					// $("#frm")[0].reset();					
					return;
				}else{
					$("#email_span").html(email);
					$("#input_num_div").show();
					$("#ok_pass_div").hide();
					$("#new_pass_div").hide();
					$("#email").val(email);
					$("#change_id").val($("#id").val());
				}
            }
         });
		
	});

	$("#email_sel").change(function() {
		var email2 = $(this).val();
		if(email2 == ""){
			$("#email_str").show();
		}else{
			$("#email_str").hide();
		}
	});

});	

/*
 * 인증번호 확인
 */
function rNumChechk(){
	var tempVal = $("input[name=rNum]").val();
	var val = $("input[name=sRdm_Num]").val();
	
	if(tempVal.length != 6){
		alert("정확한 인증번호 6자리를 입력해 주시기 바랍니다.");
		$("input[name=rNum]").val("");
		return;
	}
	
	if(tempVal == val){
		$("input[name=rNum]").val("");
		$("input[name=sRdm_Num]").val("");
		alert("인증이 확인되었습니다.");
		//$("#vnoform").attr("action","/member/join02_3");	
		//$("#vnoform").submit();
		$("#input_num_div").hide();		
		$("#new_pass_div").show();
		$("#ok_pass_div").hide();
	}else{
		alert("정확한 인증번호 6자리를 입력해 주시기 바랍니다.");
		return;
	}
}
</script>
		<form name="frm" id="frm" method="post" enctype="multipart/form-data" accept-charset="utf-8">
			<input type="hidden" name="email" id="email"/>
			<input type="hidden" name="change_id" id="change_id"/>
			
			<input type="hidden" name="sRdm_Num" value=""/>
					<div class="contsArea member">
						<h2><img src="/assets/user/images/member_title05.png" alt="비밀번호 찾기 회원정보를 입력해 주세요."></h2>
						<div class="innerBoxMem">
							<table class="memberForm">
								<caption>아이디 찾기이며 이름, 이메일 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width:95px">
									<col style="width:505px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="fname">이름</label></th>
										<td>
											<div>
												<input type="text" id="fname" name="name" class="wid01" placeholder="이름">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="id">아이디</label></th>
										<td>
											<div>
												<input type="text" id="id" name="id" class="wid01" placeholder="아이디">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">이메일</th>
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
								</tbody>
							</table>
							<div class="btnArea idPw">
								<button type="button" id="okBtn" class="btnTypeBasic sizeM"><span>확인</span></button>
							</div>
						</div>

						<!-- 인증번호 입력 -->
						<div class="idpwBox" id="input_num_div" style="display: none;">
 							<div>
 								<p>입력하신 <span id="email_span"></span> 메일로 인증번호가 발송되었습니다.<br>
 									인증번호를 확인 후 입력해주시기 바랍니다.</p>
 							</div>
							<div class="authArea">
								<label for="rNum">인증번호 입력</label>
								<input type="text" id="rNum" name="rNum" class="wid01" placeholder="인증번호">
								<button type="button" class="lineBtn" onclick="rNumChechk();"><span>확인</span></button>
								<!-- <p>인증메일이 도착하지 않을경우 <a href="#">여기</a>를 눌러주세요.</p> -->
							</div>
						</div>
						<!--// 인증번호 입력 -->

						<!-- 새비밀번호입력 -->
						<div class="idpwBox" id="new_pass_div"  style="display: none;">
							<p class="idpwTit">새비밀번호 입력</p>
 							<div>
 								<p>새로운 비빌번호를 입력해 주세요.</p>
 							</div>
 							<div class="pwArea">
								<span>
									<label for="pwd">비밀번호</label>
									<input type="password" id="pwd" name="pwd">
								</span>
								<p>* 영문,숫자,특수문자를 모두포함하여 8자~20자</p>
								<span>
									<label for="pwd2">비밀번호 확인</label>
									<input type="password" id="pwd2" name="pwd2">
								</span>
								<p id="pwd_valid"></p>
							</div>
							<div class="btnArea">
								<button type="button" class="btnTypeBasic sizeM" id="updateBtn"><span>변경완료</span></button>
							</div>
						</div>
						<!--// 새비밀번호입력 -->

						<!-- 비밀번호변경완료 -->
						<div class="idpwBox" id="ok_pass_div" style="display: none;">
							<p class="idpwTit">비밀번호 변경완료</p>
 							<div>
 								<p>비밀번호 변경이 완료되었습니다.<br>
 								새로운 비밀번호로 로그인 후 사용해주시기 바랍니다.</p>
 							</div>
							<div class="btnArea">
								<a href="/member/login.do" class="btnTypeBasic sizeM"><span>로그인</span></a>
								<a href="/main.do" class="btnTypeBasic sizeM colorGray"><span>홈으로 이동</span></a>
							</div>
						</div>
						<!--// 비밀번호변경완료 -->
					</div>
			</form>