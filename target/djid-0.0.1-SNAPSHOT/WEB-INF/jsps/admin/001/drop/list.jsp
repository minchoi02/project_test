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
		
		if(confirm("선택한 회원을 모두 탈퇴 승인처리 하시겠습니까?")){
			$("#frm_search_title").val($("#search_title").val());
			$("#frm_search_value").val($("#search_value").val());
			
			$("#seq").val(seq);
			$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/check_drop.do");
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

	$("#frm_search_title").val($("#search_title").val());
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
						<div style="width:600px;margin:0 auto;">
						<form name="searchForm" id="searchForm" method="post" action="/admin/001/drop/list.do">
							<input type="hidden" name="page" id="page" value="${bean.page}"/>
							<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}"/>
	
							<table class="tbl" style="width:600px;border:0">
								<colgroup>
									<col width="20%" />
									<col width="80%" />
								</colgroup>
								<tbody>
									<tr>
										<th><b>회원정보</b></th>
										<td>
										<select name="search_title" id="search_title" style="width:70px; max-width:70px;" >
											<option value="">전체</option>
											<option value="id" <c:if test="${bean.search_title eq 'id'}">selected</c:if>>아이디</option>
											<option value="name" <c:if test="${bean.search_title eq 'name'}">selected</c:if>>이름</option>
											<option value="tel" <c:if test="${bean.search_title eq 'tel'}">selected</c:if>>연락처</option>							
										</select>	
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
									
									<input type="hidden" name="search_title" id="frm_search_title" value="${bean.search_title}" />
									<input type="hidden" name="search_value" id="frm_search_value" value="${bean.search_value}" />
									
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="8%" />
											<col width="12%" />
											<col width="15%" />
											<col width="12%" />
											<col width="18%" />
											<col width="18%" />
											<col width="12%" />
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkbox" name="checkAll" id="checkAll"></th>
												<th>유형</th>
												<th>아이디</th>
												<th>이름</th>
												<th>연락처</th>
												<th>구분</th>
												<th>연령</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${empty list}">
												<tr>
													<td colspan="7" style="text-align:center;">등록된 회원이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}">
													<tr>
            											<td><input type="checkbox" name="check_seq" id="check_seq${list.SEQ}" value="${list.SEQ}"></td>
            											<td onclick="goView('${list.SEQ}');" style="text-align: center;">${list.KIND}</td>
														<td onclick="goView('${list.SEQ}');" style="text-align: center;">${list.ID}</td>
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
														<td onclick="goView('${list.SEQ}');">${list.GUBUN}</td>
														<td onclick="goView('${list.SEQ}');">${list.AGE}</td>
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
												<span class="button01"><a href="#none" id="check_drop">선택회원 탈퇴승인</a></span>
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
		</div>