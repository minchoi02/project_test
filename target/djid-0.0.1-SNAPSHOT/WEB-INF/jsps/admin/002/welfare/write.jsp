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
							<table  class="tbv"  summary="공지사항 글입력하기" style="width: 960px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="20%" >
									<col width="10%" >
									<col width="20%" >
								</colgroup>
								<tbody>
									<tr>
										<th>분류</th>
										<td colspan="3">
											<input type="checkbox" id="1" class="all_type" /> 전체 
											<c:forEach var="list" items="${selType1List}" varStatus="status">
												<label for="type1_${status.count}">
													<input type="checkbox" name="type_code" class="type1" id="type1_${status.count}" value="${list.SEQ}"/> ${list.CODE_DESC}
												</label>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th>성별</th>
										<td colspan="3">
											<input type="checkbox" id="3" class="all_type" /> 전체 
											<c:forEach var="list" items="${selType3List}" varStatus="status">
												<label for="type3_${status.count}">
													<input type="checkbox" name="type_code" class="type3" id="type3_${status.count}" value="${list.SEQ}"/> ${list.CODE_DESC}
												</label>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th>장애유형</th>
										<td colspan="3">
											<input type="checkbox" id="4" class="all_type" /> 전체 
											<c:forEach var="list" items="${selType4List}" varStatus="status">
												<label for="type4_${status.count}">
													<input type="checkbox" name="type_code" class="type4" id="type4_${status.count}" value="${list.SEQ}"/> ${list.CODE_DESC}
												</label>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th>장애등급</th>
										<td colspan="3">
											<input type="checkbox" id="5" class="all_type" /> 전체 
											<c:forEach var="list" items="${selType5List}" varStatus="status">
												<label for="type5_${status.count}">
													<input type="checkbox" name="type_code" class="type5" id="type5_${status.count}" value="${list.SEQ}"/> ${list.CODE_DESC}
												</label>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th>지역</th>
										<td colspan="3">
											<input type="checkbox" id="6" class="all_type" /> 전체 
											<c:forEach var="list" items="${selType6List}" varStatus="status">
												<label for="type6_${status.count}">
													<input type="checkbox" name="type_code" class="type6" id="type6_${status.count}" value="${list.SEQ}"/> ${list.CODE_DESC}
												</label>
											</c:forEach>
										</td>
									</tr>
								</tbody>
							</table>
							
							<table  class="tbv" style="margin-top: 10px; width: 960px;"  summary="글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="20%" >
									<col width="10%" >
									<col width="20%" >
								</colgroup>
								<tbody>
									<tr>
										<th><label for="SUBJECT">제목</label></th>
										<td colspan="3">
											<input type="text" name="title" id="title" value="" style="width:100%;"> 
										</td>
									</tr>									
									<tr>
										<td colspan="4">
											<input type="hidden" name="type" id="type" value="${bean.board_name}">
											<textarea name="content" id="content" rows="10" cols="100" style="width:100%; height:600px; display:none;"></textarea>
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
								<span class="button02" id="btnSearch" ><a href="#" id="insertBtn" >확인</a></span>
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



$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	$("#insertBtn").click(function() {
		
		if( $("input:checkbox[class=type1]:checked").length < 1 ){ alert("분류를 선택해주세요."); return; }
		if( $("input:checkbox[class=type3]:checked").length < 1 ){ alert("성별을 선택해주세요."); return; }
		if( $("input:checkbox[class=type4]:checked").length < 1 ){ alert("장애유형을 선택해주세요."); return; }
		if( $("input:checkbox[class=type5]:checked").length < 1 ){ alert("장애등급을 선택해주세요."); return; }
		if( $("input:checkbox[class=type6]:checked").length < 1 ){ alert("지역을 선택해주세요."); return; }
		
		if( !valCheck('title', '제목을입력하세요') ) return;
		
		if(confirm('등록하시겠습니까?')){			
			$("#frm").submit();	
		}
		
	});
	
	$(".all_type").change(function() {
		$(".type"+$(this).prop("id")).prop("checked", $(this).prop("checked"));
	});
	
	$("input[name=type_code]").change(function() {
		if( $(this).prop("checked") == false ){
			$("#" + $(this).prop("class").replace("type", "")).prop("checked", false);
		}		
	});

});	

</script>		
	