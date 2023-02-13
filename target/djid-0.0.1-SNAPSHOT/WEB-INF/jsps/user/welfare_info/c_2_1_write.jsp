<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
var document_etc = false;

$(document).ready(function(){
	
	$(".onlynum").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/g,"") );} );
	
	$('input[name=age_str]').click(function () {
		var age_str = $(this).val();
		if(age_str == "연령제한"){
			$("#age_int_span").css("display", "");	
		}else{
			$("#age_int_span").css("display", "none");
		}		
	});
	
	$('input[name=disables_emp_yn]').click(function () {
		var age_str = $(this).val();
		if(age_str == "Y"){
			$("#disabled_emp_yn_span").css("display", "");	
		}else{
			$("#disabled_emp_yn_span").css("display", "none");
		}		
	});
	
	$('.document, .eat, .insurance').click(function () {
		var doc_check = $(this).is(":checked");
		if(doc_check){
			$(this).val("Y");
		}else{
			$(this).val("N");
		}
	});	
	
	
	$('#document6').click(function () {
		var doc_check = $(this).is(":checked");
		if(doc_check){
			$("#document_span").css("display", "");
			document_etc = true;
		}else{
			$("#document_span").css("display", "none");
			document_etc = false;
		}
	});
	
	$('#gugun_seq').change(function () {
		
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
		    	$("#dongri_seq").html(html);
		    }
		});
	});
	
	$('#gugun_seq').change();
	
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
	var objSel = document.getElementById("sdate_day");
	
	$("#sdate_day").find("option").remove();
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
	    
    	var day = "${view.SDATE_DAY}";
    	if((i+1) == day){
    	objOption.setAttribute("selected","selected");
    	}
	  }
}

function changeDay2(mm){
	var mon = mm.value;
	var last_day = 30;
	var objSel = document.getElementById("edate_day");
	
	$("#edate_day").find("option").remove();
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
	    
    	var day = "${view.EDATE_DAY}";
    	if((i+1) == day){
    	objOption.setAttribute("selected","selected");
    	}
	  }
}
</script>
		<form name="frm" id="frm" method="post" enctype="multipart/form-data" accept-charset="utf-8">
					<div class="contsArea welfareInfo">
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>구인정보 입력화면이며 구인제목, 모집기간 및 구인내용, 근로조건, 업체정보를 입력합니다.</caption>
								<colgroup>
									<col style="width: 150px">
									<col style="width: 779px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="title">구인제목</label></th>
										<td><input type="text" name="title" id="title" value="" class="wid65"></td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>모집기간</th>
										<td class="typePhone">
											<select name="sdate_year" id="sdate_year" title="모집기간 시작년도">
												<option value="">년</option>
												<c:forEach begin="2018" end="${toYear+1}" var="year">
													<option value="${year}">${year}</option>
												</c:forEach>
											</select>
											<select name="sdate_month" id="sdate_month" onchange="changeDay(this)" title="모집기간 시작월">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}">${month }</option>
												</c:forEach>
											</select>
											<select name="sdate_day" id="sdate_day" title="모집기간 시작일">
												<option value="">일</option>
											</select>
											<i>~</i>
											<select name="edate_year" id="edate_year" title="모집기간 종료년도">
												<option value="">년</option>
												<c:forEach begin="2018" end="${toYear+1}" var="year">
													<option value="${year}">${year}</option>
												</c:forEach>
											</select>
											<select name="edate_month" id="edate_month" onchange="changeDay2(this)" title="모집기간 종료월">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}">${month }</option>
												</c:forEach>
											</select>
											<select name="edate_day" id="edate_day" title="모집기간 종료일">
												<option value="">일</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<p class="contsSubTit tyBullet">구인내용</p>
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>자유게시판 글쓰기이며 제목, 파일첨부, 내용, 등록일, 자동등록방지 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width: 150px">
									<col style="width: 779px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><font class="fco01">* </font>구인유형</th>
										<td class="checkArea">
											<c:forEach var="list" items="${selType10List}" varStatus="status">
												<label for="type${status.count}"><input type="radio" name="type_seq" id="type${status.count}" value="${list.SEQ}" <c:if test="${status.count eq 1}">checked="checked"</c:if>/> ${list.CODE_DESC}</label>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>고용형태</th>
										<td class="checkArea">
											<c:forEach var="list" items="${selType11List}" varStatus="status">
												<label for="emp${status.count}"><input type="radio" name="emp_seq" id="emp${status.count}" value="${list.SEQ}" <c:if test="${status.count eq 1}">checked</c:if>/> ${list.CODE_DESC}</label>
											</c:forEach>
											<span>
												<label for="emp_int"><b>수습기간</b> </label> <input type="text" name="emp_int" id="emp_int" placeholder="숫자" class="wid65px onlynum"> <b>개월</b>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>모집인원</th>
										<td class="checkArea">
											<label for="sex1"><input type="radio" name="sex" id="sex1" value="성별무관" checked /> 성별무관</label>
											<label for="sex2"><input type="radio" name="sex" id="sex2" value="남자"/> 남자</label>											
											<label for="sex3"><input type="radio" name="sex" id="sex3" value="여자"/> 여자</label>
											<span id="sex_cnt_span">
												<label for="sex_cnt"><b>인원</b> </label> <input type="text" name="sex_cnt" id="sex_cnt" placeholder="숫자" class="wid65px onlynum">명
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="job_family">직종</label></th>
										<td>
											<input type="text" name="job_family" id="job_family" value="" class="wid65" placeholder="ex) 사무직, 운전직, 미화원 등" />
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="content">업무상세내용</label></th>
										<td><textarea name="content" id="content" placeholder="내용을 입력해주세요."></textarea></td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>연령</th>
										<td class="checkArea">											
											<label for="age1"><input type="radio" name="age_str" id="age1" value="연령무관" checked/> 연령무관</label>											
											<label for="age2"><input type="radio" name="age_str" id="age2" value="연령제한"/> 연령제한</label>
											<span id="age_int_span" style="display: none;">
											&nbsp;<input type="text" name="age_int" id="age_int" placeholder="ex) 20~50세" title="연령제한 나이">
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>혼인</th>
										<td class="checkArea">
											<c:forEach var="list" items="${selType26List}" varStatus="status">
												<label for="marry${status.count}"><input type="radio" name="marry_seq" id="marry${status.count}" value="${list.SEQ}" <c:if test="${status.count eq 1}">checked</c:if>/> ${list.CODE_DESC}</label>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="edu_seq">학력</label></th>
										<td>
											<select name="edu_seq" id="edu_seq" class="wid20">
												<c:forEach var="list" items="${selType18List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="cert">우대자격증</label></th>
										<td>
											<input type="text" name="cert" id="cert" value="" class="wid95" placeholder="ex) 워드프로세서 1급, 정보처리기사" />
										</td>
									</tr>
									<tr>
										<th scope="row">제출서류</th>
										<td class="documentArea">
											<c:forEach var="list" items="${selType12List}" varStatus="status">
												<input type="checkbox" class="document" name="document${status.count}_yn" id="document${status.count}" value="N"> <label for="document${status.count}">${list.CODE_DESC}</label>
											</c:forEach>
											<span id="document_span" style="display: none;">
											&nbsp;<input type="text" name="document_etc" id="document_etc" title="기타제출서류" class="wid120px">
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<p class="contsSubTit tyBullet">근로조건</p>
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>자유게시판 글쓰기이며 제목, 파일첨부, 내용, 등록일, 자동등록방지 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width: 150px">
									<col style="width: 779px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><font class="fco01">* </font>근무시간</th>
										<td class="typePhone">
											<input type="number" name="shour" id="shour" max="23" min="0" placeholder="시" title="근무시간 시작 시"/>
											:
											<input type="number" name="sminute" id="sminute" max="0" min="59" placeholder="분" title="근무시간 시작 분"/>
											~
											<input type="number" name="ehour" id="ehour" max="23" min="0" placeholder="시" title="근무시간 종료 시"/>
											:
											<input type="number" name="eminute" id="eminute" max="0" min="59" placeholder="분" title="근무시간 종료 분"/>		
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="salary_kind_seq">급여</label></th>
										<td>										
											<select name="salary_kind_seq" id="salary_kind_seq" class="wid25">
												<c:forEach var="list" items="${selType25List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
											&nbsp;<input type="text" name="salary" id="salary" class="wid25 onlynum" title="급여 입력">원
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="gugun_seq">근무지역</label></th>
										<td>
											<select name="gugun_seq" id="gugun_seq" class="wid25">
												<c:forEach var="list" items="${selType6List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
											<select name="dongri_seq" id="dongri_seq" class="wid25" title="근무지역 동/리 선택">
												<option value="">선택</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row">식사제공</th>
										<td class="documentArea">
											<c:forEach var="list" items="${selType13List}" varStatus="status">
												<label for="eat${status.count}"><input type="checkbox" class="eat" name="eat${status.count}_yn" id="eat${status.count}" value="N"/> ${list.CODE_DESC}</label>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>기숙사</th>
										<td class="checkArea">
											<label for="dormitory1"><input type="radio" name="dormitory_yn" id="dormitory1" value="Y" checked="checked"/> 유</label>											
											<label for="dormitory2"><input type="radio" name="dormitory_yn" id="dormitory2" value="N" /> 무</label>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>퇴직금</th>
										<td class="checkArea">
											<label for="serverancepay1"><input type="radio" name="serverancepay_yn" id="serverancepay1" value="Y" checked="checked"/> 유</label>											
											<label for="serverancepay2"><input type="radio" name="serverancepay_yn" id="serverancepay2" value="N"/> 무</label>
										</td>
									</tr>
									<tr>
										<th scope="row">4대보험</th>
										<td class="documentArea">
											<c:forEach var="list" items="${selType16List}" varStatus="status">
												<label for="insurance${status.count}"><input type="checkbox" class="insurance" name="insurance${status.count}_yn" id="insurance${status.count}" value="N"/> ${list.CODE_DESC}</label>
											</c:forEach>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<p class="contsSubTit tyBullet">업체정보</p>
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>자유게시판 글쓰기이며 제목, 파일첨부, 내용, 등록일, 자동등록방지 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width: 150px">
									<col style="width: 314px">
									<col style="width: 150px">
									<col style="width: 315px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="company_name">업체명</label></th>
										<td><input type="text" name="company_name" id="company_name" class="wid95"></td>
										<th scope="row"><label for="company_ceo_name">대표자명</label></th>
										<td><input type="text" name="company_ceo_name" id="company_ceo_name" class="wid95"></td>
									</tr>
									<tr>
										<th scope="row"><label for="company_number">사업자등록번호</label></th>
										<td><input type="text" name="company_number" id="company_number" class="wid95"></td>
										<th scope="row"><label for="company_domain">홈페이지</label></th>
										<td><input type="text" name="company_domain" id="company_domain" class="wid95"></td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>전화번호</th>
										<td>
											<input type="text" name="tel1" id="tel1" value="" style="width:70px;" maxlength="6" size="6" title="전화번호 앞자리">
											-
											<input type="text" name="tel2" id="tel2" value="" style="width:70px;" maxlength="6" size="6" title="전화번호 가운데 자리">
											-
											<input type="text" name="tel3" id="tel3" value="" style="width:70px;" maxlength="6" size="6" title="전화번호 뒷자리">
										</td>
										<th scope="row">팩스</th>
										<td>
											<input type="text" name="fax1" id="fax1" value="" style="width:70px;" maxlength="6" size="6" title="팩스번호 앞자리">
											-
											<input type="text" name="fax2" id="fax2" value="" style="width:70px;" maxlength="6" size="6" title="팩스번호 가운데 자리">
											-
											<input type="text" name="fax3" id="fax3" value="" style="width:70px;" maxlength="6" size="6" title="팩스번호 뒷자리">
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="company_sectors">업종</label></th>
										<td><input type="text" name="company_sectors" id="company_sectors" class="wid95"></td>
										<th scope="row"><label for="company_product">생산품</label></th>
										<td><input type="text" name="company_product" id="company_product" class="wid95"></td>
									</tr>
									<tr>
										<th scope="row"><label for="zip_cd">주소</label></th>
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
										<th scope="row"><font class="fco01">* </font>근로자수</th>
										<td  colspan="3" class="checkArea">
											<span>
											남자 <input type="text" class="onlynum" name="person1" id="person1" placeholder="숫자" style="width: 50px;" title="남자 근로자 수 입력">명
											</span>
											<span>
											여자 <input type="text" class="onlynum" name="person2" id="person2" placeholder="숫자" style="width: 50px;" title="여자 근로자 수 입력">명
											</span>											
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="manager_name">담당자명</label></th>
										<td><input type="text" name="manager_name" id="manager_name" class="wid95"></td>
										<th scope="row">연락처</th>
										<td>
											<input type="text" name="manager_tel1" id="manager_tel1" value="" style="width:70px;" maxlength="6" size="6" title="담당자 전화번호 앞자리">
											-
											<input type="text" name="manager_tel2" id="manager_tel2" value="" style="width:70px;" maxlength="6" size="6" title="담당자 전화번호 가운데 자리">
											-
											<input type="text" name="manager_tel3" id="manager_tel3" value="" style="width:70px;" maxlength="6" size="6" title="담당자 전화번호 뒷자리">
										</td>
									</tr>
									<tr>
										<th scope="row">장애인 고용현황</th>
										<td  colspan="3" class="checkArea">
											<label for="disables_emp_yn1"><input type="radio" name="disables_emp_yn" id="disables_emp_yn1" value="Y"/> 유</label>											
											<span id="disabled_emp_yn_span" style="display: none;">
												&nbsp;<input type="text" class="onlynum" name="disables_emp" id="disables_emp" placeholder="숫자" style="width: 50px;" title="장애인 근로자 수 입력">명
											</span>									
											<label for="disables_emp_yn2"><input type="radio" name="disables_emp_yn" id="disables_emp_yn2" value="N" checked="checked"/> 무</label>
										</td>
									</tr>
								</tbody>
							</table>
						</div>


						<div class="btnArea center">
							<!-- <button type="button" class="btnTypeBasic sizeM" onclick="layerPopUp(this,'#layerRegist');"><span>등록완료</span></button> -->
							<button type="button" class="btnTypeBasic sizeM" id="insertBtn"><span>등록완료</span></button>
							<button type="button" class="btnTypeBasic sizeM colorGray" onclick="location.href='list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>'"><span>취소</span></button>
						</div>

					</div>
					
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${view.SEQ}">
					<input type="hidden" id="search_name" name="search_name" value="${bean.search_name }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
					
					<!-- 전화번호 합치기 -->
					<input type="hidden" id="company_tel" name="company_tel" value="">
					<input type="hidden" id="company_fax" name="company_fax" value="">
					<input type="hidden" id="manager_tel" name="manager_tel" value="">
			</form>
			
<script>



$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	$("#insertBtn").click(function() {
				
		if( !valCheck('title', '구인제목을 입력해주세요.') ) return;
		if( !valCheck('sdate_year', ' 모집기간(년)을 선택해주세요.') ) return;
		if( !valCheck('sdate_month', ' 모집기간(월)을 선택해주세요.') ) return;
		if( !valCheck('sdate_day', ' 모집기간(일)을 선택해주세요.') ) return;
		if( !valCheck('edate_year', ' 모집기간(년)을 선택해주세요.') ) return;
		if( !valCheck('edate_month', ' 모집기간(월)을 선택해주세요.') ) return;
		if( !valCheck('edate_day', ' 모집기간(일)을 선택해주세요.') ) return;		
		if( !valCheck('emp_int', ' 수습 개월을 입력해주세요.') ) return;
		if( !valCheck('sex_cnt', '모집인원 수를 입력해주세요.') ) return;
		if( !valCheck('job_family', '직종을 입력해주세요.') ) return;
		if( !valCheck('content', '업무상세내용을 입력해주세요.') ) return;
		if( !valCheck('cert', '우대자격증을 입력해주세요.') ) return;
		if( document_etc ){
			if( !valCheck('document_etc', '제출서류(기타)를 입력해주세요.') ) return;	
		}
		if( !valCheck('shour', '근무시간을 입력해주세요.') ) return;
		if( !valCheck('sminute', '근무시간을 입력해주세요.') ) return;
		if( !valCheck('ehour', '근무시간을 입력해주세요.') ) return;
		if( !valCheck('eminute', '근무시간을 입력해주세요.') ) return;		
		if( !valCheck('salary', '급여를 입력해주세요.') ) return;
		if( !valCheck('dongri_seq', '근무지역을 선택해주세요.') ) return;
		
		if( !valCheck('company_name', '업체명을 입력해주세요.') ) return;
		if( !valCheck('tel1', '업체 전화번호를 입력해주세요.') ) return;
		if( !valCheck('tel2', '업체 전화번호를 입력해주세요.') ) return;
		if( !valCheck('tel3', '업체 전화번호를 입력해주세요.') ) return;
		if( !valCheck('company_sectors', '업종을 입력해주세요.') ) return;
		
		if( $("#person1").val() == "" && $("#person2").val() == "" ){
			alert("근로자수를 입력해주세요."); $("#person1").focus(); return;
		}
		
		if( !valCheck('manager_name', '담당자명을 입력해주세요.') ) return;
		if( !valCheck('manager_tel1', '담당자 연락처를 입력해주세요.') ) return;
		if( !valCheck('manager_tel2', '담당자 연락처를 입력해주세요.') ) return;
		if( !valCheck('manager_tel3', '담당자 연락처를 입력해주세요.') ) return;
		
		if( $("input[name=disables_emp_yn]:checked").val() == "Y" && $("#disables_emp").val() == "" ){
			alert("장애인 고용인원을 입력해주세요."); $("#disables_emp").focus(); return;
		}
		
		if(confirm('등록하시겠습니까?')){
			$("#frm").prop("action", "/welfare_info/c_2_1/insert.do");
			$("#frm").submit();	
		}
		
	});
	

});	

</script>		