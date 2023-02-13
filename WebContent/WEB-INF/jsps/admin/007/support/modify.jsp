<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!-- <script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script> -->
<!-- <script type="text/javascript" src="/assets/editor/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script type="text/javascript" src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
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
									<col width="20%" >
									<col width="30%" >
									<col width="20%" >
									<col width="30%" >
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											<input type="text" name="name" id="fname" value="${view.NAME}" style="width:150px;" maxlength="15" size="15"> 
										</td>
										<th>성별</th>
										<td>
											<label for="sex1"><input type="radio" name="sex" id="sex1" value="남자" checked="checked"/>남자</label>
											<label for="sex2"><input type="radio" name="sex" id="sex2" value="여자"/>여자</label> 
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
										<th>생년월일</th>
										<td>
											<select name="birth_year" id="birth_year" style="width:60px;">
												<option value="">년</option>
												<c:forEach begin="1930" end="${toYear}" var="year">
													<option value="${year}" <c:if test="${view.BIRTH_YEAR eq year}">selected</c:if> >${year}</option>
												</c:forEach>
											</select>&nbsp;
											<select name="birth_month" id="birth_month" style="width:50px;" onchange="changeDay(this)">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}" <c:if test="${view.BIRTH_MONTH eq month}">selected</c:if> >${month }</option>
												</c:forEach>
											</select>&nbsp;
											<select name="birth_day" id="birth_day" style="width:50px;">
												<option value="">일</option>
											</select>&nbsp;																					
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td colspan="3">
											 <input type="text" name="email1" id="email1" value="${view.EMAIL1}" style="width:90px;" maxlength="15" size="15">
											 @
											 <input type="text" name="email2" id="email2" value="${view.EMAIL2}" style="width:90px;" maxlength="15" size="15">
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3">
											<input type="text" name="zip_cd" id="zip_cd" style="width: 100px;" value="${view.ZIP_CD}"  readonly="readonly" />
											<span class="button02" id="btnSearch" ><a href="#none" id="addrBtn" onclick="DaumPostcode();" >주소검색</a></span>
											<br/>
											<input type="text" name="addr1" id="addr1" value="${view.ADDR1}" style="width: 350px; margin-top: 5px;" readonly="readonly"/>											
											<br/>
											<input type="text" name="addr2" id="addr2" value="${view.ADDR2}" style="width: 350px; margin-top: 5px;"/>				 
										</td>
									</tr>
									<tr>
										<th>후원방식</th>
										<td colspan="3">
											<label for="support_kind1"><input type="radio" name="support_kind" id="support_kind1" value="CMS 자동이체" <c:if test="${view.SUPPORT_KIND eq 'CMS 자동이체'}">checked="checked"</c:if> />CMS 자동이체</label>
											<label for="support_kind2"><input type="radio" name="support_kind" id="support_kind2" value="계좌이체" <c:if test="${view.SUPPORT_KIND eq '계좌이체'}">checked="checked"</c:if>/>계좌이체</label>  
										</td>
									</tr>
									<tr>
										<th>후원금액</th>
										<td colspan="3">
											<label for="support_price1"><input type="radio" name="price_radio" id="support_price1" value="3000" <c:if test="${view.SUPPORT_PRICE eq '3000'}">checked="checked"</c:if>/>3,000원</label>
											<label for="support_price2"><input type="radio" name="price_radio" id="support_price2" value="5000" <c:if test="${view.SUPPORT_PRICE eq '5000'}">checked="checked"</c:if>/>5,000원</label>
											<label for="support_price3"><input type="radio" name="price_radio" id="support_price3" value="10000" <c:if test="${view.SUPPORT_PRICE eq '10000'}">checked="checked"</c:if>/>10,000원</label>
											<label for="support_price4"><input type="radio" name="price_radio" id="support_price4" value="20000" <c:if test="${view.SUPPORT_PRICE eq '20000'}">checked="checked"</c:if>/>20,000원</label>
											<label for="support_price5"><input type="radio" name="price_radio" id="support_price5" value="etc" <c:if test="${view.SUPPORT_PRICE ne '3000' and view.SUPPORT_PRICE ne '5000' and view.SUPPORT_PRICE ne '10000' and view.SUPPORT_PRICE ne '20000'}">checked="checked"</c:if>/>기타</label>
											<span id="price_span" style="display:none;"><input type="text" name="price_etc" id="price_etc" value="${view.SUPPORT_PRICE}" style="width:80px;" maxlength="30" size="30">원</span>
											<input type="hidden" name="support_price" id="support_pirce" value="${view.SUPPORT_PRICE}"/>
										</td>
									</tr>
									<tr id="support_transfer_tr">
										<th>이체일자</th>
										<td colspan="3">
											<label for="support_transfer_day1"><input type="radio" name="support_transfer_day" id="support_transfer_day1" value="5일" <c:if test="${view.SUPPORT_TRANSFER_DAY eq '5일'}">checked="checked"</c:if>/>5일</label>
											<label for="support_transfer_day2"><input type="radio" name="support_transfer_day" id="support_transfer_day2" value="10일" <c:if test="${view.SUPPORT_TRANSFER_DAY eq '10일'}">checked="checked"</c:if>/>10일</label>
											<label for="support_transfer_day3"><input type="radio" name="support_transfer_day" id="support_transfer_day3" value="15일" <c:if test="${view.SUPPORT_TRANSFER_DAY eq '15일'}">checked="checked"</c:if>/>15일</label>
											<label for="support_transfer_day4"><input type="radio" name="support_transfer_day" id="support_transfer_day4" value="20일" <c:if test="${view.SUPPORT_TRANSFER_DAY eq '20일'}">checked="checked"</c:if>/>20일</label>
										</td>
									</tr>
									<tr id="reg_tr">
										<th>주민등록번호</th>
										<td colspan="3">
											 <input type="text" name="reg_no1" id="reg_no1" value="${view.REG_NO1}" style="width:90px;" maxlength="6" size="6">
											 -
											 <input type="password" name="reg_no2" id="reg_no2" value="${view.REG_NO2}" style="width:90px;" maxlength="7" size="7">
										</td>
									</tr>
									<tr>
										<th>후원동기</th>
										<td colspan="3">
											 <c:forEach var="list" items="${selType28List}" varStatus="status">
												<label for="motive${status.count}"><input type="checkbox" class="motive" name="motive_seq" id="motive${status.count}" value="${list.SEQ}" <c:if test="${fn:contains(MOTIVE_LIST, list.CODE_DESC)}">checked</c:if>/>${list.CODE_DESC}</label>
											</c:forEach>
											<input type="text" name="etc" id="etc" value="${view.ETC}" style="width:150px; display:none;" maxlength="30" size="30">
										</td>
									</tr>
									<tr>
										<th>하고싶은말</th>
										<td colspan="3">
											<textarea name="content" id="content" rows="10" cols="80" placeholder="내용을 입력해주세요.">${view.CONTENT}</textarea>
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
function validateEmail(email) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}


$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	$('#motive4').click(function () {
		var flag = $(this).is(":checked");
		if(flag){
			$("#etc").css("display", "");
		}else{
			$("#etc").css("display", "none");
		}
	});
	
	$('input[name=price_radio]').click(function () {
		var price_val = $(this).val();
		if(price_val == 'etc'){
			$("#price_span").css("display", "");
		}else{
			$("#price_span").css("display", "none");
		}
	});
	
	$('input[name=support_kind]').change(function () {
		var support_kind = $(this).val();
		if(support_kind == 'CMS 자동이체'){
			$("#support_transfer_tr").css("display", "");
			$("#reg_tr").css("display", "");
		}else{
			$("#support_transfer_tr").css("display", "none");
			$("#reg_tr").css("display", "none");
		}
	});

	$("#updateBtn").click(function() {
		
		var support_kind = $('input[name=support_kind]:checked').val()
		
		if( !valCheck('fname', '이름을 입력해주세요.') ) return;
		if( !valCheck('tel1', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel3', '연락처를 입력해주세요.') ) return;
		if( !valCheck('birth_year', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('birth_month', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('birth_day', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('email1', '이메일을 입력해주세요.') ) return;
		if( !valCheck('email2', '이메일을 입력해주세요.') ) return;
		if( $("#email1").val() != "" && $("#emai2").val() != "" ){
			var email = $("#email1").val() + "@" + $("#email2").val();
			if(!validateEmail(email)){
				alert("이메일 형식이 맞지 않습니다."); return;
				$("#email2").focus();
			}
		}
		if( !valCheck('zip_cd', '우편번호를 입력해주세요.') ) return;
		if( !valCheck('addr1', '주소를 입력해주세요.') ) return;
		if( !valCheck('addr2', '상세주소를 입력해주세요.') ) return;

		if(support_kind == "CMS 자동이체"){
			if( !valCheck('reg_no1', '주민등록번호를 입력해주세요.') ) return;
			if( !valCheck('reg_no2', '주민등록번호를 입력해주세요.') ) return;	
		}
		
		if(confirm('등록하시겠습니까?')){
			var price = $('input[name=price_radio]:checked').val();
			if(price != 'etc'){
				$("#support_price").val( $('input[name=price_radio]:checked').val() );	
			}else{
				$("#support_price").val( $("#price_etc").val() );
			}
			$("#frm").submit();
		}
		
	});
	
	
	
	
	
	$('input[name=price_radio]:checked').click();
	
	if("${view.SUPPORT_KIND}" == "계좌이체"){
		$("input[name=support_kind]").change();	
	}	
	
	var flag = $("#motive4").is(":checked");
	if(flag){
		$("#etc").css("display", "");
	}else{
		$("#etc").css("display", "none");
	}
	
	changeDay("${view.BIRTH_MONTH}");
	
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
<script type="text/javascript" src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
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
									<col width="20%" >
									<col width="30%" >
									<col width="20%" >
									<col width="30%" >
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											<input type="text" name="name" id="fname" value="${view.NAME}" style="width:150px;" maxlength="15" size="15"> 
										</td>
										<th>성별</th>
										<td>
											<label for="sex1"><input type="radio" name="sex" id="sex1" value="남자" checked="checked"/>남자</label>
											<label for="sex2"><input type="radio" name="sex" id="sex2" value="여자"/>여자</label> 
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
										<th>생년월일</th>
										<td>
											<select name="birth_year" id="birth_year" style="width:60px;">
												<option value="">년</option>
												<c:forEach begin="1930" end="${toYear}" var="year">
													<option value="${year}" <c:if test="${view.BIRTH_YEAR eq year}">selected</c:if> >${year}</option>
												</c:forEach>
											</select>&nbsp;
											<select name="birth_month" id="birth_month" style="width:50px;" onchange="changeDay(this)">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}" <c:if test="${view.BIRTH_MONTH eq month}">selected</c:if> >${month }</option>
												</c:forEach>
											</select>&nbsp;
											<select name="birth_day" id="birth_day" style="width:50px;">
												<option value="">일</option>
											</select>&nbsp;																					
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td colspan="3">
											 <input type="text" name="email1" id="email1" value="${view.EMAIL1}" style="width:90px;" maxlength="15" size="15">
											 @
											 <input type="text" name="email2" id="email2" value="${view.EMAIL2}" style="width:90px;" maxlength="15" size="15">
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3">
											<input type="text" name="zip_cd" id="zip_cd" style="width: 100px;" value="${view.ZIP_CD}"  readonly="readonly" />
											<span class="button02" id="btnSearch" ><a href="#none" id="addrBtn" onclick="DaumPostcode();" >주소검색</a></span>
											<br/>
											<input type="text" name="addr1" id="addr1" value="${view.ADDR1}" style="width: 350px; margin-top: 5px;" readonly="readonly"/>											
											<br/>
											<input type="text" name="addr2" id="addr2" value="${view.ADDR2}" style="width: 350px; margin-top: 5px;"/>				 
										</td>
									</tr>
									<tr>
										<th>후원방식</th>
										<td colspan="3">
											<label for="support_kind1"><input type="radio" name="support_kind" id="support_kind1" value="CMS 자동이체" <c:if test="${view.SUPPORT_KIND eq 'CMS 자동이체'}">checked="checked"</c:if> />CMS 자동이체</label>
											<label for="support_kind2"><input type="radio" name="support_kind" id="support_kind2" value="계좌이체" <c:if test="${view.SUPPORT_KIND eq '계좌이체'}">checked="checked"</c:if>/>계좌이체</label>  
										</td>
									</tr>
									<tr>
										<th>후원금액</th>
										<td colspan="3">
											<label for="support_price1"><input type="radio" name="price_radio" id="support_price1" value="3000" <c:if test="${view.SUPPORT_PRICE eq '3000'}">checked="checked"</c:if>/>3,000원</label>
											<label for="support_price2"><input type="radio" name="price_radio" id="support_price2" value="5000" <c:if test="${view.SUPPORT_PRICE eq '5000'}">checked="checked"</c:if>/>5,000원</label>
											<label for="support_price3"><input type="radio" name="price_radio" id="support_price3" value="10000" <c:if test="${view.SUPPORT_PRICE eq '10000'}">checked="checked"</c:if>/>10,000원</label>
											<label for="support_price4"><input type="radio" name="price_radio" id="support_price4" value="20000" <c:if test="${view.SUPPORT_PRICE eq '20000'}">checked="checked"</c:if>/>20,000원</label>
											<label for="support_price5"><input type="radio" name="price_radio" id="support_price5" value="etc" <c:if test="${view.SUPPORT_PRICE ne '3000' and view.SUPPORT_PRICE ne '5000' and view.SUPPORT_PRICE ne '10000' and view.SUPPORT_PRICE ne '20000'}">checked="checked"</c:if>/>기타</label>
											<span id="price_span" style="display:none;"><input type="text" name="price_etc" id="price_etc" value="${view.SUPPORT_PRICE}" style="width:80px;" maxlength="30" size="30">원</span>
											<input type="hidden" name="support_price" id="support_pirce" value="${view.SUPPORT_PRICE}"/>
										</td>
									</tr>
									<tr id="support_transfer_tr">
										<th>이체일자</th>
										<td colspan="3">
											<label for="support_transfer_day1"><input type="radio" name="support_transfer_day" id="support_transfer_day1" value="5일" <c:if test="${view.SUPPORT_TRANSFER_DAY eq '5일'}">checked="checked"</c:if>/>5일</label>
											<label for="support_transfer_day2"><input type="radio" name="support_transfer_day" id="support_transfer_day2" value="10일" <c:if test="${view.SUPPORT_TRANSFER_DAY eq '10일'}">checked="checked"</c:if>/>10일</label>
											<label for="support_transfer_day3"><input type="radio" name="support_transfer_day" id="support_transfer_day3" value="15일" <c:if test="${view.SUPPORT_TRANSFER_DAY eq '15일'}">checked="checked"</c:if>/>15일</label>
											<label for="support_transfer_day4"><input type="radio" name="support_transfer_day" id="support_transfer_day4" value="20일" <c:if test="${view.SUPPORT_TRANSFER_DAY eq '20일'}">checked="checked"</c:if>/>20일</label>
										</td>
									</tr>
									<tr id="reg_tr">
										<th>주민등록번호</th>
										<td colspan="3">
											 <input type="text" name="reg_no1" id="reg_no1" value="${view.REG_NO1}" style="width:90px;" maxlength="6" size="6">
											 -
											 <input type="password" name="reg_no2" id="reg_no2" value="${view.REG_NO2}" style="width:90px;" maxlength="7" size="7">
										</td>
									</tr>
									<tr>
										<th>후원동기</th>
										<td colspan="3">
											 <c:forEach var="list" items="${selType28List}" varStatus="status">
												<label for="motive${status.count}"><input type="checkbox" class="motive" name="motive_seq" id="motive${status.count}" value="${list.SEQ}" <c:if test="${fn:contains(MOTIVE_LIST, list.CODE_DESC)}">checked</c:if>/>${list.CODE_DESC}</label>
											</c:forEach>
											<input type="text" name="etc" id="etc" value="${view.ETC}" style="width:150px; display:none;" maxlength="30" size="30">
										</td>
									</tr>
									<tr>
										<th>하고싶은말</th>
										<td colspan="3">
											<textarea name="content" id="content" rows="10" cols="80" placeholder="내용을 입력해주세요.">${view.CONTENT}</textarea>
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
function validateEmail(email) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}


$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	$('#motive4').click(function () {
		var flag = $(this).is(":checked");
		if(flag){
			$("#etc").css("display", "");
		}else{
			$("#etc").css("display", "none");
		}
	});
	
	$('input[name=price_radio]').click(function () {
		var price_val = $(this).val();
		if(price_val == 'etc'){
			$("#price_span").css("display", "");
		}else{
			$("#price_span").css("display", "none");
		}
	});
	
	$('input[name=support_kind]').change(function () {
		var support_kind = $(this).val();
		if(support_kind == 'CMS 자동이체'){
			$("#support_transfer_tr").css("display", "");
			$("#reg_tr").css("display", "");
		}else{
			$("#support_transfer_tr").css("display", "none");
			$("#reg_tr").css("display", "none");
		}
	});

	$("#updateBtn").click(function() {
		
		var support_kind = $('input[name=support_kind]:checked').val()
		
		if( !valCheck('fname', '이름을 입력해주세요.') ) return;
		if( !valCheck('tel1', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel3', '연락처를 입력해주세요.') ) return;
		if( !valCheck('birth_year', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('birth_month', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('birth_day', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('email1', '이메일을 입력해주세요.') ) return;
		if( !valCheck('email2', '이메일을 입력해주세요.') ) return;
		if( $("#email1").val() != "" && $("#emai2").val() != "" ){
			var email = $("#email1").val() + "@" + $("#email2").val();
			if(!validateEmail(email)){
				alert("이메일 형식이 맞지 않습니다."); return;
				$("#email2").focus();
			}
		}
		if( !valCheck('zip_cd', '우편번호를 입력해주세요.') ) return;
		if( !valCheck('addr1', '주소를 입력해주세요.') ) return;
		if( !valCheck('addr2', '상세주소를 입력해주세요.') ) return;

		if(support_kind == "CMS 자동이체"){
			if( !valCheck('reg_no1', '주민등록번호를 입력해주세요.') ) return;
			if( !valCheck('reg_no2', '주민등록번호를 입력해주세요.') ) return;	
		}
		
		if(confirm('등록하시겠습니까?')){
			var price = $('input[name=price_radio]:checked').val();
			if(price != 'etc'){
				$("#support_price").val( $('input[name=price_radio]:checked').val() );	
			}else{
				$("#support_price").val( $("#price_etc").val() );
			}
			$("#frm").submit();
		}
		
	});
	
	
	
	
	
	$('input[name=price_radio]:checked').click();
	
	if("${view.SUPPORT_KIND}" == "계좌이체"){
		$("input[name=support_kind]").change();	
	}	
	
	var flag = $("#motive4").is(":checked");
	if(flag){
		$("#etc").css("display", "");
	}else{
		$("#etc").css("display", "none");
	}
	
	changeDay("${view.BIRTH_MONTH}");
	
});	

</script>		
>>>>>>> refs/heads/202204
	