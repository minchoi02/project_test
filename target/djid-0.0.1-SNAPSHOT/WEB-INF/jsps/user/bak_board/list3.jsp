<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>
$(document).ready(function() {
	
	$(".popup_td").click(function (e) {
		
		$(".calendarPopup").hide();
		var popup_id = $(this).prop("id");
		
		var oWidth = $("#popup"+popup_id).width();
		var oHeight = $("#popup"+popup_id).height();

		// 레이어가 나타날 위치를 셋팅한다.
		var divLeft = e.pageX + 5;
		var divTop = e.pageY + 5;
	   	
	   	$("#popup"+popup_id).css("left",divLeft);
	   	$("#popup"+popup_id).css("top", divTop);
	   	$("#popup"+popup_id).css("position", "absolute");
	   	$("#popup"+popup_id).css("z-index", "999");
	   	$("#popup"+popup_id).show();
	})
	
	$('html').click(function(e) { 
		if(!$(e.target).hasClass("calendarPopup") && !$(e.target).hasClass("popup_td")) {
			$(".calendarPopup").hide();
		}
	});

});
function moveMonth(year, month){
	location.href = "/board/e_2/list.do?year="+year+"&month="+month;
}

function goView(seq){
	$("#seq").val(seq);
	$("#frm").prop("action", "/board/e_2/view.do");
	$("#frm").submit();
}
</script>
<form name="frm" id="frm" method="post">
	<input type="hidden" name="seq" id="seq" value="" />
	<input type="hidden" name="year" id="year" value="${year}" />
	<input type="hidden" name="month" id="month" value="${month}" />
	<input type="hidden" name="day" id="day" value="" />
</form>


					<div class="contsArea trafficInformation">
						<p class="textParaList">교육 및 행사일정입니다.</p>
						<div class="calendarHead">
							<button type="button" class="prev" onclick="moveMonth('${preYear}', '${preMonth}');">이전달</button>
							<strong>${year}년 ${month}월</strong>
							<button type="button" class="next" onclick="moveMonth('${nextYear}', '${nextMonth}');">다음달</button>
						</div>
						<div class="calendarWrap">
							<table class="calendarTable">
								<caption>행사달력이며 날짜별 행사 정보를 제공합니다.</caption>
								<colgroup>
									<col style="width:14.2857%" span="7">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="sun">일</th>
										<th scope="col">월</th>
										<th scope="col">화</th>
										<th scope="col">수</th>
										<th scope="col">목</th>
										<th scope="col">금</th>
										<th scope="col">토</th>
									</tr>
								</thead>
								<tbody>
									<tr id='calcont'>
										${viewCal}
									</tr>
								</tbody>
							</table>
						</div>

					</div>
