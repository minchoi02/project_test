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
						<form name="searchForm" id="searchForm" method="post" action="/admin/010/master/list.do">
							<input type="hidden" name="page" id="page" value="${bean.page}"/>
							<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}"/>
	
							<table class="tbl" style="width:600px;border:0">
								<colgroup>
									<col width="20%" />
									<col width="80%" />
								</colgroup>
								<tbody>
									<tr>
										<th><b>관리자정보</b></th>
										<td>
										<select name="search_title" id="search_title" style="width:70px; max-width:70px;" >
											<option value="">전체</option>
											<option value="id" <c:if test="${bean.search_title eq 'id'}">selected</c:if>>아이디</option>
											<option value="name" <c:if test="${bean.search_title eq 'name'}">selected</c:if>>이름</option>							
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
											<col width="10%" />
											<col width="25%" />
											<col width="20%" />
											<col width="20%" />
											<col width="25%" />
										</colgroup>
										<thead>
											<tr>
												<th>번호</th>
												<th>아이디</th>
												<th>이름</th>
												<th>권한</th>
												<th>등록일</th>
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
													<tr onclick="goView('${list.SEQ}');">
														<c:set var="q" value="${q+1 }" />
            											<td>${pageCount -q +1 }</td>
														<td style="text-align: center;">${list.ID}</td>
														<td style="text-align: center;">${list.NAME}</td>
														<td style="text-align: center;">
															<c:choose>
																<c:when test="${list.GRADE eq 'A'}">슈퍼관리자</c:when>
																<c:otherwise>관리자</c:otherwise>
															</c:choose>
														</td>
														<td style="text-align: center;"><fmt:formatDate value="${list.REG_DATE}" pattern="yyyy-MM-dd" /></td>
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
												<span class="button01"><a href="/admin/${bean.menuno}/${bean.board_name}/write.do">관리자 등록</a></span>
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