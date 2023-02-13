<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script language='javascript'>
	$(document).ready(function() {
		/* $("#calbase a").hover(function(){
			var tPosX = event.clientX-12;
			var tPosY = event.clientY;
			if($(this).attr("id") == '5'){
				tPosX = event.clientX-50;
			}else if($(this).attr("id") == '6'){
				tPosX = event.clientX-150;
			}
			$(this).find('#viewContent').css({
				"top" : tPosY,
				"left" : tPosX,
				"display" : "block"
			});
		},
		function(){
			$(this).find('#viewContent').css({
				"display" : "none"
			});
		});
		 */
		
/* 		$('.event_td').fancybox({
			'width'			:	'1022px',
			'padding'		: 	'0',
			'margin'	    :   0,
			'transitionIn'	:	'elastic',
			'transitionOut'	:	'elastic',
			'auto'			: false,
			'type' 			: 	'iframe',
			afterShow : function() {
				$(".fancybox-close").css('background','url(/assets/common/images/fancy_closeBtn.png) no-repeat');
				$(".fancybox-close").css({'width':'55px','height':'17px','top':'74px','right':'-68px'});
		    } 
		}); */


		 
		 
	});
	
	function goYearMonth(){
		var year_month = $("#year_month").val();
		var year = year_month.split(":")[0];
		var month = year_month.split(":")[1];
		
		location.href = "?year="+year+"&month="+month;
	}
	
	function okFinish(date){
		location.href = "/admin/005/setting/ok_finish.do?date="+date+"&year=${year}&month=${month}";	
	}
	
	function cancelFinish(date){
		location.href = "/admin/005/setting/cancel_finish.do?date="+date+"&year=${year}&month=${month}";
	}
</script>
<STYLE type="text/css">
td {
	font-size: 9pt;
}

#yyyymm b {
	font-size : 150%;
}

#calbase #calweek {
	height: 25px;
	text-align: center;
	background-color: #e6e4e6;
}

#calbase #calcont {
	margin: 20px;
	height: 80px;
	vertical-align: text-top;
}

#calbase #calcont td {
	width: 14%;
	padding: 5px;
}

#viewContent {
	position: absolute;
	background-color:#ffffff; 
	border:solid 1px #d0d0d0; 
	width:150px; 
	height:90px; 
	padding:5px; 
	display: none;
	word-break:break-all;
}
</STYLE>
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
		
		<div class="conBox">

					<table align="center" width="265"  style="height:100px;" cellpadding="2" cellspacing="1">
						<tr id="yyyymm">
							<td align="center"><a href="?year=${preYear}&month=${preMonth}">${preYear}년${preMonth}월</a>
								<b>&nbsp;${year}년&nbsp;${month}월&nbsp;</b> 
								<a href="?year=${nextYear}&month=${nextMonth}">${nextYear}년${nextMonth}월</a>
							</td>
						</tr>
						<tr>
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy" var="now_year" /> 
							<td style="text-align: center;">
								<select name="year_month" id="year_month" onchange="goYearMonth();">
									<c:forEach var="year_list" begin="2008" end="${now_year + 2}" step="1">
										<c:forEach var="month_list" begin="1" end="12" step="1">
											<%-- <c:if test="${year_month ne '2008' and month_list ne '1'}"> --%>
												<option value="${year_list}:${month_list}" <c:if test="${year_list eq year and month_list eq month}">selected</c:if>>${year_list}년 ${month_list}월</option>
											<%-- </c:if> --%>
										</c:forEach>
									</c:forEach>
									
								</select>
							</td>
						</tr>
					</table>
					
					<table class="tbl" align="center" style="text-align:left;" width="98%" cellpadding="0" cellspacing="1"	border="1" bgcolor="#cccccc" id="calbase">
						<tr id="calweek">
							<td><font color="red">일</font></td>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td><font color="blue">토</font></td>
						</tr>
						<tr id='calcont' style="text-align:left;">
							${viewCal}
						</tr>
					</table>
				
			</div>
		</div>
	</article>