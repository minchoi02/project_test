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
		$("#searchForm").prop("action", "/${bean.menu}/${bean.menu_sub}/list.do");
		$('#searchForm').submit();
	});
	
	$('input[name="search_value"]').keydown(function() {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	        $("#btnSearch").click();
	    }
	});
	
});

function goView(seq){
	
	$("#seq").val(seq);
	$("#frm").attr("action", "/${bean.menu}/${bean.menu_sub}/view.do");
	$("#frm").submit();
}

</script>
					<div class="contsArea disabledPersons">
						<div class="tabMenu num2">
							<div>
								<div class="btnTab <c:if test="${menu.menu_num_sub_sub eq '01'}">on</c:if>"><a href="/federation/g_3_1/list.do"><span>사진</span></a></div>
								<div class="btnTab <c:if test="${menu.menu_num_sub_sub eq '02'}">on</c:if>"><a href="/federation/g_3_2/list.do"><span>영상</span></a></div>
							</div>
						</div>
						<form name="searchForm" id="searchForm" method="post">
							<div class="searchTypeBoard">
								<div class="srchInnerBox">
									<select id="search_name" name="search_name" title="검색유형 선택">
										<option value="title" <c:if test="${bean.search_name eq 'title' }">selected=selected</c:if>>제목</option>
			              				<option value="content" <c:if test="${bean.search_name eq 'content' }">selected=selected</c:if>>내용</option>
									</select>
									<input type="text" id="search_value" name="search_value" value="${bean.search_value }" placeholder="내용을 입력해 주세요" title="검색할 내용">
									<button type="button" class="btnTypeBasic" id="btnSearch">
										<span>검색</span>
									</button>
								</div>
							</div>
						</form>
						<!-- list -->
						
						<form name="frm" id="frm" method="post">
							<input type="hidden" name="search_name" value="${bean.search_name}" />
							<input type="hidden" name="search_value" value="${bean.search_value}" />
							<input type="hidden" name="page" id="page" value="${bean.page}" />
							<input type="hidden" name="seq" id="seq" value="" />
						
						
							<div class="photoBalleryList">
								<ul>
									<c:forEach var="listA" items="${list}">
										<li>
											<a href="javascript:goView('${listA.SEQ}');">
												<p class="img">
													<img src="/upload/${listA.THUM_IMG}" alt="${listA.TITLE} 글 대문 사진" onerror='this.src="/assets/user/images/common/noimg.png"'>
													<c:if test="${bean.board_name eq 'movie'}">
														<span>영상</span>
													</c:if>
												</p>
												<div>
													<p>${listA.TITLE}</p>
													<span><fmt:formatDate value="${listA.REG_DATE}" pattern="yyyy-MM-dd" /></span>  /  <span>조회수 : ${listA.HIT}</span>
												</div>
											</a>
										</li>
									</c:forEach>
									<c:if test="${empty list}">
										<li>&nbsp;</li>
										<li style="text-align: center;">등록된 글이없습니다.</li>
										<li>&nbsp;</li>
									</c:if>
								</ul>
							</div>
							<!--//list -->
							
							${navi}
						
						</form>
					</div>