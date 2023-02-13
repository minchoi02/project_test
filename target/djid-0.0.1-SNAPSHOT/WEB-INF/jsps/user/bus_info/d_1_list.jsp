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
	
	$("#okBtn").click(function() {

		if( !valCheck('pwd', '비밀번호를 입력해주세요.') ) return;
		
		$.ajax({
		    url: '/bus_info/d_1/pwdConfirm.do?seq='+$('#seq').val()+'&pwd='+$('#pwd').val(),
		    type : "POST",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(r){
		    	if(r == 1){
		    		$("#viewFrm").prop("action", "/bus_info/d_1/view.do");
		    		$("#viewFrm").submit();
		    	}else if(r == 0){
		    		alert('비밀번호가 일치하지 않습니다.');
		    		$("#pwd").val("");
		    		$('#pwd').focus();
		    	}else{
		    		alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
		    	}
		    }
		});
		
		
	});
	
	$("#canBtn").click(function() {
		$("#viewFrm")[0].reset();
	});
	
});
function moveMonth(year, month){
	location.href = "/bus_info/d_1/list.do?year="+year+"&month="+month;
}

function goReserv(year, month, day){
	$("#year").val(year);
	$("#month").val(month);
	$("#day").val(day);
	
	$("#reservFrm").prop("action", "/bus_info/d_1/write.do");
	$("#reservFrm").submit();
}

function goViewPop(seq){
	$("#seq").val(seq);
	layerPopUp(this, '#layerPassword');
}
</script>
<form name="reservFrm" id="reservFrm" method="post">
	<input type="hidden" name="year" id="year" value="" />
	<input type="hidden" name="month" id="month" value="" />
	<input type="hidden" name="day" id="day" value="" />
</form>


					<div class="contsArea trafficInformation">
						<p class="textParaList">탑승을 원하시는 날짜 하루전에만 예약이 가능합니다.</p>
						<div class="calendarHead">
							<button type="button" class="prev" onclick="moveMonth('${preYear}', '${preMonth}');">이전달</button>
							<strong>${year}년 ${month}월</strong>
							<button type="button" class="next" onclick="moveMonth('${nextYear}', '${nextMonth}');">다음달</button>
						</div>
						<div class="calendarWrap">
							<table class="calendarTable">
								<caption>해피콜 예약 달력입니다. 날짜별 예약 목록 및 예약가능, 마감여부를 표시합니다.</caption>
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

						<div class="btnArea">
							<a href="/bus_info/d_1_1.do" class="btnTypePrev sizeM"><span>전단계로 이동</span></a>
						</div>
					</div>

<form name="viewFrm" id="viewFrm" method="post">
	<input type="hidden" name="seq" id="seq" />
	<!-- 레이어 팝업 -->
	<div class="layerWrapper confirmPassword" id="layerPassword">
		<div class="layerBox">
			<div class="layerHeader">
				<strong>비밀번호 확인</strong>
			</div>
			<div class="layerBody">
				<div class="innerBox">
					<p class="formbox">
						<label for="pwd">예약시 입력한 비밀번호를 입력해주세요.</label><input type="password" name="pwd" id="pwd" title="비밀번호 입력">
					</p>
					<div class="btnWrapper">
						<button type="button" id="okBtn" class="btnTypeBasic colorBlueGray sizeS"><span>확인</span></button>
						<button type="button" id="canBtn" class="btnTypeBasic colorGray sizeS btnCloseLayer"><span>취소</span></button><!-- 닫기기능 .btnCloseLayer -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //레이어팝업 -->
</form>