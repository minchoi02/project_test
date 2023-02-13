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
							
							<table  class="tbv" style="margin-top: 10px;"  summary="글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="15%" >
									<col width="75%" >
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											<input type="text" name="name" id="fname" value="${view.NAME}" style="width:150px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td>
											<input type="text" name="tel1" id="tel1" value="${view.TEL1}" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="tel2" id="tel2" value="${view.TEL2}" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="tel3" id="tel3" value="${view.TEL3}" style="width:50px;" maxlength="6" size="6"> 
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>
											 <input type="text" name="email1" id="email1" value="${view.EMAIL1}" style="width:90px;" maxlength="15" size="15">
											 @
											 <input type="text" name="email2" id="email2" value="${view.EMAIL2}" style="width:90px;" maxlength="15" size="15">
										</td>
									</tr>
									<tr>
										<th>희망분야</th>
										<td>
											<input type="text" name="wanted_kind" id="wanted_kind" value="${view.WANTED_KIND}" style="width:200px;" maxlength="30" size="30"> 
										</td>
									</tr>
									<tr>
										<th>희망활동시간</th>
										<td>
											<input type="text" name="wanted_time" id="wanted_time" value="${view.WANTED_TIME}" style="width:200px;" maxlength="30" size="30"> 
										</td>
									</tr>
									<tr>
										<th>하고싶은말</th>
										<td>
											<textarea name="content" id="content" rows="10" cols="80" placeholder="내용을 입력해주세요.">${view.CONTENT}</textarea>
										</td>
									</tr>
									<tr>
										<th>참여동기</th>
										<td>
											 <c:forEach var="list" items="${selType27List}" varStatus="status">
												<label for="motive${status.count}"><input type="checkbox" class="motive" name="motive_seq" id="motive${status.count}" value="${list.SEQ}" <c:if test="${fn:contains(MOTIVE_LIST, list.CODE_DESC)}">checked</c:if>/>${list.CODE_DESC}</label>
											</c:forEach>
											<input type="text" name="etc" id="etc" value="${view.ETC}" style="width:150px; display:none;" maxlength="30" size="30">
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
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
				</form>
			</div>
		</div>
<script type="text/javascript">
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

	$("#updateBtn").click(function() {
		
		if( !valCheck('fname', '이름을 입력해주세요.') ) return;
		if( !valCheck('tel1', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel3', '연락처를 입력해주세요.') ) return;		
		if( !valCheck('email1', '이메일을 입력해주세요.') ) return;
		if( !valCheck('email2', '이메일을 입력해주세요.') ) return;
		if( $("#email1").val() != "" && $("#emai2").val() != "" ){
			var email = $("#email1").val() + "@" + $("#email2").val();
			if(!validateEmail(email)){
				alert("이메일 형식이 맞지 않습니다."); return;
				$("#email2").focus();
			}
		}
		if( !valCheck('wanted_kind', '희망분야를 입력해주세요.') ) return;
		if( !valCheck('wanted_time', '희망활동시간을 입력해주세요.') ) return;
		
		if(confirm('등록하시겠습니까?')){
			$("#frm").submit();
		}
		
	});
	
	var flag = $("#motive8").is(":checked");
	if(flag){
		$("#etc").css("display", "");
	}else{
		$("#etc").css("display", "none");
	}
	
	
});	

</script>		
	