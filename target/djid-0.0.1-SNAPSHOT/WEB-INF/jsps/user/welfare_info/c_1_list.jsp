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
		$("#searchForm").prop("action", "/welfare_info/c_1/list.do");
		$('#searchForm').submit();
	});

});

</script>

<div class="contsArea welfareInfo">
	<p class="textParaList">전국 복지 뉴스ㆍ이슈 정보를 알려드립니다.</p>
	<form name="searchForm" id="searchForm" method="post">
		<div class="searchTypeBoard">
			<div class="searchTypeNews">
				<input type="text" name="search_content" id="search_content" value="${bean.search_content}" placeholder="검색하실 기사제목을 입력해 주세요" title="검색할 기사제목">
				<button type="button" class="btnTypeBasic" id="btnSearch"><span>검색</span></button>
			</div>
		</div>
	</form>
	<form name="frm" id="frm" method="post">
		<input type="hidden" name="page" id="page" value="${bean.page}" />
		<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
		<input type="hidden" name="seq" id="seq" value="" />
		<input type="hidden" name="search_channel" id="frm_search_channel" value="${bean.search_channel}" />
		<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
		<!-- list -->
		<div class="thumbnailList">
			<ul>
				<c:forEach var="list" items="${list}">
					<li> <a href="${list.LINK}" target="_blank">
						<p class="img"><img src="${list.THUM_IMG}" alt="${list.THUM_ALT}" style="width: 180px; height: 122px;"></p>
						<div> <strong>${list.TITLE}</strong>
							<p>
								<c:choose>
									<c:when test="${fn:length(list.DESCRIPTION) > 150}"> ${fn:substring(list.DESCRIPTION, 0, 150)}... </c:when>
									<c:otherwise> ${list.DESCRIPTION} </c:otherwise>
								</c:choose>
							</p>
							<span>
							<fmt:formatDate value="${list.PUB_DATE}" pattern="yyyy-MM-dd HH:mm" />
							</span> </div>
						</a> </li>
				</c:forEach>
			</ul>
		</div>
		<!--//list --> 
		
		${navi}
	</form>
</div>
