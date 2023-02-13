<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>
$(document).ready(function() {
	
	$("#pwd").focus();
	
	$("#okBtn").click(function() {
		if( !valCheck('pwd', '비밀번호를 입력해주세요.') ) return;
		$("#frm").prop("action", "/member/out_2.do");
		$("#frm").submit();
	});
	
	$("#pwd").keypress(function(e){
		if(e.keyCode == 13) {
			$('#okBtn').click(); 
		}
	});
});	
</script>
	<form name="frm" id="frm" method="post">
					<div class="contsArea member">
						<div class="innerBoxMem modify">
							<p class="h3tit mbt50">회원탈퇴를 위하여 비밀번호를 다시한번 입력해주시기 바랍니다.</span></p>
							<table class="memberForm">
								<caption>비밀번호 변경</caption>
								<colgroup>
									<col style="width:95px">
									<col style="width: *">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="us_pw">비밀번호</label></th>
										<td>
											<div class="type01">
												<input type="password" name="pwd" id="pwd" maxlength="20" size="20">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btnArea">
								<button type="button" id="okBtn" class="btnTypeBasic sizeM"><span>확인</span></button>
								<button type="button" id="cancelBtn" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
							</div>
						</div>
					</div>
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>
$(document).ready(function() {
	
	$("#pwd").focus();
	
	$("#okBtn").click(function() {
		if( !valCheck('pwd', '비밀번호를 입력해주세요.') ) return;
		$("#frm").prop("action", "/member/out_2.do");
		$("#frm").submit();
	});
	
	$("#pwd").keypress(function(e){
		if(e.keyCode == 13) {
			$('#okBtn').click(); 
		}
	});
});	
</script>
	<form name="frm" id="frm" method="post">
					<div class="contsArea member">
						<div class="innerBoxMem modify">
							<p class="h3tit mbt50">회원탈퇴를 위하여 비밀번호를 다시한번 입력해주시기 바랍니다.</span></p>
							<table class="memberForm">
								<caption>비밀번호 변경</caption>
								<colgroup>
									<col style="width:95px">
									<col style="width: *">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="us_pw">비밀번호</label></th>
										<td>
											<div class="type01">
												<input type="password" name="pwd" id="pwd" maxlength="20" size="20">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btnArea">
								<button type="button" id="okBtn" class="btnTypeBasic sizeM"><span>확인</span></button>
								<button type="button" id="cancelBtn" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
							</div>
						</div>
					</div>
>>>>>>> refs/heads/202204
	</form>