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
	
	$("#frm_search_group_seq").val($("#search_group_seq").val());
	$("#frm_search_sex_seq").val($("#search_sex_seq").val());
	$("#frm_search_type_seq").val($("#search_type_seq").val());
	$("#frm_search_grade_seq").val($("#search_grade_seq").val());
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
						<form name="searchForm" id="searchForm" method="post" action="/admin/002/welfare/list.do">
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
										<th><b>분류</b></th>
										<td>
										<select name="search_group_seq" id="search_group_seq" style="width:100%;min-width:100%;" >
											<option value="">전체</option>
											<c:forEach var="list" items="${selType1List}">
												<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_group_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
											</c:forEach>
										</select>	
										</td>
										<th><b>성별</b></th>
										<td>
										<select name="search_sex_seq" id="search_sex_seq" style="width:100%;min-width:100%;" >
											<option value="">전체</option>
											<c:forEach var="list" items="${selType3List}">
												<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_sex_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
											</c:forEach>
										</select>	
										</td>
										<th><b>장애유형</b></th>
										<td>
										<select name="search_type_seq" id="search_type_seq" style="width:100%;min-width:100%;" >
											<option value="">전체</option>
											<c:forEach var="list" items="${selType4List}">
												<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_type_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
											</c:forEach>
										</select>	
										</td>										
									</tr>
									<tr>
										<th><b>장애등급</b></th>
										<td>
										<select name="search_grade_seq" id="search_grade_seq" style="width:100%;min-width:100%;">
											<option value="">전체</option>
											<c:forEach var="list" items="${selType5List}">
												<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_grade_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
											</c:forEach>
										</select>
										</td>
										<th><b>지역</b></th>
										<td>
										<select name="search_area_seq" id="search_area_seq" style="width:100%;min-width:100%;" >
											<option value="">전체</option>
											<c:forEach var="list" items="${selType6List}">
												<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_area_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
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
									
									<input type="hidden" name="search_group_seq" id="frm_search_group_seq" value="${bean.search_group_seq}" />
									<input type="hidden" name="search_sex_seq" id="frm_search_sex_seq" value="${bean.search_sex_seq}" />
									<input type="hidden" name="search_type_seq" id="frm_search_type_seq" value="${bean.search_type_seq}" />
									<input type="hidden" name="search_grade_seq" id="frm_search_grade_seq" value="${bean.search_grade_seq}" />
									<input type="hidden" name="search_area_seq" id="frm_search_area_seq" value="${bean.search_area_seq}" />
									<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
									
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="7%" />
											<col width="35%" />
											<col width="*" />
											<col width="15%" />
										</colgroup>
										<thead>
											<tr>
												<th>번호</th>
												<th>분류</th>
												<th>제목</th>
												<th>상세보기</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${empty list}">
												<tr>
													<td colspan="4" style="text-align:center;">등록된 복지가 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}">
													<tr onclick="goView('${list.SEQ}');">
														<c:set var="q" value="${q+1 }" />
            											<td>${pageCount -q +1 }</td>
														<td style="text-align: left;">${list.KIND_DESC}</td>
														<td style="text-align: center;">${list.TITLE}</td>
														<td style="text-align: center;">
															<span class="button02" id="btnSearch" ><a href="javascript:goView('${list.SEQ}');">자세히 보기</a></span>
														</td>
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