<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<link rel="stylesheet" href="/css/member.css">

<script>

function validateEmail(email) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}

// 아이디 검증
function chkId(str){
	var idReg = /^[a-z]+[a-z0-9]{5,14}$/g;       
	return idReg.test( str );
}

// 영문,숫자,특수문자 혼합하여 8자리~20자리 이내.(비밀번호 표준)
function chkPwd(str){
	var pw = str;
 	var num = pw.search(/[0-9]/g);
 	var eng = pw.search(/[a-z]/ig);
 	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 

 	if(pw.length < 8 || pw.length > 20){
  		alert("비밀번호를 8자리 ~ 20자리 이내로 입력해주세요.");
  		return false;
 	}

 	if(pw.search(/₩s/) != -1){
  		alert("비밀번호는 공백업이 입력해주세요.");
  		return false;
 	} 
 	
 	if(num < 0 || eng < 0 || spe < 0 ){
  		alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
  		return false;
 	}
 	return true;
}


$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	/*
	* 회원 등록 버튼 
	*/
	$("#insertBtn").click(function() {
		
		if( !valCheck('id', '아이디를 입력해주세요.') ) return;
		if ( $("#check_yn").val() == "N" ){
			alert("아이디 중복체크를 해주세요."); return;
		}
		if( !valCheck('reg_mb_tel', '비밀번호를 입력해주세요.') ) return;
		/* if( !valCheck('reg_mb_tel', '비밀번호 확인을 입력해주세요.') ) return; */
		if( $("#pwd").val() != $("#pwd2").val() ){
			alert("비밀번호를 확인해주세요."); $("#pwd2").focus(); return;
		}
		
		// 비밀번호 검증 추가
		if ( !chkPwd($.trim($("#pwd").val())) ){
			 $('#pwd').val('');
			 $('#pwd').focus(); return false;
		}
		
		if( !valCheck('name', '이름을 입력해주세요.') ) return;	
		//if( !valCheck('tel1', '연락처를 입력해주세요.') ) return;
		if( !valCheck('reg_mb_addr1', '주소를 입력해주세요.') ) return;
		if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		/* if( !valCheck('tel3', '연락처를 입력해주세요.') ) return; */
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
		
		/* var checkCaptcha = false; */
		
	/* 	if ( $('#captcha_input').val() == "" ) {
            alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
            $("#captcha_input").focus();
            return;
	     } else {
	            $.ajax({
                   url: '/validateCaptcha.do',
                   type: 'POST',
                   dataType: 'text',
                   data: 'captcha_input=' + $('#captcha_input').val(),
                   async: false,      
                   success: function(resp) {
                         if(resp.indexOf("Y") != -1){
                        	 
                         }else{
                        	 alert("보안문자 입력 값이 일치하지 않습니다. 새로운 문자를 다시 입력해주세요.");
                        	 reloadCaptcha();
	                         $('#captcha_input').val('');
	                         checkCaptcha = true;
	                        return;
                         }
                         
                   }
	            });
	     } */
		
/* 		if(checkCaptcha){
			return;
		} */
		
 		if(confirm('등록하시겠습니까?')){
			$("#email").val(email);
			$("#frm").prop("action", "/member/join_2_insert.do");
			$("#frm").submit();
		} 
		
	});
	
	$("#cancelBtn").click(function() {
		$("#frm")[0].reset();
	});
	
	/*
	* 아이디 변경시 중복체크 해제
	*/	
	$("#email_sel").change(function() {
		var email2 = $(this).val();
		if(email2 == ""){
			$("#email_str").show();
		}else{
			$("#email_str").hide();
		}
	});
	
	/*
	* 아이디 변경시 중복체크 해제
	*/	
	$("#layer_id").change(function() {
		$("#check_yn").val("N");
	});
	
	$("#id").change(function() {
		$("#check_yn").val("N");
	});
	
	
	/*
	* 아이디 중복 체크
	*/
	$("#check_id").click(function() {
		
		/* if( !valCheck('layer_id', '아이디를 입력해주세요.') ) return;
		if(!chkId($("#layer_id").val())){ */
		if( !valCheck('id', '아이디를 입력해주세요.') ) return;
		if(!chkId($("#id").val())){
			$("#id").focus();
			alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			return;
		}
		$.ajax({
		    url: "/admin/001/check_id_ajax.do?id=" + $("#id").val(),
		    type : "GET",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(data){			    	
		    	if(data){
		    		//alert("사용 가능한 아이디입니다.");
		    		//$("#pwd").focus();
		    		$("#check_yn").val("Y");
		    		$("#layer_id_p").html("입력하신 아이디 : " + $("#id").val());
		    		$("#layer_id_valid").html("- 사용 가능한 아이디입니다.");
		    		$("#layer_id_valid").removeClass("validationNo");
		    		$("#layer_id_valid").addClass("validationNo");
		    		$("#layer_id_p").css("display", "");
		    		$("#layer_id_valid").css("display", "");
		    	}else{
		    		$("#layer_id_p").html("입력하신 아이디 : " + $("#id").val());
		    		$("#layer_id").val("");
		    		$("#layer_id").focus();
		    		$("#check_yn").val("N");		    		
		    		$("#layer_id_valid").html("- 사용이 불가능한 아이디입니다.");
		    		$("#layer_id_valid").removeClass("validationNo");
		    		$("#layer_id_valid").addClass("validationNo");
		    		$("#layer_id_p").css("display", "");
		    		$("#layer_id_valid").css("display", "");
		    	}
		    }
		});
		
		
	});
	
	$("#layer_id_ok").click(function() {
		if( $("#layer_id").val() == "" ){
			$("#layer_id").focus();
			alert("아이디를 입력해주세요.");
			return;
		}
		if(!chkId($("#layer_id").val())){
			$("#layer_id").focus();
			alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			return;
		}
		if( $("#check_yn").val() == "N" ){
			$("#layer_id").focus();
			alert("아이디 중복확인을 해주세요."); return;
		}
		$("#id").val( $("#layer_id").val() );
		$("#layer_id_cancel").click();
	});
	
	$("#layer_id_cancel").click(function() {
		
	});
	
	$("#pwd, #pwd2").keyup(function() {
		if( $("#pwd").val() != $("#pwd2").val()){
			$("#pwd_valid").removeClass("validationNo");
			$("#pwd_valid").addClass("validationNo");
			$("#pwd_valid").html("! 비밀번호가 일치 하지 않습니다");
		}else if( $("#pwd").val() == "" || $("#pwd2").val() == "" ){
			$("#pwd_valid").html("");
		}else{
			$("#pwd_valid").removeClass("validationNo");
			$("#pwd_valid").addClass("validationNo");
			$("#pwd_valid").html("비밀번호가 일치합니다.");
		}
		
	});
});	

function imgRefresh(){
    $("#captchaImg").attr("src", "/captchaImage.do?id=" + Math.random());
}

function reloadCaptcha(){
	var timeData = new Date();
	var reloadNum = timeData.getTime();
	var captchaUrl = '/captchaImage.do';
	$('#captchaImg').attr('src',captchaUrl+'?'+reloadNum);
}

function playAudio(){
	var timeData = new Date();
	var reloadNum = timeData.getTime();
	var browserInfo = navigator.userAgent.toLowerCase();
	if((browserInfo.indexOf("msie") >= 0 || browserInfo.indexOf("trident") >= 0)){
		var htmlString = '<object type="audio/x-wav" data="/captchaAudio.do?' + reloadNum + '" width="0" height="0"><param name="src" value="/captchaAudio.do?' + reloadNum +'"/><param name="autostart" value="true" /><param name="controller" value="false" /></object>';
		document.getElementById('audioPlayer').innerHTML = htmlString;
		document.getElementById('captcha_input').focus();
	}else if(browserInfo.indexOf("chrome") >= 0 || browserInfo.indexOf("firefox") >= 0 || browserInfo.indexOf("safari") >= 0){
		var htmlString = '<audio controls autoplay style="height:0px;width:0px;"><source src="/captchaAudio.do?' + reloadNum + '" type="audio/wav"></audio>';
		document.getElementById('audioPlayer').innerHTML = htmlString;
		document.getElementById('captcha_input').focus();
	}else{
		// 예외처리 필요
	}
}</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function win_zip(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('reg_mb_zip').value = data.zonecode;
            document.getElementById("reg_mb_addr1").value = roadAddr;
            document.getElementById("reg_mb_addr2").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("reg_mb_addr3").value = extraRoadAddr;
            } else {
                document.getElementById("reg_mb_addr3").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>

    <div class="login-title">
        <h2><i class="xi-paper-o"></i> JOIN</h2>
    </div>
               
    <div id="join-box">
	
        <form name="frm" id="frm" method="post" method="post" enctype="multipart/form-data" accept-charset="utf-8">
        
            <div id="join_area" class="join-form">
                
                <section id="regist_member">
                	<h4>회원구분<em><span class="colorBlue">*</span>는 필수항목입니다.</em></h4>
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                	<div class="select_company">
                                    <input name="category" type="radio" value="뿌리기업" /> 뿌리기업 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <input name="category" type="radio" value="일반기업" /> 일반기업
                                    </div>
                                    <span id="msg_mb_id"></span>
                                    <!-- <span class="frm_info">공급기업 또는 수요기업 중복 선택 가능합니다.</span> -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>서비스분야</strong></span>
                                    <select class="frm_input service" name="service">
                                    	<option>선택해주세요.</option>
	                                    <option value='주조'>주조</option>
	                                    <option value='금형'>금형</option>
	                                    <option value='소성가공'>소성가공</option>
	                                    <option value='용접'>용접</option>
	                                    <option value='표면처리'>표면처리</option>
	                                    <option value='열처리'>열처리</option>
                                    </select>
								</td>
                            </tr>
                        </tbody>
                    </table>
                    <h4>회원정보입력</h4>
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="text" name="id" id="id"  class="frm_input" minlength="3" maxlength="20" placeholder="*아이디">
                                    <span id="msg_mb_id"><input type=button id="check_id" class="btn_frmline" value="아이디 중복체크"></span>
                                    <p id="layer_id_p"></p>
                                    <span id="layer_id_valid"></span>
                                    <span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
									<span id="pwd_valid"></span>	
                                </td>
                            </tr>
                            <tr>
                                <td><input type="password" name="pwd" id="pwd"  class="frm_input" minlength="3" maxlength="20" placeholder="*패스워드"></td>
                            </tr>
                            <tr>
                                <td><input type="password" name="pwd2" id="pwd2"  class="frm_input " minlength="3" maxlength="20" placeholder="*패스워드 확인"></td>
                            </tr>
                        </tbody>
                    </table>
                    <table>
                        <tbody>
                            <tr>
                                <td><span class="line"></span></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="name" id="name" class="frm_input required datepicker" required placeholder="*이름">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <input type="text" name="email1" id="email1" required class="frm_input tel required" size="30" maxlength="100" placeholder="*이메일"> 
                                   @ 
                                   <select title="주소 선택" name="email_sel" id="email_sel"  class="frm_input tel">
										<option value="" title="직접입력">직접입력</option>
										<option value="naver.com" title="naver.com">naver.com</option>
										<option value="nate.com" title="nate.com">nate.com</option>
										<option value="gmail.com" title="gmail.com">gmail.com</option>
										<option value="hanmail.net" title="hanmail.net">hanmail.net</option>
										<option value="hotmail.com" title="hotmail.com">hotmail.com</option>
									</select>
                                    <input type="text" name="email_str" id="email_str" title="이메일 주소 직접 입력" placeholder="이메일 직접입력">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>전화번호</strong></span>
                                    <select class="frm_input tel" name="tel1">
                                    	<option>선택</option> 
                                    	<option value="02">02</option> 
                                    	<option value="031">031</option> 
                                    	<option value="032">032</option> 
                                    	<option value="033">033</option> 
                                    	<option value="041">041</option> 
                                    	<option value="042">042</option> 
                                    	<option value="043">043</option> 
                                    	<option value="051">051</option> 
                                    	<option value="052">052</option> 
                                    	<option value="053">053</option> 
                                    	<option value="054">054</option> 
                                    	<option value="055">055</option> 
                                    	<option value="061">061</option> 
                                    	<option value="062">062</option> 
                                    	<option value="063">063</option> 
                                    	<option value="064">064</option> 
                                    	<option value="070">070</option> 
                                    	<option value="050">050</option> 
                                    </select> -
                                    <input type="text" name="tel2" value="" id="tel2" required class="frm_input tel required" size="70" maxlength="100" placeholder=""> -
                                    <input type="text" name="tel3" value="" id="tel3" required class="frm_input tel required" size="70" maxlength="100" placeholder="">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>팩스번호</strong></span>
                                    <select class="frm_input tel" name="FAX1">
                                    	<option>선택</option> 
                                    	<option value="02">02</option> 
                                    	<option value="031">031</option> 
                                    	<option value="032">032</option> 
                                    	<option value="033">033</option> 
                                    	<option value="041">041</option> 
                                    	<option value="042">042</option> 
                                    	<option value="043">043</option> 
                                    	<option value="051">051</option> 
                                    	<option value="052">052</option> 
                                    	<option value="053">053</option> 
                                    	<option value="054">054</option> 
                                    	<option value="055">055</option> 
                                    	<option value="061">061</option> 
                                    	<option value="062">062</option> 
                                    	<option value="063">063</option> 
                                    	<option value="064">064</option> 
                                    	<option value="070">070</option> 
                                    	<option value="050">050</option> 
                                    </select> -
                                    <input type="text" name="FAX2" value="" id="reg_mb_tel" required class="frm_input tel required" size="70" maxlength="100" placeholder=""> -
                                    <input type="text" name="FAX3" value="" id="reg_mb_tel" required class="frm_input tel required" size="70" maxlength="100" placeholder="">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>휴대전화번호</strong></span>
                                    <select class="frm_input tel" name="phone1">
                                    	<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
                                    </select> -
                                    <input type="text" name="phone2" value="" id="reg_mb_tel" required class="frm_input tel required" size="70" maxlength="100" placeholder=""> -
                                    <input type="text" name="phone3" value="" id="reg_mb_tel" required class="frm_input tel required" size="70" maxlength="100" placeholder="">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="business_name" id="mb_company" value="" class="frm_input required" required placeholder="회원사(상호명)">
                                    <!-- <button type="button" class="btn_frmline" onclick="win_zip('fregisterform', 'mb_zip', 'mb_addr1', 'mb_addr2', 'mb_addr3', 'mb_addr_jibeon');">기업검색</button> -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="mb_company1" id="mb_company1" value="" class="frm_input required" required placeholder="대표자">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="mb_company2" id="mb_company2" value="" class="frm_input required" required placeholder="홈페이지주소">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="mb_company3" id="mb_company3" value="" class="frm_input required" required placeholder="사업자등록증">
                                </td>
                            </tr>
                            
                            <tr>
                                
                                <td class="address">
                                    <label for="reg_mb_zip" class="sound_only">우편번호</label>
                                    <input type="text" name="zip_code" value="" id="reg_mb_zip"  class="frm_input " size="5" maxlength="6" placeholder="우편번호">
                                    <button type="button" class="btn_frmline" onclick="win_zip('fregisterform', 'mb_zip', 'mb_addr1', 'mb_addr2', 'mb_addr3', 'mb_addr_jibeon');">주소검색</button><br>
                                    <input type="text" name="address" value="" id="reg_mb_addr1"  class="frm_input frm_address " size="50" placeholder="기본주소">
                                    <label for="reg_mb_addr1">기본주소</label><br>
                                    <input type="text" name="address2" value="" id="reg_mb_addr2" class="frm_input frm_address" size="50" placeholder="상세주소">
                                    <label for="reg_mb_addr2">상세주소</label>
                                    <br>
                                    <input type="text" name="etc" value="" id="reg_mb_addr3" class="frm_input frm_address" size="50" readonly="readonly" placeholder="참고항목">
                                    <label for="reg_mb_addr3">참고항목</label>
                                    <input type="hidden" name="mb_addr_jibeon" value="">
                                </td>
                            </tr>
                            <!-- <tr>
                                <td><span class="frm_info2"><strong>사업자등록증사본</strong></span>
                                    <input type="file" name="mb_company3" id="mb_company3" value="" class="frm_input required" required placeholder="사업자등록증">
                                </td>
                            </tr>
                            <tr>
                                <td><span class="frm_info2"><strong>제작자등록증사본</strong></span>
                                    <input type="file" name="mb_company3" id="mb_company3" value="" class="frm_input required" required placeholder="사업자등록증">
                                </td>
                            </tr>
                            <tr>
                                <td><span class="frm_info2"><strong>업체시설확인서</strong></span>
                                    <input type="file" name="mb_company3" id="mb_company3" value="" class="frm_input required" required placeholder="사업자등록증">
                                </td>
                            </tr>
                            <tr>
                                <td><span class="frm_info2"><strong>전자의결등록</strong></span>
                                    <input type="file" name="mb_company3" id="mb_company3" value="" class="frm_input required" required placeholder="사업자등록증">
                                </td>
                            </tr> -->
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>메일링신청</strong></span>
                                    <input name="mailing" type="radio" value="1" /> 신청
                                    &nbsp;&nbsp;&nbsp;
                                    <input name="mailing" type="radio" value="0" /> 미신청
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>정보공개여부</strong></span>
                                    <input name="openno" type="radio" value="1" /> 공개
                                    &nbsp;&nbsp;&nbsp;
                                    <input name="openno" type="radio" value="0" /> 비공개
                                </td>
                            </tr>
                            <%-- <tr>
                                <td class="check"><br /><br />
                                    <input type="checkbox" name="mb_mailling" value="1" id="reg_mb_mailling">
                                    정보 메일을 받겠습니다.
                                </td>
                            </tr>
    
                            
                            <tr>
                                <td class="check">
                                    <input type="checkbox" name="mb_sms" value="1" id="reg_mb_sms">
                                    휴대폰 문자메세지를 받겠습니다.
                                </td>
                            </tr> --%>
                            
                            <!-- <tr>
                                <td class="check">
                                    <input type="hidden" name="mb_open_default" value="">
                                    <input type="checkbox" name="mb_open" value="1" id="reg_mb_open">
                                    다른분들이 나의 정보를 볼 수 있도록 합니다. (정보공개를 바꾸시면 앞으로 20일 이내에는 변경이 안됩니다.)
                                </td>
                            </tr> -->
                        </tbody>
                    </table>
                    <div class="btn_confirm">
                        <input type="submit" value="회원가입" id="insertBtn" class="btn_join">
                    </div>
                <section>
            </div>
        </form>
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<link rel="stylesheet" href="/css/member.css">

<script>

function validateEmail(email) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}

// 아이디 검증
function chkId(str){
	var idReg = /^[a-z]+[a-z0-9]{5,14}$/g;       
	return idReg.test( str );
}

// 영문,숫자,특수문자 혼합하여 8자리~20자리 이내.(비밀번호 표준)
function chkPwd(str){
	var pw = str;
 	var num = pw.search(/[0-9]/g);
 	var eng = pw.search(/[a-z]/ig);
 	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 

 	if(pw.length < 8 || pw.length > 20){
  		alert("비밀번호를 8자리 ~ 20자리 이내로 입력해주세요.");
  		return false;
 	}

 	if(pw.search(/₩s/) != -1){
  		alert("비밀번호는 공백업이 입력해주세요.");
  		return false;
 	} 
 	
 	if(num < 0 || eng < 0 || spe < 0 ){
  		alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
  		return false;
 	}
 	return true;
}


$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	/*
	* 회원 등록 버튼 
	*/
	$("#insertBtn").click(function() {
		
		if( !valCheck('id', '아이디를 입력해주세요.') ) return;
		if ( $("#check_yn").val() == "N" ){
			alert("아이디 중복체크를 해주세요."); return;
		}
		if( !valCheck('reg_mb_tel', '비밀번호를 입력해주세요.') ) return;
		/* if( !valCheck('reg_mb_tel', '비밀번호 확인을 입력해주세요.') ) return; */
		if( $("#pwd").val() != $("#pwd2").val() ){
			alert("비밀번호를 확인해주세요."); $("#pwd2").focus(); return;
		}
		
		// 비밀번호 검증 추가
		if ( !chkPwd($.trim($("#pwd").val())) ){
			 $('#pwd').val('');
			 $('#pwd').focus(); return false;
		}
		
		if( !valCheck('name', '이름을 입력해주세요.') ) return;	
		//if( !valCheck('tel1', '연락처를 입력해주세요.') ) return;
		if( !valCheck('reg_mb_addr1', '주소를 입력해주세요.') ) return;
		if( !valCheck('tel2', '연락처를 입력해주세요.') ) return;
		/* if( !valCheck('tel3', '연락처를 입력해주세요.') ) return; */
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
		
		/* var checkCaptcha = false; */
		
	/* 	if ( $('#captcha_input').val() == "" ) {
            alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
            $("#captcha_input").focus();
            return;
	     } else {
	            $.ajax({
                   url: '/validateCaptcha.do',
                   type: 'POST',
                   dataType: 'text',
                   data: 'captcha_input=' + $('#captcha_input').val(),
                   async: false,      
                   success: function(resp) {
                         if(resp.indexOf("Y") != -1){
                        	 
                         }else{
                        	 alert("보안문자 입력 값이 일치하지 않습니다. 새로운 문자를 다시 입력해주세요.");
                        	 reloadCaptcha();
	                         $('#captcha_input').val('');
	                         checkCaptcha = true;
	                        return;
                         }
                         
                   }
	            });
	     } */
		
/* 		if(checkCaptcha){
			return;
		} */
		
 		if(confirm('등록하시겠습니까?')){
			$("#email").val(email);
			$("#frm").prop("action", "/member/join_2_insert.do");
			$("#frm").submit();
		} 
		
	});
	
	$("#cancelBtn").click(function() {
		$("#frm")[0].reset();
	});
	
	/*
	* 아이디 변경시 중복체크 해제
	*/	
	$("#email_sel").change(function() {
		var email2 = $(this).val();
		if(email2 == ""){
			$("#email_str").show();
		}else{
			$("#email_str").hide();
		}
	});
	
	/*
	* 아이디 변경시 중복체크 해제
	*/	
	$("#layer_id").change(function() {
		$("#check_yn").val("N");
	});
	
	$("#id").change(function() {
		$("#check_yn").val("N");
	});
	
	
	/*
	* 아이디 중복 체크
	*/
	$("#check_id").click(function() {
		
		/* if( !valCheck('layer_id', '아이디를 입력해주세요.') ) return;
		if(!chkId($("#layer_id").val())){ */
		if( !valCheck('id', '아이디를 입력해주세요.') ) return;
		if(!chkId($("#id").val())){
			$("#id").focus();
			alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			return;
		}
		$.ajax({
		    url: "/admin/001/check_id_ajax.do?id=" + $("#id").val(),
		    type : "GET",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(data){			    	
		    	if(data){
		    		//alert("사용 가능한 아이디입니다.");
		    		//$("#pwd").focus();
		    		$("#check_yn").val("Y");
		    		$("#layer_id_p").html("입력하신 아이디 : " + $("#id").val());
		    		$("#layer_id_valid").html("- 사용 가능한 아이디입니다.");
		    		$("#layer_id_valid").removeClass("validationNo");
		    		$("#layer_id_valid").addClass("validationNo");
		    		$("#layer_id_p").css("display", "");
		    		$("#layer_id_valid").css("display", "");
		    	}else{
		    		$("#layer_id_p").html("입력하신 아이디 : " + $("#id").val());
		    		$("#layer_id").val("");
		    		$("#layer_id").focus();
		    		$("#check_yn").val("N");		    		
		    		$("#layer_id_valid").html("- 사용이 불가능한 아이디입니다.");
		    		$("#layer_id_valid").removeClass("validationNo");
		    		$("#layer_id_valid").addClass("validationNo");
		    		$("#layer_id_p").css("display", "");
		    		$("#layer_id_valid").css("display", "");
		    	}
		    }
		});
		
		
	});
	
	$("#layer_id_ok").click(function() {
		if( $("#layer_id").val() == "" ){
			$("#layer_id").focus();
			alert("아이디를 입력해주세요.");
			return;
		}
		if(!chkId($("#layer_id").val())){
			$("#layer_id").focus();
			alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			return;
		}
		if( $("#check_yn").val() == "N" ){
			$("#layer_id").focus();
			alert("아이디 중복확인을 해주세요."); return;
		}
		$("#id").val( $("#layer_id").val() );
		$("#layer_id_cancel").click();
	});
	
	$("#layer_id_cancel").click(function() {
		
	});
	
	$("#pwd, #pwd2").keyup(function() {
		if( $("#pwd").val() != $("#pwd2").val()){
			$("#pwd_valid").removeClass("validationNo");
			$("#pwd_valid").addClass("validationNo");
			$("#pwd_valid").html("! 비밀번호가 일치 하지 않습니다");
		}else if( $("#pwd").val() == "" || $("#pwd2").val() == "" ){
			$("#pwd_valid").html("");
		}else{
			$("#pwd_valid").removeClass("validationNo");
			$("#pwd_valid").addClass("validationNo");
			$("#pwd_valid").html("비밀번호가 일치합니다.");
		}
		
	});
});	

function imgRefresh(){
    $("#captchaImg").attr("src", "/captchaImage.do?id=" + Math.random());
}

function reloadCaptcha(){
	var timeData = new Date();
	var reloadNum = timeData.getTime();
	var captchaUrl = '/captchaImage.do';
	$('#captchaImg').attr('src',captchaUrl+'?'+reloadNum);
}

function playAudio(){
	var timeData = new Date();
	var reloadNum = timeData.getTime();
	var browserInfo = navigator.userAgent.toLowerCase();
	if((browserInfo.indexOf("msie") >= 0 || browserInfo.indexOf("trident") >= 0)){
		var htmlString = '<object type="audio/x-wav" data="/captchaAudio.do?' + reloadNum + '" width="0" height="0"><param name="src" value="/captchaAudio.do?' + reloadNum +'"/><param name="autostart" value="true" /><param name="controller" value="false" /></object>';
		document.getElementById('audioPlayer').innerHTML = htmlString;
		document.getElementById('captcha_input').focus();
	}else if(browserInfo.indexOf("chrome") >= 0 || browserInfo.indexOf("firefox") >= 0 || browserInfo.indexOf("safari") >= 0){
		var htmlString = '<audio controls autoplay style="height:0px;width:0px;"><source src="/captchaAudio.do?' + reloadNum + '" type="audio/wav"></audio>';
		document.getElementById('audioPlayer').innerHTML = htmlString;
		document.getElementById('captcha_input').focus();
	}else{
		// 예외처리 필요
	}
}</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function win_zip(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('reg_mb_zip').value = data.zonecode;
            document.getElementById("reg_mb_addr1").value = roadAddr;
            document.getElementById("reg_mb_addr2").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("reg_mb_addr3").value = extraRoadAddr;
            } else {
                document.getElementById("reg_mb_addr3").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>

    <div class="login-title">
        <h2><i class="xi-paper-o"></i> JOIN</h2>
    </div>
               
    <div id="join-box">
	
        <form name="frm" id="frm" method="post" method="post" enctype="multipart/form-data" accept-charset="utf-8">
        
            <div id="join_area" class="join-form">
                
                <section id="regist_member">
                	<h4>회원구분<em><span class="colorBlue">*</span>는 필수항목입니다.</em></h4>
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                	<div class="select_company">
                                    <input name="category" type="radio" value="뿌리기업" /> 뿌리기업 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <input name="category" type="radio" value="일반기업" /> 일반기업
                                    </div>
                                    <span id="msg_mb_id"></span>
                                    <!-- <span class="frm_info">공급기업 또는 수요기업 중복 선택 가능합니다.</span> -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>서비스분야</strong></span>
                                    <select class="frm_input service" name="service">
                                    	<option>선택해주세요.</option>
	                                    <option value='주조'>주조</option>
	                                    <option value='금형'>금형</option>
	                                    <option value='소성가공'>소성가공</option>
	                                    <option value='용접'>용접</option>
	                                    <option value='표면처리'>표면처리</option>
	                                    <option value='열처리'>열처리</option>
                                    </select>
								</td>
                            </tr>
                        </tbody>
                    </table>
                    <h4>회원정보입력</h4>
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <input type="text" name="id" id="id"  class="frm_input" minlength="3" maxlength="20" placeholder="*아이디">
                                    <span id="msg_mb_id"><input type=button id="check_id" class="btn_frmline" value="아이디 중복체크"></span>
                                    <p id="layer_id_p"></p>
                                    <span id="layer_id_valid"></span>
                                    <span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
									<span id="pwd_valid"></span>	
                                </td>
                            </tr>
                            <tr>
                                <td><input type="password" name="pwd" id="pwd"  class="frm_input" minlength="3" maxlength="20" placeholder="*패스워드"></td>
                            </tr>
                            <tr>
                                <td><input type="password" name="pwd2" id="pwd2"  class="frm_input " minlength="3" maxlength="20" placeholder="*패스워드 확인"></td>
                            </tr>
                        </tbody>
                    </table>
                    <table>
                        <tbody>
                            <tr>
                                <td><span class="line"></span></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="name" id="name" class="frm_input required datepicker" required placeholder="*이름">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <input type="text" name="email1" id="email1" required class="frm_input tel required" size="30" maxlength="100" placeholder="*이메일"> 
                                   @ 
                                   <select title="주소 선택" name="email_sel" id="email_sel"  class="frm_input tel">
										<option value="" title="직접입력">직접입력</option>
										<option value="naver.com" title="naver.com">naver.com</option>
										<option value="nate.com" title="nate.com">nate.com</option>
										<option value="gmail.com" title="gmail.com">gmail.com</option>
										<option value="hanmail.net" title="hanmail.net">hanmail.net</option>
										<option value="hotmail.com" title="hotmail.com">hotmail.com</option>
									</select>
                                    <input type="text" name="email_str" id="email_str" title="이메일 주소 직접 입력" placeholder="이메일 직접입력">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>전화번호</strong></span>
                                    <select class="frm_input tel" name="tel1">
                                    	<option>선택</option> 
                                    	<option value="02">02</option> 
                                    	<option value="031">031</option> 
                                    	<option value="032">032</option> 
                                    	<option value="033">033</option> 
                                    	<option value="041">041</option> 
                                    	<option value="042">042</option> 
                                    	<option value="043">043</option> 
                                    	<option value="051">051</option> 
                                    	<option value="052">052</option> 
                                    	<option value="053">053</option> 
                                    	<option value="054">054</option> 
                                    	<option value="055">055</option> 
                                    	<option value="061">061</option> 
                                    	<option value="062">062</option> 
                                    	<option value="063">063</option> 
                                    	<option value="064">064</option> 
                                    	<option value="070">070</option> 
                                    	<option value="050">050</option> 
                                    </select> -
                                    <input type="text" name="tel2" value="" id="tel2" required class="frm_input tel required" size="70" maxlength="100" placeholder=""> -
                                    <input type="text" name="tel3" value="" id="tel3" required class="frm_input tel required" size="70" maxlength="100" placeholder="">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>팩스번호</strong></span>
                                    <select class="frm_input tel" name="FAX1">
                                    	<option>선택</option> 
                                    	<option value="02">02</option> 
                                    	<option value="031">031</option> 
                                    	<option value="032">032</option> 
                                    	<option value="033">033</option> 
                                    	<option value="041">041</option> 
                                    	<option value="042">042</option> 
                                    	<option value="043">043</option> 
                                    	<option value="051">051</option> 
                                    	<option value="052">052</option> 
                                    	<option value="053">053</option> 
                                    	<option value="054">054</option> 
                                    	<option value="055">055</option> 
                                    	<option value="061">061</option> 
                                    	<option value="062">062</option> 
                                    	<option value="063">063</option> 
                                    	<option value="064">064</option> 
                                    	<option value="070">070</option> 
                                    	<option value="050">050</option> 
                                    </select> -
                                    <input type="text" name="FAX2" value="" id="reg_mb_tel" required class="frm_input tel required" size="70" maxlength="100" placeholder=""> -
                                    <input type="text" name="FAX3" value="" id="reg_mb_tel" required class="frm_input tel required" size="70" maxlength="100" placeholder="">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>휴대전화번호</strong></span>
                                    <select class="frm_input tel" name="phone1">
                                    	<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
                                    </select> -
                                    <input type="text" name="phone2" value="" id="reg_mb_tel" required class="frm_input tel required" size="70" maxlength="100" placeholder=""> -
                                    <input type="text" name="phone3" value="" id="reg_mb_tel" required class="frm_input tel required" size="70" maxlength="100" placeholder="">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="business_name" id="mb_company" value="" class="frm_input required" required placeholder="회원사(상호명)">
                                    <!-- <button type="button" class="btn_frmline" onclick="win_zip('fregisterform', 'mb_zip', 'mb_addr1', 'mb_addr2', 'mb_addr3', 'mb_addr_jibeon');">기업검색</button> -->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="mb_company1" id="mb_company1" value="" class="frm_input required" required placeholder="대표자">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="mb_company2" id="mb_company2" value="" class="frm_input required" required placeholder="홈페이지주소">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="mb_company3" id="mb_company3" value="" class="frm_input required" required placeholder="사업자등록증">
                                </td>
                            </tr>
                            
                            <tr>
                                
                                <td class="address">
                                    <label for="reg_mb_zip" class="sound_only">우편번호</label>
                                    <input type="text" name="zip_code" value="" id="reg_mb_zip"  class="frm_input " size="5" maxlength="6" placeholder="우편번호">
                                    <button type="button" class="btn_frmline" onclick="win_zip('fregisterform', 'mb_zip', 'mb_addr1', 'mb_addr2', 'mb_addr3', 'mb_addr_jibeon');">주소검색</button><br>
                                    <input type="text" name="address" value="" id="reg_mb_addr1"  class="frm_input frm_address " size="50" placeholder="기본주소">
                                    <label for="reg_mb_addr1">기본주소</label><br>
                                    <input type="text" name="address2" value="" id="reg_mb_addr2" class="frm_input frm_address" size="50" placeholder="상세주소">
                                    <label for="reg_mb_addr2">상세주소</label>
                                    <br>
                                    <input type="text" name="etc" value="" id="reg_mb_addr3" class="frm_input frm_address" size="50" readonly="readonly" placeholder="참고항목">
                                    <label for="reg_mb_addr3">참고항목</label>
                                    <input type="hidden" name="mb_addr_jibeon" value="">
                                </td>
                            </tr>
                            <!-- <tr>
                                <td><span class="frm_info2"><strong>사업자등록증사본</strong></span>
                                    <input type="file" name="mb_company3" id="mb_company3" value="" class="frm_input required" required placeholder="사업자등록증">
                                </td>
                            </tr>
                            <tr>
                                <td><span class="frm_info2"><strong>제작자등록증사본</strong></span>
                                    <input type="file" name="mb_company3" id="mb_company3" value="" class="frm_input required" required placeholder="사업자등록증">
                                </td>
                            </tr>
                            <tr>
                                <td><span class="frm_info2"><strong>업체시설확인서</strong></span>
                                    <input type="file" name="mb_company3" id="mb_company3" value="" class="frm_input required" required placeholder="사업자등록증">
                                </td>
                            </tr>
                            <tr>
                                <td><span class="frm_info2"><strong>전자의결등록</strong></span>
                                    <input type="file" name="mb_company3" id="mb_company3" value="" class="frm_input required" required placeholder="사업자등록증">
                                </td>
                            </tr> -->
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>메일링신청</strong></span>
                                    <input name="mailing" type="radio" value="1" /> 신청
                                    &nbsp;&nbsp;&nbsp;
                                    <input name="mailing" type="radio" value="0" /> 미신청
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="frm_info2"><strong>정보공개여부</strong></span>
                                    <input name="openno" type="radio" value="1" /> 공개
                                    &nbsp;&nbsp;&nbsp;
                                    <input name="openno" type="radio" value="0" /> 비공개
                                </td>
                            </tr>
                            <%-- <tr>
                                <td class="check"><br /><br />
                                    <input type="checkbox" name="mb_mailling" value="1" id="reg_mb_mailling">
                                    정보 메일을 받겠습니다.
                                </td>
                            </tr>
    
                            
                            <tr>
                                <td class="check">
                                    <input type="checkbox" name="mb_sms" value="1" id="reg_mb_sms">
                                    휴대폰 문자메세지를 받겠습니다.
                                </td>
                            </tr> --%>
                            
                            <!-- <tr>
                                <td class="check">
                                    <input type="hidden" name="mb_open_default" value="">
                                    <input type="checkbox" name="mb_open" value="1" id="reg_mb_open">
                                    다른분들이 나의 정보를 볼 수 있도록 합니다. (정보공개를 바꾸시면 앞으로 20일 이내에는 변경이 안됩니다.)
                                </td>
                            </tr> -->
                        </tbody>
                    </table>
                    <div class="btn_confirm">
                        <input type="submit" value="회원가입" id="insertBtn" class="btn_join">
                    </div>
                <section>
            </div>
        </form>
>>>>>>> refs/heads/202204
    </div>