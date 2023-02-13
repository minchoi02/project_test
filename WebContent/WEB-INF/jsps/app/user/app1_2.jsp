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
	<title>순환버스 회차 정보 - 정보드림 장애인 교통정보</title>
	<link rel="stylesheet" type="text/css" href="/assets/app/user/css/common.css">
	<script type="text/javascript" src="/assets/app/user/js/lib/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/assets/app/user/js/common_ui.js"></script>
	<script type="text/javascript">
	
	var playAlert;
	var rotation = "${rotation}";
	
	$(document).ready(function(){
		
		
		if(rotation != ""){
			$("#ro"+rotation).click();
		}
		
		$(".iconDrivingBus").css("display", "none");
		
		clearInterval(playAlert);
		playAlert = setInterval(function() {
			getBusService();
		}, 1000)	  
	});

	var topPer = 0;
	function getBusService(){
		
		$.ajax({
		    url: '/app/getBusLocation.do?bus=1',
		    type : "POST",
		    error: function(request,status,error){
		    	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    },
		    success: function(map){
		    	var status1 = map.status1;
		    	rotation = map.rotation;
				
		    	if(status1 == "운행종료"){
		    		$("#status_span").removeClass("wating");
		    		$("#status_span").removeClass("runing");
		    		$("#status_span").addClass("finished");
		    		$("#status_p").html("현재 운행종료되었습니다.");
		    	}else if(status1 == "운행중"){
		    		$("#status_span").removeClass("wating");
		    		$("#status_span").removeClass("finished");
		    		$("#status_span").addClass("runing");
		    		$("#status_p").html("현재 운행중입니다.");
		    		
		    		var now_location = map.now_location;
    		    	var station = map.station;
    		    	var top = 7 + ((now_location-1) * 9);
					
    		    	console.log(now_location + "번째 정류장" + "top:" + top + ", rotation:" + rotation);
    		    	
    		    	$("#busimg" + rotation).show();
					$("#busimg" + rotation).animate({ top: top+"px"}, 200 );
    		    	$("#busstaion" + rotation).html(station);
		    		
		    	}else if(status1 == "정비중"){
		    		$("#status_span").removeClass("runing");
		    		$("#status_span").removeClass("finished");
		    		$("#status_span").addClass("wating");
		    		$("#status_p").html("차량정비중입니다. 자세한 문의는 하단 연락처로 연락부탁드립니다.");
		    	}
		    	
		    	$("#status_span").html(status1);
		    }
		});
		
	}
	</script>
</head>
</head>
<body>
	<div class="appWrapper">
		<header>
			<div class="header">
				<div class="homeBtnBox">
					<button type="button" class="btnHome" onclick="location.href='/app/app1_1.do';"><em class="hidden">홈으로 이동</em></button>
				</div>
				<h1><span>정보드림</span>장애인 교통정보</h1>

				<div class="btnTabWrapper">
					<ul>
						<li><a href="/app/app1_2.do" class="on"><span>1호차</span></a></li>
						<li><a href="/app/app1_3.do"><span>2호차</span></a></li>
					</ul>
				</div>
			</div>
		</header>

		<section>
			<div  class="trafficInformation">
				<h2 class="hidden">회차별 노선</h2>

				<div class="currentInfoBox">
					<strong>1호차 74도 1266</strong><span id="status_span" class="statusTxts <c:choose><c:when test="${status1 eq '운행중'}">runing</c:when><c:when test="${status1 eq '정비중'}">wating</c:when><c:otherwise>finished</c:otherwise></c:choose>">${status1}</span>
					<c:choose>
						<c:when test="${status1 eq '운행중'}"><p id="status_p">현재 운행중입니다.</p></c:when>
						<c:when test="${status1 eq '정비중'}"><p id="status_p">차량정비중입니다. 자세한 문의는 하단 연락처로 연락부탁드립니다.</p></c:when>
						<c:otherwise><p id="status_p">현재 운행종료되었습니다.</p></c:otherwise>
					</c:choose>
				</div>

				<!--
				<div class="currentInfoBox">
					<strong>2호차 74오 1625</strong><span class="statusTxts finished">운행종료</span>
					
				</div>

				<div class="currentInfoBox">
					<strong>2호차 74오 1625</strong><span class="statusTxts waiting">정비중</span>
					
				</div>
				-->

				<!-- 탭 -->
				<div class="tabMenuWrapper">
					<div class="tabMenu num4">
						<div>
							<div class="btnTab on"><a id="ro1" href="#freeShuttleBus2_1"><span>1차</span></a></div>
							<div class="btnTab"><a id="ro2" href="#freeShuttleBus2_2"><span>2차</span></a></div>
							<div class="btnTab"><a id="ro3" href="#freeShuttleBus2_3"><span>3차</span></a></div>
							<div class="btnTab"><a id="ro4"href="#freeShuttleBus2_4"><span>4차</span></a></div>
						</div>
					</div>

					<div class="tabContBox" id="freeShuttleBus2_1">
						<div class="busTimeTblWrapper">
							<strong class="iconDrivingBus" id="busimg1"><span class="hidden"><em id="busstaion1"></em> 을 출발한 버스</span></strong>

							<ol class="busTimeTable">
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>08:32</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>08:34</em></span>
										</div>
									</div>
								</li>
								<li><!-- .active 활성화 -->
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>08:36</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>국세청</strong><span class="stopTime"><b class="hidden">시간</b><em>08:38</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>근로복지공단 대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:40</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>08:45</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>(구)샤또호텔</strong><span class="stopTime"><b class="hidden">시간</b><em>08:47</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>08:50</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>경성코아</strong><span class="stopTime"><b class="hidden">시간</b><em>08:55</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>선치과병원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:02</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중촌주공아파트 2단지</strong><span class="stopTime"><b class="hidden">시간</b><em>09:10</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중촌주공아파트 1단지</strong><span class="stopTime"><b class="hidden">시간</b><em>09:13</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>선병원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:15</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>은행선화주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>09:17</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전준법지원센터</strong><span class="stopTime"><b class="hidden">시간</b><em>09:19</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>흥국화재</strong><span class="stopTime"><b class="hidden">시간</b><em>09:21</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대우당약국</strong><span class="stopTime"><b class="hidden">시간</b><em>09:23</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역(중고가전)</strong><span class="stopTime"><b class="hidden">시간</b><em>09:33</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>09:34</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한밭자이</strong><span class="stopTime"><b class="hidden">시간</b><em>09:35</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>09:37</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>09:39</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>09:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>09:43</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:50</em></span>
										</div>
									</div>
								</li>
							</ol>
						</div>
					</div>

					<div class="tabContBox" id="freeShuttleBus2_2">
						<div class="busTimeTblWrapper">
							<strong class="iconDrivingBus" id="busimg2"><span class="hidden"><em id="busstaion2">읍내동 현대아파트 후문</em> 을 출발한 버스</span></strong>

							<ol class="busTimeTable">
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대화동 대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:33</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>10:34</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>10:36</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>10:38</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>10:40</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>10:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>10:44</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역(유신당)</strong><span class="stopTime"><b class="hidden">시간</b><em>10:45</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중앙시장</strong><span class="stopTime"><b class="hidden">시간</b><em>10:47</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>원동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>10:49</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>부가4가(농협)</strong><span class="stopTime"><b class="hidden">시간</b><em>10:54</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대우당약국</strong><span class="stopTime"><b class="hidden">시간</b><em>11:00</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역(중고가전)</strong><span class="stopTime"><b class="hidden">시간</b><em>11:13</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>11:14</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:15</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:17</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>11:19</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>11:22</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가(신선)</strong><span class="stopTime"><b class="hidden">시간</b><em>11:23</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>11:28</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>보람아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한마음아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:32</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>법동주공아파트 3단지</strong><span class="stopTime"><b class="hidden">시간</b><em>11:35</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>11:41</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>11:43</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>11:50</em></span>
										</div>
									</div>
								</li>
							</ol>
						</div>
					</div>

					<div class="tabContBox" id="freeShuttleBus2_3">
						<div class="busTimeTblWrapper">
							<strong class="iconDrivingBus" id="busimg3"><span class="hidden"><em id="busstaion3">체육재활원</em> 을 출발한 버스</span></strong>

							<ol class="busTimeTable">
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>13:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>13:32</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>13:36</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>13:36</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>법동주공아파트 3단지</strong><span class="stopTime"><b class="hidden">시간</b><em>13:39</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한마음아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>13:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>보람아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>13:45</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>13:48</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>13:53</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>13:54</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>13:57</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>13:59</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:01</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:03</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역</strong><span class="stopTime"><b class="hidden">시간</b><em>14:04</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대우당약국</strong><span class="stopTime"><b class="hidden">시간</b><em>14:06</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대흥동성당</strong><span class="stopTime"><b class="hidden">시간</b><em>14:09</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>충무체육관</strong><span class="stopTime"><b class="hidden">시간</b><em>14:13</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>부사4가(문창시장)</strong><span class="stopTime"><b class="hidden">시간</b><em>14:16</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:20</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역(중고가전)</strong><span class="stopTime"><b class="hidden">시간</b><em>14:33</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:34</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:35</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:37</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>14:39</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>14:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:43</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:50</em></span>
										</div>
									</div>
								</li>
							</ol>
						</div>
					</div>

					<div class="tabContBox" id="freeShuttleBus2_4">
						<div class="busTimeTblWrapper">
							<strong class="iconDrivingBus" id="busimg4"><span class="hidden"><em id="busstaion4">체육재활원</em> 을 출발한 버스</span></strong>
							<ol class="busTimeTable">
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>15:32</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>15:34</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>15:36</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>국세청</strong><span class="stopTime"><b class="hidden">시간</b><em>15:38</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>근로복지공단 대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:40</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>15:45</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>(구)샤또호텔</strong><span class="stopTime"><b class="hidden">시간</b><em>15:47</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>15:49</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>용전4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:52</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>스마트뷰 아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>15:54</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:56</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:58</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역(유신당) </strong><span class="stopTime"><b class="hidden">시간</b><em>16:00</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대우당약국</strong><span class="stopTime"><b class="hidden">시간</b><em>16:02</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중앙로역 6번출구</strong><span class="stopTime"><b class="hidden">시간</b><em>16:04</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전준법지원센터</strong><span class="stopTime"><b class="hidden">시간</b><em>16:06</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>은행선화주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>16:09</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>선병원</strong><span class="stopTime"><b class="hidden">시간</b><em>16:12</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중촌주공아파트 1단지</strong><span class="stopTime"><b class="hidden">시간</b><em>16:13</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중촌주공아파트 2단지</strong><span class="stopTime"><b class="hidden">시간</b><em>16:16</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>16:23</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>16:25</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>16:28</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>16:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>16:40</em></span>
										</div>
									</div>
								</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- //탭 -->
			</div>
		</section>

		<footer>
			<p>
				<span class="address">34917)대전광역시 중구 보문로 246, 대림빌딩 7층 705호<br> 전화번호 : 042-625-4678 / 팩스 : 042-635-4679</span>
				Copyright(c) 2018 대전장애인단체총연합회 All Rights reserved.
			</p>
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
	<title>순환버스 회차 정보 - 정보드림 장애인 교통정보</title>
	<link rel="stylesheet" type="text/css" href="/assets/app/user/css/common.css">
	<script type="text/javascript" src="/assets/app/user/js/lib/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/assets/app/user/js/common_ui.js"></script>
	<script type="text/javascript">
	
	var playAlert;
	var rotation = "${rotation}";
	
	$(document).ready(function(){
		
		
		if(rotation != ""){
			$("#ro"+rotation).click();
		}
		
		$(".iconDrivingBus").css("display", "none");
		
		clearInterval(playAlert);
		playAlert = setInterval(function() {
			getBusService();
		}, 1000)	  
	});

	var topPer = 0;
	function getBusService(){
		
		$.ajax({
		    url: '/app/getBusLocation.do?bus=1',
		    type : "POST",
		    error: function(request,status,error){
		    	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    },
		    success: function(map){
		    	var status1 = map.status1;
		    	rotation = map.rotation;
				
		    	if(status1 == "운행종료"){
		    		$("#status_span").removeClass("wating");
		    		$("#status_span").removeClass("runing");
		    		$("#status_span").addClass("finished");
		    		$("#status_p").html("현재 운행종료되었습니다.");
		    	}else if(status1 == "운행중"){
		    		$("#status_span").removeClass("wating");
		    		$("#status_span").removeClass("finished");
		    		$("#status_span").addClass("runing");
		    		$("#status_p").html("현재 운행중입니다.");
		    		
		    		var now_location = map.now_location;
    		    	var station = map.station;
    		    	var top = 7 + ((now_location-1) * 9);
					
    		    	console.log(now_location + "번째 정류장" + "top:" + top + ", rotation:" + rotation);
    		    	
    		    	$("#busimg" + rotation).show();
					$("#busimg" + rotation).animate({ top: top+"px"}, 200 );
    		    	$("#busstaion" + rotation).html(station);
		    		
		    	}else if(status1 == "정비중"){
		    		$("#status_span").removeClass("runing");
		    		$("#status_span").removeClass("finished");
		    		$("#status_span").addClass("wating");
		    		$("#status_p").html("차량정비중입니다. 자세한 문의는 하단 연락처로 연락부탁드립니다.");
		    	}
		    	
		    	$("#status_span").html(status1);
		    }
		});
		
	}
	</script>
</head>
</head>
<body>
	<div class="appWrapper">
		<header>
			<div class="header">
				<div class="homeBtnBox">
					<button type="button" class="btnHome" onclick="location.href='/app/app1_1.do';"><em class="hidden">홈으로 이동</em></button>
				</div>
				<h1><span>정보드림</span>장애인 교통정보</h1>

				<div class="btnTabWrapper">
					<ul>
						<li><a href="/app/app1_2.do" class="on"><span>1호차</span></a></li>
						<li><a href="/app/app1_3.do"><span>2호차</span></a></li>
					</ul>
				</div>
			</div>
		</header>

		<section>
			<div  class="trafficInformation">
				<h2 class="hidden">회차별 노선</h2>

				<div class="currentInfoBox">
					<strong>1호차 74도 1266</strong><span id="status_span" class="statusTxts <c:choose><c:when test="${status1 eq '운행중'}">runing</c:when><c:when test="${status1 eq '정비중'}">wating</c:when><c:otherwise>finished</c:otherwise></c:choose>">${status1}</span>
					<c:choose>
						<c:when test="${status1 eq '운행중'}"><p id="status_p">현재 운행중입니다.</p></c:when>
						<c:when test="${status1 eq '정비중'}"><p id="status_p">차량정비중입니다. 자세한 문의는 하단 연락처로 연락부탁드립니다.</p></c:when>
						<c:otherwise><p id="status_p">현재 운행종료되었습니다.</p></c:otherwise>
					</c:choose>
				</div>

				<!--
				<div class="currentInfoBox">
					<strong>2호차 74오 1625</strong><span class="statusTxts finished">운행종료</span>
					
				</div>

				<div class="currentInfoBox">
					<strong>2호차 74오 1625</strong><span class="statusTxts waiting">정비중</span>
					
				</div>
				-->

				<!-- 탭 -->
				<div class="tabMenuWrapper">
					<div class="tabMenu num4">
						<div>
							<div class="btnTab on"><a id="ro1" href="#freeShuttleBus2_1"><span>1차</span></a></div>
							<div class="btnTab"><a id="ro2" href="#freeShuttleBus2_2"><span>2차</span></a></div>
							<div class="btnTab"><a id="ro3" href="#freeShuttleBus2_3"><span>3차</span></a></div>
							<div class="btnTab"><a id="ro4"href="#freeShuttleBus2_4"><span>4차</span></a></div>
						</div>
					</div>

					<div class="tabContBox" id="freeShuttleBus2_1">
						<div class="busTimeTblWrapper">
							<strong class="iconDrivingBus" id="busimg1"><span class="hidden"><em id="busstaion1"></em> 을 출발한 버스</span></strong>

							<ol class="busTimeTable">
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>08:32</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>08:34</em></span>
										</div>
									</div>
								</li>
								<li><!-- .active 활성화 -->
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>08:36</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>국세청</strong><span class="stopTime"><b class="hidden">시간</b><em>08:38</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>근로복지공단 대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:40</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>08:45</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>(구)샤또호텔</strong><span class="stopTime"><b class="hidden">시간</b><em>08:47</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>08:50</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>경성코아</strong><span class="stopTime"><b class="hidden">시간</b><em>08:55</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>선치과병원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:02</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중촌주공아파트 2단지</strong><span class="stopTime"><b class="hidden">시간</b><em>09:10</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중촌주공아파트 1단지</strong><span class="stopTime"><b class="hidden">시간</b><em>09:13</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>선병원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:15</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>은행선화주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>09:17</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전준법지원센터</strong><span class="stopTime"><b class="hidden">시간</b><em>09:19</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>흥국화재</strong><span class="stopTime"><b class="hidden">시간</b><em>09:21</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대우당약국</strong><span class="stopTime"><b class="hidden">시간</b><em>09:23</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역(중고가전)</strong><span class="stopTime"><b class="hidden">시간</b><em>09:33</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>09:34</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한밭자이</strong><span class="stopTime"><b class="hidden">시간</b><em>09:35</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>09:37</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>09:39</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>09:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>09:43</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:50</em></span>
										</div>
									</div>
								</li>
							</ol>
						</div>
					</div>

					<div class="tabContBox" id="freeShuttleBus2_2">
						<div class="busTimeTblWrapper">
							<strong class="iconDrivingBus" id="busimg2"><span class="hidden"><em id="busstaion2">읍내동 현대아파트 후문</em> 을 출발한 버스</span></strong>

							<ol class="busTimeTable">
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대화동 대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:33</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>10:34</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>10:36</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>10:38</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>10:40</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>10:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>10:44</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역(유신당)</strong><span class="stopTime"><b class="hidden">시간</b><em>10:45</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중앙시장</strong><span class="stopTime"><b class="hidden">시간</b><em>10:47</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>원동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>10:49</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>부가4가(농협)</strong><span class="stopTime"><b class="hidden">시간</b><em>10:54</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대우당약국</strong><span class="stopTime"><b class="hidden">시간</b><em>11:00</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역(중고가전)</strong><span class="stopTime"><b class="hidden">시간</b><em>11:13</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>11:14</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:15</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:17</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>11:19</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>11:22</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가(신선)</strong><span class="stopTime"><b class="hidden">시간</b><em>11:23</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>11:28</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>보람아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한마음아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:32</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>법동주공아파트 3단지</strong><span class="stopTime"><b class="hidden">시간</b><em>11:35</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>11:41</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>11:43</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>11:50</em></span>
										</div>
									</div>
								</li>
							</ol>
						</div>
					</div>

					<div class="tabContBox" id="freeShuttleBus2_3">
						<div class="busTimeTblWrapper">
							<strong class="iconDrivingBus" id="busimg3"><span class="hidden"><em id="busstaion3">체육재활원</em> 을 출발한 버스</span></strong>

							<ol class="busTimeTable">
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>13:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>13:32</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>13:36</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>13:36</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>법동주공아파트 3단지</strong><span class="stopTime"><b class="hidden">시간</b><em>13:39</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한마음아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>13:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>보람아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>13:45</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>13:48</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>13:53</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>13:54</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>13:57</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>13:59</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:01</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:03</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역</strong><span class="stopTime"><b class="hidden">시간</b><em>14:04</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대우당약국</strong><span class="stopTime"><b class="hidden">시간</b><em>14:06</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대흥동성당</strong><span class="stopTime"><b class="hidden">시간</b><em>14:09</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>충무체육관</strong><span class="stopTime"><b class="hidden">시간</b><em>14:13</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>부사4가(문창시장)</strong><span class="stopTime"><b class="hidden">시간</b><em>14:16</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:20</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역(중고가전)</strong><span class="stopTime"><b class="hidden">시간</b><em>14:33</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:34</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:35</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:37</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>14:39</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>14:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:43</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:50</em></span>
										</div>
									</div>
								</li>
							</ol>
						</div>
					</div>

					<div class="tabContBox" id="freeShuttleBus2_4">
						<div class="busTimeTblWrapper">
							<strong class="iconDrivingBus" id="busimg4"><span class="hidden"><em id="busstaion4">체육재활원</em> 을 출발한 버스</span></strong>
							<ol class="busTimeTable">
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>15:32</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>15:34</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>읍내동 현대아파트 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>15:36</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>국세청</strong><span class="stopTime"><b class="hidden">시간</b><em>15:38</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>근로복지공단 대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:40</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:42</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>15:45</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>(구)샤또호텔</strong><span class="stopTime"><b class="hidden">시간</b><em>15:47</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>15:49</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>용전4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:52</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>스마트뷰 아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>15:54</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:56</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:58</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전역(유신당) </strong><span class="stopTime"><b class="hidden">시간</b><em>16:00</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대우당약국</strong><span class="stopTime"><b class="hidden">시간</b><em>16:02</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중앙로역 6번출구</strong><span class="stopTime"><b class="hidden">시간</b><em>16:04</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대전준법지원센터</strong><span class="stopTime"><b class="hidden">시간</b><em>16:06</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>은행선화주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>16:09</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>선병원</strong><span class="stopTime"><b class="hidden">시간</b><em>16:12</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중촌주공아파트 1단지</strong><span class="stopTime"><b class="hidden">시간</b><em>16:13</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>중촌주공아파트 2단지</strong><span class="stopTime"><b class="hidden">시간</b><em>16:16</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>솔랑마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>16:23</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>16:25</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>16:28</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>16:30</em></span>
										</div>
									</div>
								</li>
								<li>
									<div class="busStopBox">
										<div>
											<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>16:40</em></span>
										</div>
									</div>
								</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- //탭 -->
			</div>
		</section>

		<footer>
			<p>
				<span class="address">34917)대전광역시 중구 보문로 246, 대림빌딩 7층 705호<br> 전화번호 : 042-625-4678 / 팩스 : 042-635-4679</span>
				Copyright(c) 2018 대전장애인단체총연합회 All Rights reserved.
			</p>
		</footer>
	</div>

</body>
>>>>>>> refs/heads/202204
</html>