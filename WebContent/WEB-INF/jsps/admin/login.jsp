<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<title>정보드림 관리자</title>
	<!-- <link type="text/css" rel='stylesheet' href="/assets/admin/css/reset.css" />
	<link type="text/css" rel='stylesheet' href="/assets/admin/css/login.css" /> -->
	<link type="text/css" rel='stylesheet' href="/assets/admin/css/admin.css" />
	<script type="text/javascript" src="/assets/admin/js/jquery/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/assets/admin/js/setting.js"></script>
	<script type="text/javascript" src="/assets/admin/js/validation.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#id").focus();
	});
	function login(){
		
		if(!valCheck('id','아이디를 입력하세요')){ return;}
		if(!valCheck('pwd','비밀번호를 입력하세요')){ return;}
			
		$.ajax({
		    url: '/manage/loginPro.do?id='+$('#id').val()+'&pwd='+$('#pwd').val(),
		    type : "POST",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(r){
		    	if(r == 1){
		    		alert('아이디 또는 비밀번호가 틀립니다.');
		    		$('#pwd').focus();
		    	}	
		    	else if(r== 2){
		    		alert('아이디 또는 비밀번호가 틀립니다.');
		    		$('#pwd').focus();
		    	}
		    	else if(r == 100){
		    		
		    		$.ajax({
		    		    url: '/manage/getPermMenu.do',
		    		    type : "POST",
		    		    error: function(){
		    		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    		    },
		    		    success: function(r){
		    		    	if(r == ""){
		    		    		location.href='/admin/001/member/list.do'; 		
		    		    	}else{
		    		    		location.href=r;
		    		    	}
		    		    }
		    		});		    		
		    		
		    	}
		    	else{
		    		alert('다시 시도해주세요');
		    	}
		    }
		});
	}
</script>
</head>
<body class="bg01">
<div id="Warp">
	<div class="loginB">
		<div class="loginArea">
			<!-- 정보 입력 폼 -->
			<form action="/loginPro.do" id="loginForm" name="loginForm" >
			<div class="inputA">
				<p>
					<span class="hidden">아 이 디</span>
					<input type="text" style="width:190px;ime-mode:disabled"  name="id" id="id" value="" tabindex="1">
				</p>
				<p class="pt26">
					<span class="hidden">비밀번호</span>
					<input type="password" style="width:190px;" name="pwd" id="pwd" value="" tabindex="2" onkeydown="javascript: if (event.keyCode == 13) {login();}">
				</p>
				<p class="bt_login">
					<a href="#none"  onclick="login();" tabindex="3" class="btn_login">로그인</a>
				</p>
			</div>
			</form>
			<!-- //정보 입력 폼 -->
		</div>
		<div class="foot">
			Copyright ⓒ 정보드림 2018. All right reserved.
		</div>
	</div>
</div>
</body>
</html>

=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<title>정보드림 관리자</title>
	<!-- <link type="text/css" rel='stylesheet' href="/assets/admin/css/reset.css" />
	<link type="text/css" rel='stylesheet' href="/assets/admin/css/login.css" /> -->
	<link type="text/css" rel='stylesheet' href="/assets/admin/css/admin.css" />
	<script type="text/javascript" src="/assets/admin/js/jquery/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/assets/admin/js/setting.js"></script>
	<script type="text/javascript" src="/assets/admin/js/validation.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#id").focus();
	});
	function login(){
		
		if(!valCheck('id','아이디를 입력하세요')){ return;}
		if(!valCheck('pwd','비밀번호를 입력하세요')){ return;}
			
		$.ajax({
		    url: '/manage/loginPro.do?id='+$('#id').val()+'&pwd='+$('#pwd').val(),
		    type : "POST",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(r){
		    	if(r == 1){
		    		alert('아이디 또는 비밀번호가 틀립니다.');
		    		$('#pwd').focus();
		    	}	
		    	else if(r== 2){
		    		alert('아이디 또는 비밀번호가 틀립니다.');
		    		$('#pwd').focus();
		    	}
		    	else if(r == 100){
		    		
		    		$.ajax({
		    		    url: '/manage/getPermMenu.do',
		    		    type : "POST",
		    		    error: function(){
		    		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    		    },
		    		    success: function(r){
		    		    	if(r == ""){
		    		    		location.href='/admin/001/member/list.do'; 		
		    		    	}else{
		    		    		location.href=r;
		    		    	}
		    		    }
		    		});		    		
		    		
		    	}
		    	else{
		    		alert('다시 시도해주세요');
		    	}
		    }
		});
	}
</script>
</head>
<body class="bg01">
<div id="Warp">
	<div class="loginB">
		<div class="loginArea">
			<!-- 정보 입력 폼 -->
			<form action="/loginPro.do" id="loginForm" name="loginForm" >
			<div class="inputA">
				<p>
					<span class="hidden">아 이 디</span>
					<input type="text" style="width:190px;ime-mode:disabled"  name="id" id="id" value="" tabindex="1">
				</p>
				<p class="pt26">
					<span class="hidden">비밀번호</span>
					<input type="password" style="width:190px;" name="pwd" id="pwd" value="" tabindex="2" onkeydown="javascript: if (event.keyCode == 13) {login();}">
				</p>
				<p class="bt_login">
					<a href="#none"  onclick="login();" tabindex="3" class="btn_login">로그인</a>
				</p>
			</div>
			</form>
			<!-- //정보 입력 폼 -->
		</div>
		<div class="foot">
			Copyright ⓒ 정보드림 2018. All right reserved.
		</div>
	</div>
</div>
</body>
</html>

>>>>>>> refs/heads/202204
