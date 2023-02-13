<<<<<<< HEAD
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
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/insert.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
							
							<input type="hidden" name="check_yn" id="check_yn" value="N" />
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
											<input type="text" name="id" id="id" value="" style="width:150px;" maxlength="15" size="15"> 
											<span class="button02" id="btnSearch" ><a href="#none" id="check_id" >중복확인</a></span>
										</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td>
											<input type="password" name="pwd" id="pwd" value="" style="width:200px;" maxlength="15" size="15"> 
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
											<input type="text" name="name" id="fname" value="" style="width:150px;" maxlength="10" size="10"> 
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td>
											<input type="text" name="tel1" id="tel1" value="" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="tel2" id="tel2" value="" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="tel3" id="tel3" value="" style="width:50px;" maxlength="6" size="6"> 
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>
											<input type="text" name="email1" id="email1" value="" style="width:150px;"> 
											@
											<input type="text" name="email2" id="email2" value="" style="width:150px;">
										</td>
									</tr>
									<tr>
										<th>구분</th>
										<td>
											<select name="person_gubun" id="person_gubun" style="width: 200px;">
												<option value="장애인본인">장애인본인</option>
												<option value="장애인가족">장애인가족</option>
												<option value="관련종사자">관련종사자</option>
												<option value="관련학과학생">관련학과학생</option>
												<option value="기타(비장애인)">기타(비장애인)</option>
											</select> 
										</td>
									</tr>
									<tr>
										<th>연령</th>
										<td>
											<select name="age" id="age" style="width: 200px;">
												<option value="10대">10대</option>
												<option value="20대">20대</option>
												<option value="30대">30대</option>
												<option value="40대">40대</option>
												<option value="50대">50대</option>
												<option value="60대~">60대~</option>
											</select>  
										</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>											
											<label for="sex_1">
												<input type="radio" name="sex" id="sex_1" value="남자" checked="checked"> 남자
											</label>
											<label for="sex_2">
												<input type="radio" name="sex" id="sex_2" value="여자"> 여자
											</label>
										</td>
									</tr>
									<tr>
										<th>회원유형</th>
										<td>
											<select name="kind" id="kind" style="width: 200px;">
												<option value="일반">일반</option>
												<option value="직원">직원</option>
											</select>   
										</td>
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="insertBtn" >등록 완료</a></span>
								<span class="button02" id="btnSearch" ><a href="list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
						
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${bean.seq }">
					<input type="hidden" id="search_name" name="search_name" value="${bean.search_name }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
				</form>
			</div>
		</div>
<script type="text/javascript">

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
		//if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		//if( !valCheck('tel3', '연락처를 입력해주세요.') ) return;
		//if( !valCheck('email1', '이메일을 입력해주세요.') ) return;
		//if( !valCheck('email2', '이메일을 입력해주세요.') ) return;
		if( $("#email1").val() != "" && $("#emai2").val() != "" ){
			var email = $("#email1").val() + "@" + $("#email2").val();
			if(!validateEmail(email)){
				alert("이메일 형식이 맞지 않습니다."); return;
			}
		}
		
		if(confirm('등록하시겠습니까?')){
			$("#email").val(email);
			$("#frm").submit();
		}
		
	});
	
	
	/*
	* 아이디 변경시 중복체크 해제
	*/	
	$("#id").change(function() {
		$("#check_yn").val("N");
	});
	
	
	/*
	* 아이디 중복 체크
	*/
	$("#check_id").click(function() {
		
		if( !valCheck('id', '아이디를 입력해주세요.') ) return;
		
		$.ajax({
		    url: "/admin/001/check_id_ajax.do?id=" + $("#id").val(),
		    type : "GET",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(data){			    	
		    	if(data){
		    		alert("사용 가능한 아이디입니다.");
		    		$("#check_yn").val("Y");
		    		$("#pwd").focus();
		    	}else{
		    		alert("이미 사용중인 아이디입니다.");
		    		$("#id").val("");
		    		$("#id").focus();
		    		$("#check_yn").val("N");
		    	}
		    }
		});
		
		
	});
	
});	

</script>		
=======
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
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/insert.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
							
							<input type="hidden" name="check_yn" id="check_yn" value="N" />
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
											<input type="text" name="id" id="id" value="" style="width:150px;" maxlength="15" size="15"> 
											<span class="button02" id="btnSearch" ><a href="#none" id="check_id" >중복확인</a></span>
										</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td>
											<input type="password" name="pwd" id="pwd" value="" style="width:200px;" maxlength="15" size="15"> 
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
											<input type="text" name="name" id="fname" value="" style="width:150px;" maxlength="10" size="10"> 
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td>
											<input type="text" name="tel1" id="tel1" value="" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="tel2" id="tel2" value="" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="tel3" id="tel3" value="" style="width:50px;" maxlength="6" size="6"> 
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>
											<input type="text" name="email1" id="email1" value="" style="width:150px;"> 
											@
											<input type="text" name="email2" id="email2" value="" style="width:150px;">
										</td>
									</tr>
									<tr>
										<th>구분</th>
										<td>
											<select name="person_gubun" id="person_gubun" style="width: 200px;">
												<option value="장애인본인">장애인본인</option>
												<option value="장애인가족">장애인가족</option>
												<option value="관련종사자">관련종사자</option>
												<option value="관련학과학생">관련학과학생</option>
												<option value="기타(비장애인)">기타(비장애인)</option>
											</select> 
										</td>
									</tr>
									<tr>
										<th>연령</th>
										<td>
											<select name="age" id="age" style="width: 200px;">
												<option value="10대">10대</option>
												<option value="20대">20대</option>
												<option value="30대">30대</option>
												<option value="40대">40대</option>
												<option value="50대">50대</option>
												<option value="60대~">60대~</option>
											</select>  
										</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>											
											<label for="sex_1">
												<input type="radio" name="sex" id="sex_1" value="남자" checked="checked"> 남자
											</label>
											<label for="sex_2">
												<input type="radio" name="sex" id="sex_2" value="여자"> 여자
											</label>
										</td>
									</tr>
									<tr>
										<th>회원유형</th>
										<td>
											<select name="kind" id="kind" style="width: 200px;">
												<option value="일반">일반</option>
												<option value="직원">직원</option>
											</select>   
										</td>
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="insertBtn" >등록 완료</a></span>
								<span class="button02" id="btnSearch" ><a href="list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
						
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${bean.seq }">
					<input type="hidden" id="search_name" name="search_name" value="${bean.search_name }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
				</form>
			</div>
		</div>
<script type="text/javascript">

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
		//if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		//if( !valCheck('tel3', '연락처를 입력해주세요.') ) return;
		//if( !valCheck('email1', '이메일을 입력해주세요.') ) return;
		//if( !valCheck('email2', '이메일을 입력해주세요.') ) return;
		if( $("#email1").val() != "" && $("#emai2").val() != "" ){
			var email = $("#email1").val() + "@" + $("#email2").val();
			if(!validateEmail(email)){
				alert("이메일 형식이 맞지 않습니다."); return;
			}
		}
		
		if(confirm('등록하시겠습니까?')){
			$("#email").val(email);
			$("#frm").submit();
		}
		
	});
	
	
	/*
	* 아이디 변경시 중복체크 해제
	*/	
	$("#id").change(function() {
		$("#check_yn").val("N");
	});
	
	
	/*
	* 아이디 중복 체크
	*/
	$("#check_id").click(function() {
		
		if( !valCheck('id', '아이디를 입력해주세요.') ) return;
		
		$.ajax({
		    url: "/admin/001/check_id_ajax.do?id=" + $("#id").val(),
		    type : "GET",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(data){			    	
		    	if(data){
		    		alert("사용 가능한 아이디입니다.");
		    		$("#check_yn").val("Y");
		    		$("#pwd").focus();
		    	}else{
		    		alert("이미 사용중인 아이디입니다.");
		    		$("#id").val("");
		    		$("#id").focus();
		    		$("#check_yn").val("N");
		    	}
		    }
		});
		
		
	});
	
});	

</script>		
>>>>>>> refs/heads/202204
	