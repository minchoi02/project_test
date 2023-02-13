<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
	<title>정보드림 장애인 교통정보 운전자용 앱</title>
	<link rel="stylesheet" type="text/css" href="/assets/app/driver/css/common.css">
	<script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/assets/admin/js/validation.js"></script>
	<script type="text/javascript">
	  $(document).ready(function(){
		  
		  var logout = "${bean.logout}";
		  
		  if(logout != "ok"){
			  var auto_id = getCookie("auto_id");
			  $("#id").val(auto_id);
			  
			  var auto_pwd = getCookie("auto_pwd");
			  $("#pwd").val(auto_pwd);

			  if( auto_id != "" && auto_pwd != ""){
				  $("#bus").val(getCookie("auto_bus"));
				  $("#frm").prop("action", "/app/app2_2.do");
				  $("#frm").submit();
			  }
		  }		  
		  
		  var id = getCookie("id");
		  $("#id").val(id); 
		  
		  if($("#id").val() != ""){
			  $("#saveID").attr("checked", true);
		  }
		    
		  $("#loginBtn").click(function(){
			  
			  if( !valCheck('id', '아이디를 입력해주세요') ) return;
			  if( !valCheck('pwd', '비밀번호를 입력해주세요') ) return;
			  
			  if($("#saveID").is(":checked")){
				  setCookie("id", $("#id").val(), 365);
			  }else{
				  deleteCookie("id");
			  }
			  
			  if($("#autoLogin").is(":checked")){
				  setCookie("auto_id", $("#id").val(), 365);
				  setCookie("auto_pwd", $("#pwd").val(), 365);
				  setCookie("auto_bus", $("#bus").val(), 365);
			  }else{
				  deleteCookie("auto_id");
				  deleteCookie("auto_pwd");
				  deleteCookie("auto_bus");
			  }
			  
			  $("#frm").prop("action", "/app/app2_2.do");
			  $("#frm").submit();
		  });
	  });
	  
	  function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
	</script>
</head>
<body>
	<div class="appWrapper intro">
		<div class="section">
			<div id="headerIntro">
				<h1 class="title"><span>정보드림 장애인 교통정보</span>운전자용 앱</h1>
			</div>
			
			<form name="frm" id="frm" method="post" action="">
				<div class="fieldSetBox">
					<fieldset>
						<legend>앱 로그인</legend>
	
						<div class="formRow">
							<label for="selectBusService">호차선택</label>
							<span>
								<select id="selectBusService" id="bus" name="bus">
									<option value="1">1호차</option>
									<option value="2">2호차</option>
								</select>
							</span>
						</div>
						<div class="formRow"><input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" title="아이디"></div>
						<div class="formRow"><input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" title="비밀번호"></div>
						<div class="formRow chkbox">
							<span>
								<input type="checkbox" id="saveID"><label for="saveID">아이디 저장</label>
							</span>
							<span>
								<input type="checkbox" id="autoLogin"><label for="autoLogin">자동로그인</label>
							</span>
						</div>
	
	
	
						<p><button type="button" class="btn" id="loginBtn">로그인</button></p>
					</fieldset>
				</div>
			</form>
		</div>
	</div>
</body>
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
	<title>정보드림 장애인 교통정보 운전자용 앱</title>
	<link rel="stylesheet" type="text/css" href="/assets/app/driver/css/common.css">
	<script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/assets/admin/js/validation.js"></script>
	<script type="text/javascript">
	  $(document).ready(function(){
		  
		  var logout = "${bean.logout}";
		  
		  if(logout != "ok"){
			  var auto_id = getCookie("auto_id");
			  $("#id").val(auto_id);
			  
			  var auto_pwd = getCookie("auto_pwd");
			  $("#pwd").val(auto_pwd);

			  if( auto_id != "" && auto_pwd != ""){
				  $("#bus").val(getCookie("auto_bus"));
				  $("#frm").prop("action", "/app/app2_2.do");
				  $("#frm").submit();
			  }
		  }		  
		  
		  var id = getCookie("id");
		  $("#id").val(id); 
		  
		  if($("#id").val() != ""){
			  $("#saveID").attr("checked", true);
		  }
		    
		  $("#loginBtn").click(function(){
			  
			  if( !valCheck('id', '아이디를 입력해주세요') ) return;
			  if( !valCheck('pwd', '비밀번호를 입력해주세요') ) return;
			  
			  if($("#saveID").is(":checked")){
				  setCookie("id", $("#id").val(), 365);
			  }else{
				  deleteCookie("id");
			  }
			  
			  if($("#autoLogin").is(":checked")){
				  setCookie("auto_id", $("#id").val(), 365);
				  setCookie("auto_pwd", $("#pwd").val(), 365);
				  setCookie("auto_bus", $("#bus").val(), 365);
			  }else{
				  deleteCookie("auto_id");
				  deleteCookie("auto_pwd");
				  deleteCookie("auto_bus");
			  }
			  
			  $("#frm").prop("action", "/app/app2_2.do");
			  $("#frm").submit();
		  });
	  });
	  
	  function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
	</script>
</head>
<body>
	<div class="appWrapper intro">
		<div class="section">
			<div id="headerIntro">
				<h1 class="title"><span>정보드림 장애인 교통정보</span>운전자용 앱</h1>
			</div>
			
			<form name="frm" id="frm" method="post" action="">
				<div class="fieldSetBox">
					<fieldset>
						<legend>앱 로그인</legend>
	
						<div class="formRow">
							<label for="selectBusService">호차선택</label>
							<span>
								<select id="selectBusService" id="bus" name="bus">
									<option value="1">1호차</option>
									<option value="2">2호차</option>
								</select>
							</span>
						</div>
						<div class="formRow"><input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" title="아이디"></div>
						<div class="formRow"><input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" title="비밀번호"></div>
						<div class="formRow chkbox">
							<span>
								<input type="checkbox" id="saveID"><label for="saveID">아이디 저장</label>
							</span>
							<span>
								<input type="checkbox" id="autoLogin"><label for="autoLogin">자동로그인</label>
							</span>
						</div>
	
	
	
						<p><button type="button" class="btn" id="loginBtn">로그인</button></p>
					</fieldset>
				</div>
			</form>
		</div>
	</div>
</body>
>>>>>>> refs/heads/202204
</html>