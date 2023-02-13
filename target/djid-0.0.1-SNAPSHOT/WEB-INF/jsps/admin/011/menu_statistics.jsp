<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<style>
	.sta_tbl tr td { text-align:left; }
</style>
<script type="text/javascript">

$(document).ready(function(){
	
	$('.datepicker').datepicker({
		changeMonth:true,
		changeYear:true,
		dateFormat:'yy-mm-dd',
		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});


	$('#btnSearch').click(function () {
		var startDate = $.trim($('input[name="startDate"]').val());
		var endDate = $.trim($('input[name="endDate"]').val());
		if(startDate == ''){
			alert('검색기간을 입력하세요');
			$('input[name="startDate"]').focus();
			return false;
		}
		if(endDate == ''){
			alert('검색기간을 입력하세요');
			$('input[name="endDate"]').focus();
			return false;
		}
		if(startDate > endDate){
			alert('종료 날짜가 시작날짜보다 앞에 있습니다.');
			$('input[name="endDate"]').focus();
			return false;
		}
		$('#searchForm').submit();
	});
	
});

function goView(seq){

	$("#frm_search_title").val($("#search_title").val());
	$("#frm_search_value").val($("#search_value").val());
	
	$("#seq").val(seq);
	$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/view.do");
	$("#frm").submit();
}

</script>
<div id="contents_bg">
	
		<div class="con_tit">
			${menu.menuname}
		</div>
 
		<div class="conBox">
		
				<div class="T_basic">
						<div style="width:600px;margin:0 auto;">
						<form name="searchForm" id="searchForm" method="post" action="/admin/011/menu/menu_statistics.do">
							<table class="tbl" style="width:600px;border:0">
								<colgroup>
									<col width="20%" />
									<col width="80%" />
								</colgroup>
								<tbody>
									<tr>
										<th><b>기간검색</b></th>
										<td>
											<input type="text" name="startDate" id="startDate" class="datepicker" value="${startDate}" readonly="readonly" style="width:190px;" />
											-
											<input type="text" name="endDate" id="endDate" class="datepicker" value="${endDate}" readonly="readonly" style="width:190px;" />
										<span class="button01" id="btnSearch" ><a href="#none" >검색</a></span>
										</td>									
									</tr>
								</tbody>
							</table>
						</form>
						</div>
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
											<td align="left">
												<c:if test="${(startDate ne null) && (startDate ne '') }">
													기간 : ${startDate } ~ ${endDate }
												</c:if>
											</td>
										</tr>
									</table>
									<form action="/admin/${bean.menuno}/${bean.board_name}/insert.do" name="frm" id="frm" method="post">
									<input type="hidden" name="page" id="page" value="${bean.page}" />
									<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
									
									<input type="hidden" name="seq" id="seq" value="" />
									
									<input type="hidden" name="search_title" id="frm_search_title" value="${bean.search_title}" />
									<input type="hidden" name="search_value" id="frm_search_value" value="${bean.search_value}" />
									
									<table class="tbl sta_tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="50%" />
											<col width="50%" />
										</colgroup>
										<thead>
											<tr>
												<th>메뉴명</th>
												<th>접속 수</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${empty list}">
												<tr>
													<td colspan="2" style="text-align:center;">등록된 메뉴 내역이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}">
													<tr>
            											<td>
            												${list.MENU2} > ${list.MENU3}
            												<c:if test="${list.MENU4 ne null }"> > ${list.MENU4 }</c:if>
            												<c:if test="${list.MENU5 ne null }"> > ${list.MENU5 }</c:if>
            											</td>
														<td>
															<img src="/images/common/graph.royalblue.gif" style="width:${370*(list.CNT / total_cnt)}px; height:20px;" />
															${list.CNT}
															<c:choose>
																<c:when test="${total_cnt > 0 }">
																	(<fmt:formatNumber value="${(list.CNT / total_cnt)*100 }" pattern=".00" />%)
																</c:when>
																<c:otherwise>
																	(0.00%)
																</c:otherwise>
															</c:choose>
														</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
									</form>

								</div>
							</td>
						</tr>
					</table>
			</div> 
		</div>