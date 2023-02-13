<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

$(document).ready(function(){


	$('#btnSearch').click(function () {
	//	if(! valCheck('search_value','검색어를 입력하세요')) return;
	//	if(! lenCheck('search_value',2, '검색어는 2글자 이상 입력하세요')) return;
		$('#page').val(1);
		$('#pagelistno').val(1);
		$('#searchForm').submit();
	});
	
	$('#check_drop').click(function () {
		if ( $("input[name=check_seq]:checked").length < 1){
			alert("1개 이상 선택해주세요.");
			return;
		}
		
		if(confirm("선택한 댓글을 모두 삭제하시겠습니까?")){
			$("#frm_search_title").val($("#search_title").val());
			$("#frm_search_value").val($("#search_value").val());
			
			$("#seq").val(seq);
			$("#frm").attr("action", "/admin/003/comment/delete.do");
			$("#frm").submit();
		}
	});
	
	// 체크 박스 모두 체크
	$("#checkAll").click(function() {
		if($("#checkAll").is(":checked")){
			$("input[name=check_seq]:checkbox").each(function() {
				$(this).prop("checked", true);
			});
		}else{
			$("input[name=check_seq]:checkbox").each(function() {
				$(this).prop("checked", false);
			});
		}		
	});
	
});

function goView(seq){
	
	$("#frm_search_kind_seq").val($("#search_kind_seq").val());
	$("#frm_search_area_seq").val($("#search_area_seq").val());
	$("#frm_search_content").val($("#search_content").val());
	
	$("#seq").val(seq);
	$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/view.do");
	$("#frm").submit();
}

</script>
<div id="contents_bg">
	
		<div class="con_tit">
			${menu.menuname}
		</div>
 
		<div class="conBox">
		
				<div class="T_basic">
						<div style="width:800px;margin:0 auto;">
						<form name="searchForm" id="searchForm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/list.do">
							<input type="hidden" name="page" id="page" value="${bean.page}"/>
							<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}"/>
							<table class="tbl" style="width:800px;border:0">
								<colgroup>
									<col width="20%" />
									<col width="30%" />
									<col width="20%" />
									<col width="30%" />
								</colgroup>
								<tbody>									
									<tr>
										<th><b>구분</b></th>
										<td>
										<select name="search_gubun" id="search_gubun" style="width:100%;min-width:100%;">
											<option value="">전체</option>
											<option value="facility" <c:if test="${bean.search_gubun eq 'facility'}">selected</c:if>>복지시설</option>
											<option value="convenience" <c:if test="${bean.search_gubun eq 'convenience'}">selected</c:if>>편의시설</option>
										</select>
										</td>
										<th><b>검색어</b></th>
										<td>
										<input type="text" name="search_content" id="search_content" value="${bean.search_content}" style="width:100%:min-width:100%" />
										</td>										
									</tr>
									<tr style="border:0;">
										<td colspan="4" style="text-align: center;border:0;height:40px;" onmouseover="this.style.backgroundColor='white';"><span class="button01" id="btnSearch" ><a href="#none" >검색</a></span></td>
									</tr>
								</tbody>
							</table>
						</form>
						</div>
					</div>
				
			
					<table border="0" style="width:100%;margin-top:10px;">
						<tr valign="top">
							<td align="center" id="list_area_td">
								<div id="list_area_div">
									<table style="width: 95%;">
										<colgroup>
											<col width="100%" />
										</colgroup>
										<tr>
											<td align="left">총 :  ${totalCount} 개</td>
										</tr>
									</table>
									<form action="/admin/${bean.menuno}/${bean.board_name}/insert.do" name="frm" id="frm" method="post">
									<input type="hidden" name="page" id="page" value="${bean.page}" />
									<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
									
									<input type="hidden" name="seq" id="seq" value="" />
									
									<input type="hidden" name="search_kind_seq" id="frm_search_kind_seq" value="${bean.search_kind_seq}" />
									<input type="hidden" name="search_area_seq" id="frm_search_area_seq" value="${bean.search_area_seq}" />
									<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
									
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="5%" />
											<col width="10%" />
											<col width="17%" />
											<col width="10%" />
											<col width="*" />
											<col width="17%" />
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkbox" name="checkAll" id="checkAll"></th>
												<th>구분</th>
												<th>시설명</th>
												<th>작성자</th>
												<th>내 용</th>
												<th>등록일시</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${empty list}">
												<tr>
													<td colspan="6" style="text-align:center;">등록된 댓글이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}">
													<tr>
            											<td><input type="checkbox" name="check_seq" id="check_seq${list.SEQ}" value="${list.SEQ}"></td>
														<td style="text-align: center;">
															<c:choose>
																<c:when test="${list.GUBUN eq 'facility'}">
																	복지시설
																</c:when>
																<c:otherwise>
																	편의시설
																</c:otherwise>
															</c:choose>
														</td>
														<td style="text-align: center;">${list.FACILITY_NAME}</td>
														<td style="text-align: center;">${list.NAME}</td>
														<td style="text-align: left;">${list.CONTENT}</td>
														<td style="text-align: center;"><fmt:formatDate value="${list.REG_DATE}" pattern="yyyy-MM-dd HH:mm" /></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
									
									<table style="width: 95%;">
										<colgroup>
											<col width="100%" />
										</colgroup>
										<tr>
											<td align="right" style="padding-top:5px;">
												<span class="button01"><a href="#none" id="check_drop">선택삭제</a></span>
											</td>
										</tr>
									</table>
									</form>
									<!--  pageNate  -->
									${navi }
									<!--//pageNate  -->

								</div>
							</td>
						</tr>
					</table>
			</div> 
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

$(document).ready(function(){


	$('#btnSearch').click(function () {
	//	if(! valCheck('search_value','검색어를 입력하세요')) return;
	//	if(! lenCheck('search_value',2, '검색어는 2글자 이상 입력하세요')) return;
		$('#page').val(1);
		$('#pagelistno').val(1);
		$('#searchForm').submit();
	});
	
	$('#check_drop').click(function () {
		if ( $("input[name=check_seq]:checked").length < 1){
			alert("1개 이상 선택해주세요.");
			return;
		}
		
		if(confirm("선택한 댓글을 모두 삭제하시겠습니까?")){
			$("#frm_search_title").val($("#search_title").val());
			$("#frm_search_value").val($("#search_value").val());
			
			$("#seq").val(seq);
			$("#frm").attr("action", "/admin/003/comment/delete.do");
			$("#frm").submit();
		}
	});
	
	// 체크 박스 모두 체크
	$("#checkAll").click(function() {
		if($("#checkAll").is(":checked")){
			$("input[name=check_seq]:checkbox").each(function() {
				$(this).prop("checked", true);
			});
		}else{
			$("input[name=check_seq]:checkbox").each(function() {
				$(this).prop("checked", false);
			});
		}		
	});
	
});

function goView(seq){
	
	$("#frm_search_kind_seq").val($("#search_kind_seq").val());
	$("#frm_search_area_seq").val($("#search_area_seq").val());
	$("#frm_search_content").val($("#search_content").val());
	
	$("#seq").val(seq);
	$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/view.do");
	$("#frm").submit();
}

</script>
<div id="contents_bg">
	
		<div class="con_tit">
			${menu.menuname}
		</div>
 
		<div class="conBox">
		
				<div class="T_basic">
						<div style="width:800px;margin:0 auto;">
						<form name="searchForm" id="searchForm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/list.do">
							<input type="hidden" name="page" id="page" value="${bean.page}"/>
							<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}"/>
							<table class="tbl" style="width:800px;border:0">
								<colgroup>
									<col width="20%" />
									<col width="30%" />
									<col width="20%" />
									<col width="30%" />
								</colgroup>
								<tbody>									
									<tr>
										<th><b>구분</b></th>
										<td>
										<select name="search_gubun" id="search_gubun" style="width:100%;min-width:100%;">
											<option value="">전체</option>
											<option value="facility" <c:if test="${bean.search_gubun eq 'facility'}">selected</c:if>>복지시설</option>
											<option value="convenience" <c:if test="${bean.search_gubun eq 'convenience'}">selected</c:if>>편의시설</option>
										</select>
										</td>
										<th><b>검색어</b></th>
										<td>
										<input type="text" name="search_content" id="search_content" value="${bean.search_content}" style="width:100%:min-width:100%" />
										</td>										
									</tr>
									<tr style="border:0;">
										<td colspan="4" style="text-align: center;border:0;height:40px;" onmouseover="this.style.backgroundColor='white';"><span class="button01" id="btnSearch" ><a href="#none" >검색</a></span></td>
									</tr>
								</tbody>
							</table>
						</form>
						</div>
					</div>
				
			
					<table border="0" style="width:100%;margin-top:10px;">
						<tr valign="top">
							<td align="center" id="list_area_td">
								<div id="list_area_div">
									<table style="width: 95%;">
										<colgroup>
											<col width="100%" />
										</colgroup>
										<tr>
											<td align="left">총 :  ${totalCount} 개</td>
										</tr>
									</table>
									<form action="/admin/${bean.menuno}/${bean.board_name}/insert.do" name="frm" id="frm" method="post">
									<input type="hidden" name="page" id="page" value="${bean.page}" />
									<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
									
									<input type="hidden" name="seq" id="seq" value="" />
									
									<input type="hidden" name="search_kind_seq" id="frm_search_kind_seq" value="${bean.search_kind_seq}" />
									<input type="hidden" name="search_area_seq" id="frm_search_area_seq" value="${bean.search_area_seq}" />
									<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
									
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="5%" />
											<col width="10%" />
											<col width="17%" />
											<col width="10%" />
											<col width="*" />
											<col width="17%" />
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkbox" name="checkAll" id="checkAll"></th>
												<th>구분</th>
												<th>시설명</th>
												<th>작성자</th>
												<th>내 용</th>
												<th>등록일시</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${empty list}">
												<tr>
													<td colspan="6" style="text-align:center;">등록된 댓글이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}">
													<tr>
            											<td><input type="checkbox" name="check_seq" id="check_seq${list.SEQ}" value="${list.SEQ}"></td>
														<td style="text-align: center;">
															<c:choose>
																<c:when test="${list.GUBUN eq 'facility'}">
																	복지시설
																</c:when>
																<c:otherwise>
																	편의시설
																</c:otherwise>
															</c:choose>
														</td>
														<td style="text-align: center;">${list.FACILITY_NAME}</td>
														<td style="text-align: center;">${list.NAME}</td>
														<td style="text-align: left;">${list.CONTENT}</td>
														<td style="text-align: center;"><fmt:formatDate value="${list.REG_DATE}" pattern="yyyy-MM-dd HH:mm" /></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
									
									<table style="width: 95%;">
										<colgroup>
											<col width="100%" />
										</colgroup>
										<tr>
											<td align="right" style="padding-top:5px;">
												<span class="button01"><a href="#none" id="check_drop">선택삭제</a></span>
											</td>
										</tr>
									</table>
									</form>
									<!--  pageNate  -->
									${navi }
									<!--//pageNate  -->

								</div>
							</td>
						</tr>
					</table>
			</div> 
>>>>>>> refs/heads/202204
		</div>