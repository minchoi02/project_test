<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>

$(document).ready(function(){


	$('#btnSearch').click(function () {
	//	if(! valCheck('search_value','검색어를 입력하세요')) return;
	//	if(! lenCheck('search_value',2, '검색어는 2글자 이상 입력하세요')) return;
		$('#page').val(1);
		$('#pagelistno').val(1);
		$("#searchForm").prop("action", "/welfare_info/c_2_1/list.do")
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
	$("#frm").attr("action", "/welfare_info/c_2_1/view.do");
	$("#frm").submit();
}

</script>

					<div class="contsArea welfareInfo">
						<form name="searchForm" id="searchForm" method="post">
							<!-- 검색박스 -->
							<div class="searchBoxWrap type02">
								<p class="rowOptions">
									<span>
										<label for="search_gugun_seq">근무지역</label>
										<select name="search_gugun_seq" id="search_gugun_seq">
											<option value="">전체</option>
											<c:forEach var="list" items="${selType6List}">
												<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_gugun_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
											</c:forEach>
										</select>
									</span>
									<span>
										<select name="search_dongri_seq" id="search_dongri_seq" title="읍/면/동 선택">
											<option value="">전체</option>
										</select>
									</span>
									<span><button type="button" class="btnTypeBasic" id="btnSearch">검색</button></span>
								</p>
							</div>
							<!-- //검색박스 -->
						</form>
						
						<form name="frm" id="frm" method="post">
							<input type="hidden" name="page" id="page" value="${bean.page}" />
							<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
							
							<input type="hidden" name="seq" id="seq" value="" />
							
							<input type="hidden" name="search_gugun_seq" id="frm_search_gugun_seq" value="${bean.search_gugun_seq}" />
							<input type="hidden" name="search_dongri_seq" id="frm_search_dongri_seq" value="${bean.search_dongri_seq}" />
							<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
										
							<!-- list -->
							<div class="commList">
								<table class="boardTypeCol type02">
									<caption>구인정보 목록이며 근무지역, 모집내용, 모집인원, 성별, 급여(원),보기 를 제공하고 제목 링크를 통해 상세페이지로 이동합니다.</caption>
									<colgroup>
										<col style="width: 160px">
										<col style="width: 344px">
										<col style="width: 95px">
										<col style="width: 85px">
										<col style="width: 150px">
										<col style="width: 95px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">근무지역</th>
											<th scope="col">모집내용</th>
											<th scope="col">모집인원</th>
											<th scope="col">성별</th>
											<th scope="col">급여(원)</th>
											<th scope="col">보기</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty list}">
											<tr>
												<td colspan="6" style="text-align:center;">등록된 구인정보가 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${!empty list}">
											<c:forEach var="list" items="${list}">
												<tr>
													<td class="left">대전시 ${list.GUGUN} ${list.DONGRI}</td>
													<td class="left"><strong class="recruiTit">${list.COMPANY_NAME}</strong>${list.TITLE}</td>
													<td>${list.SEX_CNT}명</td>
													<td>${list.SEX}</td>
													<td>
														<c:choose>
															<c:when test="${list.SALARY_KIND eq '시급제'}">
															시)<fmt:formatNumber value="${list.SALARY}" pattern="#,###.##"/>원
															</c:when>
															<c:when test="${list.SALARY_KIND eq '일급제'}">
															일)<fmt:formatNumber value="${list.SALARY}" pattern="#,###.##"/>원
															</c:when>
															<c:when test="${list.SALARY_KIND eq '월급제'}">
															월)<fmt:formatNumber value="${list.SALARY}" pattern="#,###.##"/>원
															</c:when>
															<c:when test="${list.SALARY_KIND eq '연봉제'}">
															연)<fmt:formatNumber value="${list.SALARY}" pattern="#,###.##"/>원
															</c:when>
														</c:choose>
													</td>
													<td><a href="javascript:goView('${list.SEQ}');" class="btnView">대전시 ${list.GUGUN} ${list.DONGRI} ${list.COMPANY_NAME} ${list.TITLE} ${list.SEX_CNT}명 ${list.SEX} ${list.SALARY_KIND} ${list.SALARY}원 상세페이지 이동</a></td>													
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
							
							${navi}
							
							<!--//list -->
							<div class="btnArea">
								<a href="/welfare_info/c_2_1/write.do" class="btnTypeBasic sizeM"><span>구인정보 등록하기</span></a>
							</div>
						</form>
					</div>