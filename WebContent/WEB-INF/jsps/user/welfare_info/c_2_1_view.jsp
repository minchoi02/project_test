<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>

function goList(){
	$("#frm").attr("action", "/welfare_info/c_2_1/list.do");
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
								<span>${view.COMPANY_NAME}</span>
								<h4>${view.TITLE}</h4>
								<strong class="number">모집인원 : ${view.SEX} ${view.SEX_CNT}명</strong>
							</div>
							<div class="infoArea">
								<div class="infoAreaLeft">
									<dl class="infoL">
										<dt>지원자격</dt>
										<dd>
											<ul>
												<li><em>성별</em><span>${view.SEX}</span></li>
												<li><em>연령</em><span>
													<c:if test="${view.AGE_STR eq '연령무관'}">${view.AGE_STR}</c:if>
													<c:if test="${not empty view.AGE_INT and view.AGE_STR eq '연령제한'}">${view.AGE_INT}</c:if>
													</span></li>
												<li><em>혼인</em><span>${view.MARRY}</span></li>
												<li><em>학력</em><span>${view.EDU}</span></li>
												<li><em>우대 자격증</em><span>${view.CERT}</span></li>
												<li><em>제출 서류</em><span>
													<c:if test="${view.DOCUMENT1_YN eq 'Y'}">
													이력서<c:if test="${view.DOCUMENT2_YN eq 'Y' or view.DOCUMENT3_YN eq 'Y' or view.DOCUMENT4_YN eq 'Y' or view.DOCUMENT5_YN eq 'Y' or view.DOCUMENT6_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.DOCUMENT2_YN eq 'Y'}">
													자기소개서<c:if test="${view.DOCUMENT3_YN eq 'Y' or view.DOCUMENT4_YN eq 'Y' or view.DOCUMENT5_YN eq 'Y' or view.DOCUMENT6_YN eq 'Y'}">,</c:if> 
													</c:if>
													<c:if test="${view.DOCUMENT3_YN eq 'Y'}">
													성적증명서<c:if test="${view.DOCUMENT4_YN eq 'Y' or view.DOCUMENT5_YN eq 'Y' or view.DOCUMENT6_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.DOCUMENT4_YN eq 'Y'}">
													졸업증명서<c:if test="${view.DOCUMENT5_YN eq 'Y' or view.DOCUMENT6_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.DOCUMENT5_YN eq 'Y'}">
													주민등록등본<c:if test="${view.DOCUMENT6_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.DOCUMENT6_YN eq 'Y'}">
													${view.DOCUMENT_ETC} 
													</c:if>
												</span></li>
											</ul>
										</dd>
									</dl>
									<dl class="infoR">
										<dt>근무조건</dt>
										<dd>
											<ul>
												<li><em>고용형태</em><span>
													${view.EMP} 
													<c:if test="${not empty view.EMP_INT}">(수습: ${view.EMP_INT}개월)</c:if>
												</span></li>
												<li><em>근무시간</em><span>${view.SHOUR}:${view.SMINUTE} ~ ${view.EHOUR}:${view.EMINUTE}</span></li>
												<li><em>급여</em><span>${view.SALARY_KIND} <c:if test="${not empty view.SALARY}"><fmt:formatNumber value="${view.SALARY}" pattern="#,###.##"/>원</c:if></span></li>
												<li><em>복리후생</em><span>
													<c:if test="${view.EAT1_YN eq 'Y'}">
													조식<c:if test="${view.EAT2_YN eq 'Y' or view.EAT3_YN eq 'Y' or view.DORMITORY_YN eq 'Y' or view.SERVERANCEPAY_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.EAT2_YN eq 'Y'}">
													중식<c:if test="${view.EAT3_YN eq 'Y' or view.DORMITORY_YN eq 'Y' or view.SERVERANCEPAY_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.EAT3_YN eq 'Y'}">
													석식<c:if test="${view.DORMITORY_YN eq 'Y' or view.SERVERANCEPAY_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.DORMITORY_YN eq 'Y'}">
													기숙사<c:if test="${view.SERVERANCEPAY_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.SERVERANCEPAY_YN eq 'Y'}">
													퇴직금
													</c:if>
												</span></li>
												<li><em>4대보험</em><span>
													<c:if test="${view.INSURANCE1_YN eq 'Y'}">
													산재보험<c:if test="${view.INSURANCE2_YN eq 'Y' or view.INSURANCE3_YN eq 'Y' or view.INSURANCE4_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.INSURANCE2_YN eq 'Y'}">
													고용보험<c:if test="${view.INSURANCE3_YN eq 'Y' or view.INSURANCE4_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.INSURANCE3_YN eq 'Y'}">
													건강보험<c:if test="${view.INSURANCE4_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.INSURANCE4_YN eq 'Y'}">
													국민연금 
													</c:if>
												</span></li>
												<li><em>지역</em><span>대전시 ${view.GUGUN} ${view.DONGRI}</span></li>
											</ul>
										</dd>
									</dl>
								</div>
								<div class="infoAreaRight">
									<dl>
										<dt>기업정보</dt>
										<dd>
											<ul>
												<li><em>회사명</em><span>
													<c:if test="${not empty view.COMPANY_NAME}">${view.COMPANY_NAME}</c:if>
													<c:if test="${empty view.COMPANY_NAME}">&nbsp;</c:if>
												</span></li>
												<li><em>대표자명</em><span>
													<c:if test="${not empty view.COMPANY_CEO_NAME}">${view.COMPANY_CEO_NAME}</c:if>
													<c:if test="${empty view.COMPANY_CEO_NAME}">&nbsp;</c:if>
												</span></li>
												<li><em>업종</em><span>
													<c:if test="${not empty view.COMPANY_SECTORS}">${view.COMPANY_SECTORS}</c:if>
													<c:if test="${empty view.COMPANY_SECTORS}">&nbsp;</c:if>
												</span></li>
												<li><em>근로자수</em><span>남자: ${view.PERSON1}명 / 여자: ${view.PERSON2}명</span></li>
												<li><em>주소</em><span>${view.ADDR1}&nbsp;${view.ADDR2}</span></li>
												<li><em>홈페이지</em><span><a href="http://${view.COMPANY_DOMAIN}" class="homeGo" target="_blank">${view.COMPANY_DOMAIN}</a></span></li>
											</ul>
										</dd>
									</dl>
								</div>
							</div>
						</div>
						<div class="commView type03">
							<h4>상세내용</h4>
							<div class="textInfo">
								<p>${view.VIEW_CONTENT}</p>
							</div>
						</div>
						<div class="commView type03">
							<h4>연락처</h4>
							<div class="textInfo">
								<p>${view.MANAGER_TEL}</p>
							</div>
						</div>
						<div class="btnArea">
							<a href="javascript:goList();" class="btnTypeBasic sizeM"><span>목록보기</span></a>
						</div>

						<!-- <div class="prevNext type02">
							<p class="prev"><b>이전글 : </b><a href="#">함께 일하신분을 찾습니다.</a></p>
							<p class="next"><b>다음글 : </b><a href="#">함께 일하신분을 찾습니다.</a></p>
						</div> -->
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>

function goList(){
	$("#frm").attr("action", "/welfare_info/c_2_1/list.do");
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
								<span>${view.COMPANY_NAME}</span>
								<h4>${view.TITLE}</h4>
								<strong class="number">모집인원 : ${view.SEX} ${view.SEX_CNT}명</strong>
							</div>
							<div class="infoArea">
								<div class="infoAreaLeft">
									<dl class="infoL">
										<dt>지원자격</dt>
										<dd>
											<ul>
												<li><em>성별</em><span>${view.SEX}</span></li>
												<li><em>연령</em><span>
													<c:if test="${view.AGE_STR eq '연령무관'}">${view.AGE_STR}</c:if>
													<c:if test="${not empty view.AGE_INT and view.AGE_STR eq '연령제한'}">${view.AGE_INT}</c:if>
													</span></li>
												<li><em>혼인</em><span>${view.MARRY}</span></li>
												<li><em>학력</em><span>${view.EDU}</span></li>
												<li><em>우대 자격증</em><span>${view.CERT}</span></li>
												<li><em>제출 서류</em><span>
													<c:if test="${view.DOCUMENT1_YN eq 'Y'}">
													이력서<c:if test="${view.DOCUMENT2_YN eq 'Y' or view.DOCUMENT3_YN eq 'Y' or view.DOCUMENT4_YN eq 'Y' or view.DOCUMENT5_YN eq 'Y' or view.DOCUMENT6_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.DOCUMENT2_YN eq 'Y'}">
													자기소개서<c:if test="${view.DOCUMENT3_YN eq 'Y' or view.DOCUMENT4_YN eq 'Y' or view.DOCUMENT5_YN eq 'Y' or view.DOCUMENT6_YN eq 'Y'}">,</c:if> 
													</c:if>
													<c:if test="${view.DOCUMENT3_YN eq 'Y'}">
													성적증명서<c:if test="${view.DOCUMENT4_YN eq 'Y' or view.DOCUMENT5_YN eq 'Y' or view.DOCUMENT6_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.DOCUMENT4_YN eq 'Y'}">
													졸업증명서<c:if test="${view.DOCUMENT5_YN eq 'Y' or view.DOCUMENT6_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.DOCUMENT5_YN eq 'Y'}">
													주민등록등본<c:if test="${view.DOCUMENT6_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.DOCUMENT6_YN eq 'Y'}">
													${view.DOCUMENT_ETC} 
													</c:if>
												</span></li>
											</ul>
										</dd>
									</dl>
									<dl class="infoR">
										<dt>근무조건</dt>
										<dd>
											<ul>
												<li><em>고용형태</em><span>
													${view.EMP} 
													<c:if test="${not empty view.EMP_INT}">(수습: ${view.EMP_INT}개월)</c:if>
												</span></li>
												<li><em>근무시간</em><span>${view.SHOUR}:${view.SMINUTE} ~ ${view.EHOUR}:${view.EMINUTE}</span></li>
												<li><em>급여</em><span>${view.SALARY_KIND} <c:if test="${not empty view.SALARY}"><fmt:formatNumber value="${view.SALARY}" pattern="#,###.##"/>원</c:if></span></li>
												<li><em>복리후생</em><span>
													<c:if test="${view.EAT1_YN eq 'Y'}">
													조식<c:if test="${view.EAT2_YN eq 'Y' or view.EAT3_YN eq 'Y' or view.DORMITORY_YN eq 'Y' or view.SERVERANCEPAY_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.EAT2_YN eq 'Y'}">
													중식<c:if test="${view.EAT3_YN eq 'Y' or view.DORMITORY_YN eq 'Y' or view.SERVERANCEPAY_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.EAT3_YN eq 'Y'}">
													석식<c:if test="${view.DORMITORY_YN eq 'Y' or view.SERVERANCEPAY_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.DORMITORY_YN eq 'Y'}">
													기숙사<c:if test="${view.SERVERANCEPAY_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.SERVERANCEPAY_YN eq 'Y'}">
													퇴직금
													</c:if>
												</span></li>
												<li><em>4대보험</em><span>
													<c:if test="${view.INSURANCE1_YN eq 'Y'}">
													산재보험<c:if test="${view.INSURANCE2_YN eq 'Y' or view.INSURANCE3_YN eq 'Y' or view.INSURANCE4_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.INSURANCE2_YN eq 'Y'}">
													고용보험<c:if test="${view.INSURANCE3_YN eq 'Y' or view.INSURANCE4_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.INSURANCE3_YN eq 'Y'}">
													건강보험<c:if test="${view.INSURANCE4_YN eq 'Y'}">,</c:if>
													</c:if>
													<c:if test="${view.INSURANCE4_YN eq 'Y'}">
													국민연금 
													</c:if>
												</span></li>
												<li><em>지역</em><span>대전시 ${view.GUGUN} ${view.DONGRI}</span></li>
											</ul>
										</dd>
									</dl>
								</div>
								<div class="infoAreaRight">
									<dl>
										<dt>기업정보</dt>
										<dd>
											<ul>
												<li><em>회사명</em><span>
													<c:if test="${not empty view.COMPANY_NAME}">${view.COMPANY_NAME}</c:if>
													<c:if test="${empty view.COMPANY_NAME}">&nbsp;</c:if>
												</span></li>
												<li><em>대표자명</em><span>
													<c:if test="${not empty view.COMPANY_CEO_NAME}">${view.COMPANY_CEO_NAME}</c:if>
													<c:if test="${empty view.COMPANY_CEO_NAME}">&nbsp;</c:if>
												</span></li>
												<li><em>업종</em><span>
													<c:if test="${not empty view.COMPANY_SECTORS}">${view.COMPANY_SECTORS}</c:if>
													<c:if test="${empty view.COMPANY_SECTORS}">&nbsp;</c:if>
												</span></li>
												<li><em>근로자수</em><span>남자: ${view.PERSON1}명 / 여자: ${view.PERSON2}명</span></li>
												<li><em>주소</em><span>${view.ADDR1}&nbsp;${view.ADDR2}</span></li>
												<li><em>홈페이지</em><span><a href="http://${view.COMPANY_DOMAIN}" class="homeGo" target="_blank">${view.COMPANY_DOMAIN}</a></span></li>
											</ul>
										</dd>
									</dl>
								</div>
							</div>
						</div>
						<div class="commView type03">
							<h4>상세내용</h4>
							<div class="textInfo">
								<p>${view.VIEW_CONTENT}</p>
							</div>
						</div>
						<div class="commView type03">
							<h4>연락처</h4>
							<div class="textInfo">
								<p>${view.MANAGER_TEL}</p>
							</div>
						</div>
						<div class="btnArea">
							<a href="javascript:goList();" class="btnTypeBasic sizeM"><span>목록보기</span></a>
						</div>

						<!-- <div class="prevNext type02">
							<p class="prev"><b>이전글 : </b><a href="#">함께 일하신분을 찾습니다.</a></p>
							<p class="next"><b>다음글 : </b><a href="#">함께 일하신분을 찾습니다.</a></p>
						</div> -->
>>>>>>> refs/heads/202204
					</div>