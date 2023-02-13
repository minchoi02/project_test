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
		$("#searchForm").prop("action", "/welfare_info/daejeon_news/list.do");
		$('#searchForm').submit();
	});

});

function goView(seq){
	
	$("#seq").val(seq);
	$("#frm").attr("action", "/${bean.menu}/${bean.menu_sub}/view.do");
	$("#frm").submit();
}

</script>

<div class="contsArea welfareInfo">
	<p class="textParaList">대전광역시의 복지 뉴스ㆍ이슈 정보를 알려드립니다.</p>
	<form name="searchForm" id="searchForm" method="post">
		<input type="hidden" name="search_name" id="search_name" value="title" />
		<div class="searchTypeBoard">
			<div class="searchTypeNews">
				<input type="text" name="search_value" id="search_value" value="${bean.search_value}" placeholder="검색하실 기사제목을 입력해 주세요" title="검색할 기사제목">
				<button type="button" class="btnTypeBasic" id="btnSearch"><span>검색</span></button>
			</div>
		</div>
	</form>
	<form name="frm" id="frm" method="post">
		<input type="hidden" name="search_name" value="${bean.search_name}" />
		<input type="hidden" name="search_value" value="${bean.search_value}" />
		<input type="hidden" name="page" id="page" value="${bean.page}" />
		<input type="hidden" name="seq" id="seq" value="" />
		<!-- list -->
		<div class="thumbnailList">
			<ul>
				<c:forEach var="list" items="${list}">
					<li> <a href="javascript:goView('${list.SEQ}');">
						<p class="img"><img src="/upload/${list.THUM_IMG}" alt="${list.TITLE} 대문사진" style="width: 180px; height: 122px;"></p>
						<div> <strong>${list.TITLE}</strong>
							<p>
								<c:choose>
									<c:when test="${fn:length(list.LIST_CONTENT) > 150}"> ${fn:substring(list.LIST_CONTENT, 0, 150)}... </c:when>
									<c:otherwise> ${list.LIST_CONTENT} </c:otherwise>
								</c:choose>
							</p>
							<span>
							<fmt:formatDate value="${list.REG_DATE}" pattern="yyyy-MM-dd HH:mm" />
							</span> </div>
						</a> </li>
				</c:forEach>
				<c:if test="${empty list}">
					<li style="height: 0px; padding: 50px 30px; text-align: center;">등록된 글이 없습니다.</li>
				</c:if>
			</ul>
		</div>
		<!--//list --> 
		
		${navi}
	</form>
</div>
