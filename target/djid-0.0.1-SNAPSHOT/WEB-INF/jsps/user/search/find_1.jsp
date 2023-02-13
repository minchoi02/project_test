<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>

<script>
$(document).ready(function() {
	$('#innerSearchBtn').click(function () {
		var keyword = $("#inner_keyword").val();
		if(keyword == ""){
			alert("검색어를 입력해주세요.");  $("#inner_keyword").focus(); return;
		} 
		if(keyword.length < 2){
			alert("검색어는 두 글자 이상 입력해주세요.");  $("#inner_keyword").focus(); return;				
		}
		$("#searchForm").prop("action", "/search/find_1.do");
		$("#searchForm").submit();
	});
});

function thebogi(gubun){
	$("#gubun").val(gubun);
	$("#thebogiFrm").prop("action", "/search/find_2.do");
	$("#thebogiFrm").submit();
}

</script>

<form name="thebogiFrm" id="thebogiFrm" method="post">
	<input type="hidden" name="keyword" id="sss" value="${bean.keyword}" />
	<input type="hidden" name="gubun" id="gubun" value="" />
</form>

		<!-- contents -->
		<div class="container searchArea"><!-- .searchArea 통합검색 -->
			<div class="innerBox">

				<!-- 검색박스 -->
				<div class="searchPageTop">
					<form name="searchForm" id="searchForm" method="post">
						<div class="topSearch">
							<fieldset>
								<legend>통합검색</legend>
								<div class="searchBoxSet">
									<input type="text" name="keyword" id="inner_keyword" value="${bean.keyword}" title="검색어 입력" placeholder="검색어를 입력하세요"><button type="button" id="innerSearchBtn"><em>통합검색</em></button>
								</div>
								<div class="popularSearches">
									<strong>인기검색어</strong>
									<c:forEach var="list" items="${menu.list}">
										<a href="javascript:goTotalSearch('${list.KEYWORD}')">${list.KEYWORD}</a>
									</c:forEach>
								</div>
							</fieldset>
						</div>
					</form>
				</div>
				<!-- //검색박스 -->

				<!-- 검색결과 -->
				<div class="searchResult">
					<div class="srchLeftBox">
						<p class="searchWord">'<span>${bean.keyword}</span>'검색어로 '<em>${totalCount}</em>'개의 결과를 찾았습니다.</p>
						
						<c:if test="${not empty menuTop3List}">
							<div class="subjectBox">
								<dl>
									<dt>메뉴  <em>(${menuCount}개)</em></dt>
									<dd>
										<c:forEach var="list" items="${menuTop3List}">
											<p class="menuSubject">
												<strong class="topic">
													<c:choose>
														<c:when test="${empty list.MENU4 and empty list.MENU5}">
															${list.MENU3}
														</c:when>
														<c:when test="${empty list.MENU5}">
															${list.MENU4}
														</c:when>
														<c:when test="${not empty list.MENU5}">
															${list.MENU5}
														</c:when>
													</c:choose>
												</strong>
												<a href="${list.LINK}" target="_blank">
													<c:if test="${not empty list.MENU1}">
														${list.MENU1}
													</c:if>
													<c:if test="${not empty list.MENU2}">
														&gt; ${list.MENU2}
													</c:if>
													<c:if test="${not empty list.MENU3}">
														&gt; ${list.MENU3}
													</c:if>
													<c:if test="${not empty list.MENU4}">
														&gt; ${list.MENU4}
													</c:if>
													<c:if test="${not empty list.MENU5}">
														&gt; ${list.MENU5}
													</c:if>
												</a>
											</p>
										</c:forEach>
									</dd>
								</dl>
	
								<a href="javascript:thebogi('menu');" class="moreResult"><em class="hidden">메뉴</em>검색결과 더보기</a><!-- .hidden 에 검색결과 주제(dt) 포함필수 -->
							</div>
						</c:if>
						
						<c:set var="stStrong" value="<strong>" />						
						<c:set var="edStrong" value="</strong>" />
						<c:set var="replaceKeyword" value="${stStrong}${bean.keyword}${edStrong}" />
						
						<c:if test="${not empty welfareTop3List}">
							<div class="subjectBox">
								<dl>
									<dt>맞춤형 복지정보<em>(${welfareCount}개)</em></dt>
									<dd>
										<c:forEach var="list" items="${welfareTop3List}">
											<a href="${list.LINK}" target="_blank">
												<span>${list.TITLE}</span>
												<p>
													<c:choose>
														<c:when test="${fn:length(list.CONTENT) > 150 }">
															${fn:replace(fn:substring(list.CONTENT, 0, 150), bean.keyword, replaceKeyword)}...
														</c:when>
														<c:otherwise>
															${fn:replace(list.CONTENT, bean.keyword, replaceKeyword)}
														</c:otherwise>
													</c:choose>
												</p>
											</a>
										</c:forEach>
									</dd>
								</dl>
	
								<a href="javascript:thebogi('welfare');" class="moreResult"><em class="hidden">맞춤형 복지정보</em>검색결과 더보기</a><!-- .hidden 에 검색결과 주제(dt) 포함필수 -->
							</div>
						</c:if>

						<c:if test="${not empty facilityTop3List}">
							<div class="subjectBox">
								<dl>
									<dt>우리지역 복지시설 <em>(${facilityCount}개)</em></dt>
									<dd>
										<c:forEach var="list" items="${facilityTop3List}">
											<a href="/welfare_facility/b_1/view.do?seq=${list.SEQ}" target="_blank">
												<span>${list.NAME}</span>
												<p>
													<span class="divide">기관(시설)명 ${list.NAME}</span>
													<span class="divide">지역 ${list.AREA} </span>
													<span class="divide">연락처</span>
													<span class="divide">Tel. ${list.TEL}</span>
													<span class="divide">Fax. ${list.FAX}</span>
													<span class="divide">
													Homepage ${list.DOMAIN}
													주소 ${list.ADDR1} ${list.ADDR2}
													</span>
												</p>
											</a>
										</c:forEach>	
									</dd>
								</dl>
	
								<a href="javascript:thebogi('facility');" class="moreResult"><em class="hidden">우리지역 복지시설</em>검색결과 더보기</a><!-- .hidden 에 검색결과 주제(dt) 포함필수 -->
							</div>
						</c:if>

						<c:if test="${not empty boardTop3List}">
							<div class="subjectBox">
								<dl>
									<dt>게시판<em>(${boardCount}개)</em></dt>
									<dd>
										<c:forEach var="list" items="${boardTop3List}">
											<a href="${list.LINK}?seq=${list.SEQ}" target="_blank">
												<span>${list.TITLE}</span>
												<p>
													<c:choose>
														<c:when test="${fn:length(list.CONTENT) > 150 }">
															${fn:replace(fn:substring(list.CONTENT, 0, 150), bean.keyword, replaceKeyword)}...
														</c:when>
														<c:otherwise>
															${fn:replace(list.CONTENT, bean.keyword, replaceKeyword)}
														</c:otherwise>
													</c:choose>
												</p>
											</a>
										</c:forEach>
									</dd>
								</dl>
	
								<a href="javascript:thebogi('board');" class="moreResult"><em class="hidden">게시판</em>검색결과 더보기</a><!-- .hidden 에 검색결과 주제(dt) 포함필수 -->
							</div>
						</c:if>

					</div>
					<div class="srchRightBox">
						<dl class="rankingBox">
							<dt>인기검색어</dt>
							<dd>
								<ul class="ranking">
									<c:forEach var="list" items="${searchList}" varStatus="status">
										<li>
											<strong>${status.count}</strong>
											<span><a href="javascript:goTotalSearch('${list.KEYWORD}')">${list.KEYWORD}</a></span>
										</li>
									</c:forEach>
								</ul>
							</dd>
						</dl>

						<p class="bannerImgBox"><a href="javascript:alert('준비중입니다');" target="blank" title="새창"><img src="/assets/user/images/bnr_srch_right01.png" alt="대전장애인단체총연합회"></a></p>
						<p class="bannerImgBox"><a href="javascript:alert('준비중입니다');" target="blank" title="새창"><img src="/assets/user/images/bnr_srch_right02.png" alt="요양간호사 모집-대전시 성모병원에서 요양간호사를 모집합니다."></a></p>
					</div>
				</div>
				<!-- //검색결과 -->

			</div>
		</div>
		<!-- //contents -->