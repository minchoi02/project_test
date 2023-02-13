<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="/assets/user/js/lib/bootstrap-datepicker.js"></script>
<script src="/assets/user/js/lib/bootstrap-datepicker.kr.min.js"></script>
	
<script>
var document_etc = false;

$(document).ready(function(){
	
	$(".onlynum").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/g,"") );} );
	
	$(".cal").datepicker({
		changeMonth: true,
		changeYear: true,
		format: "yyyy-mm-dd",
		language: "kr",
	});

	$('#area1_gugun_seq').change(function () {
		
		var gugun = $(this).val();
		
		$.ajax({
		    url: "/common/gugun_for_dongri.do?gugun_seq=" + gugun,
		    type : "GET",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(list){		    	
		    	var html = "";
		    	for (var i = 0; i < list.length; i++) {
					var seq = list[i].SEQ;
					var code_desc = list[i].CODE_DESC;
					html += "<option value='"+seq+"'>" + code_desc + "</option>";
				}
		    	$("#area1_dongri_seq").html(html);
		    }
		});
	});
	
	$('#area2_gugun_seq').change(function () {
		
		var gugun = $(this).val();
		
		$.ajax({
		    url: "/common/gugun_for_dongri.do?gugun_seq=" + gugun,
		    type : "GET",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(list){		    	
		    	var html = "";
		    	for (var i = 0; i < list.length; i++) {
					var seq = list[i].SEQ;
					var code_desc = list[i].CODE_DESC;
					html += "<option value='"+seq+"'>" + code_desc + "</option>";
				}
		    	$("#area2_dongri_seq").html(html);
		    }
		});
	});
	
	$('#area1_gugun_seq').change();
	$('#area2_gugun_seq').change();
	
	
});


function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("zip_cd").value = data.zonecode;
           /*  document.getElementById("zip_cd2").value = data.postcode2; */
            document.getElementById("addr1").value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}

function changeDay(mm){
	var mon = mm.value;
	var last_day = 30;
	var objSel = document.getElementById("birth_day");
	
	$("#birth_day").find("option").remove();
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
	    
    	var day = "${view.BIRTH_DAY}";
    	if((i+1) == day){
    	objOption.setAttribute("selected","selected");
    	}
	  }
}


var edu_tr_cnt = 1;

function edu_plus(){
	if(edu_tr_cnt >= 5){
		alert("최대 5개 까지만 입력 가능합니다.");
		return;
	}
	edu_tr_cnt++;
	var html = ' <div id="edu_tr'+ edu_tr_cnt +'">';
		html+= ' <label for="edu_name'+edu_tr_cnt+'">학교명(기관명)</label>';
		html+= ' <input type="text" name="edu_name" id="edu_name'+edu_tr_cnt+'" value="" style="width: 120px;" class="wid140px" maxlength="50" size="50" >';
		html+= ' <div class="datePickerInput">';
		html+= ' <div class="input-group date">';
		html+= ' <input type="text" class="cal" name="edu_sdate" id="edu_sdate'+edu_tr_cnt+'" style="width: 90px;" title="입학 월 일" readonly="readonly"><button type="button" class="btnDatePicker"><em>달력</em></button>';
		html+= ' <i>~</i>';
		html+= ' <input type="text" class="cal" name="edu_edate" id="edu_edate'+edu_tr_cnt+'" style="width: 90px;" title="졸업 월 일" readonly="readonly"><button type="button" class="btnDatePicker"><em>달력</em></button>';
		html+= ' </div>';
		html+= ' </div>';
		html+= ' <input type="text" class="wid170px" name="edu_content" id="edu_content'+edu_tr_cnt+'" style="width: 140px;" placeholder="교육/훈련내용" maxlength="50" size="50" title="교육/훈련내용 입력">';
		html+= ' <input type="text" class="wid140px" name="edu_etc" id="edu_etc'+edu_tr_cnt+'" style="width: 110px;" placeholder="기타" maxlength="50" size="50" title="기타 사항 입력">';
		html+= ' <button type="button" class="plus" onclick="edu_plus();">+</button>';
		html+= ' <button type="button" class="minus" onclick="edu_minus();">-</button>';
		html+= ' </div>';
	$("#edu_tbody").append(html);
	$(document).find(".cal").removeClass('hasDatepicker').datepicker({
		changeMonth: true,
		changeYear: true,
		format: "yyyy-mm-dd",
		language: "kr",
	});
}

function edu_minus(){
	if(edu_tr_cnt == 1){
		alert("더 이상 삭제할 수 없습니다.");
		return;
	}
	$("#edu_tr"+edu_tr_cnt).remove();
	edu_tr_cnt--;
}


var career_tr_cnt = 1;

function career_plus(){
	if(career_tr_cnt >= 5){
		alert("최대 5개 까지만 입력 가능합니다.");
		return;
	}
	career_tr_cnt++;
	var html = ' <div id="career_tr'+ career_tr_cnt +'">';
		html+= ' <label for="career_name'+career_tr_cnt+'">사업체명</label>';
		html+= ' <input type="text" name="career_name" id="career_name'+career_tr_cnt+'" value="" style="width: 120px;" class="wid140px" maxlength="50" size="50" >';
		html+= ' <div class="datePickerInput">';
		html+= ' <div class="input-group date">';
		html+= ' <input type="text" class="cal" name="career_sdate" id="career_sdate'+career_tr_cnt+'" style="width: 90px;" title="근무 시작 월 일" readonly="readonly"><button type="button" class="btnDatePicker"><em>달력</em></button>';
		html+= ' <i>~</i>';
		html+= ' <input type="text" class="cal" name="career_edate" id="career_edate'+career_tr_cnt+'" style="width: 90px;" title="근무 종료 월 일" readonly="readonly"><button type="button" class="btnDatePicker"><em>달력</em></button>';
		html+= ' </div>';
		html+= ' </div>';
		html+= ' <input type="text" class="wid170px" name="career_content" id="career_content'+career_tr_cnt+'" style="width: 140px;" placeholder="담당직무" maxlength="50" size="50" title="담당직무 입력">';
		html+= ' <input type="text" class="wid140px" name="career_etc" id="career_etc'+career_tr_cnt+'" style="width: 110px;" placeholder="급여" maxlength="50" size="50" title="급여 입력">';
		html+= ' <button type="button" class="plus" onclick="career_plus();">+</button>';
		html+= ' <button type="button" class="minus" onclick="career_minus();">-</button>';
		html+= ' </div>';
	$("#career_tbody").append(html);
	$(document).find(".cal").removeClass('hasDatepicker').datepicker({
		changeMonth: true,
		changeYear: true,
		format: "yyyy-mm-dd",
		language: "kr",
	});
}

function career_minus(){
	if(career_tr_cnt == 1){
		alert("더 이상 삭제할 수 없습니다.");
		return;
	}
	$("#career_tr"+career_tr_cnt).remove();
	career_tr_cnt--;
}

function validateEmail(email) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}

</script>
<form name="frm" id="frm" action="/admin/${bean.menuno}/${bean.board_name}/insert.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
	
	<input type="hidden" id="email" name="email" value="" />
	
					<div class="contsArea welfareInfo">
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>구직정보 등록이며 성명,생년월일,주소,장애유형 및 등급 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width: 150px">
									<col style="width: 314px">
									<col style="width: 150px">
									<col style="width: 315px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="fname">성명</label></th>
										<td><input type="text" name="name" id="fname" class="wid95" maxlength="20" size="20"></td>
										<th scope="row"><font class="fco01">* </font>생년월일</th>
										<td>
											<select name="birth_year" id="birth_year" title="모집기간 시작년도" class="date">
												<option value="">년</option>
												<c:forEach begin="1935" end="${toYear}" var="year">
													<option value="${year}">${year}</option>
												</c:forEach>
											</select>
											<select name="birth_month" id="birth_month" onchange="changeDay(this)" title="모집기간 시작월" class="date">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}">${month }</option>
												</c:forEach>
											</select>
											<select name="birth_day" id="birth_day" title="모집기간 시작일" class="date">
												<option value="">일</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="zip_cd">주소</label></th>
										<td colspan="3" class="address">
											<input type="text" name="zip_cd" id="zip_cd" readonly="readonly">
											<button type="button" class="btnTypeBasic colorGray" onclick="DaumPostcode();"><span>주소검색</span></button>
											<p>
												<input type="text" name="addr1" id="addr1" title="상세주소1" readonly="readonly">
												<input type="text" name="addr2" id="addr2" title="상세주소2">
											</p>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>연락처</th>
										<td>
											<input type="text" name="tel1" id="tel1" value="" style="width:70px;" maxlength="6" size="6" title="연락처 앞자리">
											-
											<input type="text" name="tel2" id="tel2" value="" style="width:70px;" maxlength="6" size="6" title="연락처 가운데 자리">
											-
											<input type="text" name="tel3" id="tel3" value="" style="width:70px;" maxlength="6" size="6" title="연락처 뒷자리">
										</td>
										<th scope="row">이메일</th>
										<td>
											<input type="text" name="email1" id="email1" value="" style="width:100px;" title="이메일 아이디"> 
											@
											<input type="text" name="email2" id="email2" value="" style="width:120px;" title="이메일 뒷자리">
										</td>
									</tr>
									<tr>
										<th scope="row">장애유형 및 등급</th>
										<td colspan="3" class="formStyle01">
											<div>
												<font class="fco01">* </font>
												<label for="kind_seq">장애유형</label>
												<select name="kind_seq" id="kind_seq" class="wid160px">
													<c:forEach var="list" items="${selType4List}" varStatus="status">
														<option value="${list.SEQ}">${list.CODE_DESC}</option>
													</c:forEach>
												</select>
												
												<label for="occur_date">장애발생시기</label>
												<input type="text" name="occur_date" id="occur_date" value="" class="wid160px" maxlength="50" size="50">
											</div>
											<div>
												<font class="fco01">* </font>
												<label for="level_seq">장애급수</label>
												<select name="level_seq" id="level_seq" class="wid160px">
													<c:forEach var="list" items="${selType5List}" varStatus="status">
														<option value="${list.SEQ}">${list.CODE_DESC}</option>
													</c:forEach>
												</select>
												<label for="regist_date">장애등록일</label>
												<input type="text" name="regist_date" id="regist_date" value="" class="wid160px" maxlength="50" size="50">
											</div>
											<div>
												<label for="part">장애부위</label>
												<input type="text" name="part" id="part" value="" class="wid160px" maxlength="50" size="50">
												<label for="cure">진료/치료</label>
												<input type="text" name="cure" id="cure" value="" class="wid160px" maxlength="50" size="50">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="formStyle02">
							<div id="edu_tbody">
								<div>
									<label for="edu_name1"><font class="fco01">* </font>학교명(기관명)</label>
									<input type="text" name="edu_name" id="edu_name1" value="" style="width: 120px;" class="wid140px" maxlength="50" size="50" >
									<div class="datePickerInput">
										<div class="input-group date">
											<input type="text" class="cal" name="edu_sdate" id="edu_sdate1" style="width: 90px;" title="입학 월 일" readonly="readonly"><button type="button" class="btnDatePicker"><em>달력</em></button>
											<i>~</i>
											<input type="text" class="cal" name="edu_edate" id="edu_edate1" style="width: 90px;" title="졸업 월 일" readonly="readonly"><button type="button" class="btnDatePicker"><em>달력</em></button>
										</div>
									</div>
									<input type="text" class="wid170px" name="edu_content" id="edu_content1" style="width: 140px;" placeholder="교육/훈련내용" maxlength="50" size="50" title="교육/훈련내용 입력">
									<input type="text" class="wid140px" name="edu_etc" id="edu_etc1" style="width: 110px;" placeholder="기타" maxlength="50" size="50" title="기타 사항 입력">
									<button type="button" class="plus" onclick="edu_plus();">+</button>
									<button type="button" class="minus" onclick="edu_minus();">-</button>
								</div>
							</div>
							<div id="career_tbody">
								<div id="career_tr">
									<label for="career_name1">사업체명</label>
									<input type="text" name="career_name" id="career_name1" value="" style="width: 120px;" class="wid140px" maxlength="50" size="50" >
									<div class="datePickerInput">
										<div class="input-group date">
											<input type="text" class="cal" name="career_sdate" id="career_sdate1" style="width: 90px;" title="근무 시작 월 일" readonly="readonly"><button type="button" class="btnDatePicker"><em>달력</em></button>
											<i>~</i>
											<input type="text" class="cal" name="career_edate" id="career_edate1" style="width: 90px;" title="근무 종료 월 일" readonly="readonly"><button type="button" class="btnDatePicker"><em>달력</em></button>
										</div>
									</div>
									<input type="text" class="wid170px" name="career_content" id="career_content1" style="width: 140px;" placeholder="담당직무" maxlength="50" size="50" title="담당직무 입력">
									<input type="text" class="wid140px" name="career_etc" id="career_etc1" style="width: 110px;" placeholder="급여" maxlength="50" size="50" title="급여 입력">
									<button type="button" class="plus" onclick="career_plus();">+</button>
									<button type="button" class="minus" onclick="career_minus();">-</button>
								</div>
							</div>
						</div>

						<p class="contsSubTit tyBullet">생활적용능력</p>
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>생활적용능력이며 외모/청결상태, 일상생활, 이동능력(교통), 의사소통, 대인관계, 자격 및 면허,기타 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width: 150px">
									<col style="width: 779px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="life_ability1">외모/청결상태</label></th>
										<td><input type="text" name="life_ability1" id="life_ability1" class="wid85"></td>
									</tr>
									<tr>
										<th scope="row"><label for="life_ability2">일상생활</label></th>
										<td><input type="text" name="life_ability2" id="life_ability2" class="wid85"></td>
									</tr>
									<tr>
										<th scope="row"><label for="life_ability3">이동능력(교통)</label></th>
										<td><input type="text" name="life_ability3" id="life_ability3" class="wid85"></td>
									</tr>
									<tr>
										<th scope="row"><label for="life_ability4">의사소통</label></th>
										<td><input type="text" name="life_ability4" id="life_ability4" class="wid85"></td>
									</tr>
									<tr>
										<th scope="row"><label for="life_ability5">대인관계</label></th>
										<td><input type="text" name="life_ability5" id="life_ability5" class="wid85"></td>
									</tr>
									<tr>
										<th scope="row"><label for="life_ability6">자격 및 면허</label></th>
										<td><input type="text" name="life_ability6" id="life_ability6" class="wid85"></td>
									</tr>
									<tr>
										<th scope="row"><label for="life_ability7">기타</label></th>
										<td><input type="text" name="life_ability7" id="life_ability7" class="wid85"></td>
									</tr>
								</tbody>
							</table>
						</div>

						<p class="contsSubTit tyBullet">취업욕구</p>
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>취업욕구이며 희망직종, 취업조건, 자기소개, 취업고려사항 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width: 150px">
									<col style="width: 779px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">희망직종</th>
										<td class="formStyle03">
											<div>
												<label for="sectors"><b><font class="fco01">* </font>직종</b></label>
												<input type="text" name="sectors" id="sectors" class="wid160px">
												<b><font class="fco01">* </font>응답</b>												
												<input type="radio" name="response" id="response1" value="본인" checked="checked">
												<label for="response1">본인</label>												
												<input type="radio" name="response" id="response2" value="보호자">
												<label for="response2">보호자</label>
											</div>
											<div>
												<label for="reason"><b><font class="fco01">* </font>사유</b></label>
												<input type="text" name="reason" id="reason" value="" class="wid160px"/>
												<b><font class="fco01">* </font>성별</b>												
												<input type="radio" name="sex" id="sex1" value="남자" checked="checked">
												<label for="sex1">남자</label>
												<input type="radio" name="sex" id="sex2" value="여자">
												<label for="sex2">여자</label>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">취업조건</th>
										<td class="formStyle04">
											<div>
												<label for="area1_gugun_seq"><b><font class="fco01">* </font>근무지역 1지망</b></label>
												<select name="area1_gugun_seq" id="area1_gugun_seq" style="width: 70px; min-width:70px;">
													<c:forEach var="list" items="${selType6List}" varStatus="status">
														<option value="${list.SEQ}">${list.CODE_DESC}</option>
													</c:forEach>
												</select>
												<select name="area1_dongri_seq" id="area1_dongri_seq" style="width: 80px; min-width:80px;" title="근무지역1지망 동/리 선택">
													<option value="">선택</option>
												</select>
												<label for="salary"><b><font class="fco01">* </font>희망임금</b></label>
												월 <input type="text" name="salary" id="salary" value="" placeholder="숫자" class="wid160px onlynum"/> 만원
												
											</div>
											<div>
												<label for="area2_gugun_seq"><b><font class="fco01">* </font>근무지역 2지망</b></label>
												<select name="area2_gugun_seq" id="area2_gugun_seq" style="width: 70px; min-width:70px;">
													<c:forEach var="list" items="${selType6List}" varStatus="status">
														<option value="${list.SEQ}">${list.CODE_DESC}</option>
													</c:forEach>
												</select>
												<select name="area2_dongri_seq" id="area2_dongri_seq" style="width: 80px; min-width:80px;" title="근무지역2지망 동/리 선택">
													<option value="">선택</option>
												</select>
												<b><font class="fco01">* </font>근무시간</b>
												<select name="shour" id="shour" class="date" title="근무시간 시작 시">
													<option value="">시</option>
													<c:forEach var="hour" begin="0" end="23" step="1">
														<option value="${hour}">${hour}</option>
													</c:forEach>
												</select>
												<select name="sminute" id="sminute" title="근무시간 시작 분" class="date">
													<option value="">분</option>
													<c:forEach var="minute" begin="0" end="59" step="1">
														<option value="${minute}">${minute}</option>
													</c:forEach>
												</select>
												<i>~</i>&nbsp;
												<select name="ehour" id="ehour" title="근무시간 종료 시" class="date">
													<option value="">시</option>
													<c:forEach var="hour" begin="0" end="23" step="1">
														<option value="${hour}">${hour}</option>
													</c:forEach>
												</select>
												<select name="eminute" id="eminute" title="근무시간 종료 분" class="date">
													<option value="">분</option>
													<c:forEach var="minute" begin="0" end="59" step="1">
														<option value="${minute}">${minute}</option>
													</c:forEach>
												</select>
											</div>
											<div>
												<label for="emp"><b>고용형태</b></label>
												<input type="text" name="emp" id="emp" value="" class="wid160px"/>
												&nbsp;
												<b><font class="fco01">* </font>기숙여부</b>
												<span>
													<input type="radio" name="dormitory_yn" id="dormitory1" value="Y" checked="checked">
													<label for="dormitory1">유</label>
													<input type="radio" name="dormitory_yn" id="dormitory2" value="N">
													<label for="dormitory2">무</label>
												</span>
											</div>
										</td>
									</tr>

									<tr>
										<th scope="row"><font class="fco01">* </font><label for="content1">자기소개</label></th>
										<td><textarea name="content1" id="content1" placeholder="자기소개 내용을 입력해주세요."></textarea></td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="content2">취업고려사항</label></th>
										<td><textarea name="content2" id="content2" placeholder="취업고려사항 내용을 입력해주세요."></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="btnArea center">
							<button type="button" class="btnTypeBasic sizeM" id="insertBtn"><span>등록완료</span></button>
							<button type="button" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
						</div>

					</div>
</form>

<script>



$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	$("#insertBtn").click(function() {

		if( !valCheck('fname', '성명을 입력해주세요.') ) return;
		if( !valCheck('birth_year', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('birth_month', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('birth_day', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('zip_cd', '우편번호를 입력해주세요.') ) return;
		if( !valCheck('addr1', '주소를 입력해주세요.') ) return;
		if( !valCheck('addr2', '상세주소를 입력해주세요.') ) return;
		if( !valCheck('tel1', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel3', '연락처를 입력해주세요.') ) return;

		if( $("#email1").val() != "" && $("#emai2").val() != "" ){
			var email = $("#email1").val() + "@" + $("#email2").val();
			if(!validateEmail(email)){
				alert("이메일 형식이 맞지 않습니다."); return;
			}
			$("#email").val( $("#email1").val() + "@" + $("#email2").val() );
		}
		 
		
		
		// 학력사항 검증 Start
		var edu_name_flag = false;
		$("input[name=edu_name]").each(function(index){
			//alert($("input[name=edu_name]").length + "개 중 " + index + "개");
			var edu_name = $("input[name=edu_name]").eq(index).val();
			var edu_sdate = $("input[name=edu_sdate]").eq(index).val();
			var edu_edate = $("input[name=edu_edate]").eq(index).val();
			var edu_content = $("input[name=edu_content]").eq(index).val();
			var edu_etc = $("input[name=edu_etc]").eq(index).val();
			//if(edu_name==""||edu_sdate==""||edu_edate==""||edu_content==""||edu_etc==""){
			if(edu_name==""||edu_sdate==""||edu_edate==""||edu_content==""){
				edu_name_flag = true;	
			}			
			return;
		});
		if(edu_name_flag){
			alert("학력 사항을 모두 입력해주세요.");
			$("input[name=edu_name]").eq(0).focus();
			return;
		}		
		// 학력사항 End
		
		if( !valCheck('sectors', '직종을 입력해주세요.') ) return;
		if( !valCheck('reason', '사유를 입력해주세요.') ) return;
		if( !valCheck('salary', '희망임금을 입력해주세요.') ) return;
		if( !valCheck('shour', '근무시간을 입력해주세요.') ) return;
		if( !valCheck('sminute', '근무시간을 입력해주세요.') ) return;
		if( !valCheck('ehour', '근무시간을 입력해주세요.') ) return;
		if( !valCheck('eminute', '근무시간을 입력해주세요.') ) return;
		if( !valCheck('content1', '자기소개를 입력해주세요.') ) return;
		if( !valCheck('content2', '취업시 고려사항을 입력해주세요.') ) return;
				
		if(confirm('등록하시겠습니까?')){
			$("#frm").prop("action", "/welfare_info/c_2_2/insert.do");
			$("#frm").submit();	
		}
		
	});
	

});	

</script>		