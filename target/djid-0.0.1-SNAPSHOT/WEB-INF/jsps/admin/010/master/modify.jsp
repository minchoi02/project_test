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
										<th>메뉴권한</th>
										<td>
											<label><input type="checkbox" id="8" class="all_menu" /> 전체</label> 
											<c:forEach var="list" items="${selType29List}" varStatus="status">
												<label for="menu_${status.count}">
													<input type="checkbox" name="menu" class="menu" id="menu_${status.count}" value="${list.SEQ}" <c:if test="${fn:contains(view.MENU, list.SEQ)}">checked="checked"</c:if> /> ${list.CODE_DESC}
												</label>
												<c:if test="${status.count == 4}"><br/></c:if>
											</c:forEach> 
										</td>
									</tr>
									<tr>
										<th>메모</th>
										<td>
											<textarea name="memo" id="memo" rows="10" cols="80" placeholder="내용을 입력해주세요.">${view.MEMO}</textarea>
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
	var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
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
			/* if ( !chkPwd($.trim($("#pwd").val())) ){
				alert('비밀번호를 확인하세요.₩n(영문,숫자를 혼합하여 6~20자 이내)');
				 $('#pwd').val('');
				 $('#pwd').focus(); return false;
			} */
		}
		
		if($("input[name=menu]:checked").length < 1){
			alert("메뉴권한은 1개 이상 선택해야합니다.");
			return;
		}
		
		if(confirm('수정하시겠습니까?')){
			$("#frm").submit();
		}
		
	});
	
	$(".all_menu").change(function() {
		$(".menu").prop("checked", $(this).prop("checked"));
	});
	

	
});	

</script>		
	