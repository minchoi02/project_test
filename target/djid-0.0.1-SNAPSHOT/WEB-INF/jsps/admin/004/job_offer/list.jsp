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
	
	$('#search_gugun_seq').change(function () {
		
		var gugun = $(this).val();
		var search_dongri_seq = "${bean.search_dongri_seq}";
		$.ajax({
		    url: "/common/gugun_for_dongri.do?gugun_seq=" + gugun,
		    type : "GET",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(list){		    	
		    	var html = "";
		    	html += "<option value=''>전체</option>";
		    	for (var i = 0; i < list.length; i++) {
					var seq = list[i].SEQ;
					var code_desc = list[i].CODE_DESC;
					var selected = "";
					if(search_dongri_seq == seq){
						selected = "selected";
					}
					html += "<option value='"+seq+"' "+ selected +" >" + code_desc + "</option>";
				}
		    	$("#search_dongri_seq").html(html);
		    }
		});
	});
	
	if( $("#search_gugun_seq").val() != "" ){
		$('#search_gugun_seq').change();	
	}
	
});

function goView(seq){
	
	$("#frm_search_dongri_seq").val($("#search_dongri_seq").val());
	$("#frm_search_gugun_seq").val($("#search_gugun_seq").val());
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
									<col width="15%" />
									<col width="45%" />
									<col width="15%" />
									<col width="25%" />
								</colgroup>
								<tbody>									
									<tr>
										<th><b>근무지역</b></th>
										<td>
										<select name="search_gugun_seq" id="search_gugun_seq" style="width:150px;min-width:150px;">
											<option value="">전체</option>
											<c:forEach var="list" items="${selType6List}">
												<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_gugun_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
											</c:forEach>
										</select>
										<select name="search_dongri_seq" id="search_dongri_seq" style="width:130px;min-width:130px;">
											<option value="">전체</option>
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
									
									<input type="hidden" name="search_gugun_seq" id="frm_search_gugun_seq" value="${bean.search_gugun_seq}" />
									<input type="hidden" name="search_dongri_seq" id="frm_search_dongri_seq" value="${bean.search_dongri_seq}" />
									<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
									
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="5%" />
											<col width="18%" />											
											<col width="13%" />
											<col width="*" />
											<col width="10%" />
											<col width="16%" />
											<col width="8%" />
										</colgroup>
										<thead>
											<tr>
												<th>번호</th>
												<th>회사명</th>
												<th>근무지역</th>
												<th>제목</th>
												<th>모집인원</th>
												<th>급여</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${empty list}">
												<tr>
													<td colspan="7" style="text-align:center;">등록된 구인정보가 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}">
													<tr onclick="goView('${list.SEQ}');">
														<c:set var="q" value="${q+1 }" />
            											<td>${pageCount -q +1 }</td>
														<td style="text-align: center;">${list.COMPANY_NAME}</td>
														<td style="text-align: center;">${list.GUGUN} ${list.DONGRI}</td>
														<td style="text-align: center;">${list.TITLE}</td>
														<td style="text-align: center;">
															${list.SEX} ${list.SEX_CNT}명
														</td>
														<td style="text-align: center;">
															${list.SALARY_KIND} <fmt:formatNumber value="${list.SALARY}" pattern="\#,###.##"/>원
														</td>														
														<td style="text-align: center;">${list.STATUS}</td>
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