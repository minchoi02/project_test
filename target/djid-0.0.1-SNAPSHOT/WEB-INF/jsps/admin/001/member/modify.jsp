<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!-- <script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script> -->
<!-- <script type="text/javascript" src="/assets/editor/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script type="text/javascript" src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
	
		<div class="conBox">
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/update.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
							
							<input type="hidden" name="change_pwd" id="change_pwd" value="N"/>
							<input type="hidden" name="email" id="email" value="" />
							
							<table  class="tbv" style="margin-top: 10px;"  summary="글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="15%" >
									<col width="75%" >
								</colgroup>
								<tbody>
									<tr>
										<th>아이디</th>
										<td> 
											${view.ID}
										</td>
									</tr>
									<tr>
										<th>비밀번호</th>    
										<td>    
											<input type="password" name="pwd" id="pwd" value="${view.PWD}" style="width:200px;" maxlength="15" size="15">
											8~20자의 영문/숫자/특수문자를 조합하여 입력 
										</td>
									</tr>
									<tr>
										<th>비밀번호 확인</th>
										<td>
											<input type="password" name="pwd2" id="pwd2" value="" style="width:200px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>이름</th>
										<td>
											<input type="text" name="name" id="fname" value="${view.NAME}" style="width:150px;" maxlength="10" size="10"> 
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td>
											<input type="text" name="tel1" id="tel1" value="${view.TEL1}" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="tel2" id="tel2" value="${view.TEL2}" style="width:50px; maxlength="6" size="6">
											-
											<input type="text" name="tel3" id="tel3" value="${view.TEL3}" style="width:50px;" maxlength="6" size="6"> 
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>
											<input type="text" name="email1" id="email1" value="${view.EMAIL1}" style="width:150px;"> 
											@
											<input type="text" name="email2" id="email2" value="${view.EMAIL2}" style="width:150px;">
										</td>
									</tr>
									<tr>
										<th>구분</th>
										<td>
											<select name="person_gubun" id="person_gubun" style="width: 200px;">
												<option value="장애인본인" <c:if test="${view.GUBUN eq '장애인본인'}">selected</c:if>>장애인본인</option>
												<option value="장애인가족" <c:if test="${view.GUBUN eq '장애인가족'}">selected</c:if>>장애인가족</option>
												<option value="관련종사자" <c:if test="${view.GUBUN eq '관련종사자'}">selected</c:if>>관련종사자</option>
												<option value="관련학과학생" <c:if test="${view.GUBUN eq '관련학과학생'}">selected</c:if>>관련학과학생</option>
												<option value="기타(비장애인)" <c:if test="${view.GUBUN eq '기타(비장애인)'}">selected</c:if>>기타(비장애인)</option>
											</select> 
										</td>
									</tr>
									<tr>
										<th>연령</th>
										<td>
											<select name="age" id="age" style="width: 200px;">
												<option value="10대" <c:if test="${view.AGE eq '10대'}">selected</c:if>>10대</option>
												<option value="20대" <c:if test="${view.AGE eq '20대'}">selected</c:if>>20대</option>
												<option value="30대" <c:if test="${view.AGE eq '30대'}">selected</c:if>>30대</option>
												<option value="40대" <c:if test="${view.AGE eq '40대'}">selected</c:if>>40대</option>
												<option value="50대" <c:if test="${view.AGE eq '50대'}">selected</c:if>>50대</option>
												<option value="60대~" <c:if test="${view.AGE eq '60대~'}">selected</c:if>>60대~</option>
											</select> 
										</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>											
											<label for="sex_1">
												<input type="radio" name="sex" id="sex_1" value="남자" <c:if test="${view.SEX eq '남자'}">checked="checked"</c:if>> 남자
											</label>
											<label for="sex_2">
												<input type="radio" name="sex" id="sex_2" value="여자" <c:if test="${view.SEX eq '여자'}">checked="checked"</c:if>> 여자
											</label>
										</td>
									</tr>
									<tr>
										<th>회원유형</th>
										<td>
											<select name="kind" id="kind" style="width: 200px;">
												<option value="일반" <c:if test="${view.KIND eq '일반'}">selected</c:if>>일반</option>
												<option value="직원" <c:if test="${view.KIND eq '직원'}">selected</c:if>>직원</option>
											</select>   
										</td>
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="updateBtn" >수정 완료</a></span>
								<span class="button02" id="btnSearch" ><a href="view.do?seq=${view.SEQ}&board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_title=${bean.search_title}&search_value=${bean.search_value}</c:if>">취소</a></span>
							</div>
							<!-- </p> -->
						
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${bean.seq }">
					<input type="hidden" id="search_title" name="search_title" value="${bean.search_title }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
				</form>
			</div>
		</div>
<script type="text/javascript">

function validateEmail(email) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}

function chkPwd(str){
	var reg_pwd = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	if(!reg_pwd.test(str)){
		return false;
	}
	return true;
}

$(document).ready(function() {
	
	$("#pwd").change(function() {
		$("#change_pwd").val("OK");
	});

	var board_name = "${bean.board_name}";
	
	/*
	* 회원 등록 버튼
	*/
	$("#updateBtn").click(function() {
		
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
			
		//if( !valCheck('tel1', '연락처를 입력하세요') ) return;
		//if( !valCheck('tel2', '연락처를 입력하세요') ) return;
		//if( !valCheck('tel3', '연락처를 입력하세요') ) return;
		//if( !valCheck('email1', '이메일을 입력해주세요.') ) return;
		//if( !valCheck('email2', '이메일을 입력해주세요.') ) return;		
		if( $("#email1").val() != "" && $("#emai2").val() != "" ){
			var email = $("#email1").val() + "@" + $("#email2").val();
			if(!validateEmail(email)){
				alert("이메일 형식이 맞지 않습니다."); return;
			}
		}
		
		if(confirm('수정하시겠습니까?')){
			$("#email").val(email);
			$("#frm").submit();
		}
		
	});
	

	
});	

</script>		
	