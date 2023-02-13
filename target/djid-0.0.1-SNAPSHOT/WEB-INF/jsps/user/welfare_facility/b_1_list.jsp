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
		$("#searchForm").attr("action", "/welfare_facility/b_1/list.do");
		$('#searchForm').submit();
	});
	
	$('#search_area_seq').change(function () {
		var thisVal = $(this).val();
		if(thisVal == "38"){
			$('#daejeonArea1').click();
		}else if(thisVal == "37"){
			$('#daejeonArea2').click();
		}else if(thisVal == "40"){
			$('#daejeonArea3').click();
		}else if(thisVal == "39"){
			$('#daejeonArea4').click();
		}else if(thisVal == "41"){
			$('#daejeonArea5').click();
		}
	});
		
	
});

function goView(seq){
	
	$("#frm_search_kind_seq").val($("#search_kind_seq").val());
	$("#frm_search_area_seq").val($("#search_area_seq").val());
	$("#frm_search_content").val($("#search_content").val());
	
	$("#seq").val(seq);
	$("#frm").attr("action", "/welfare_facility/b_1/view.do");
	$("#frm").submit();
}

</script>
			
					<div class="contsArea welfareSearch">
						<p class="textPara_top">검색을 통해 찾고자 하시는 우리지역 복지시설을 찾으실 수 있습니다.</p>

						<form name="searchForm" id="searchForm" method="post" action="/welfare_facility/b_1/list.do">
						<!-- 검색박스 -->
						<div class="searchBoxWrap facility">
							<div class="typeFacility">
								<div class="verticalBox maps">
									<div>
										<span class="imgBox"><img src="/assets/user/images/srch_map01_dong-gu.png" alt="대전지도" usemap="#srchMap"></span>
										<map name="srchMap">
											<area id="daejeonArea1" href="#" alt="동구"   shape="poly" coords="204,59,174,86,171,97,182,111,172,117,158,110,144,121,168,152,144,156,147,170,141,179,148,191,127,209,143,217,164,199,181,188,190,154,195,123,213,112,219,95,244,87,231,72,218,67,209,75,203,58" onfocus="this.blur()">
											<area id="daejeonArea2" href="#" alt="중구"   shape="poly" coords="107,168,113,154,141,119,161,147,140,152,145,167,136,175,148,189,130,210,120,192,112,192,121,171,104,166" onfocus="this.blur()">
											<area id="daejeonArea3" href="#" alt="서구"   shape="poly" coords="53,174,44,185,54,200,59,196,70,204,71,224,98,197,98,170,109,162,111,152,135,116,132,102,108,112,105,127,92,131,86,144,65,169,53,173" onfocus="this.blur()">
											<area id="daejeonArea4" href="#" alt="대덕구" shape="poly" coords="143,118,158,105,164,113,178,111,172,98,175,83,206,58,215,50,197,45,204,31,183,46,146,50,138,59,158,74,144,94,131,101" onfocus="this.blur()">
											<area id="daejeonArea5" href="#" alt="유성구" shape="poly" coords="29,154,28,154,52,172,69,161,100,126,114,109,133,100,147,96,154,72,138,55,153,46,154,25,144,19,128,25,124,45,106,68,78,70,56,114,49,127,38,150,26,152" onfocus="this.blur()">
										</map>
									</div>

									<script>
									$(function(){
										IMG_Replace();
									});
									function IMG_Replace(){
										var mapIMG = $('.verticalBox.maps').find('.imgBox > img'),
											area1_src = '/assets/user/images/srch_map01_dong-gu.png',
											area2_src = '/assets/user/images/srch_map02_Jung-gu.png',
											area3_src = '/assets/user/images/srch_map03_seo-gu.png',
											area4_src = '/assets/user/images/srch_map04_daedeok-gu.png',
											area5_src = '/assets/user/images/srch_map05_yuseong-gu.png';

										$('#daejeonArea1').on('click',function(){
											mapIMG.attr('src',area1_src);
											$("#search_area_seq").val("38").prop("selected", true);
											return false;
										});

										$('#daejeonArea2').on('click',function(e){
											mapIMG.attr('src',area2_src);
											$("#search_area_seq").val("37").prop("selected", true);
											return false;
										});

										$('#daejeonArea3').on('click',function(e){
											mapIMG.attr('src',area3_src);
											$("#search_area_seq").val("40").prop("selected", true);
											return false;
										});

										$('#daejeonArea4').on('click',function(e){
											mapIMG.attr('src',area4_src);
											$("#search_area_seq").val("39").prop("selected", true);
											return false;
										});

										$('#daejeonArea5').on('click',function(e){
											mapIMG.attr('src',area5_src);
											$("#search_area_seq").val("41").prop("selected", true);
											return false;
										});
										
										var area = "${bean.search_area_seq}";
										if(area == "38"){
											$("#daejeonArea1").click();
										}else if(area == "37"){
											$("#daejeonArea2").click();
										}else if(area == "40"){
											$("#daejeonArea3").click();
										}else if(area == "39"){
											$("#daejeonArea4").click();
										}else if(area == "41"){
											$("#daejeonArea5").click();
										}
									}
									</script>
								</div>
								<div class="verticalBox srchInput">
									<p class="srchText">지역 또는 복지시설명을 입력해주세요.</p>
									<p>
										<label for="search_area_seq">지역</label>
										<select name="search_area_seq" id="search_area_seq">
											<option value="">전체</option>
											<c:forEach var="list" items="${selType6List}">
												<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_area_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
											</c:forEach>
										</select>
									</p>
									<p>
										<label for="search_kind_seq">시설유형</label>
										<select name="search_kind_seq" id="search_kind_seq">
											<option value="">전체</option>
											<c:forEach var="list" items="${selType9List}">
												<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_kind_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
											</c:forEach>
										</select>	
									</p>
									<p><label for="search_content">검색어</label><input type="text" name="search_content" id="search_content" value="${bean.search_content}"></p>
									<p class="btns"><button type="button" class="btnTypeSearch colorGreen" id="btnSearch"><span>검색</span></button></p>
								</div>
							</div>
						</div>
						<!-- //검색박스 -->
						</form>
						
						<form name="frm" id="frm" method="post">
							<input type="hidden" name="page" id="page" value="${bean.page}" />
							<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
							
							<input type="hidden" name="seq" id="seq" value="" />
							
							<input type="hidden" name="search_kind_seq" id="frm_search_kind_seq" value="${bean.search_kind_seq}" />
							<input type="hidden" name="search_area_seq" id="frm_search_area_seq" value="${bean.search_area_seq}" />
							<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
									
						<div class="textRight">총 <em>${totalCount}</em>건, <em>${bean.page}</em>/${listCount} page</div>
						<!-- list -->
						<div class="commList">
							<table class="boardTypeCol type02">
								<caption> 복지시설 검색이며 번호,지역,시설유형,시설명,연락처,주소,홈페이지,지도 목록 제공이며 상세페이지로 이동합니다.</caption>
								<colgroup>
									<col style="width:60px">
									<col style="width:70px">
									<col style="width:100px">
									<col style="width:auto">
									<col style="width:130px">
									<col style="width:auto">
									<col style="width:70px">
									<col style="width:60px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">no</th>
										<th scope="col">지역</th>
										<th scope="col">기관유형</th>
										<th scope="col">기관명</th>
										<th scope="col">전화번호</th>
										<th scope="col">주소</th>
										<th scope="col">홈페이지</th>
										<th scope="col">지도</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list}">
										<tr>
											<td colspan="8" style="text-align:center;">검색된 복지시설이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list}">
										<c:forEach var="list" items="${list}">
											<tr>
												<c:set var="q" value="${q+1 }" />
          										<td onclick="goView('${list.SEQ}');">${pageCount -q +1 }</td>
												<td onclick="goView('${list.SEQ}');" style="text-align: center;">${list.AREA}</td>
												<td onclick="goView('${list.SEQ}');" style="text-align: center;">${list.KIND}</td>
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
												<td onclick="goView('${list.SEQ}');" style="text-align: left;">${list.ADDR1} ${list.ADDR2}</td>
												<c:if test="${not empty list.DOMAIN}">												
													<td><a href="http://${list.DOMAIN}" class="btnHome" target="_blank">${list.NAME} 홈페이지 이동</a></td>
												</c:if>
												<c:if test="${empty list.DOMAIN}">
													<td>-</td>
												</c:if>
												<td><a href="javascript:goView('${list.SEQ}');" class="btnMap">${list.NAME} 지도 이동</a></td>
											</tr>
										</c:forEach>
									</c:if>									
								</tbody>
							</table>
						</div>
						<!-- //list -->

						${navi}
						
						</form>
					</div>
			