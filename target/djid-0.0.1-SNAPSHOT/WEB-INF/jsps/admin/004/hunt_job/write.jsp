<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!-- <script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script> -->
<!-- <script type="text/javascript" src="/assets/editor/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<style>
.ui-datepicker select.ui-datepicker-month{ width:40%; font-size: 13px; }
.ui-datepicker select.ui-datepicker-year{ width:50%; font-size: 13px; }
</style>
<script type="text/javascript">
var document_etc = false;

$(document).ready(function(){
	
	$(".cal").datepicker({
		changeMonth: true,
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달'	
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
	var html = '<tr id="edu_tr'+ edu_tr_cnt +'">';
		html+= '<td><input type="text" name="edu_name" id="edu_name'+edu_tr_cnt+'" value="" style="width:150px;" maxlength="50" size="50"></td>';
		html+= '<td>';
		html+= ' <input type="text" class="cal" name="edu_sdate" id="edu_sdate'+edu_tr_cnt+'" value="" style="width:80px;" readonly="readonly"><img src="/assets/admin/images/cal2.png" width="25px" class="cal" alt="달력"/>';
		html+= ' ~';
		html+= ' <input type="text" class="cal" name="edu_edate" id="edu_edate'+edu_tr_cnt+'" value="" style="width:80px;" readonly="readonly"><img src="/assets/admin/images/cal2.png" width="25px" class="cal" alt="달력"/>';
		html+= '</td>';
		html+= '<td><input type="text" name="edu_content" id="edu_content'+edu_tr_cnt+'" value="" style="width:200px;" maxlength="50" size="50"></td>';
		html+= '<td><input type="text" name="edu_etc" id="edu_etc'+edu_tr_cnt+'" value="" style="width:160px;" maxlength="50" size="50"></td>';
		html+= '<td><input type="button" value="+" onclick="edu_plus();"> <input type="button" value="-" onclick="edu_minus();"></td>';
		html+= "</tr>";
	$("#edu_tbody").append(html);
	$(document).find(".cal").removeClass('hasDatepicker').datepicker();
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
	var html = '<tr id="career_tr'+ career_tr_cnt +'">';
		html+= '<td><input type="text" name="career_name" id="career_name'+career_tr_cnt+'" value="" style="width:150px;" maxlength="50" size="50"></td>';
		html+= '<td>';
		html+= ' <input type="text" class="cal" name="career_sdate" id="career_sdate'+career_tr_cnt+'" value="" style="width:80px;" readonly="readonly"><img src="/assets/admin/images/cal2.png" width="25px" class="cal" alt="달력"/>';
		html+= ' ~';
		html+= ' <input type="text" class="cal" name="career_edate" id="career_edate'+career_tr_cnt+'" value="" style="width:80px;" readonly="readonly"><img src="/assets/admin/images/cal2.png" width="25px" class="cal" alt="달력"/>';
		html+= '</td>';
		html+= '<td><input type="text" name="career_content" id="career_content'+career_tr_cnt+'" value="" style="width:200px;" maxlength="50" size="50"></td>';
		html+= '<td><input type="text" name="career_etc" id="career_etc'+career_tr_cnt+'" value="" style="width:160px;" maxlength="50" size="50"></td>';
		html+= '<td><input type="button" value="+" onclick="career_plus();"> <input type="button" value="-" onclick="career_minus();"></td>';
		html+= "</tr>";
	$("#career_tbody").append(html);
	$(document).find(".cal").removeClass('hasDatepicker').datepicker();
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
<style>
.edu_table tr td{
	text-align: center;
}
.edu_table tr{
	height: 30px;
}
</style>
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
	
		<div class="conBox">
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/insert.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
							
							<input type="hidden" name="email" id="email" value="" />
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">기본정보</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="15%" >
									<col width="25%" >
									<col width="20%" >
									<col width="30%" >
								</colgroup>
								<tbody>
									<tr>
										<th colspan="2"><span style="color: red;">*</span> 성명</th>
										<td>
											<input type="text" name="name" id="fname" value="" style="width: 200px;" maxlength="20" size="20"/>																					
										</td>
										<th><span style="color: red;">*</span> 생년월일</th>
										<td>
											<select name="birth_year" id="birth_year" style="width:60px;">
												<option value="">년</option>
												<c:forEach begin="1930" end="${toYear}" var="year">
													<option value="${year}">${year}</option>
												</c:forEach>
											</select>&nbsp;
											<select name="birth_month" id="birth_month" style="width:50px;" onchange="changeDay(this)">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}">${month }</option>
												</c:forEach>
											</select>&nbsp;
											<select name="birth_day" id="birth_day" style="width:50px;">
												<option value="">일</option>
											</select>&nbsp;																					
										</td>
									</tr>
									<tr>
										<th colspan="2"><span style="color: red;">*</span> 주소</th>
										<td colspan="3">
											<input type="text" name="zip_cd" id="zip_cd" style="width: 100px;" readonly="readonly" />
											<span class="button02" id="btnSearch" ><a href="#none" id="addrBtn" onclick="DaumPostcode();" >주소검색</a></span>
											<br/>
											<input type="text" name="addr1" id="addr1" style="width: 350px; margin-top: 5px;" readonly="readonly"/>											
											<br/>
											<input type="text" name="addr2" id="addr2" style="width: 350px; margin-top: 5px;" maxlength="50" size="50"/>																							
										</td>
									</tr>
									<tr>
										<th colspan="2"><span style="color: red;">*</span> 연락처</th>
										<td>
											<input type="text" name="tel1" id="tel1" value="" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="tel2" id="tel2" value="" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="tel3" id="tel3" value="" style="width:50px;" maxlength="6" size="6">																					
										</td>
										<th>이메일</th>
										<td>
											<input type="text" name="email1" id="email1" value="" style="width:100px;"> 
											@
											<input type="text" name="email2" id="email2" value="" style="width:120px;">
										</td>
									</tr>
									<tr>										
										<th rowspan="3" style="height: 120px;">장애유형<br/>및<br/>등급</th>
										<th><span style="color: red;">*</span> 장애유형</th>
										<td>
											<select name="kind_seq" id="kind_seq" style="width: 200px;">
												<c:forEach var="list" items="${selType4List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
										</td>
										<th>장애발생시기</th>
										<td>
											<input type="text" name="occur_date" id="occur_date" value="" style="width:200px;" maxlength="50" size="50">
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 장애급수</th>
										<td>
											<select name="level_seq" id="level_seq" style="width: 200px;">
												<c:forEach var="list" items="${selType5List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
										</td>
										<th>장애등록일</th>
										<td>
											<input type="text" name="regist_date" id="regist_date" value="" style="width:200px;" maxlength="50" size="50">
										</td>
									</tr>
									<tr>
										<th>장애부위</th>
										<td>
											<input type="text" name="part" id="part" value="" style="width:200px;" maxlength="50" size="50">
										</td>
										<th>진료/치료</th>
										<td>
											<input type="text" name="cure" id="cure" value="" style="width:200px;" maxlength="50" size="50">
										</td>
									</tr>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">학력사항</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv edu_table"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="18%" >
									<col width="27%" >
									<col width="24%" >
									<col width="21%" >
									<col width="10%" >
								</colgroup>
								<tbody id="edu_tbody">
									<tr>
										<th><span style="color: red;">*</span> 학교명(기관명)</th>
										<th>기간</th>
										<th>교육/훈련내용</th>
										<th>기타</th>
										<th>추가/삭제</th>
									</tr>
									<tr>
										<td><input type="text" name="edu_name" id="edu_name1" value="" style="width:150px;" maxlength="50" size="50"></td>
										<td>
											<input type="text" class="cal" name="edu_sdate" id="edu_sdate1" value="" style="width:80px;" readonly="readonly"><img src="/assets/admin/images/cal2.png" width="25px" class="cal" alt="달력"/>
											~
											<input type="text" class="cal" name="edu_edate" id="edu_edate1" value="" style="width:80px;" readonly="readonly"><img src="/assets/admin/images/cal2.png" width="25px" class="cal" alt="달력"/>
										</td>
										<td><input type="text" name="edu_content" id="edu_content1" value="" style="width:200px;" maxlength="50" size="50"></td>
										<td><input type="text" name="edu_etc" id="edu_etc1" value="" style="width:160px;" maxlength="50" size="50"></td>
										<td><input type="button" value="+" onclick="edu_plus();"> <input type="button" value="-" onclick="edu_minus();"></td>
									</tr>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">경력사항</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv edu_table"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="18%" >
									<col width="27%" >
									<col width="24%" >
									<col width="21%" >
									<col width="10%" >
								</colgroup>
								<tbody id="career_tbody">
									<tr>
										<th>사업체명</th>
										<th>기간</th>
										<th>담당직무</th>
										<th>급여</th>
										<th>추가/삭제</th>
									</tr>
									<tr id="career_tr">
										<td><input type="text" name="career_name" id="career_name1" value="" style="width:150px;" maxlength="50" size="50"></td>
										<td>
											<input type="text" class="cal" name="career_sdate" id="career_sdate1" value="" style="width:80px;" readonly="readonly"><img src="/assets/admin/images/cal2.png" width="25px" class="cal" alt="달력"/>
											~
											<input type="text" class="cal" name="career_edate" id="career_edate1" value="" style="width:80px;" readonly="readonly"><img src="/assets/admin/images/cal2.png" width="25px" class="cal" alt="달력"/>
										</td>
										<td><input type="text" name="career_content" id="career_content1" value="" style="width:200px;" maxlength="50" size="50"></td>
										<td><input type="text" name="career_etc" id="career_etc1" value="" style="width:160px;" maxlength="50" size="50"></td>
										<td><input type="button" value="+" onclick="career_plus();"> <input type="button" value="-" onclick="career_minus();"></td>
									</tr>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">생활적용능력</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
										<th>외모/청결상태</th>
										<td>
											<input type="text" name="life_ability1" id="life_ability1" value="" style="width: 500px;"/>
										</td>
									</tr>
									<tr>
										<th>일상생활</th>
										<td>
											<input type="text" name="life_ability2" id="life_ability2" value="" style="width: 500px;"/>
										</td>
									</tr>
									<tr>
										<th>이동능력(교통)</th>
										<td>
											<input type="text" name="life_ability3" id="life_ability3" value="" style="width: 500px;"/>
										</td>
									</tr>
									<tr>
										<th>의사소통</th>
										<td>
											<input type="text" name="life_ability4" id="life_ability4" value="" style="width: 500px;"/>
										</td>
									</tr>
									<tr>
										<th>대인관계</th>
										<td>
											<input type="text" name="life_ability5" id="life_ability5" value="" style="width: 500px;"/>
										</td>
									</tr>
									<tr>
										<th>자격 및 면허</th>
										<td>
											<input type="text" name="life_ability6" id="life_ability6" value="" style="width: 500px;"/>
										</td>
									</tr>
									<tr>
										<th>기타</th>
										<td>
											<input type="text" name="life_ability7" id="life_ability7" value="" style="width: 500px;"/>
										</td>
									</tr>						
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">취업욕구</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="15%" >
									<col width="25%" >
									<col width="20%" >
									<col width="30%" >
								</colgroup>
								<tbody>
									<tr>
										<th rowspan="2">희망직종</th>
										<th><span style="color: red;">*</span> 직종</th>										
										<td>
											<input type="text" name="sectors" id="sectors" value="" style="width: 200px;"/>																					
										</td>
										<th><span style="color: red;">*</span> 응답</th>
										<td>									
											<label for="response1"><input type="radio" name="response" id="response1" value="본인" checked="checked">본인</label>
											<label for="response2"><input type="radio" name="response" id="response2" value="보호자">보호자</label> 																					
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 사유</th>										
										<td>
											<input type="text" name="reason" id="reason" value="" style="width: 200px;"/>																					
										</td>
										<th><span style="color: red;">*</span> 성별</th>
										<td>
											<label for="sex1"><input type="radio" name="sex" id="sex1" value="남자" checked="checked">남자</label>
											<label for="sex2"><input type="radio" name="sex" id="sex2" value="여자">여자</label>																												
										</td>
									</tr>
									<tr>
										<th rowspan="3">취업조건</th>
										<th><span style="color: red;">*</span> 근무지역 1지</th>										
										<td>
											<select name="area1_gugun_seq" id="area1_gugun_seq" style="width: 80px;">
												<c:forEach var="list" items="${selType6List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
											<select name="area1_dongri_seq" id="area1_dongri_seq" style="width: 100px;">
												<option value="">선택</option>
											</select>																					
										</td>
										<th><span style="color: red;">*</span> 희망임금</th>
										<td>
											월 <input type="number" name="salary" id="salary" value="" placeholder="숫자" style="width: 50px;"/> 만원											 																					
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 근무지역 2지</th>										
										<td>
											<select name="area2_gugun_seq" id="area2_gugun_seq" style="width: 80px;">
												<c:forEach var="list" items="${selType6List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
											<select name="area2_dongri_seq" id="area2_dongri_seq" style="width: 100px;">
												<option value="">선택</option>
											</select>																						
										</td>
										<th><span style="color: red;">*</span> 근무시간</th>
										<td>
											<input type="number" name="shour" id="shour" max="23" min="0" placeholder="시" style="width: 50px;"/>
											:
											<input type="number" name="sminute" id="sminute" max="0" min="59" placeholder="분" style="width: 50px;"/>
											~
											<input type="number" name="ehour" id="ehour" max="23" min="0" placeholder="시" style="width: 50px;"/>
											:
											<input type="number" name="eminute" id="eminute" max="0" min="59" placeholder="분" style="width: 50px;"/>																												
										</td>
									</tr>
									<tr>
										<th>고용형태</th>										
										<td>
											<input type="text" name="emp" id="emp" value="" style="width: 200px;"/>																					
										</td>
										<th><span style="color: red;">*</span> 기숙여부</th>
										<td>									
											<label for="dormitory1"><input type="radio" name="dormitory_yn" id="dormitory1" value="Y" checked="checked">유</label>
											<label for="dormitory2"><input type="radio" name="dormitory_yn" id="dormitory2" value="N">무</label>
										</td>
									</tr>									
									<tr>
										<th colspan="2"><span style="color: red;">*</span> 자기소개</th>
										<td colspan="3">
											<textarea name="content1" id="content1" rows="10" cols="80" placeholder="내용을 입력해주세요."></textarea>																				
										</td>
									</tr>
									<tr>
										<th colspan="2"><span style="color: red;">*</span> 취업시 고려사항</th>
										<td colspan="3">
											<textarea name="content2" id="content2" rows="5" cols="80" placeholder="내용을 입력해주세요."></textarea>																				
										</td>
									</tr>									
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">상태정보</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="30%" >
									<col width="20%" >
									<col width="30%" >
								</colgroup>
								<tbody>
									<tr>
										<th><span style="color: red;">*</span> 상태</th>
										<td colspan="3">
											<select name="status_seq" id="status_seq" style="width: 120px;">
												<c:forEach var="list" items="${selType24List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							
							
							
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="insertBtn" >확인</a></span>
								<span class="button02" id="btnSearch" ><a href="list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
						
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${view.SEQ}">
					<input type="hidden" id="search_name" name="search_name" value="${bean.search_name }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">

				</form>
			</div>
		</div>
<script type="text/javascript">



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
			if(edu_name==""||edu_sdate==""||edu_edate==""||edu_content==""||edu_etc==""){
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
			$("#frm").submit();	
		}
		
	});
	

});	

</script>		
	