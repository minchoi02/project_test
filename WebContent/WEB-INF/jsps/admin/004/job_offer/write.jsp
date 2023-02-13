<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!-- <script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script> -->
<!-- <script type="text/javascript" src="/assets/editor/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
var document_etc = false;

$(document).ready(function(){
	
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
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
	
		<div class="conBox">
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/insert.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">구인제목</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
										<th><span style="color: red;">*</span> 구인제목</th>
										<td>
											<input type="text" name="title" id="title" value="" style="width: 400px;"/>																					
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 모집기간</th>
										<td>
											<select name="sdate_year" id="sdate_year" style="width:60px;">
												<option value="">년</option>
												<c:forEach begin="2018" end="${toYear+1}" var="year">
													<option value="${year}">${year}</option>
												</c:forEach>
											</select>&nbsp;
											<select name="sdate_month" id="sdate_month" style="width:50px;" onchange="changeDay(this)">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}">${month }</option>
												</c:forEach>
											</select>&nbsp;
											<select name="sdate_day" id="sdate_day" style="width:50px;">
												<option value="">일</option>
											</select>&nbsp;
											~
											<select name="edate_year" id="edate_year" style="width:60px;">
												<option value="">년</option>
												<c:forEach begin="2018" end="${toYear+1}" var="year">
													<option value="${year}">${year}</option>
												</c:forEach>
											</select>&nbsp;
											<select name="edate_month" id="edate_month" style="width:50px;" onchange="changeDay2(this)">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}">${month }</option>
												</c:forEach>
											</select>&nbsp;
											<select name="edate_day" id="edate_day" style="width:50px;">
												<option value="">일</option>
											</select>&nbsp;
										</td>
									</tr>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">구인내용</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
										<th><span style="color: red;">*</span> 구인유형</th>
										<td>
											<c:forEach var="list" items="${selType10List}" varStatus="status">
												<label for="type${status.count}"><input type="radio" name="type_seq" id="type${status.count}" value="${list.SEQ}" <c:if test="${status.count eq 1}">checked="checked"</c:if>/>${list.CODE_DESC}</label>
											</c:forEach>																		
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 고용형태</th>
										<td>
											<c:forEach var="list" items="${selType11List}" varStatus="status">
												<label for="emp${status.count}"><input type="radio" name="emp_seq" id="emp${status.count}" value="${list.SEQ}" <c:if test="${status.count eq 1}">checked</c:if>/>${list.CODE_DESC}</label>
											</c:forEach>
											&nbsp;&nbsp;&nbsp; 수습: <input type="number" name="emp_int" id="emp_int" placeholder="숫자" style="width: 50px;" min="0">개월
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 모집인원</th>
										<td>
											<label for="sex1"><input type="radio" name="sex" id="sex1" value="성별무관" checked />성별무관</label>
											<label for="sex2"><input type="radio" name="sex" id="sex2" value="남자"/>남자</label>											
											<label for="sex3"><input type="radio" name="sex" id="sex3" value="여자"/>여자</label>
											<span id="sex_cnt_span" style="display: ;" />
											&nbsp;&nbsp;&nbsp; 인원:<input type="number" name="sex_cnt" id="sex_cnt" placeholder="숫자" style="width: 50px;" min="0">명
											</span>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 직종</th>
										<td>
											<input type="text" name="job_family" id="job_family" value="" style="width: 350px;" placeholder="ex) 사무직, 운전직, 미화원 등" />
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 업무상세내용</th>
										<td>
											<textarea name="content" id="content" rows="10" cols="80" placeholder="내용을 입력해주세요."></textarea>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 연령</th>
										<td>
											<label for="age1"><input type="radio" name="age_str" id="age1" value="연령무관" checked/>연령무관</label>											
											<label for="age2"><input type="radio" name="age_str" id="age2" value="연령제한"/>연령제한</label>
											<span id="age_int_span" style="display: none;"/>
											&nbsp;<input type="text" name="age_int" id="age_int" placeholder="ex) 20~50세" style="width: 120px;">
											</span>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 혼인</th>
										<td>
											<c:forEach var="list" items="${selType26List}" varStatus="status">
												<label for="marry${status.count}"><input type="radio" name="marry_seq" id="marry${status.count}" value="${list.SEQ}" <c:if test="${status.count eq 1}">checked</c:if>/>${list.CODE_DESC}</label>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 학력</th>
										<td>
											<select name="edu_seq" id="edu_seq" style="width: 120px;">
												<c:forEach var="list" items="${selType18List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 우대자격증</th>
										<td>
											<input type="text" name="cert" id="cert" value="" style="width: 350px;" placeholder="ex) 워드프로세서 1급, 정보처리기사" />
										</td>
									</tr>
									<tr>
										<th>제출서류</th>
										<td>
											<c:forEach var="list" items="${selType12List}" varStatus="status">
												<label for="document${status.count}"><input type="checkbox" class="document" name="document${status.count}_yn" id="document${status.count}" value="N"/>${list.CODE_DESC}</label>
											</c:forEach>
											<span id="document_span" style="display: none;"/>
											&nbsp;<input type="text" name="document_etc" id="document_etc" style="width: 120px;">
											</span>
										</td>
									</tr>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">근로조건</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
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
										<th><span style="color: red;">*</span> 급여</th>
										<td>
											<select name="salary_kind_seq" id="salary_kind_seq" style="width: 80px;">
												<c:forEach var="list" items="${selType25List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
											&nbsp;<input type="number" name="salary" id="salary" style="width: 120px;" min="0">원
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 근무지역</th>
										<td>
											<select name="gugun_seq" id="gugun_seq" style="width: 80px;">
												<c:forEach var="list" items="${selType6List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
											<select name="dongri_seq" id="dongri_seq" style="width: 100px;">
												<option value="">선택</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>식사제공</th>
										<td>
											<c:forEach var="list" items="${selType13List}" varStatus="status">
												<label for="eat${status.count}"><input type="checkbox" class="eat" name="eat${status.count}_yn" id="eat${status.count}" value="N"/>${list.CODE_DESC}</label>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 기숙사</th>
										<td>
											<label for="dormitory1"><input type="radio" name="dormitory_yn" id="dormitory1" value="Y" checked="checked"/>유</label>											
											<label for="dormitory2"><input type="radio" name="dormitory_yn" id="dormitory2" value="N" />무</label>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 퇴직금</th>
										<td>
											<label for="serverancepay1"><input type="radio" name="serverancepay_yn" id="serverancepay1" value="Y" checked="checked"/>유</label>											
											<label for="serverancepay2"><input type="radio" name="serverancepay_yn" id="serverancepay2" value="N"/>무</label>
										</td>
									</tr>
									<tr>
										<th>4대보험</th>
										<td>
											<c:forEach var="list" items="${selType16List}" varStatus="status">
												<label for="insurance${status.count}"><input type="checkbox" class="insurance" name="insurance${status.count}_yn" id="insurance${status.count}" value="N"/>${list.CODE_DESC}</label>
											</c:forEach>
										</td>
									</tr>									
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">업체정보</div>
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
										<th><span style="color: red;">*</span> 업체명</th>
										<td><input type="text" name="company_name" id="company_name" style="width: 200px;"></td>
										<th>대표자명</th>
										<td><input type="text" name="company_ceo_name" id="company_ceo_name" style="width: 200px;"></td>
									</tr>
									<tr>
										<th>사업자등록번호</th>
										<td><input type="text" name="company_number" id="company_number" style="width: 200px;"></td>
										<th>홈페이지</th>
										<td><input type="text" name="company_domain" id="company_domain" style="width: 200px;"></td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 전화번호</th>
										<td>
											<input type="text" name="tel1" id="tel1" value="" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="tel2" id="tel2" value="" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="tel3" id="tel3" value="" style="width:50px;" maxlength="6" size="6">
										</td>
										<th>팩스</th>
										<td>
											<input type="text" name="fax1" id="fax1" value="" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="fax2" id="fax2" value="" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="fax3" id="fax3" value="" style="width:50px;" maxlength="6" size="6">
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 업종</th>
										<td><input type="text" name="company_sectors" id="company_sectors" style="width: 200px;"></td>
										<th>생산품</th>
										<td><input type="text" name="company_product" id="company_product" style="width: 200px;"></td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3">
											<input type="text" name="zip_cd" id="zip_cd" style="width: 100px;" readonly="readonly" />
											<span class="button02" id="btnSearch" ><a href="#none" id="addrBtn" onclick="DaumPostcode();" >주소검색</a></span>
											<br/>
											<input type="text" name="addr1" id="addr1" style="width: 350px; margin-top: 5px;" readonly="readonly"/>											
											<br/>
											<input type="text" name="addr2" id="addr2" style="width: 350px; margin-top: 5px;"/>											 											
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 근로자수</th>
										<td colspan="3">
											남자: <input type="number" name="person1" id="person1" placeholder="숫자" style="width: 50px;" min="0">명
											여자: <input type="number" name="person2" id="person2" placeholder="숫자" style="width: 50px;" min="0">명											 											
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 담당자명</th>
										<td><input type="text" name="manager_name" id="manager_name" style="width: 200px;"></td>
										<th><span style="color: red;">*</span> 연락처</th>
										<td>
											<input type="text" name="manager_tel1" id="manager_tel1" value="" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="manager_tel2" id="manager_tel2" value="" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="manager_tel3" id="manager_tel3" value="" style="width:50px;" maxlength="6" size="6">											 											
										</td>
									</tr>
									<tr>
										<th>장애인 고용현황</th>
										<td colspan="3">
											<label for="disables_emp_yn1"><input type="radio" name="disables_emp_yn" id="disables_emp_yn1" value="Y"/>유</label>											
											<span id="disabled_emp_yn_span" style="display: none;"/>
												&nbsp;<input type="number" name="disables_emp" id="disables_emp" placeholder="숫자" style="width: 50px;" min="0">명
											</span>									
											<label for="disables_emp_yn2"><input type="radio" name="disables_emp_yn" id="disables_emp_yn2" value="N" checked="checked"/>무</label>													 											
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
											<select name="status_seq" id="status_seq" style="width: 150px;">
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
					
					<!-- 전화번호 합치기 -->
					<input type="hidden" id="company_tel" name="company_tel" value="">
					<input type="hidden" id="company_fax" name="company_fax" value="">
					<input type="hidden" id="manager_tel" name="manager_tel" value="">
					
				</form>
			</div>
		</div>
<script type="text/javascript">



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
			$("#frm").submit();	
		}
		
	});
	

});	

</script>		
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!-- <script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script> -->
<!-- <script type="text/javascript" src="/assets/editor/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
var document_etc = false;

$(document).ready(function(){
	
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
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
	
		<div class="conBox">
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/insert.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">구인제목</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
										<th><span style="color: red;">*</span> 구인제목</th>
										<td>
											<input type="text" name="title" id="title" value="" style="width: 400px;"/>																					
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 모집기간</th>
										<td>
											<select name="sdate_year" id="sdate_year" style="width:60px;">
												<option value="">년</option>
												<c:forEach begin="2018" end="${toYear+1}" var="year">
													<option value="${year}">${year}</option>
												</c:forEach>
											</select>&nbsp;
											<select name="sdate_month" id="sdate_month" style="width:50px;" onchange="changeDay(this)">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}">${month }</option>
												</c:forEach>
											</select>&nbsp;
											<select name="sdate_day" id="sdate_day" style="width:50px;">
												<option value="">일</option>
											</select>&nbsp;
											~
											<select name="edate_year" id="edate_year" style="width:60px;">
												<option value="">년</option>
												<c:forEach begin="2018" end="${toYear+1}" var="year">
													<option value="${year}">${year}</option>
												</c:forEach>
											</select>&nbsp;
											<select name="edate_month" id="edate_month" style="width:50px;" onchange="changeDay2(this)">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}">${month }</option>
												</c:forEach>
											</select>&nbsp;
											<select name="edate_day" id="edate_day" style="width:50px;">
												<option value="">일</option>
											</select>&nbsp;
										</td>
									</tr>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">구인내용</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
										<th><span style="color: red;">*</span> 구인유형</th>
										<td>
											<c:forEach var="list" items="${selType10List}" varStatus="status">
												<label for="type${status.count}"><input type="radio" name="type_seq" id="type${status.count}" value="${list.SEQ}" <c:if test="${status.count eq 1}">checked="checked"</c:if>/>${list.CODE_DESC}</label>
											</c:forEach>																		
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 고용형태</th>
										<td>
											<c:forEach var="list" items="${selType11List}" varStatus="status">
												<label for="emp${status.count}"><input type="radio" name="emp_seq" id="emp${status.count}" value="${list.SEQ}" <c:if test="${status.count eq 1}">checked</c:if>/>${list.CODE_DESC}</label>
											</c:forEach>
											&nbsp;&nbsp;&nbsp; 수습: <input type="number" name="emp_int" id="emp_int" placeholder="숫자" style="width: 50px;" min="0">개월
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 모집인원</th>
										<td>
											<label for="sex1"><input type="radio" name="sex" id="sex1" value="성별무관" checked />성별무관</label>
											<label for="sex2"><input type="radio" name="sex" id="sex2" value="남자"/>남자</label>											
											<label for="sex3"><input type="radio" name="sex" id="sex3" value="여자"/>여자</label>
											<span id="sex_cnt_span" style="display: ;" />
											&nbsp;&nbsp;&nbsp; 인원:<input type="number" name="sex_cnt" id="sex_cnt" placeholder="숫자" style="width: 50px;" min="0">명
											</span>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 직종</th>
										<td>
											<input type="text" name="job_family" id="job_family" value="" style="width: 350px;" placeholder="ex) 사무직, 운전직, 미화원 등" />
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 업무상세내용</th>
										<td>
											<textarea name="content" id="content" rows="10" cols="80" placeholder="내용을 입력해주세요."></textarea>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 연령</th>
										<td>
											<label for="age1"><input type="radio" name="age_str" id="age1" value="연령무관" checked/>연령무관</label>											
											<label for="age2"><input type="radio" name="age_str" id="age2" value="연령제한"/>연령제한</label>
											<span id="age_int_span" style="display: none;"/>
											&nbsp;<input type="text" name="age_int" id="age_int" placeholder="ex) 20~50세" style="width: 120px;">
											</span>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 혼인</th>
										<td>
											<c:forEach var="list" items="${selType26List}" varStatus="status">
												<label for="marry${status.count}"><input type="radio" name="marry_seq" id="marry${status.count}" value="${list.SEQ}" <c:if test="${status.count eq 1}">checked</c:if>/>${list.CODE_DESC}</label>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 학력</th>
										<td>
											<select name="edu_seq" id="edu_seq" style="width: 120px;">
												<c:forEach var="list" items="${selType18List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 우대자격증</th>
										<td>
											<input type="text" name="cert" id="cert" value="" style="width: 350px;" placeholder="ex) 워드프로세서 1급, 정보처리기사" />
										</td>
									</tr>
									<tr>
										<th>제출서류</th>
										<td>
											<c:forEach var="list" items="${selType12List}" varStatus="status">
												<label for="document${status.count}"><input type="checkbox" class="document" name="document${status.count}_yn" id="document${status.count}" value="N"/>${list.CODE_DESC}</label>
											</c:forEach>
											<span id="document_span" style="display: none;"/>
											&nbsp;<input type="text" name="document_etc" id="document_etc" style="width: 120px;">
											</span>
										</td>
									</tr>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">근로조건</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
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
										<th><span style="color: red;">*</span> 급여</th>
										<td>
											<select name="salary_kind_seq" id="salary_kind_seq" style="width: 80px;">
												<c:forEach var="list" items="${selType25List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
											&nbsp;<input type="number" name="salary" id="salary" style="width: 120px;" min="0">원
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 근무지역</th>
										<td>
											<select name="gugun_seq" id="gugun_seq" style="width: 80px;">
												<c:forEach var="list" items="${selType6List}" varStatus="status">
													<option value="${list.SEQ}">${list.CODE_DESC}</option>
												</c:forEach>
											</select>
											<select name="dongri_seq" id="dongri_seq" style="width: 100px;">
												<option value="">선택</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>식사제공</th>
										<td>
											<c:forEach var="list" items="${selType13List}" varStatus="status">
												<label for="eat${status.count}"><input type="checkbox" class="eat" name="eat${status.count}_yn" id="eat${status.count}" value="N"/>${list.CODE_DESC}</label>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 기숙사</th>
										<td>
											<label for="dormitory1"><input type="radio" name="dormitory_yn" id="dormitory1" value="Y" checked="checked"/>유</label>											
											<label for="dormitory2"><input type="radio" name="dormitory_yn" id="dormitory2" value="N" />무</label>
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 퇴직금</th>
										<td>
											<label for="serverancepay1"><input type="radio" name="serverancepay_yn" id="serverancepay1" value="Y" checked="checked"/>유</label>											
											<label for="serverancepay2"><input type="radio" name="serverancepay_yn" id="serverancepay2" value="N"/>무</label>
										</td>
									</tr>
									<tr>
										<th>4대보험</th>
										<td>
											<c:forEach var="list" items="${selType16List}" varStatus="status">
												<label for="insurance${status.count}"><input type="checkbox" class="insurance" name="insurance${status.count}_yn" id="insurance${status.count}" value="N"/>${list.CODE_DESC}</label>
											</c:forEach>
										</td>
									</tr>									
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">업체정보</div>
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
										<th><span style="color: red;">*</span> 업체명</th>
										<td><input type="text" name="company_name" id="company_name" style="width: 200px;"></td>
										<th>대표자명</th>
										<td><input type="text" name="company_ceo_name" id="company_ceo_name" style="width: 200px;"></td>
									</tr>
									<tr>
										<th>사업자등록번호</th>
										<td><input type="text" name="company_number" id="company_number" style="width: 200px;"></td>
										<th>홈페이지</th>
										<td><input type="text" name="company_domain" id="company_domain" style="width: 200px;"></td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 전화번호</th>
										<td>
											<input type="text" name="tel1" id="tel1" value="" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="tel2" id="tel2" value="" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="tel3" id="tel3" value="" style="width:50px;" maxlength="6" size="6">
										</td>
										<th>팩스</th>
										<td>
											<input type="text" name="fax1" id="fax1" value="" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="fax2" id="fax2" value="" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="fax3" id="fax3" value="" style="width:50px;" maxlength="6" size="6">
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 업종</th>
										<td><input type="text" name="company_sectors" id="company_sectors" style="width: 200px;"></td>
										<th>생산품</th>
										<td><input type="text" name="company_product" id="company_product" style="width: 200px;"></td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3">
											<input type="text" name="zip_cd" id="zip_cd" style="width: 100px;" readonly="readonly" />
											<span class="button02" id="btnSearch" ><a href="#none" id="addrBtn" onclick="DaumPostcode();" >주소검색</a></span>
											<br/>
											<input type="text" name="addr1" id="addr1" style="width: 350px; margin-top: 5px;" readonly="readonly"/>											
											<br/>
											<input type="text" name="addr2" id="addr2" style="width: 350px; margin-top: 5px;"/>											 											
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 근로자수</th>
										<td colspan="3">
											남자: <input type="number" name="person1" id="person1" placeholder="숫자" style="width: 50px;" min="0">명
											여자: <input type="number" name="person2" id="person2" placeholder="숫자" style="width: 50px;" min="0">명											 											
										</td>
									</tr>
									<tr>
										<th><span style="color: red;">*</span> 담당자명</th>
										<td><input type="text" name="manager_name" id="manager_name" style="width: 200px;"></td>
										<th><span style="color: red;">*</span> 연락처</th>
										<td>
											<input type="text" name="manager_tel1" id="manager_tel1" value="" style="width:50px;" maxlength="6" size="6">
											-
											<input type="text" name="manager_tel2" id="manager_tel2" value="" style="width:50px;" maxlength="6" size="6"">
											-
											<input type="text" name="manager_tel3" id="manager_tel3" value="" style="width:50px;" maxlength="6" size="6">											 											
										</td>
									</tr>
									<tr>
										<th>장애인 고용현황</th>
										<td colspan="3">
											<label for="disables_emp_yn1"><input type="radio" name="disables_emp_yn" id="disables_emp_yn1" value="Y"/>유</label>											
											<span id="disabled_emp_yn_span" style="display: none;"/>
												&nbsp;<input type="number" name="disables_emp" id="disables_emp" placeholder="숫자" style="width: 50px;" min="0">명
											</span>									
											<label for="disables_emp_yn2"><input type="radio" name="disables_emp_yn" id="disables_emp_yn2" value="N" checked="checked"/>무</label>													 											
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
											<select name="status_seq" id="status_seq" style="width: 150px;">
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
					
					<!-- 전화번호 합치기 -->
					<input type="hidden" id="company_tel" name="company_tel" value="">
					<input type="hidden" id="company_fax" name="company_fax" value="">
					<input type="hidden" id="manager_tel" name="manager_tel" value="">
					
				</form>
			</div>
		</div>
<script type="text/javascript">



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
			$("#frm").submit();	
		}
		
	});
	

});	

</script>		
>>>>>>> refs/heads/202204
	