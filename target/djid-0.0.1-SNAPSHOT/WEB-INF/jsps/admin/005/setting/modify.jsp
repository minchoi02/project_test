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

$(document).ready(function(){
	$('#month').change();
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
	    objOption.text = i+1;
	    objOption.value = i+1;
	    
	    objSel.options.add(objOption);
	    
    	var day = "${view.RESERV_DAY}";
    	if((i+1) == Number(day)){
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
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/update.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
							
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
											<input type="text" name="reserv_name" id="reserv_name" value="${view.RESERV_NAME}" style="width:150px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td>
											<input type="password" name="pwd" id="pwd" value="${view.PWD}" style="width:150px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>예약일시</th>
										<td>
											 <select name="year" id="year" style="width:60px;">
												<option value="">년</option>
												<c:forEach begin="2018" end="${toYear+1}" var="year">
													<option value="${year}" <c:if test="${view.RESERV_YEAR eq year}">selected</c:if>>${year}</option>
												</c:forEach>
											</select> -
											<select name="month" id="month" style="width:50px;" onchange="changeDay(this)">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}" <c:if test="${view.RESERV_MONTH eq month}">selected</c:if>>${month }</option>
												</c:forEach>
											</select> -
											<select name="day" id="day" style="width:50px;">
												<option value="">일</option>
											</select>&nbsp;&nbsp;
											<select name="hour" id="hour" style="width:50px;">
												<option value="">시</option>
												<c:forEach begin="00" end="23" var="hour" varStatus="status">
													<option value="${hour}" <c:if test="${view.RESERV_HOUR eq hour}">selected</c:if>>${hour}</option>
												</c:forEach>
											</select> :
											<select name="minute" id="minute" style="width:50px;">
												<option value="">분</option>
												<c:forEach begin="00" end="50" step="10" var="minute" varStatus="status">
													<option value="${minute}" <c:if test="${view.RESERV_MINUTE eq minute}">selected</c:if>>${minute}</option>
												</c:forEach>
											</select>&nbsp;
										</td>
									</tr>
									<tr>
										<th>탑승자 이름</th>
										<td>
											<input type="text" name="pass_name" id="pass_name" value="${view.PASS_NAME}" style="width:150px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>탑승장소</th>
										<td>
											<input type="text" name="s_place" id="s_place" value="${view.S_PLACE}" style="width:150px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>도착장소</th>
										<td>
											<input type="text" name="e_place" id="e_place" value="${view.E_PLACE}" style="width:150px;" maxlength="15" size="15"> 
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td>
											<input type="text" name="tel1" id="tel1" value="${view.TEL1}" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="tel2" id="tel2" value="${view.TEL2}" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="tel3" id="tel3" value="${view.TEL3}" style="width:50px;" maxlength="6" size="6"> 
										</td>
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="updateBtn" >수정 완료</a></span>
								<span class="button02" id="btnSearch" ><a href="view.do?seq=${view.SEQ}&board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_title=${bean.search_title}&search_value=${bean.search_value}</c:if>">취소</a></span>
							</div>
							<!-- </p> -->
						
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${bean.seq }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
				</form>
			</div>
		</div>
<script type="text/javascript">

$(document).ready(function() {
	
	var board_name = "${bean.board_name}";

	$("#updateBtn").click(function() {
		
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
		
		if(confirm('수정하시겠습니까?')){
			$("#frm").submit();
		}
		
	});
	

	
});	

</script>		
	