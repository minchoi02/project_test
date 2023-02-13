<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
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
		<form name="frm" id="frm" method="post" enctype="multipart/form-data" accept-charset="utf-8">		
			<input type="hidden" name="email" id="email" value="" />
					<div class="contsArea communicationNotice">
						<p class="contsSubTit tyBullet">정보입력 <font class="fco01">(* 필수입력 항목)</font></p>
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>후원신청하기 화면이며 이름, 성별, 연락처, 생년월일, 이메일, 주소, 후원방식, 후원금액, 이체일자, 주민등록번호, 참여동기, 하고싶은말을 입력합니다.</caption>
								<colgroup>
									<col style="width: 150px">
									<col style="width: 360px">
									<col style="width: 110px">
									<col style="width: 309px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="fname">이름</label></th>
										<td><input type="text" name="name" id="fname" class="wid40" maxlength="15" size="15"></td>
										<th scope="row"><font class="fco01">* </font>성별</th>
										<td class="checkArea">					
											<label for="sex1"><input type="radio" name="sex" id="sex1" value="남자" checked="checked"/> 남자</label>
											<label for="sex2"><input type="radio" name="sex" id="sex2" value="여자"/> 여자</label>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="tel1">연락처</label></th>
										<td class="typePhone">
											<select id="tel1" name="tel1" title="휴대폰 앞자리 선택">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
											</select>
											<input type="text" class="phone" name="tel2" id="tel2" title="휴대폰 가운데  4자리">
											<input type="text" class="phone" name="tel3" id="tel3" title="휴대폰 마지막 4자리">
										</td>
										<th scope="row"><font class="fco01">* </font><label for="birth_year">생년월일</label></th>
										<td class="typePhone">	
											<select name="birth_year" id="birth_year" class="date">
												<option value="">년</option>
												<c:forEach begin="1930" end="${toYear}" var="year">
													<option value="${year}">${year}</option>
												</c:forEach>
											</select>
											<select name="birth_month" id="birth_month" class="date" onchange="changeDay(this)" title="생년월일 월">
													<option value="">월</option>
												<c:forEach begin="1" end="12" var="month" >
													<option value="${month}">${month }</option>
												</c:forEach>
											</select>
											<select name="birth_day" id="birth_day" class="date" title="생년월일 일">
												<option value="">일</option>
											</select>	
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="email1">이메일</label></th>
										<td colspan="3" class="typeEmail">
											<input type="text" id="email1" name="email1" title="이메일 아이디 입력">
											<i>@</i>
											<select title="주소 선택" id="email_sel">
												<option value="" title="직접입력">직접입력</option>
												<option value="naver.com" title="naver.com">naver.com</option>
												<option value="nate.com" title="nate.com">nate.com</option>
												<option value="gmail.com" title="gmail.com">gmail.com</option>
												<option value="hanmail.net" title="hanmail.net">hanmail.net</option>
												<option value="hotmail.com" title="hotmail.com">hotmail.com</option>
											</select>
											<input type="text" id="email_str" title="이메일 주소 직접 입력">
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font><label for="zip_cd">주소</label></th>
										<td colspan="3" class="address">
											<input type="text" name="zip_cd" id="zip_cd" readonly="readonly" onclick="DaumPostcode();"/>
											<button type="button" class="btnTypeBasic colorGray" onclick="DaumPostcode();"><span>검색</span></button>
											<p>
												<input type="text" name="addr1" id="addr1" readonly="readonly" title="상세주소1" onclick="DaumPostcode();"/>											
												<input type="text" name="addr2" id="addr2" title="상세주소2"/>		
											</p>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>후원방식</th>
										<td colspan="3" class="checkArea">
											<label for="support_kind1"><input type="radio" name="support_kind" id="support_kind1" value="CMS 자동이체" checked="checked"/> CMS 자동이체</label>
											<label for="support_kind2"><input type="radio" name="support_kind" id="support_kind2" value="계좌이체"/> 계좌이체</label>
										</td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>후원금액</th>
										<td colspan="3" class="checkArea">
											<label for="support_price1"><input type="radio" name="price_radio" id="support_price1" value="3000" checked="checked"/> 3,000원</label>
											<label for="support_price2"><input type="radio" name="price_radio" id="support_price2" value="5000" /> 5,000원</label>
											<label for="support_price3"><input type="radio" name="price_radio" id="support_price3" value="10000" /> 10,000원</label>
											<label for="support_price4"><input type="radio" name="price_radio" id="support_price4" value="20000" /> 20,000원</label>
											<label for="support_price5"><input type="radio" name="price_radio" id="support_price5" value="etc" /> 기타</label>
											<span id="price_span" style="display:none;"><input type="text" name="price_etc" id="price_etc" value="" style="width:80px;" maxlength="30" size="30" title="후원금액 기타 입력">원</span>
											<input type="hidden" name="support_price" id="support_price" value=""/>
										</td>
									</tr>
									<tr id="support_transfer_tr">
										<th scope="row"><font class="fco01">* </font>이체일자</th>
										<td  colspan="3" class="checkArea">
											<label for="support_transfer_day1"><input type="radio" name="support_transfer_day" id="support_transfer_day1" value="5일" checked="checked"/> 5일</label>
											<label for="support_transfer_day2"><input type="radio" name="support_transfer_day" id="support_transfer_day2" value="10일" /> 10일</label>
											<label for="support_transfer_day3"><input type="radio" name="support_transfer_day" id="support_transfer_day3" value="15일" /> 15일</label>
											<label for="support_transfer_day4"><input type="radio" name="support_transfer_day" id="support_transfer_day4" value="20일" /> 20일</label>
										</td>
									</tr>
									<tr id="reg_tr">
										<th scope="row"><font class="fco01">* </font><label for="reg_no1">주민등록번호</label></th>
										<td  colspan="3" class="idnumArea">
											<input type="text" name="reg_no1" id="reg_no1" maxlength="6" size="6">
											 <i>-</i>
											<input type="password" name="reg_no2" id="reg_no2" title="주민등록번호 뒷자리" maxlength="7" size="7">
										</td>
									</tr>
									<tr id="account_tr" style="display: none;">
										<th scope="row">입금계좌</th>
										<td colspan="3">하나은행 656-171476-22605 <strong>(사)대전장애인단체총연합회</strong></td>
									</tr>
									<tr>
										<th scope="row"><font class="fco01">* </font>참여동기</th>
										<td  colspan="3" class="checkArea">
											<c:forEach var="list" items="${selType28List}" varStatus="status">
												<label for="motive${status.count}"><input type="checkbox" class="motive" name="motive_seq" id="motive${status.count}" value="${list.SEQ}"/> ${list.CODE_DESC}</label>
											</c:forEach>
											<input type="text" name="etc" id="etc" value="" style="display:none;" title="기타 내용" maxlength="30" size="30">
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="content">하고싶은말</label></th>
										<td colspan="3"><textarea name="content" id="content" placeholder="내용을 입력해주세요" title="하고싶은 말 입력"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<p class="contsSubTit tyBullet mbt20">개인정보수집이용동의</p>
						<div class="termsScroll">
							<strong>수집되는 개인정보는 「개인정보보호법」에 따라 보호되며, 동 법률에 따라 수집·이용 동의가 필요합니다.</strong><br/>
							1. 수집이용목적 : 후원금액 출금에 사용<br/>
							2. 수집항목 : 이름,성별,연락처,생년월일,이메일,주소,주민등록번호<br/>
							3. 수집근거 : 「전자금융거래법」제15조, 「금융실명거래 및 비밀보장에 관한 법률」제2조, 동법 시행령 제3조<br/>
							4. 이용 및 보유기간 : 전자금융거래법 제22조 및 기록물보존기간 만료시 까지 <br/>
							5. 동의를 거부할 수 있으며, 동의 거부시 CMS를 사용 할 수 없습니다.<br/><br/>
							수집되는 개인정보는 「개인정보보호법」에 따라 보호되며, 동 법률에 따라 제3자 제공 동의가 필요합니다.<br/>
							1. 제공기관 : 정보드림<br/>
							2. 제공받는 기관 : (cms 등록기관명 삽입), 해당은행 <br/>
							3. 제공받는자의 이용목적 : 출금(후원금액 자동이체)<br/>
							4. 제공항목 : 신청자(이름, 은행명, 생년월일, 계좌번호, 휴대폰번호)<br/>
							5. 동의를 거부할 수 있으며, 동의 거부시 CMS를 사용 할 수 없습니다.
						</div>
						<input type="checkbox" id="check1"> <label for="check1">예,동의합니다. </label>
						<div class="btnArea center">
							<button type="button" class="btnTypeBasic sizeM" id="insertBtn"><span>신청완료</span></button>
							<button type="button" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
						</div>
					</div>
		</form>
<script>
function validateEmail(email) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}

$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	$("#email_sel").change(function() {
		var email2 = $(this).val();
		if(email2 == ""){
			$("#email_str").show();
		}else{
			$("#email_str").hide();
		}
	});
	
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
			$("#account_tr").css("display", "none");
		}else{
			$("#support_transfer_tr").css("display", "none");
			$("#reg_tr").css("display", "none");
			$("#account_tr").css("display", "");
		}
	});

	$("#insertBtn").click(function() {

		var support_kind = $('input[name=support_kind]:checked').val()
		
		if( !valCheck('fname', '이름을 입력해주세요.') ) return;
		if( !valCheck('tel1', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		if( !valCheck('tel3', '연락처를 입력해주세요.') ) return;
		if( !valCheck('birth_year', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('birth_month', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('birth_day', '생년월일을 선택해주세요.') ) return;
		if( !valCheck('email1', '이메일을 입력해주세요.') ) return;		
		
		if( $("#email_sel").val() == "" && $("#email_str").val() == "" ){
			if( !valCheck('email_str', '이메일을 입력해주세요.') ) return;
		}
		
		var email = "";
		if( $("#email_sel").val() == "" ){			
			email = $("#email1").val() + "@" + $("#email_str").val();
			if(!validateEmail(email)){
				alert("이메일 형식이 맞지 않습니다."); return;
			}
		}else{
			email = $("#email1").val() + "@" + $("#email_sel").val();
			if(!validateEmail(email)){
				alert("이메일 형식이 맞지 않습니다."); return;
			}
		}
		if( !valCheck('zip_cd', '우편번호를 입력해주세요.') ) return;
		if( !valCheck('addr1', '주소를 입력해주세요.') ) return;
		if( !valCheck('addr2', '상세주소를 입력해주세요.') ) return;
		
		if(support_kind == "CMS 자동이체"){
			if( !valCheck('reg_no1', '주민등록번호를 입력해주세요.') ) return;
			if( !valCheck('reg_no2', '주민등록번호를 입력해주세요.') ) return;	
		}
		
		var price = $('input[name=price_radio]:checked').val();
		if(price == 'etc'){
			if($("#price_etc").val() == ""){
				alert("후원금액을 입력해주세요.");
				$("#price_etc").focus();
				return;
			}
		}
		
		if( $("input[name=motive_seq]:checked").length < 1){
			alert("참여동기를 하나 이상 선택해주세요.");
			return;
		}
		
		var check1 = $("#check1").is(":checked");
		if(!check1){
			alert("개인정보수집이용동의 후 신청 가능합니다."); return;	
		}
				
		if(confirm('등록하시겠습니까?')){
			
			if(price != 'etc'){
				$("#support_price").val( $('input[name=price_radio]:checked').val() );	
			}else{
				$("#support_price").val( $("#price_etc").val() );
			}
			$("#email").val(email);
			$("#frm").prop("action", "/federation/g_4_f_2/insert.do");
			$("#frm").submit();
		}
		
	});
	
});	

</script>		
	