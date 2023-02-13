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
									<col width="10%" />
									<col width="20%" />
									<col width="10%" />
									<col width="20%" />
									<col width="10%" />
									<col width="20%" />
								</colgroup>
								<tbody>									
									<tr>
										<th><b>지역선택</b></th>
										<td>
										<select name="search_area_seq" id="search_area_seq" style="width:100%;min-width:100%;">
											<option value="">전체</option>
											<c:forEach var="list" items="${selType6List}">
												<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_area_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
											</c:forEach>
										</select>
										</td>
										<th><b>시설유형</b></th>
										<td>
										<select name="search_kind_seq" id="search_kind_seq" style="width:100%;min-width:100%;" >
											<option value="">전체</option>
											<c:forEach var="list" items="${selType9List}">
												<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_kind_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
											</c:forEach>
										</select>	
										</td>
										<th><b>검색어</b></th>
										<td>
										<input type="text" name="search_content" id="search_content" value="${bean.search_content}" style="width:100%:min-width:100%" />
										</td>										
									</tr>
									<tr style="border:0;">
										<td colspan="6" style="text-align: center;border:0;height:40px;" onmouseover="this.style.backgroundColor='white';"><span class="button01" id="btnSearch" ><a href="#none" >검색</a></span></td>
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
											<col width="7%" />
											<col width="12%" />
											<col width="17%" />
											<col width="12%" />
											<col width="*" />
										</colgroup>
										<thead>
											<tr>
												<th>번호</th>
												<th>지역</th>
												<th>시설유형</th>
												<th>시설명</th>
												<th>연락처</th>
												<th>주소</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${empty list}">
												<tr>
													<td colspan="6" style="text-align:center;">등록된 시설이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}">
													<tr onclick="goView('${list.SEQ}');">
														<c:set var="q" value="${q+1 }" />
            											<td>${pageCount -q +1 }</td>
														<td style="text-align: center;">${list.AREA}</td>
														<td style="text-align: center;">${list.KIND}</td>
														<td style="text-align: center;">${list.NAME}</td>
														<td style="text-align: center;">
															<c:choose>
																<c:when test="${not empty list.TEL1}">
																	${list.TEL1}-${list.TEL2}-${list.TEL3}
																</c:when>
																<c:otherwise>
																	-
																</c:otherwise>
															</c:choose>	
														</td>
														<td style="text-align: left;">${list.ADDR1} ${list.ADDR2}</td>
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
												<span class="button01"><a href="/admin/${bean.menuno}/${bean.board_name}/write.do">등록하기</a></span>
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