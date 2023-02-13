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
		if(confirm("선택한 뉴스를 모두 삭제하시겠습니까?")){
			$("#frm_search_content").val($("#search_content").val());
			$("#frm_search_channel").val($("#search_channel").val());
			
			$("#seq").val(seq);
			$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/check_drop.do");
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

	$("#frm_search_content").val($("#search_content").val());
	$("#frm_search_channel").val($("#search_channel").val());
	
	$("#seq").val(seq);
	$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/view.do");
	$("#frm").submit();
}

function configSave(){
	$.ajax({
	    url: "/admin/004/news_config_update.do",
	    data: "keyword_1="+encodeURI($("#keyword_1").val())+"&keyword_2="+encodeURI($("#keyword_2").val())+"&keyword_3="+encodeURI($("#keyword_3").val()),
	    type : "GET",
	    error: function(){
	    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
	    },
	    success: function(){
			alert("저장 되었습니다.");
	    }
	});	
}

</script>
<div id="contents_bg">
	
		<div class="con_tit">
			${menu.menuname}
		</div>
 
		<div class="conBox">
		
				<div class="T_basic">
						<div style="width:600px;margin:0 auto;">
						
						<table class="tbl" style="width:600px;border:0;">
								<colgroup>
									<col width="18%" />
									<col width="22%" />
									<col width="23%" />
									<col width="23%" />
									<col width="14%" />
								</colgroup>
								<tbody>
									<tr>
										<th><b>키워드 설정</b></th>
										<td>
											<input type="text" name="keyword_1" id="keyword_1" value="${config.KEYWORD_1}" style="width:100%;min-width:100%;max-width:100%;" />
										</td>										
										<td>
											<input type="text" name="keyword_2" id="keyword_2" value="${config.KEYWORD_2}" style="width:100%;min-width:100%;max-width:100%;" />
										</td>
										<td>
											<input type="text" name="keyword_3" id="keyword_3" value="${config.KEYWORD_3}" style="width:100%;min-width:100%;max-width:100%;" />
										</td>				
										<td colspan="4" style="text-align: center;" onmouseover="this.style.backgroundColor='white';">
											<span class="button01"><a href="javascript:configSave();" >저장</a></span>
										</td>
									</tr>
								</tbody>
							</table>
							
						<form name="searchForm" id="searchForm" method="post" action="/admin/004/news/list.do">
							<input type="hidden" name="page" id="page" value="${bean.page}"/>
							<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}"/>
							<table class="tbl" style="width:600px;border:0; margin-top: 10px;">
								<colgroup>
									<col width="15%" />
									<col width="28%" />
									<col width="15%" />
									<col width="28%" />
									<col width="14%" />
								</colgroup>
								<tbody>
									<tr>
										<th><b>채널</b></th>
										<td>
										<select name="search_channel" id="search_channel" style="width:100%;min-width:100%;" >
											<option value="">전체</option>
											<option value="NAVER" <c:if test="${bean.search_channel eq 'NAVER'}">selected</c:if>>네이버</option>
											<option value="ABLE" <c:if test="${bean.search_channel eq 'ABLE'}">selected</c:if>>에이블뉴스</option>
											<%-- <option value="ADMIN" <c:if test="${bean.search_channel eq 'ADMIN'}">selected</c:if>>관리자</option> --%>
										</select>
										</td>										
										<th><b>검색어</b></th>
										<td>
										<input type="text" name="search_content" id="search_content" value="${bean.search_content}" style="width:100%;min-width:100%;max-width:100%;" />
										</td>				
										<td colspan="4" style="text-align: center;" onmouseover="this.style.backgroundColor='white';"><span class="button01" id="btnSearch" ><a href="#none" >검색</a></span></td>					
									</tr>									
								</tbody>
							</table>
						</form>
							
							
						</div>
					</div>
					
					
				
			
					<table border="0" style="width:100%;margin-top:15px;">
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
									
									<input type="hidden" name="search_channel" id="frm_search_channel" value="${bean.search_channel}" />
									<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
									
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="6%" />
											<col width="18%" />
											<col width="*" />
											<col width="9%" />
											<col width="14%" />
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkbox" name="checkAll" id="checkAll"></th>
												<th>썸네일</th>
												<th>기사 제목</th>
												<th>채널</th>
												<th>등록 일시</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${empty list}">
												<tr>
													<td colspan="5" style="text-align:center;">등록된 뉴스가 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}">
													<tr>
            											<td><input type="checkbox" name="check_seq" id="check_seq${list.SEQ}" value="${list.SEQ}"></td>
            											<td onclick="window.open('${list.LINK}');" style="text-align: center;">
            												<img src="${list.THUM_IMG}" alt="${list.THUM_ALT}" style="width: 150px; height: 102px;" onerror="this.src='/assets/user/images/new_default.png'" />
            											</td>
            											<td onclick="window.open('${list.LINK}');" style="text-align: left;">
            												<span style="font-size: 14px;"><b>${list.TITLE}</b></span>
            												<br/>
            												${list.DESCRIPTION}
            											</td>
            											<td onclick="window.open('${list.LINK}');" style="text-align: center;">${list.CHANNEL}</td>
														<td>
															<fmt:formatDate value="${list.PUB_DATE}" pattern="yyyy-MM-dd HH:mm" />
															<br/><br/>
															<span class="button01"><a href="#none" id="thum_update" onclick="goView('${list.SEQ}')">썸네일 등록</a></span>
														</td>
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
												<span class="button01"><a href="#none" id="check_drop">선택삭제</a></2pan>
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