<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>
$(document).ready(function(){
	$('#month').change();
	
	$("#insertBtn").click(function() {
		
		if( !valCheck('reserv_name', '예약자 이름을 입력해주세요.') ) return;
		if( !valCheck('pwd', '비밀번호를 입력해주세요.') ) return;
		/* if( !valCheck('year', '예약일시를 선택해주세요.') ) return;
		if( !valCheck('month', '예약일시를 선택해주세요.') ) return;
		if( !valCheck('day', '예약일시를 선택해주세요.') ) return; */
		if( !valCheck('hour', '예약일시를 선택해주세요.') ) return;
		if( !valCheck('minute', '예약일시를 선택해주세요.') ) return;
		if( !valCheck('pass_name', '탑승자 이름을 입력해주세요.') ) return;
		if( !valCheck('s_place', '탑승장소를 입력해주세요.') ) return;
		if( !valCheck('e_place', '도착장소를 입력해주세요.') ) return;
		if( !valCheck('tel1', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel3', '연락처를 입력해주세요.') ) return;
		
		if(confirm('예약하시겠습니까?')){
			$("#frm").prop("action", "/bus_info/d_1/insert.do");
			$("#frm").submit();
		}
		
	});
	
	$("#cancelBtn").click(function() {
		location.href = "/bus_info/d_1/list.do?year=${bean.year}&month=${bean.month}";
	});
});

function changeDay(mm){
	var mon = mm.value;
	var last_day = 30;
	var objSel = document.getElementById("day");
	
	$("#day").find("option").remove();
	var optionObj = document.createElement("option");     
	optionObj.text = "일";
	optionObj.value = "";
    objSel.options.add(optionObj);
	
	if(mon == 1 || mon == 3 || mon == 5 || mon == 7 || mon == 8 ||  mon == 10 ||  mon == 12 ){
		last_day = 31;
	}else if( mon == 2 ){
		last_day = 28;
	}
	
	 for (var i=0; i < last_day; i++){
	    var objOption = document.createElement("option");        
	    objOption.text = (i+1)+"일";
	    objOption.value = i+1;
	    
	    objSel.options.add(objOption);
	    
    	var day = "${bean.day}";
    	if((i+1) == day){
    	objOption.setAttribute("selected","selected");
    	}
	  }
}
</script>
	<form name="frm" id="frm" method="post" enctype="multipart/form-data" accept-charset="utf-8">
	
		<input type="hidden" name="reservYear" id="reservYear" value="${bean.year}" />
		<input type="hidden" name="reservMonth" id="reservMonth" value="${bean.month}" />
		<input type="hidden" name="reservDay" id="reservDay" value="${bean.day}" />
		
					<div class="contsArea trafficInformation">
						<p class="textParaList">탑승을 원하시는 날짜 하루전에만 예약이 가능합니다.</p>
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>해피콜 예약하기이며 예약자이름,비밀번호,예약일시,탑승자이름,탑승장소,도착장소,연락처 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width: 170px">
									<col style="width: 759px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="reserv_name">예약자 이름</label></th>
										<td><input type="text" name="reserv_name" id="reserv_name" value="" maxlength="15" size="15" class="wid40"></td>
									</tr>
									<tr>
										<th scope="row"><label for="pwd">비밀번호</label></th>
										<td><input type="password" name="pwd" id="pwd" value="" maxlength="15" size="15" class="wid40"></td>
									</tr>
									<tr>
										<th scope="row">예약일시</th>
										<td>
											<%-- <select name="year" id="year">
												<option value="">년</option>
												<c:forEach begin="2018" end="${toYear+1}" var="year">
													<option value="${year}" <c:if test="${bean.year eq year}">selected</c:if>>${year}년</option>
												</c:forEach>
											</select>
											<select name="month" id="month" title="예약 월" onchange="changeDay(this)">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}" <c:if test="${bean.month eq month}">selected</c:if>>${month }월</option>
												</c:forEach>
											</select>
											<select name="day" id="day" title="예약 일">
												<option value="">일</option>
											</select> --%>
											<input type="hidden" name="year" id="year" value="${bean.year}" />
											<input type="hidden" name="month" id="month" value="${bean.month}" />
											<input type="hidden" name="day" id="day" value="${bean.day}" />
											${bean.year}년											
											${bean.month}월											
											${bean.day}일
											&nbsp;&nbsp;
											<select name="hour" id="hour" title="예약 시">
												<option value="">시</option>
												<c:forEach begin="09" end="18" var="hour" varStatus="status">
													<option value="${hour}" <c:if test="${bean.hour eq hour}">selected</c:if>>${hour}시</option>
												</c:forEach>
											</select>
											<select name="minute" id="minute" title="예약 분">
												<option value="">분</option>
												<c:forEach begin="00" end="50" step="10" var="minute" varStatus="status">
													<option value="${minute}" <c:if test="${bean.minute eq minute}">selected</c:if>>${minute}분</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="pass_name">탑승자 이름</label></th>
										<td><input type="text" name="pass_name" id="pass_name" value="" maxlength="15" size="15" class="wid40"></td>
									</tr>
									<tr>
										<th scope="row"><label for="s_place">탑승장소</label></th>
										<td><input type="text" name="s_place" id="s_place" value="" maxlength="15" size="15" class="wid40"></td>
									</tr>
									<tr>
										<th scope="row"><label for="e_place">도착장소</label></th>
										<td><input type="text" name="e_place" id="e_place" value="" maxlength="15" size="15" class="wid40"></td>
									</tr>
									<tr>
										<th scope="row">연락처</th>
										<td>
											<select id="tel1" name="tel1" title="휴대폰 앞자리 선택">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
											</select>																						
											<input type="text" class="phone" name="tel2" id="tel2" value="" title="전화번호 가운데 4자리" maxlength="6" size="6">
											<input type="text" class="phone" name="tel3" id="tel3" value="" title="전화번호 마지막 4자리" maxlength="6" size="6">
										</td>
									</tr>
									<tr>
										<th scope="row">장애등급</th>
										<td>
											<select id="grade" name="grade" title="장애등급 선택" style="width: 200px;">
												<option value="지체 1급">지체 1급</option>
												<option value="지체 2급">지체 2급</option>
												<option value="뇌병변 1급">뇌병변 1급</option>
												<option value="뇌병변 2급">뇌병변 2급</option>
											</select>											
										</td>
									</tr>
									<tr>
										<th scope="row">탑승인원</th>
										<td>
											<select id="person_cnt" name="person_cnt" title="탑승인원 선택">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>명							
										</td>
									</tr>
									<tr>
										<th scope="row">수급여부</th>
										<td>
											<input type="radio" name="supply_yn" id="supply_y" value="Y" checked="checked"> <label for="supply_y">수급</label>
											&nbsp;
											<input type="radio" name="supply_yn" id="supply_n" value="N"> <label for="supply_n">미수급</label>						
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btnArea center">
							<button type="button" id="insertBtn" class="btnTypeBasic sizeM"><span>예약완료</span></button>
							<button type="button" id="cancelBtn" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
						</div>
					</div>
	</form>
	
	