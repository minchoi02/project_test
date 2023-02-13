<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.sdate').datepicker({
		'dateFormat':'yy-mm-dd',
		'monthNames':['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	});
	
	$('.edate').datepicker({
		'dateFormat':'yy-mm-dd',
		'monthNames':['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	});
});
</script>
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
	
		<div class="conBox">
				<form name="frm" id="frm" method="post" action="board_update.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
					<input type="hidden" name="id" id="id" value="${adminInfo.ID}" >
					<input type="hidden" name="member_seq" id="member_seq" value="${adminInfo.SEQ}" >
					<input type="hidden" name="name" id="name" value="${adminInfo.NAME}">
					<input type="hidden" name="visible" id="visible" value="99">
							<table  class="tbv"  summary="공지사항 글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="20%" >
									<col width="*" >
								</colgroup>
								<tbody>
									<tr>
										<th><label for="SUBJECT">제목</label></th>
										<td colspan="2">
											<input type="text" name="title" id="title" value="${view.TITLE }" style="width:100%;"> 
										</td>
									</tr>
									<tr>
										<th><label for="SCHEDULES">일정</label></th>
										<td colspan="2" style="text-align:left;">
											<input type="text" id="sdate" class="sdate" name="sdate" value="<fmt:formatDate value="${view.SDATE}" pattern="yyyy-MM-dd" />" size="20" width="20" >
												~
											<input type="text" id="edate" class="edate" name="edate" value="<fmt:formatDate value="${view.EDATE}" pattern="yyyy-MM-dd" />" size="20" width="20"> 
										</td>
									</tr>
									<tr >
										<th><label for="contents">내용</label></th>
										<td colspan="2">
											<input type="hidden" name="fileYn" id="fileYn" value="N">
											<input type="hidden" name="thumYn" id="thumYn" value="N">
											<input type="hidden" name="movieYn" id="movieYn" value="N">
											<input type="hidden" name="type" id="type" value="${bean.board_name}">
											<input type="hidden" name="board_name" id="board_name" value="${bean.gubun}"><!-- 게시판 아이디 -->
											
											<textarea name="content" id="content" rows="10" cols="100" style="width:100%; height:400px; display:none;">${view.CONTENT}</textarea>
											<script type="text/javascript">
												CKEDITOR.replace( 'content', {
													width: "100%",
													height: "400px",
													filebrowserUploadUrl: '/file/ckeditorImageUpload.do'
												});
											</script>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="modifyBtn" >수정</a></span>
								<span class="button02" id="btnSearch" ><a href="board_list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
					<input type="hidden" id="seq" name="seq" value="${view.SEQ}">
				</form>
			</div>
		</div>
<script type="text/javascript">

$(document).ready(function() {
	
	$("#edate").change(function() {
		var sdate_arr = $("#sdate").val().split("-");
		var edate_arr = $("#edate").val().split("-");		
		var sdate = new Date(sdate_arr[0], sdate_arr[1], sdate_arr[2]);
		var edate = new Date(edate_arr[0], edate_arr[1], edate_arr[2]);
		
		if(edate < sdate){
			alert("시작일이 종료일보다 늦을 수 없습니다.");
			$("#edate").val("");
			$("#edate").focus();
			return;
		}
	});
	
	$("#sdate").change(function() {
		var sdate_arr = $("#sdate").val().split("-");
		var edate_arr = $("#edate").val().split("-");		
		var sdate = new Date(sdate_arr[0], sdate_arr[1], sdate_arr[2]);
		var edate = new Date(edate_arr[0], edate_arr[1], edate_arr[2]);
		
		if(edate < sdate){
			alert("시작일이 종료일보다 늦을 수 없습니다.");
			$("#sdate").val("");
			$("#sdate").focus();
			return;
		}
	});
	
	$("#modifyBtn").click(function() {
		
		if( !valCheck('title', '제목을입력하세요') ) return;
		if( !valCheck('sdate', '일정을 입력해주세요.') ) return;
		if( !valCheck('edate', '일정을 입력해주세요.') ) return;
		
		var sdate_arr = $("#sdate").val().split("-");
		var edate_arr = $("#edate").val().split("-");		
		var sdate = new Date(sdate_arr[0], sdate_arr[1], sdate_arr[2]);
		var edate = new Date(edate_arr[0], edate_arr[1], edate_arr[2]);
		
		if(edate < sdate){
			alert("시작일이 종료일보다 늦을 수 없습니다.");
			$("#edate").focus();
			return;
		}
		
		if(confirm('수정하시겠습니까?')){
			$("#frm").submit();	
		}
	});
});	
</script>