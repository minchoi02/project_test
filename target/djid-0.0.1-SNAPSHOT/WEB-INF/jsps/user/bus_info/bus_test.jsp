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
	<script type="text/javascript">

	var bus = "${bean.bus}"; // 버스 호차
	
	  $(document).ready(function(){
		  
		  $("#1_2_stop").click(function(){
			  alert("운행종료");
			  $.ajax({
				    url: '/bus_info/busTest.do?status=1',
				    type : "POST",
				    error: function(){
				    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
				    },
				    success: function(r){
				    	
				    }
				});
		  });
		  
		  $("#1_2_start").click(function(){
			  alert("운행시작");
			  $.ajax({
				    url: '/bus_info/busTest.do?status=2',
				    type : "POST",
				    error: function(){
				    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
				    },
				    success: function(r){
				    	
				    }
				});
		  });
		  
		  $("#1_2_wait").click(function(){
			  alert("운행중");
			  $.ajax({
				    url: '/bus_info/busTest.do?status=3',
				    type : "POST",
				    error: function(){
				    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
				    },
				    success: function(r){
				    	
				    }
				});
		  });
				
	  });
	
	
	</script>
</head>
<body>
	<h1>운행시작시 실제 버스기사가 운행하는 것처럼 시뮬레이션됩니다. </h1>
	<h1>이전에 수집한 버스기사 실시간 위치정보를 3초에 한번씩 발송하여 운행하는 것처럼 함.</h1>
	<br/>
	<input type="button" value="1호차 - 2회차 운행시작" id="1_2_start" style="width: 200px; height: 200px;"/>
	<br/>
	<br/>
	<input type="button" value="1호차 - 2회차 운행종료" id="1_2_stop"  style="width: 200px; height: 200px;"/>
	<br/>
	<br/>
	<input type="button" value="1호차 - 2회차 정비중"  id="1_2_wait"  style="width: 200px; height: 200px;"/>

</body>
</html>