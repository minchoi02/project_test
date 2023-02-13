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
	<title>순환버스 선택 - 정보드림 장애인 교통정보</title>
	<link rel="stylesheet" type="text/css" href="/assets/app/user/css/common.css">
	<script type="text/javascript" src="/assets/app/user/js/lib/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/assets/app/user/js/common_ui.js"></script>
	<script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
	
	var playAlert;
	
	$(document).ready(function(){
		clearInterval(playAlert);
		playAlert = setInterval(function() {
			getBusService();
		}, 1000)		  
	});
	
	function getBusService(){
		
		$.ajax({
		    url: '/app/getBusService.do',
		    type : "POST",
		    error: function(request,status,error){
		    	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    },
		    success: function(r){
		    	var status1 = r.status1;
		    	var status2 = r.status2;
		    	var station1 = r.station1;
		    	var station2 = r.station2;
		    	
		    	$(".bus1").html("순환버스 1호차 - " + status1);
		    	$(".bus2").html("순환버스 2호차 - " + status2);
		    	
		    	$("#station1_span").html(station1);
		    	$("#station2_span").html(station2);
		    	
		    	if(status1 == "운행중"){
		    		$("#ptag1").addClass("runing");
		    	}else{
		    		$("#ptag1").removeClass("runing");
		    	}
		    	
		    	if(status2 == "운행중"){
		    		$("#ptag2").addClass("runing");
		    	}else{
		    		$("#ptag2").removeClass("runing");
		    	}
		    	
		    	if(station1 == "정보없음"){
		    		$("#station1_span").addClass("noData");
		    	}else{
		    		$("#station1_span").removeClass("noData");
		    	}
		    	
		    	if(station2 == "정보없음"){
		    		$("#station2_span").addClass("noData");
		    	}else{
		    		$("#station2_span").removeClass("noData");
		    	}
		    	
		    }
		});
		
	}	
	</script>
	</head>
	</head>
	<body onload="getBusService();">
	<div class="appWrapper">
		<header>
			<div class="header">
				<div class="top_logo">
					<h1><a href="/mobile/main.do">대전장애인맞춤복지정보 정보드림</a></h1>
				</div>
				<h1><span>정보드림</span>무료순환버스</h1>
				<p class="p_text">본 프로그램은 대전장애인단체총연합회에서 제공하는<br>
					무료순환버스의 위치정보안내 서비스입니다.</p>
			</div>
		</header>
		<section>
			<h2 class="hidden">순환버스 선택</h2>
			<ul class="circulatingBus">
				<li> <a href="/app/app1_2.do">
					<p id="ptag1"> <strong class="drivingInfo bus1">순환버스 1호차 - 운행종료</strong> <span>74도 1266</span> <span id="station1_span">정보없음</span> </p>
					</a> </li>
				<li> <a href="/app/app1_3.do">
					<p id="ptag2"> <strong class="drivingInfo bus2">순환버스 2호차 - 운행종료</strong> <span>74오 1625</span> <span id="station2_span">정보없음</span> </p>
					</a> </li>
			</ul>
		</section>
		<footer>
			<p> <span class="address">34917)대전광역시 중구 보문로 246, 대림빌딩 7층 705호<br>
				전화번호 : 042-625-4678 / 팩스 : 042-635-4679</span> Copyright(c) 2018 대전장애인단체총연합회 All Rights reserved. </p>
		</footer>
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
	<title>순환버스 선택 - 정보드림 장애인 교통정보</title>
	<link rel="stylesheet" type="text/css" href="/assets/app/user/css/common.css">
	<script type="text/javascript" src="/assets/app/user/js/lib/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/assets/app/user/js/common_ui.js"></script>
	<script type="text/javascript" src="/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
	
	var playAlert;
	
	$(document).ready(function(){
		clearInterval(playAlert);
		playAlert = setInterval(function() {
			getBusService();
		}, 1000)		  
	});
	
	function getBusService(){
		
		$.ajax({
		    url: '/app/getBusService.do',
		    type : "POST",
		    error: function(request,status,error){
		    	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    },
		    success: function(r){
		    	var status1 = r.status1;
		    	var status2 = r.status2;
		    	var station1 = r.station1;
		    	var station2 = r.station2;
		    	
		    	$(".bus1").html("순환버스 1호차 - " + status1);
		    	$(".bus2").html("순환버스 2호차 - " + status2);
		    	
		    	$("#station1_span").html(station1);
		    	$("#station2_span").html(station2);
		    	
		    	if(status1 == "운행중"){
		    		$("#ptag1").addClass("runing");
		    	}else{
		    		$("#ptag1").removeClass("runing");
		    	}
		    	
		    	if(status2 == "운행중"){
		    		$("#ptag2").addClass("runing");
		    	}else{
		    		$("#ptag2").removeClass("runing");
		    	}
		    	
		    	if(station1 == "정보없음"){
		    		$("#station1_span").addClass("noData");
		    	}else{
		    		$("#station1_span").removeClass("noData");
		    	}
		    	
		    	if(station2 == "정보없음"){
		    		$("#station2_span").addClass("noData");
		    	}else{
		    		$("#station2_span").removeClass("noData");
		    	}
		    	
		    }
		});
		
	}	
	</script>
	</head>
	</head>
	<body onload="getBusService();">
	<div class="appWrapper">
		<header>
			<div class="header">
				<div class="top_logo">
					<h1><a href="/mobile/main.do">대전장애인맞춤복지정보 정보드림</a></h1>
				</div>
				<h1><span>정보드림</span>무료순환버스</h1>
				<p class="p_text">본 프로그램은 대전장애인단체총연합회에서 제공하는<br>
					무료순환버스의 위치정보안내 서비스입니다.</p>
			</div>
		</header>
		<section>
			<h2 class="hidden">순환버스 선택</h2>
			<ul class="circulatingBus">
				<li> <a href="/app/app1_2.do">
					<p id="ptag1"> <strong class="drivingInfo bus1">순환버스 1호차 - 운행종료</strong> <span>74도 1266</span> <span id="station1_span">정보없음</span> </p>
					</a> </li>
				<li> <a href="/app/app1_3.do">
					<p id="ptag2"> <strong class="drivingInfo bus2">순환버스 2호차 - 운행종료</strong> <span>74오 1625</span> <span id="station2_span">정보없음</span> </p>
					</a> </li>
			</ul>
		</section>
		<footer>
			<p> <span class="address">34917)대전광역시 중구 보문로 246, 대림빌딩 7층 705호<br>
				전화번호 : 042-625-4678 / 팩스 : 042-635-4679</span> Copyright(c) 2018 대전장애인단체총연합회 All Rights reserved. </p>
		</footer>
	</div>
</body>
>>>>>>> refs/heads/202204
</html>