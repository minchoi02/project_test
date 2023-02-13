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
		
		if(confirm("선택한 예약을 모두 삭제하시겠습니까?")){
			$("#frm_search_title").val($("#search_title").val());
			$("#frm_search_value").val($("#search_value").val());
			
			$("#seq").val(seq);
			$("#frm").attr("action", "/admin/007/support/check_support_drop.do");
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

	$("#frm_search_value").val($("#search_value").val());
	
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
						<div style="width:400px;margin:0 auto;">
						<form name="searchForm" id="searchForm" method="post" action="/admin/007/support/list.do">
							<input type="hidden" name="page" id="page" value="${bean.page}"/>
							<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}"/>
	
							<table class="tbl" style="width:400px;border:0">
								<colgroup>
									<col width="30%" />
									<col width="80%" />
								</colgroup>
								<tbody>
									<tr>
										<th><b>검색</b></th>
										<td>	
										<input type="text" name="search_value" id="search_value" value="${bean.search_value}" style="width:190px;" />
										<span class="button01" id="btnSearch" ><a href="#none" >검색</a></span>
										</td>									
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
									<input type="hidden" name="search_value" id="frm_search_value" value="${bean.search_value}" />
									
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="8%" />
											<col width="15%" />
											<col width="15%" />
											<col width="*" />
											<col width="15%" />
											<col width="15%" />
											<col width="15%" />
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkbox" name="checkAll" id="checkAll"></th>
												<th>아이디</th>
												<th>이름</th>
												<th>연락처</th>
												<th>후원방식</th>
												<th>후원금액</th>
												<th>신청일</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${empty list}">
												<tr>
													<td colspan="7" style="text-align:center;">등록된 신청이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}">
													<tr>
														<c:set var="q" value="${q+1 }" />
            											<td><input type="checkbox" name="check_seq" id="check_seq${list.SEQ}" value="${list.SEQ}"></td>
            											<td onclick="goView('${list.SEQ}');" style="text-align: center;">
            												<c:choose>
																<c:when test="${not empty list.MEMBER_ID}">
																	${list.MEMBER_ID}
																</c:when>
																<c:otherwise>
																	-
																</c:otherwise>
															</c:choose>
            											</td>
														<td onclick="goView('${list.SEQ}');" style="text-align: center;">${list.NAME}</td>
														<td onclick="goView('${list.SEQ}');" style="text-align: center;">
															<c:choose>
																<c:when test="${not empty list.TEL1}">
																	${list.TEL1}-${list.TEL2}-${list.TEL3}
																</c:when>
																<c:otherwise>
																	-
																</c:otherwise>
															</c:choose>
														</td>
														<td onclick="goView('${list.SEQ}');" style="text-align: center;">${list.SUPPORT_KIND}</td>
														<td onclick="goView('${list.SEQ}');" style="text-align: center;"><fmt:formatNumber value="${list.SUPPORT_PRICE}" pattern="#,###.##"/> 원</td>
														<td onclick="goView('${list.SEQ}');" style="text-align: center;"><fmt:formatDate value="${list.REG_DATE}" pattern="yyyy-MM-dd HH:mm" /></td>														
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
											<td align="right" style="padding-top:15px;">
												<span class="button01"><a href="#none" id="check_drop">선택 삭제</a></span>
												<span class="button01"><a href="/admin/${bean.menuno}/${bean.board_name}/write.do">후원신청</a></span>
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
		
		if(confirm("선택한 예약을 모두 삭제하시겠습니까?")){
			$("#frm_search_title").val($("#search_title").val());
			$("#frm_search_value").val($("#search_value").val());
			
			$("#seq").val(seq);
			$("#frm").attr("action", "/admin/007/support/check_support_drop.do");
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

	$("#frm_search_value").val($("#search_value").val());
	
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
						<div style="width:400px;margin:0 auto;">
						<form name="searchForm" id="searchForm" method="post" action="/admin/007/support/list.do">
							<input type="hidden" name="page" id="page" value="${bean.page}"/>
							<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}"/>
	
							<table class="tbl" style="width:400px;border:0">
								<colgroup>
									<col width="30%" />
									<col width="80%" />
								</colgroup>
								<tbody>
									<tr>
										<th><b>검색</b></th>
										<td>	
										<input type="text" name="search_value" id="search_value" value="${bean.search_value}" style="width:190px;" />
										<span class="button01" id="btnSearch" ><a href="#none" >검색</a></span>
										</td>									
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
									<input type="hidden" name="search_value" id="frm_search_value" value="${bean.search_value}" />
									
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="8%" />
											<col width="15%" />
											<col width="15%" />
											<col width="*" />
											<col width="15%" />
											<col width="15%" />
											<col width="15%" />
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkbox" name="checkAll" id="checkAll"></th>
												<th>아이디</th>
												<th>이름</th>
												<th>연락처</th>
												<th>후원방식</th>
												<th>후원금액</th>
												<th>신청일</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${empty list}">
												<tr>
													<td colspan="7" style="text-align:center;">등록된 신청이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}">
													<tr>
														<c:set var="q" value="${q+1 }" />
            											<td><input type="checkbox" name="check_seq" id="check_seq${list.SEQ}" value="${list.SEQ}"></td>
            											<td onclick="goView('${list.SEQ}');" style="text-align: center;">
            												<c:choose>
																<c:when test="${not empty list.MEMBER_ID}">
																	${list.MEMBER_ID}
																</c:when>
																<c:otherwise>
																	-
																</c:otherwise>
															</c:choose>
            											</td>
														<td onclick="goView('${list.SEQ}');" style="text-align: center;">${list.NAME}</td>
														<td onclick="goView('${list.SEQ}');" style="text-align: center;">
															<c:choose>
																<c:when test="${not empty list.TEL1}">
																	${list.TEL1}-${list.TEL2}-${list.TEL3}
																</c:when>
																<c:otherwise>
																	-
																</c:otherwise>
															</c:choose>
														</td>
														<td onclick="goView('${list.SEQ}');" style="text-align: center;">${list.SUPPORT_KIND}</td>
														<td onclick="goView('${list.SEQ}');" style="text-align: center;"><fmt:formatNumber value="${list.SUPPORT_PRICE}" pattern="#,###.##"/> 원</td>
														<td onclick="goView('${list.SEQ}');" style="text-align: center;"><fmt:formatDate value="${list.REG_DATE}" pattern="yyyy-MM-dd HH:mm" /></td>														
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
											<td align="right" style="padding-top:15px;">
												<span class="button01"><a href="#none" id="check_drop">선택 삭제</a></span>
												<span class="button01"><a href="/admin/${bean.menuno}/${bean.board_name}/write.do">후원신청</a></span>
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