<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>
function goList(){
	$("#frm").attr("action", "/welfare_info/c_2_2/list.do");
	$("#frm").submit();
}

$(document).ready(function(){
	
});

</script>
<form id="frm" name="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/list.do">
	<input type="hidden" name="page" id="page" value="${bean.page}" />
	<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
	
	<input type="hidden" name="seq" id="seq" value="${bean.seq}" />

	<input type="hidden" name="search_kind_seq" id="frm_search_kind_seq" value="${bean.search_kind_seq}" />	
	<input type="hidden" name="search_area_seq" id="frm_search_area_seq" value="${bean.search_area_seq}" />
	<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
</form>
					<div class="contsArea welfareInfo">
						<div class="commView type02">
							<div class="commViewHead">
								<span>${view.NAME}</span>
								<h4>${view.SECTORS} / 
									<c:choose>
										<c:when test="${fn:length(view.CONTENT1) > 30}">
											${fn:substring(view.CONTENT1,0,30)}...
										</c:when>
										<c:otherwise>
											${view.CONTENT1}
										</c:otherwise>
									</c:choose>
								</h4>
							</div>
										
							<div class="infoArea type02">
								<div class="infoAreaLeft">
									<dl class="infoL">
										<dt>학력사항</dt>
										<dd>
											<c:if test="${not empty edu_list}">
												${edu_list[fn:length(edu_list)-1].EDU_NAME}
											</c:if>
											<c:if test="${empty edu_list}">
												-
											</c:if>
										</dd>
										<dt>경력사항</dt>
										<dd>
											<c:if test="${not empty career_list and fn:length(career_list) >= 2}">
												${career_list[fn:length(career_list)-2].CAREER_NAME}
												<br/>
												${career_list[fn:length(career_list)-1].CAREER_NAME}
											</c:if>
											<c:if test="${not empty career_list and fn:length(career_list) < 2}">
												${career_list[fn:length(career_list)-1].CAREER_NAME}
											</c:if>
											<c:if test="${empty career_list}">
												-
											</c:if>
										</dd>
										<dt>자격면허</dt>
										<dd>
											<c:choose>
												<c:when test="${not empty view.LIFE_ABILITY6}">${view.LIFE_ABILITY6}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</dd>
									</dl>
									<dl class="infoR">
										<dt>희망근무지역</dt>
										<dd>
											1지망 : ${view.AREA1_GUGUN} ${view.AREA1_DONGRI}<br>
											2지망 : ${view.AREA2_GUGUN} ${view.AREA2_DONGRI}
										</dd>
										<dt>희망근무시간</dt>
										<dd>${view.SHOUR}:${view.SMINUTE} ~ ${view.EHOUR}${view.EMINUTE}</dd>
										<dt>희망급여</dt>
										<dd>월 <fmt:formatNumber value="${view.SALARY}" pattern="#,###.##"/> 만원</dd>
									</dl>
								</div>
								<div class="infoAreaRight">
									<dl>
										<dt>${view.NAME}</dt>
										<dd>
											<ul>
												<li><em>성별</em><span>${view.SEX} ${view.BIRTH_YEAR}년생</span></li>
												<li><em>장애유형</em><span>${view.KIND}
												</span></li>
												<li><em>장애급수</em><span>${view.LEVEL}</span></li>												
												<li><em>연락처</em><span>관리자 문의</span></li>
											</ul>
										</dd>
									</dl>
								</div>
							</div>
						</div>
						<div class="commView type03">
							<h4>자기소개</h4>
							<div class="textInfo">
								<p>${view.VIEW_CONTENT1}</p>
							</div>
						</div>
						<div class="commView type03">
							<h4>연락처</h4>
							<div class="textInfo">
								<p>02-0000-0000 (관리자 연락처)</p>
							</div>
						</div>
						<div class="btnArea">
							<a href="javascript:goList();" class="btnTypeBasic sizeM"><span>목록보기</span></a>
						</div>

					</div>