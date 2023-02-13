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


$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	$('#motive8').click(function () {
		var flag = $(this).is(":checked");
		if(flag){
			$("#etc").css("display", "");
		}else{
			$("#etc").css("display", "none");
		}
	});

	$("#insertBtn").click(function() {
		
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
		
		if( !valCheck('wanted_kind', '희망분야를 입력해주세요.') ) return;
		if( !valCheck('wanted_time', '희망활동시간을 입력해주세요.') ) return;
		
		console.log( $("input[name=motive_seq]:checked").length );
		
		if( $("input[name=motive_seq]:checked").length < 1){
			alert("참여동기를 하나 이상 선택해주세요.");
			return;
		}
		
		var check1 = $("#check1").is(":checked");
		if(!check1){
			alert("개인정보수집이용동의 후 신청 가능합니다."); return;	
		}
		
		if(confirm('자원봉사를 신청하시겠습니까?')){
			$("#email").val(email);
			$("#frm").prop("action", "/federation/g_4_f_1/insert.do");
			$("#frm").submit();
		}
		
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

</script>
			<form name="frm" id="frm" method="post" enctype="multipart/form-data" accept-charset="utf-8">
					<input type="hidden" name="email" id="email" value="" />
					<div class="contsArea communicationNotice">
						<p class="contsSubTit tyBullet">정보입력 <font class="fco01">(* 필수입력 항목)</font></p>
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>자원봉사 신청 화면이며 이름, 연락처, 이메일, 희망분야, 희망활동시간, 하고싶은말, 참여동기 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width: 170px">
									<col style="width: 759px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="fname">이름</label></th>
										<td><input type="text" name="name" id="fname" class="wid40" maxlength="15" size="15"></td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="tel1">연락처</label></th>
										<td>
											<div class="typePhone">
												<select id="tel1" name="tel1" title="휴대폰 앞자리 선택">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
												</select>
												<input type="text" class="phone" name="tel2" id="tel2" title="휴대폰 가운데  4자리">
												<input type="text" class="phone" name="tel3" id="tel3" title="휴대폰 마지막 4자리">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="email1">이메일</label></th>
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
										<th scope="row"><font class="fco01">* </font><label for="wanted_kind">희망분야</label></th>
										<td><input type="text" name="wanted_kind" id="wanted_kind" class="wid40" maxlength="30" size="30"></td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="wanted_time">희망활동시간</label></th>
										<td><input type="text" name="wanted_time" id="wanted_time" class="wid40" maxlength="30" size="30"></td>
									</tr>
									<tr>
										<th scope="row"><label for="content">하고싶은말</label></th>
										<td><textarea placeholder="내용을 입력해주세요" name="content" id="content"></textarea></td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>참여동기</th>
										<td class="checkArea">
											<div>
												 <c:forEach var="list" items="${selType27List}" varStatus="status">
													<label for="motive${status.count}"><input type="checkbox" class="motive" name="motive_seq" id="motive${status.count}" value="${list.SEQ}"/> ${list.CODE_DESC}</label>
												</c:forEach>
												<input type="text" name="etc" id="etc" value="" style="width:150px; display:none;" maxlength="30" size="30" title="참여동기 기타 입력">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<p class="contsSubTit tyBullet mbt20">개인정보수집이용동의</p>
						<div class="termsScroll">
							1. 수집하는 개인정보의 항목 및 수집방법<br><br>

							(사)대전장애인단체총연합회는 회원서비스를 위하여 이용자들에게 맞춤식 서비스를 비롯한 보다
							 더 향상된 양질의 서비스를 제공하기 위하여 이용자 개인의 정보를 수집하고 있습니다.<br><br>

							&lt;필수항목&gt;<br>
							- 아이디, 비밀번호, 생년월일, 이름, 연락처,  이메일, 닉네임 : 회원제 서비스 이용에 따른 본인 확인 절차에 이용
						</div>
						<input type="checkbox" id="check1"> <label for="check1">예,동의합니다. </label>
						<div class="btnArea center">
							<button type="button" class="btnTypeBasic sizeM" id="insertBtn"><span>신청완료</span></button>
							<button type="button" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
						</div>
					</div>
			</form>