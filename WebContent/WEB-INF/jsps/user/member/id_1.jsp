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

$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	/*
	* 확인 버튼
	*/
	$("#okBtn").click(function() {
		
		if( !valCheck('fname', '이름을 입력해주세요.') ) return;	
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
		
		$.ajax({
		    type : "GET",
            url: '/member/findId.do?name=' + $('#fname').val() + "&email=" + email,
            type : "GET",
            success: function(list) {
<<<<<<< HEAD
            	console.log(list);
				if(list == null || list.length < 1){
					$("#exIdDiv").hide();
					$("#nexIdDiv").show();
				}else{
					$("#nexIdDiv").hide();
					$("#exIdDiv").show();
					$("#okIdDiv").html("<p>아이디 조회 결과 입력하신 정보와 일치하는 아이디는 아래와 같습니다.</p>");
					for (var i = 0; i < list.length; i++) {
						var id = list[i].ID;
						var reg_date = list[i].REGDATE;
						$("#okIdDiv").append("<p><strong>- "+ id +" ( 가입일자 : " + reg_date + " )</strong></p>");
					}
				}
            }
         });
		
	});

	$("#email_sel").change(function() {
		var email2 = $(this).val();
		if(email2 == ""){
			$("#email_str").show();
		}else{
			$("#email_str").hide();
		}
	});

	$("#loginBtn").click(function() {
		location.href = "/member/login.do";
	});

});	
</script>
    <div class="login-title">
        <h2><i class="xi-lock"></i> 회원정보 찾기</h2>
=======
				if(list == null || list.length < 1){
					$("#exIdDiv").hide();
					$("#nexIdDiv").show();
				}else{
					$("#nexIdDiv").hide();
					$("#exIdDiv").show();
					$("#okIdDiv").html("<p>아이디 조회 결과 입력하신 정보와 일치하는 아이디는 아래와 같습니다.</p>");
					for (var i = 0; i < list.length; i++) {
						var id = list[i].ID;
						var reg_date = list[i].REG_DATE;
						$("#okIdDiv").append("<p><strong>- "+ id +" ( 가입일자 : " + reg_date + " )</strong></p>");
					}
				}
            }
         });
		
	});

	$("#email_sel").change(function() {
		var email2 = $(this).val();
		if(email2 == ""){
			$("#email_str").show();
		}else{
			$("#email_str").hide();
		}
	});

	$("#loginBtn").click(function() {
		location.href = "/member/login.do";
	});

});	
</script>
    <div class="login-title">
        <h2><i class="xi-lock"></i><i class="xi-ellipsis-h"></i> 회원정보 찾기</h2>
>>>>>>> refs/remotes/origin/master
    </div>
     <div id="login-box">
       <div id="find_info" class="new_win mbskin">
		<form name="frm" id="frm" method="post" enctype="multipart/form-data" accept-charset="utf-8">
			<input type="hidden" name="email" id="email"/>
						<%-- <h2><img src="/assets/user/images/member_title04.png" alt="아이디 찾기 회원가입 시 입력하신 정보를 입력해 주세요."></h2>--%>
							<table class="memberForm">
								<%--<caption>아이디 찾기이며 이름, 이메일 내용을 입력합니다.</caption> --%>
								<colgroup>
									<col style="width:95px">
									<col style="width:505px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="fname">이름</label></th>
										<td>
												<input type="text" id="fname" name="name" class="login_input" placeholder="이름">
												
										</td>
									</tr>
									<tr>
										<th scope="row">이메일</th>
										<td>
											<div class="typeEmail">
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
											</div>
										</td>
									</tr>
								</tbody>
							</table>
            				 <div class="win_btn">
								<button type="button" id="okBtn" class="btn_submit"><span>확인</span></button>
							 </div>
				</form>
    		</div>
		</div>

						<!-- 아이디 확인 -->
						<div class="idpwBox" id="exIdDiv" style="display: none;">
 							<div id="okIdDiv">
 								<p>아이디 조회 결과 입력하신 정보와 일치하는 아이디는 아래와 같습니다.</p>
 								<!-- <p><strong>- abcde**** ( 가입일자 : 2016년 2월 12일)</strong></p> -->
 							</div>
							<div class="btnArea">
								<button type="button" class="btnTypeBasic sizeM" id="loginBtn"><span>로그인</span></button>
							</div>
						</div>
						<!--// 아이디 확인 -->


						<!-- 아이디 없음-->
						<div class="idpwBox" id="nexIdDiv" style="display: none;">
							 <p><strong>입력하신 정보와 일치하는 아이디가 없습니다. 다시 입력 부탁드립니다.</strong></p>
							 <p>아직 회원이 아니세요? <a href="/member/join_1.do" class="lineBtn">회원가입</a>
						</div>
						<!--// 아이디 없음 -->

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

$(document).ready(function() {

	var board_name = "${bean.board_name}";
	
	/*
	* 확인 버튼
	*/
	$("#okBtn").click(function() {
		
		if( !valCheck('fname', '이름을 입력해주세요.') ) return;	
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
		
		$.ajax({
		    type : "GET",
            url: '/member/findId.do?name=' + $('#fname').val() + "&email=" + email,
            type : "GET",
            success: function(list) {
<<<<<<< HEAD
            	console.log(list);
				if(list == null || list.length < 1){
					$("#exIdDiv").hide();
					$("#nexIdDiv").show();
				}else{
					$("#nexIdDiv").hide();
					$("#exIdDiv").show();
					$("#okIdDiv").html("<p>아이디 조회 결과 입력하신 정보와 일치하는 아이디는 아래와 같습니다.</p>");
					for (var i = 0; i < list.length; i++) {
						var id = list[i].ID;
						var reg_date = list[i].REGDATE;
						$("#okIdDiv").append("<p><strong>- "+ id +" ( 가입일자 : " + reg_date + " )</strong></p>");
					}
				}
            }
         });
		
	});

	$("#email_sel").change(function() {
		var email2 = $(this).val();
		if(email2 == ""){
			$("#email_str").show();
		}else{
			$("#email_str").hide();
		}
	});

	$("#loginBtn").click(function() {
		location.href = "/member/login.do";
	});

});	
</script>
    <div class="login-title">
        <h2><i class="xi-lock"></i> 회원정보 찾기</h2>
=======
				if(list == null || list.length < 1){
					$("#exIdDiv").hide();
					$("#nexIdDiv").show();
				}else{
					$("#nexIdDiv").hide();
					$("#exIdDiv").show();
					$("#okIdDiv").html("<p>아이디 조회 결과 입력하신 정보와 일치하는 아이디는 아래와 같습니다.</p>");
					for (var i = 0; i < list.length; i++) {
						var id = list[i].ID;
						var reg_date = list[i].REG_DATE;
						$("#okIdDiv").append("<p><strong>- "+ id +" ( 가입일자 : " + reg_date + " )</strong></p>");
					}
				}
            }
         });
		
	});

	$("#email_sel").change(function() {
		var email2 = $(this).val();
		if(email2 == ""){
			$("#email_str").show();
		}else{
			$("#email_str").hide();
		}
	});

	$("#loginBtn").click(function() {
		location.href = "/member/login.do";
	});

});	
</script>
    <div class="login-title">
        <h2><i class="xi-lock"></i><i class="xi-ellipsis-h"></i> 회원정보 찾기</h2>
>>>>>>> refs/remotes/origin/master
    </div>
     <div id="login-box">
       <div id="find_info" class="new_win mbskin">
		<form name="frm" id="frm" method="post" enctype="multipart/form-data" accept-charset="utf-8">
			<input type="hidden" name="email" id="email"/>
						<%-- <h2><img src="/assets/user/images/member_title04.png" alt="아이디 찾기 회원가입 시 입력하신 정보를 입력해 주세요."></h2>--%>
							<table class="memberForm">
								<%--<caption>아이디 찾기이며 이름, 이메일 내용을 입력합니다.</caption> --%>
								<colgroup>
									<col style="width:95px">
									<col style="width:505px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="fname">이름</label></th>
										<td>
												<input type="text" id="fname" name="name" class="login_input" placeholder="이름">
												
										</td>
									</tr>
									<tr>
										<th scope="row">이메일</th>
										<td>
											<div class="typeEmail">
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
											</div>
										</td>
									</tr>
								</tbody>
							</table>
            				 <div class="win_btn">
								<button type="button" id="okBtn" class="btn_submit"><span>확인</span></button>
							 </div>
				</form>
    		</div>
		</div>

						<!-- 아이디 확인 -->
						<div class="idpwBox" id="exIdDiv" style="display: none;">
 							<div id="okIdDiv">
 								<p>아이디 조회 결과 입력하신 정보와 일치하는 아이디는 아래와 같습니다.</p>
 								<!-- <p><strong>- abcde**** ( 가입일자 : 2016년 2월 12일)</strong></p> -->
 							</div>
							<div class="btnArea">
								<button type="button" class="btnTypeBasic sizeM" id="loginBtn"><span>로그인</span></button>
							</div>
						</div>
						<!--// 아이디 확인 -->


						<!-- 아이디 없음-->
						<div class="idpwBox" id="nexIdDiv" style="display: none;">
							 <p><strong>입력하신 정보와 일치하는 아이디가 없습니다. 다시 입력 부탁드립니다.</strong></p>
							 <p>아직 회원이 아니세요? <a href="/member/join_1.do" class="lineBtn">회원가입</a>
						</div>
						<!--// 아이디 없음 -->

>>>>>>> refs/heads/202204
