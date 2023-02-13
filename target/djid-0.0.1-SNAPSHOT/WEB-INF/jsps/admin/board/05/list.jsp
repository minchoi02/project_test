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
	
	$('#check_drop').click(function () {
		if ( $("input[name=check_seq]:checked").length < 1){
			alert("1개 이상 선택해주세요.");
			return;
		}
		
		if(confirm("선택한 글을 모두 삭제하시겠습니까?")){
			$("#frm_search_title").val($("#search_title").val());
			$("#frm_search_value").val($("#search_value").val());
			
			$("#seq").val(seq);
			$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/check_del.do");
			$("#frm").submit();
		}
	});
	
	// 체크 박스 모두 체크
	$("#checkAll").click(function() {
		if($("#checkAll").is(":checked")){
			$("input[name=check_seq]:checkbox").each(function() {
				$(this).prop("checked", true);
			});
		}else{
			$("input[name=check_seq]:checkbox").each(function() {
				$(this).prop("checked", false);
			});
		}		
	});
	
});

function goView(seq){
	
	$("#seq").val(seq);
	$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/board_view.do");
	$("#frm").submit();
}

</script>
<div id="contents_bg">
	
		<div class="con_tit">
			${menu.menuname}
		</div>
 
		<div class="conBox">
		
		<div class="inputArea disB">
					<form name="searchForm" id="searchForm" method="post" action="board_list.do">
						<select id="search_name" name="search_name" title="검색하기" style="width:100px;">
			              <option value="title" <c:if test="${bean.search_name eq 'title' }">selected=selected</c:if>>제목</option>
			            </select>
			            <input type="text" id="search_value" name="search_value" class="serch_box" value="${bean.search_value }" style="width:150px;"/>
						<span class="button01" id="btnSearch" style="margin-right: 25px;" ><a href="javascript:search();">검색</a></span>
					</form>
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
									<form action="/admin/${bean.menuno}/${bean.board_name}/board_insert.do" name="frm" id="frm" method="post">
									<input type="hidden" name="search_name" id="search_name" value="${bean.search_name}" />
									<input type="hidden" name="search_value" id="search_value" value="${bean.encodeSV}" />
									<input type="hidden" name="page" id="page" value="${bean.page}" />
									<input type="hidden" name="seq" id="seq" value="" />
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="5%" />
											<col width="*" />
											<col width="10%" />
											<col width="13%" />
											<col width="13%" />
											<col width="13%" />
											<col width="6%" />
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkbox" name="checkAll" id="checkAll"></th>
												<th>행사명</th>
												<th>작성자</th>
												<th>시작일</th>
												<th>마감일</th>
												<th>등록일</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty list}">
													<tr>
														<td colspan="7" style="text-align:center;">등록된 글이 없습니다.</td>
													</tr>
												</c:if>
												<c:if test="${!empty list}">
													<c:forEach var="listA" items="${list}">
														<tr>
															<td><input type="checkbox" name="check_seq" id="check_seq${listA.SEQ}" value="${listA.SEQ}"></td>
															<td onclick="goView('${listA.SEQ}');" style="text-align: left;">${listA.TITLE}</td>
															<td onclick="goView('${listA.SEQ}');" style="text-align: center;">${listA.NAME}</td>
															<td onclick="goView('${listA.SEQ}');" style="text-align: center;"><fmt:formatDate value="${listA.SDATE}" pattern="yyyy-MM-dd" /></td>
															<td onclick="goView('${listA.SEQ}');" style="text-align: center;"><fmt:formatDate value="${listA.EDATE}" pattern="yyyy-MM-dd" /></td>
															<td onclick="goView('${listA.SEQ}');" style="text-align: center;"><fmt:formatDate value="${listA.REG_DATE}" pattern="yyyy-MM-dd" /></td>															
															<td onclick="goView('${listA.SEQ}');" style="text-align: center;">${listA.HIT}</td>
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
												<span class="button01"><a href="#none" id="check_drop">선택삭제</a></span>
												<span class="button01"><a href="/admin/${bean.menuno}/${bean.board_name}/board_write.do">글쓰기</a></span>
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