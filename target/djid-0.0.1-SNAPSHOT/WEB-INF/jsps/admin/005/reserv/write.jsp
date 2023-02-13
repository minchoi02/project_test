<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!-- <script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script> -->
<!-- <script type="text/javascript" src="/assets/editor/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script type="text/javascript" src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>
<script>
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
	    objOption.text = i+1;
	    objOption.value = i+1;
	    
	    objSel.options.add(objOption);
	    
    	var day = "<fmt:formatDate value="${view.RESRV_DATE}" pattern="dd" />";
    	if((i+1) == day){
    	objOption.setAttribute("selected","selected");
    	}
	  }
}
</script>
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
	
		<div class="conBox">
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/insert.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
							
							<table  class="tbv" style="margin-top: 10px;"  summary="글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="15%" >
									<col width="75%" >
								</colgroup>
								<tbody>
									<tr>
										<th>예약자 이름</th>
										<td>
											<input type="text" name="reserv_name" id="reserv_name" value="" style="width:150px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td>
											<input type="password" name="pwd" id="pwd" value="" style="width:150px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>예약일시</th>
										<td>
											 <select name="year" id="year" style="width:60px;">
												<option value="">년</option>
												<c:forEach begin="2018" end="${toYear+1}" var="year">
													<option value="${year}">${year}</option>
												</c:forEach>
											</select> -
											<select name="month" id="month" style="width:50px;" onchange="changeDay(this)">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}">${month }</option>
												</c:forEach>
											</select> -
											<select name="day" id="day" style="width:50px;">
												<option value="">일</option>
											</select>&nbsp;&nbsp;
											<select name="hour" id="hour" style="width:50px;">
												<option value="">시</option>
												<c:forEach begin="00" end="23" var="hour" varStatus="status">
													<option value="${hour}">${hour}</option>
												</c:forEach>
											</select> :
											<select name="minute" id="minute" style="width:50px;">
												<option value="">분</option>
												<c:forEach begin="00" end="50" step="10" var="minute" varStatus="status">
													<option value="${minute}">${minute}</option>
												</c:forEach>
											</select>&nbsp;
										</td>
									</tr>
									<tr>
										<th>탑승자 이름</th>
										<td>
											<input type="text" name="pass_name" id="pass_name" value="" style="width:150px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>탑승장소</th>
										<td>
											<input type="text" name="s_place" id="s_place" value="" style="width:150px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>도착장소</th>
										<td>
											<input type="text" name="e_place" id="e_place" value="" style="width:150px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td>
											<input type="text" name="tel1" id="tel1" value="" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="tel2" id="tel2" value="" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="tel3" id="tel3" value="" style="width:50px;" maxlength="6" size="6"> 
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
											<select id="person_cnt" name="person_cnt" title="탑승인원 선택" style="width: 100px;">
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
									<tr>
										<th>상태</th>
										<td>
											<select id="confirm_yn" name="confirm_yn" title="상태값 선택" style="width: 100px;">
												<option value="확인중">확인중</option>
												<option value="예약완료">예약완료</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="insertBtn" >등록 완료</a></span>
								<span class="button02" id="btnSearch" ><a href="list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
						
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${bean.seq }">
					<input type="hidden" id="search_name" name="search_name" value="${bean.search_name }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
				</form>
			</div>
		</div>
<script type="text/javascript">

$(document).ready(function() {

	var board_name = "${bean.board_name}";

	$("#insertBtn").click(function() {
		
		if( !valCheck('reserv_name', '예약자 이름을 입력해주세요.') ) return;
		if( !valCheck('pwd', '비밀번호를 입력해주세요.') ) return;
		if( !valCheck('year', '예약일시를 선택해주세요.') ) return;
		if( !valCheck('month', '예약일시를 선택해주세요.') ) return;
		if( !valCheck('day', '예약일시를 선택해주세요.') ) return;
		if( !valCheck('hour', '예약일시를 선택해주세요.') ) return;
		if( !valCheck('minute', '예약일시를 선택해주세요.') ) return;
		if( !valCheck('pass_name', '예약자 이름을 입력해주세요.') ) return;
		if( !valCheck('s_place', '탑승장소를 입력해주세요.') ) return;
		if( !valCheck('e_place', '도착장소를 입력해주세요.') ) return;
		if( !valCheck('tel1', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel3', '연락처를 입력해주세요.') ) return;
		
		if(confirm('등록하시겠습니까?')){
			$("#frm").submit();
		}
		
	});
	
});	

</script>		
	