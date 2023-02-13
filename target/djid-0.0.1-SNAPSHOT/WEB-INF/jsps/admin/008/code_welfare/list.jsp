<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

$(document).ready(function(){


	$('#search_type_code_seq').change(function () {
	//	if(! valCheck('search_value','검색어를 입력하세요')) return;
	//	if(! lenCheck('search_value',2, '검색어는 2글자 이상 입력하세요')) return;
		$('#page').val(1);
		$('#pagelistno').val(1);
		$('#searchForm').submit();
	});
	
});

function goView(seq){

	$("#frm_search_type_code_seq").val($("#search_type_code_seq").val());
	
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
						<form name="searchForm" id="searchForm" method="post" action="/admin/008/code_welfare/list.do">
							<input type="hidden" name="page" id="page" value="${bean.page}"/>
							<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}"/>
							<table class="tbl" style="width:400px;border:0">
								<colgroup>
									<col width="30%" />
									<col width="40%" />
								</colgroup>
								<tbody>
									<tr>
										<th><b>상위코드</b></th>
										<td>
										<select name="search_type_code_seq" id="search_type_code_seq" style="width:100%;min-width:100%;" >
											<option value="">전체</option>
											<c:forEach var="list" items="${typeCodeList}">
												<option value="${list.TYPE}" <c:if test="${list.TYPE != '' and list.TYPE == bean.search_type_code_seq}">selected="selected"</c:if>>${list.TYPE_DESC}</option>
											</c:forEach>
										</select>	
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

									<input type="hidden" name="search_type_code_seq" id="frm_search_type_code_seq" value="${bean.search_type_code_seq}" />
									
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="10%" />
											<col width="10%" />
											<col width="20%" />
											<col width="10%" />
											<col width="20%" />
											<col width="10%" />
											<col width="20%" />
										</colgroup>
										<thead>
											<tr>
												<th>번호</th>
												<th>상위코드</th>
												<th>상위코드명</th>
												<th>하위코드</th>
												<th>하위코드명</th>
												<th>정렬순서</th>
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
														<td style="text-align: center;">${list.TYPE}</td>
														<td style="text-align: center;">${list.TYPE_DESC}</td>
														<td style="text-align: center;">${list.CODE}</td>
														<td style="text-align: center;">${list.CODE_DESC}</td>
														<td style="text-align: center;">${list.SORT}</td>
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
											<td align="right" style="padding-top:5px;">
												<span class="button01"><a href="/admin/${bean.menuno}/${bean.board_name}/write.do">등록하기</a></span>
											</td>
										</tr>
									</table>
									</form>
									

								</div>
							</td>
						</tr>
					</table>
			</div> 
		</div>