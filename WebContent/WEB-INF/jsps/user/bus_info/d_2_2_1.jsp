<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>
	
	var playAlert;
	
	$(document).ready(function(){
		
		$.ajax({
			url: '/app/getBusLocation.do?bus=2',
		    type : "POST",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(r){
		    	var status = r.status1;
		    	var rotation = r.rotation;
		    	
	    		$(".currentInfoBox").html("<p class='statusTxts finished'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625 - 운행종료</em></span></p>");
	    		
	    		console.log("=====================");
	    		console.log(status)
	    		console.log(rotation)
	    		console.log("=====================");
	    		
	    		if(status == "운행중"){
	    			$("#rotation_div"+rotation).html("<p class='statusTxts runing'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625</em></span></p>");
	    			$("#bustab"+rotation).click();
	    		}else if(status == "정비중"){
	    			$("#rotation_div"+rotation).html("<p class='statusTxts waiting'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625 - 정비중</em></span></p>");
	    		}	    		
		    }
		});
		
		
		clearInterval(playAlert);
		playAlert = setInterval(function() {
			getBusStatus();
		}, 2000)		   
	});
	
	function getBusStatus(){
		
		$.ajax({
			url: '/app/getBusLocation.do?bus=2',
		    type : "POST",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(map){
		    	var status = map.status1;
		    	var rotation = map.rotation;
		    	
		    	console.log("status="+status);
		    	console.log("rotation="+rotation);
		    	
	    		$(".currentInfoBox").html("<p class='statusTxts finished'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625 - 운행종료</em></span></p>");
	    		
	    		if(status == "운행중"){
	    			$("#rotation_div"+rotation).html("<p class='statusTxts runing'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625 - 운행중</em></span></p>");
	    		}else if(status == "정비중"){
	    			$("#rotation_div"+rotation).html("<p class='statusTxts waiting'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625 - 정비중</em></span></p>");
	    		}
	    		
	    		// 운행중이라면 버스위치 조회 후 위치 표시
	    		if(status == "운행중"){
	    			var now_location = map.now_location;
    		    	
    		    	if(now_location == null){
    		    		return;
    		    	}
    		    	
    		    	var station = map.station1;
    		    	// 전체길이 720 - 첫정류장시작 50 = 670
    		    	// 첫줄 34 정류장 * 680
    		    	// station 당 20씩 증가해보자.
    		    	// 마지막 33 정류장에서는 10만 증가해보자
    		    	var left = 0;
    		    	var top = 0;
    		    	if(now_location > 0 && now_location < 36){ // 첫번째 줄이라면
    		    		left = 50 + ((now_location-1) * 20);
    		    		top = 0;
    		    		if(now_location == 35){
    		    			left-= 10;
    		    		}
    		    	}else if(now_location >= 36 && now_location < 58){
    		    		left = 720;
    		    		var toLocation = now_location-35;
    		    		if(toLocation == 1){
    		    			top = top + 25;
    		    		}else if(toLocation == 2){
    		    			top = top + 25 + 25;
    		    		}else if(toLocation >= 20){
    		    			top = 50 + 210 + ((toLocation-19) * 25);
    		    		}else{
    		    			top = 50 + ((toLocation-2) * 11.66);
    		    		}
    		    	}else if(now_location >= 58 && now_location < 95){
	    		    	top = 310;
	    		    	left = 720;
	    		    	var leLocation = now_location-57;
	    		    	if(leLocation == 1){
    		    			left = left - 25;
    		    		}else if(leLocation == 2){
    		    			left = left - 25 - 25;
    		    		}else if(leLocation >= 3 && leLocation < 36){
    		    			left = left - (50 + ((leLocation-2) * 20));
    		    		}else{
    		    			left = left - (50 + 620 + ((leLocation-36) * 20));
    		    		}
    		    	}else if(now_location >= 95){
    		    		top = 310;
    		    		left = 0;
    		    		var leLocation = now_location-94;
    		    		if(leLocation <= 2){
    		    			top = top - (leLocation * 25);
    		    		}else{
    		    			top = top - 50 - ((leLocation-2) * 11.66);
    		    		}
    		    	}
    		    		
    		    	console.log("now_location = " + now_location)
    		    	console.log("left = " + left);
    		    	console.log("top = " + top);
    		    	
    		    	$("#busimg" + rotation).css("display", "");
    		    	$("#busimg" + rotation).animate({ left: left+"px"}, 200 );
    		    	$("#busimg" + rotation).animate({ top: top+"px"}, 200 );
    		    	$("#busstaion" + rotation).html(station);
	    		}else{
	    			// 운행중이아니라면 버스 표시 제거
	    			$("#busimg" + rotation).css("display", "none");
	    		}
	    		
		    }
		});
		
	}	
</script>
					<div class="contsArea trafficInformation">
						<p class="textParaList">무료순환버스 2호차의 운행노선안내입니다.</p>

						<!-- 노선도 -->
						<!-- ** 버스위치
							.distance_1 = 25%,
							.distance_2 = 50%,
							.distance_3 = 75%,
							.distance_4 = 100%
						-->

						<div class="busRouteWrapper">
							<div class="busRoute freeShuttleBus2_1" style="display:block;">
								<div class="busStopList">
									<span class="hidden">1차 운행 버스노선</span>

									<div class="currentInfoBox" id="rotation_div1">
									</div>
									
									<p class="iconDrivingBus" id="busimg1" style="display: none;"><em class="hidden"><span id="busstaion1"></span>에서 출발한 버스</em></p>

									<ol>
										<li class="bsStop01 toRight"><strong>체육재활원</strong></li>
										<li class="bsStop02 toRight"><strong>대전병원</strong></li>
										<li class="bsStop03 toRight"><strong>오정4가</strong></li>
										<li class="bsStop04 toRight"><strong>호남철교</strong></li>
										<li class="bsStop05 toRight"><strong>대덕구청</strong></li>
										<li class="bsStop06 toRight"><strong>홍도육교</strong></li>
										<li class="bsStop07 toRight"><strong>한밭자이<br>아파트</strong></li>
										<li class="bsStop08 toRight"><strong>삼성4가</strong></li>
										<li class="bsStop09 cornerRT"><strong>대전역</strong></li>
										<li class="bsStop10 toBottom"><strong>중앙시장</strong></li>
										<li class="bsStop11 toBottom"><strong>인동4가</strong></li>
										<li class="bsStop12 toBottom"><strong>어진마을<br>아파트</strong></li>
										<li class="bsStop13 toBottom"><strong>판암4가</strong></li>
										<li class="bsStop14 cornerRB"><strong>판암주공<br>아파트 4단지</strong></li>
										<li class="bsStop15 toLeft"><strong>판암역</strong></li>
										<li class="bsStop16 toLeft"><strong>동양의원</strong></li>
										<li class="bsStop17 toLeft"><strong>효동4가</strong></li>
										<li class="bsStop18 toLeft"><strong>인동4가</strong></li>
										<li class="bsStop19 toLeft"><strong>소제동우체국</strong></li>
										<li class="bsStop20 toLeft"><strong>성남4가</strong></li>
										<li class="bsStop21 toLeft"><strong>효촌마을<br>아파트</strong></li>
										<li class="bsStop22 toLeft"><strong>복합터미널</strong></li>
										<li class="bsStop23 cornerLB"><strong>산림조합</strong></li>
										<li class="bsStop24 toTop"><strong>웰니스병원</strong></li>
										<li class="bsStop25 toTop"><strong>다솜요양병원</strong></li>
										<li class="bsStop26 toTop"><strong>한전</strong></li>
										<li class="bsStop27 toTop"><strong>증산도</strong></li>
									</ol>
								</div>
							</div>
							<div class="busRoute freeShuttleBus2_2">
								<div class="busStopList">
									<span class="hidden">2차 운행 버스노선</span>

									<div class="currentInfoBox" id="rotation_div2">
									</div>
									
									<p class="iconDrivingBus" id="busimg2" style="display: none;"><em class="hidden"><span id="busstaion2"></span>에서 출발한 버스</em></p>

									<ol>
										<li class="bsStop01 toRight"><strong>체육재활원</strong></li>
										<li class="bsStop02 toRight"><strong>읍내동<br>주민센터</strong></li>
										<li class="bsStop03 toRight"><strong>읍내동 현대아파트 후문</strong></li>
										<li class="bsStop04 toRight"><strong>읍내동 현대아파트 정문</strong></li>
										<li class="bsStop05 toRight"><strong>국세청</strong></li>
										<li class="bsStop06 toRight"><strong>중앙병원</strong></li>
										<li class="bsStop07 toRight"><strong>하나로병원</strong></li>
										<li class="bsStop08 toRight"><strong>한전</strong></li>
										<li class="bsStop09 cornerRT"><strong>(구)샤또호텔</strong></li>
										<li class="bsStop10 toBottom"><strong>복합터미널</strong></li>
										<li class="bsStop11 toBottom"><strong>용전4가</strong></li>
										<li class="bsStop12 toBottom"><strong>(구)성남육교</strong></li>
										<li class="bsStop13 toBottom"><strong>성남4가</strong></li>
										<li class="bsStop14 cornerRB"><strong>소제동우체국</strong></li>
										<li class="bsStop15 toLeft"><strong>중앙시장</strong></li>
										<li class="bsStop16 toLeft"><strong>인동4가</strong></li>
										<li class="bsStop17 toLeft"><strong>어진마을<br>아파트</strong></li>
										<li class="bsStop18 toLeft"><strong>시외버스<br>정류장</strong></li>
										<li class="bsStop19 toLeft"><strong>신안동</strong></li>
										<li class="bsStop20 toLeft"><strong>소제동우체국</strong></li>
										<li class="bsStop21 toLeft"><strong>성남4가</strong></li>
										<li class="bsStop22 toLeft"><strong>효촌마을<br>아파트</strong></li>
										<li class="bsStop23 cornerLB"><strong>복합터미널</strong></li>
										<li class="bsStop24 toTop"><strong>다솜요양병원</strong></li>
										<li class="bsStop25 toTop"><strong>한전</strong></li>
										<li class="bsStop26 toTop"><strong>증산도</strong></li>
									</ol>
								</div>
							</div>
							<div class="busRoute freeShuttleBus2_3">
								<div class="busStopList routeNum30">
									<span class="hidden">3차 운행 버스노선</span>

									<div class="currentInfoBox" id="rotation_div3">
									</div>
									
									<p class="iconDrivingBus" id="busimg3" style="display: none;"><em class="hidden"><span id="busstaion3"></span>에서 출발한 버스</em></p>
									
									<ol>
										<li class="bsStop01 toRight"><strong>체육재활원</strong></li>
										<li class="bsStop02 toRight"><strong>대전병원</strong></li>
										<li class="bsStop03 toRight"><strong>증산도</strong></li>
										<li class="bsStop04 toRight"><strong>한전</strong></li>
										<li class="bsStop05 toRight"><strong>(구)샤또호텔</strong></li>
										<li class="bsStop06 toRight"><strong>산림조합</strong></li>
										<li class="bsStop07 toRight"><strong>웰니스병원</strong></li>
										<li class="bsStop08 toRight"><strong>복합터미널</strong></li>
										<li class="bsStop09 cornerRT"><strong>용전4가</strong></li>
										<li class="bsStop10 toBottom"><strong>(구)성남육교</strong></li>
										<li class="bsStop11 toBottom"><strong>성남4가</strong></li>
										<li class="bsStop12 toBottom"><strong>소제동우체국</strong></li>
										<li class="bsStop13 toBottom"><strong>중앙시장</strong></li>
										<li class="bsStop14 toBottom"><strong>인동4가</strong></li>
										<li class="bsStop15 cornerRB"><strong>효동4가</strong></li>
										<li class="bsStop16 toLeft"><strong>신흥마을<br>아파트</strong></li>
										<li class="bsStop17 toLeft"><strong>시외버스<br>정류장</strong></li>
										<li class="bsStop18 toLeft"><strong>신안동</strong></li>
										<li class="bsStop19 toLeft"><strong>소제동우체국</strong></li>
										<li class="bsStop20 toLeft"><strong>성남4가</strong></li>
										<li class="bsStop21 toLeft"><strong>효촌마을<br>아파트</strong></li>
										<li class="bsStop22 toLeft"><strong>복합터미널</strong></li>
										<li class="bsStop23 toLeft"><strong>다솜요양병원</strong></li>
										<li class="bsStop24 cornerLB"><strong>한전</strong></li>
										<li class="bsStop25 toTop"><strong>하나로병원</strong></li>
										<li class="bsStop26 toTop"><strong>보람아파트</strong></li>
										<li class="bsStop27 toTop"><strong>읍내현대<br>아파트 정문</strong></li>
										<li class="bsStop28 toTop"><strong>읍내동 현대<br>아파트 후문</strong></li>
										<li class="bsStop29 toTop"><strong>읍내동<br>주민센터</strong></li>
									</ol>
								</div>
							</div>
							<div class="busRoute freeShuttleBus2_4">
								<div class="busStopList">
									<span class="hidden">4차 운행 버스노선</span>

									<div class="currentInfoBox" id="rotation_div4">
									</div>
									
									<p class="iconDrivingBus" id="busimg4" style="display: none;"><em class="hidden"><span id="busstaion4"></span>에서 출발한 버스</em></p>

									<ol>
										<li class="bsStop01 toRight"><strong>체육재활원</strong></li>
										<li class="bsStop02 toRight"><strong>대전병원</strong></li>
										<li class="bsStop03 toRight"><strong>오정4가</strong></li>
										<li class="bsStop04 toRight"><strong>호남철교</strong></li>
										<li class="bsStop05 toRight"><strong>대덕구청</strong></li>
										<li class="bsStop06 toRight"><strong>홍도육교</strong></li>
										<li class="bsStop07 toRight"><strong>한밭자이<br>아파트</strong></li>
										<li class="bsStop08 toRight"><strong>삼성4가</strong></li>
										<li class="bsStop09 cornerRT"><strong>대전역</strong></li>
										<li class="bsStop10 toBottom"><strong>중앙시장</strong></li>
										<li class="bsStop11 toBottom"><strong>인동4가</strong></li>
										<li class="bsStop12 toBottom"><strong>어진마을<br>아파트</strong></li>
										<li class="bsStop13 toBottom"><strong>판암4가</strong></li>
										<li class="bsStop14 cornerRB"><strong>판암주공<br>아파트 4단지</strong></li>
										<li class="bsStop15 toLeft"><strong>판암역</strong></li>
										<li class="bsStop16 toLeft"><strong>시외버스<br>정류장</strong></li>
										<li class="bsStop17 toLeft"><strong>신안동</strong></li>
										<li class="bsStop18 toLeft"><strong>소제동우체국</strong></li>
										<li class="bsStop19 toLeft"><strong>성남4가</strong></li>
										<li class="bsStop20 toLeft"><strong>효촌마을<br>아파트</strong></li>
										<li class="bsStop21 toLeft"><strong>복합터미널</strong></li>
										<li class="bsStop22 toLeft"><strong>다솜요양병원</strong></li>
										<li class="bsStop23 cornerLB"><strong>한전</strong></li>
										<li class="bsStop24 toTop"><strong>증산도</strong></li>
									</ol>
								</div>
							</div>
						</div>
						<!-- //노선도 -->

						<!-- 탭 -->
						<p class="contsSubTit tyBullet">순환버스 배차시간표</p>
						<div class="tabMenuWrapper">
							<div class="tabMenu num4">
								<div>
									<div class="btnTab on"><a href="#freeShuttleBus2_1" id="bustab1"><span>1차 운행</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus2_2" id="bustab2"><span>2차 운행</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus2_3" id="bustab3"><span>3차 운행</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus2_4" id="bustab4"><span>4차 운행</span></a></div>
								</div>
							</div>

							<div class="tabContBox" id="freeShuttleBus2_1">
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:32</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>08:34</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>08:35</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>08:37</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>홍도육교</strong><span class="stopTime"><b class="hidden">시간</b><em>08:38</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>08:39</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>08:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>대전역</strong><span class="stopTime"><b class="hidden">시간</b><em>08:42</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>중앙시장</strong><span class="stopTime"><b class="hidden">시간</b><em>08:44</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>08:46</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>어진마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>08:48</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>판암4가</strong><span class="stopTime"><b class="hidden">시간</b><em>08:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>판암주공아파트 4단지</strong><span class="stopTime"><b class="hidden">시간</b><em>09:04</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>판암역</strong><span class="stopTime"><b class="hidden">시간</b><em>09:07</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>동양의원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:12</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>효동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>09:13</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>09:15</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>09:20</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>09:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>효촌마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>09:32</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>09:34</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>산림조합</strong><span class="stopTime"><b class="hidden">시간</b><em>09:38</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>웰니스병원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>다솜요양병원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:42</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>26</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>09:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>27</span>
											<div>
												<strong>증산도</strong><span class="stopTime"><b class="hidden">시간</b><em>09:48</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>28</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:55</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<div>-</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<div>-</div>
										</div>
									</li>
								</ul>
							</div>

							<div class="tabContBox" id="freeShuttleBus2_2">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>읍내동주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>10:34</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>10:35</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>읍내동 현대아파트 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>10:36</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>국세청</strong><span class="stopTime"><b class="hidden">시간</b><em>10:38</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>중앙병원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:39</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:41</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>10:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>(구)샤또호텔</strong><span class="stopTime"><b class="hidden">시간</b><em>10:46</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>10:48</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>용전4가</strong><span class="stopTime"><b class="hidden">시간</b><em>10:50</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>(구)성남육교</strong><span class="stopTime"><b class="hidden">시간</b><em>10:51</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>10:53</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>10:54</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>중앙시장</strong><span class="stopTime"><b class="hidden">시간</b><em>11:00</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>11:02</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>어진마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:04</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>시외버스정류장</strong><span class="stopTime"><b class="hidden">시간</b><em>11:05</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>신안동</strong><span class="stopTime"><b class="hidden">시간</b><em>11:29</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>11:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>11:31</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>효촌마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:32</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>11:34</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>다솜요양병원</strong><span class="stopTime"><b class="hidden">시간</b><em>11:36</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>11:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>26</span>
											<div>
												<strong>증산도</strong><span class="stopTime"><b class="hidden">시간</b><em>11:44</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>27</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>11:50</em></span>
											</div>
										</div>
									</li>
								</ul>
							</div>

							<div class="tabContBox" id="freeShuttleBus2_3">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>13:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>13:34</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>증산도</strong><span class="stopTime"><b class="hidden">시간</b><em>13:36</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>13:39</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>(구)샤또호텔</strong><span class="stopTime"><b class="hidden">시간</b><em>13:41</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>산림조합</strong><span class="stopTime"><b class="hidden">시간</b><em>13:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>웰니스병원</strong><span class="stopTime"><b class="hidden">시간</b><em>13:46</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>13:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>용전4가</strong><span class="stopTime"><b class="hidden">시간</b><em>13:52</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>(구)성남육교</strong><span class="stopTime"><b class="hidden">시간</b><em>13:54</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>13:56</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>13:58</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>중앙시장</strong><span class="stopTime"><b class="hidden">시간</b><em>14:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:02</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>효동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:04</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>신흥마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:06</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>시외버스정류장</strong><span class="stopTime"><b class="hidden">시간</b><em>14:08</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>신안동</strong><span class="stopTime"><b class="hidden">시간</b><em>14:11</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>14:13</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>효촌마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:31</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>14:33</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>다솜요양병원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:35</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>14:37</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>26</span>
											<div>
												<strong>보람아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:42</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>27</span>
											<div>
												<strong>읍내현대아파트 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>14:44</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>28</span>
											<div>
												<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>14:46</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>29</span>
											<div>
												<strong>읍내동주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>14:48</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>30</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:50</em></span>
											</div>
										</div>
									</li>
								</ul>
							</div>

							<div class="tabContBox" id="freeShuttleBus2_4">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:34</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:35</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>15:37</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>15:39</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>홍도육교</strong><span class="stopTime"><b class="hidden">시간</b><em>15:41</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>15:42</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:43</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>대전역</strong><span class="stopTime"><b class="hidden">시간</b><em>15:44</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>중앙시장</strong><span class="stopTime"><b class="hidden">시간</b><em>15:47</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:48</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>어진마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>15:49</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>판암4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:52</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>판암주공아파트 4단지</strong><span class="stopTime"><b class="hidden">시간</b><em>15:55</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>판암역 </strong><span class="stopTime"><b class="hidden">시간</b><em>15:58</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>시외버스정류장</strong><span class="stopTime"><b class="hidden">시간</b><em>16:08</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>신안동</strong><span class="stopTime"><b class="hidden">시간</b><em>16:10</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>16:12</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>16:14</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>효촌마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>16:16</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>16:18</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>다솜요양병원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:20</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>16:22</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>증산도</strong><span class="stopTime"><b class="hidden">시간</b><em>16:26</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>16:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<div>-</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<div>-</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<!-- //탭 -->
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>
	
	var playAlert;
	
	$(document).ready(function(){
		
		$.ajax({
			url: '/app/getBusLocation.do?bus=2',
		    type : "POST",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(r){
		    	var status = r.status1;
		    	var rotation = r.rotation;
		    	
	    		$(".currentInfoBox").html("<p class='statusTxts finished'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625 - 운행종료</em></span></p>");
	    		
	    		console.log("=====================");
	    		console.log(status)
	    		console.log(rotation)
	    		console.log("=====================");
	    		
	    		if(status == "운행중"){
	    			$("#rotation_div"+rotation).html("<p class='statusTxts runing'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625</em></span></p>");
	    			$("#bustab"+rotation).click();
	    		}else if(status == "정비중"){
	    			$("#rotation_div"+rotation).html("<p class='statusTxts waiting'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625 - 정비중</em></span></p>");
	    		}	    		
		    }
		});
		
		
		clearInterval(playAlert);
		playAlert = setInterval(function() {
			getBusStatus();
		}, 2000)		   
	});
	
	function getBusStatus(){
		
		$.ajax({
			url: '/app/getBusLocation.do?bus=2',
		    type : "POST",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(map){
		    	var status = map.status1;
		    	var rotation = map.rotation;
		    	
		    	console.log("status="+status);
		    	console.log("rotation="+rotation);
		    	
	    		$(".currentInfoBox").html("<p class='statusTxts finished'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625 - 운행종료</em></span></p>");
	    		
	    		if(status == "운행중"){
	    			$("#rotation_div"+rotation).html("<p class='statusTxts runing'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625 - 운행중</em></span></p>");
	    		}else if(status == "정비중"){
	    			$("#rotation_div"+rotation).html("<p class='statusTxts waiting'><span class='busState'>2호차 실시간 안내 : 현재</span><span><em>74오 1625 - 정비중</em></span></p>");
	    		}
	    		
	    		// 운행중이라면 버스위치 조회 후 위치 표시
	    		if(status == "운행중"){
	    			var now_location = map.now_location;
    		    	
    		    	if(now_location == null){
    		    		return;
    		    	}
    		    	
    		    	var station = map.station1;
    		    	// 전체길이 720 - 첫정류장시작 50 = 670
    		    	// 첫줄 34 정류장 * 680
    		    	// station 당 20씩 증가해보자.
    		    	// 마지막 33 정류장에서는 10만 증가해보자
    		    	var left = 0;
    		    	var top = 0;
    		    	if(now_location > 0 && now_location < 36){ // 첫번째 줄이라면
    		    		left = 50 + ((now_location-1) * 20);
    		    		top = 0;
    		    		if(now_location == 35){
    		    			left-= 10;
    		    		}
    		    	}else if(now_location >= 36 && now_location < 58){
    		    		left = 720;
    		    		var toLocation = now_location-35;
    		    		if(toLocation == 1){
    		    			top = top + 25;
    		    		}else if(toLocation == 2){
    		    			top = top + 25 + 25;
    		    		}else if(toLocation >= 20){
    		    			top = 50 + 210 + ((toLocation-19) * 25);
    		    		}else{
    		    			top = 50 + ((toLocation-2) * 11.66);
    		    		}
    		    	}else if(now_location >= 58 && now_location < 95){
	    		    	top = 310;
	    		    	left = 720;
	    		    	var leLocation = now_location-57;
	    		    	if(leLocation == 1){
    		    			left = left - 25;
    		    		}else if(leLocation == 2){
    		    			left = left - 25 - 25;
    		    		}else if(leLocation >= 3 && leLocation < 36){
    		    			left = left - (50 + ((leLocation-2) * 20));
    		    		}else{
    		    			left = left - (50 + 620 + ((leLocation-36) * 20));
    		    		}
    		    	}else if(now_location >= 95){
    		    		top = 310;
    		    		left = 0;
    		    		var leLocation = now_location-94;
    		    		if(leLocation <= 2){
    		    			top = top - (leLocation * 25);
    		    		}else{
    		    			top = top - 50 - ((leLocation-2) * 11.66);
    		    		}
    		    	}
    		    		
    		    	console.log("now_location = " + now_location)
    		    	console.log("left = " + left);
    		    	console.log("top = " + top);
    		    	
    		    	$("#busimg" + rotation).css("display", "");
    		    	$("#busimg" + rotation).animate({ left: left+"px"}, 200 );
    		    	$("#busimg" + rotation).animate({ top: top+"px"}, 200 );
    		    	$("#busstaion" + rotation).html(station);
	    		}else{
	    			// 운행중이아니라면 버스 표시 제거
	    			$("#busimg" + rotation).css("display", "none");
	    		}
	    		
		    }
		});
		
	}	
</script>
					<div class="contsArea trafficInformation">
						<p class="textParaList">무료순환버스 2호차의 운행노선안내입니다.</p>

						<!-- 노선도 -->
						<!-- ** 버스위치
							.distance_1 = 25%,
							.distance_2 = 50%,
							.distance_3 = 75%,
							.distance_4 = 100%
						-->

						<div class="busRouteWrapper">
							<div class="busRoute freeShuttleBus2_1" style="display:block;">
								<div class="busStopList">
									<span class="hidden">1차 운행 버스노선</span>

									<div class="currentInfoBox" id="rotation_div1">
									</div>
									
									<p class="iconDrivingBus" id="busimg1" style="display: none;"><em class="hidden"><span id="busstaion1"></span>에서 출발한 버스</em></p>

									<ol>
										<li class="bsStop01 toRight"><strong>체육재활원</strong></li>
										<li class="bsStop02 toRight"><strong>대전병원</strong></li>
										<li class="bsStop03 toRight"><strong>오정4가</strong></li>
										<li class="bsStop04 toRight"><strong>호남철교</strong></li>
										<li class="bsStop05 toRight"><strong>대덕구청</strong></li>
										<li class="bsStop06 toRight"><strong>홍도육교</strong></li>
										<li class="bsStop07 toRight"><strong>한밭자이<br>아파트</strong></li>
										<li class="bsStop08 toRight"><strong>삼성4가</strong></li>
										<li class="bsStop09 cornerRT"><strong>대전역</strong></li>
										<li class="bsStop10 toBottom"><strong>중앙시장</strong></li>
										<li class="bsStop11 toBottom"><strong>인동4가</strong></li>
										<li class="bsStop12 toBottom"><strong>어진마을<br>아파트</strong></li>
										<li class="bsStop13 toBottom"><strong>판암4가</strong></li>
										<li class="bsStop14 cornerRB"><strong>판암주공<br>아파트 4단지</strong></li>
										<li class="bsStop15 toLeft"><strong>판암역</strong></li>
										<li class="bsStop16 toLeft"><strong>동양의원</strong></li>
										<li class="bsStop17 toLeft"><strong>효동4가</strong></li>
										<li class="bsStop18 toLeft"><strong>인동4가</strong></li>
										<li class="bsStop19 toLeft"><strong>소제동우체국</strong></li>
										<li class="bsStop20 toLeft"><strong>성남4가</strong></li>
										<li class="bsStop21 toLeft"><strong>효촌마을<br>아파트</strong></li>
										<li class="bsStop22 toLeft"><strong>복합터미널</strong></li>
										<li class="bsStop23 cornerLB"><strong>산림조합</strong></li>
										<li class="bsStop24 toTop"><strong>웰니스병원</strong></li>
										<li class="bsStop25 toTop"><strong>다솜요양병원</strong></li>
										<li class="bsStop26 toTop"><strong>한전</strong></li>
										<li class="bsStop27 toTop"><strong>증산도</strong></li>
									</ol>
								</div>
							</div>
							<div class="busRoute freeShuttleBus2_2">
								<div class="busStopList">
									<span class="hidden">2차 운행 버스노선</span>

									<div class="currentInfoBox" id="rotation_div2">
									</div>
									
									<p class="iconDrivingBus" id="busimg2" style="display: none;"><em class="hidden"><span id="busstaion2"></span>에서 출발한 버스</em></p>

									<ol>
										<li class="bsStop01 toRight"><strong>체육재활원</strong></li>
										<li class="bsStop02 toRight"><strong>읍내동<br>주민센터</strong></li>
										<li class="bsStop03 toRight"><strong>읍내동 현대아파트 후문</strong></li>
										<li class="bsStop04 toRight"><strong>읍내동 현대아파트 정문</strong></li>
										<li class="bsStop05 toRight"><strong>국세청</strong></li>
										<li class="bsStop06 toRight"><strong>중앙병원</strong></li>
										<li class="bsStop07 toRight"><strong>하나로병원</strong></li>
										<li class="bsStop08 toRight"><strong>한전</strong></li>
										<li class="bsStop09 cornerRT"><strong>(구)샤또호텔</strong></li>
										<li class="bsStop10 toBottom"><strong>복합터미널</strong></li>
										<li class="bsStop11 toBottom"><strong>용전4가</strong></li>
										<li class="bsStop12 toBottom"><strong>(구)성남육교</strong></li>
										<li class="bsStop13 toBottom"><strong>성남4가</strong></li>
										<li class="bsStop14 cornerRB"><strong>소제동우체국</strong></li>
										<li class="bsStop15 toLeft"><strong>중앙시장</strong></li>
										<li class="bsStop16 toLeft"><strong>인동4가</strong></li>
										<li class="bsStop17 toLeft"><strong>어진마을<br>아파트</strong></li>
										<li class="bsStop18 toLeft"><strong>시외버스<br>정류장</strong></li>
										<li class="bsStop19 toLeft"><strong>신안동</strong></li>
										<li class="bsStop20 toLeft"><strong>소제동우체국</strong></li>
										<li class="bsStop21 toLeft"><strong>성남4가</strong></li>
										<li class="bsStop22 toLeft"><strong>효촌마을<br>아파트</strong></li>
										<li class="bsStop23 cornerLB"><strong>복합터미널</strong></li>
										<li class="bsStop24 toTop"><strong>다솜요양병원</strong></li>
										<li class="bsStop25 toTop"><strong>한전</strong></li>
										<li class="bsStop26 toTop"><strong>증산도</strong></li>
									</ol>
								</div>
							</div>
							<div class="busRoute freeShuttleBus2_3">
								<div class="busStopList routeNum30">
									<span class="hidden">3차 운행 버스노선</span>

									<div class="currentInfoBox" id="rotation_div3">
									</div>
									
									<p class="iconDrivingBus" id="busimg3" style="display: none;"><em class="hidden"><span id="busstaion3"></span>에서 출발한 버스</em></p>
									
									<ol>
										<li class="bsStop01 toRight"><strong>체육재활원</strong></li>
										<li class="bsStop02 toRight"><strong>대전병원</strong></li>
										<li class="bsStop03 toRight"><strong>증산도</strong></li>
										<li class="bsStop04 toRight"><strong>한전</strong></li>
										<li class="bsStop05 toRight"><strong>(구)샤또호텔</strong></li>
										<li class="bsStop06 toRight"><strong>산림조합</strong></li>
										<li class="bsStop07 toRight"><strong>웰니스병원</strong></li>
										<li class="bsStop08 toRight"><strong>복합터미널</strong></li>
										<li class="bsStop09 cornerRT"><strong>용전4가</strong></li>
										<li class="bsStop10 toBottom"><strong>(구)성남육교</strong></li>
										<li class="bsStop11 toBottom"><strong>성남4가</strong></li>
										<li class="bsStop12 toBottom"><strong>소제동우체국</strong></li>
										<li class="bsStop13 toBottom"><strong>중앙시장</strong></li>
										<li class="bsStop14 toBottom"><strong>인동4가</strong></li>
										<li class="bsStop15 cornerRB"><strong>효동4가</strong></li>
										<li class="bsStop16 toLeft"><strong>신흥마을<br>아파트</strong></li>
										<li class="bsStop17 toLeft"><strong>시외버스<br>정류장</strong></li>
										<li class="bsStop18 toLeft"><strong>신안동</strong></li>
										<li class="bsStop19 toLeft"><strong>소제동우체국</strong></li>
										<li class="bsStop20 toLeft"><strong>성남4가</strong></li>
										<li class="bsStop21 toLeft"><strong>효촌마을<br>아파트</strong></li>
										<li class="bsStop22 toLeft"><strong>복합터미널</strong></li>
										<li class="bsStop23 toLeft"><strong>다솜요양병원</strong></li>
										<li class="bsStop24 cornerLB"><strong>한전</strong></li>
										<li class="bsStop25 toTop"><strong>하나로병원</strong></li>
										<li class="bsStop26 toTop"><strong>보람아파트</strong></li>
										<li class="bsStop27 toTop"><strong>읍내현대<br>아파트 정문</strong></li>
										<li class="bsStop28 toTop"><strong>읍내동 현대<br>아파트 후문</strong></li>
										<li class="bsStop29 toTop"><strong>읍내동<br>주민센터</strong></li>
									</ol>
								</div>
							</div>
							<div class="busRoute freeShuttleBus2_4">
								<div class="busStopList">
									<span class="hidden">4차 운행 버스노선</span>

									<div class="currentInfoBox" id="rotation_div4">
									</div>
									
									<p class="iconDrivingBus" id="busimg4" style="display: none;"><em class="hidden"><span id="busstaion4"></span>에서 출발한 버스</em></p>

									<ol>
										<li class="bsStop01 toRight"><strong>체육재활원</strong></li>
										<li class="bsStop02 toRight"><strong>대전병원</strong></li>
										<li class="bsStop03 toRight"><strong>오정4가</strong></li>
										<li class="bsStop04 toRight"><strong>호남철교</strong></li>
										<li class="bsStop05 toRight"><strong>대덕구청</strong></li>
										<li class="bsStop06 toRight"><strong>홍도육교</strong></li>
										<li class="bsStop07 toRight"><strong>한밭자이<br>아파트</strong></li>
										<li class="bsStop08 toRight"><strong>삼성4가</strong></li>
										<li class="bsStop09 cornerRT"><strong>대전역</strong></li>
										<li class="bsStop10 toBottom"><strong>중앙시장</strong></li>
										<li class="bsStop11 toBottom"><strong>인동4가</strong></li>
										<li class="bsStop12 toBottom"><strong>어진마을<br>아파트</strong></li>
										<li class="bsStop13 toBottom"><strong>판암4가</strong></li>
										<li class="bsStop14 cornerRB"><strong>판암주공<br>아파트 4단지</strong></li>
										<li class="bsStop15 toLeft"><strong>판암역</strong></li>
										<li class="bsStop16 toLeft"><strong>시외버스<br>정류장</strong></li>
										<li class="bsStop17 toLeft"><strong>신안동</strong></li>
										<li class="bsStop18 toLeft"><strong>소제동우체국</strong></li>
										<li class="bsStop19 toLeft"><strong>성남4가</strong></li>
										<li class="bsStop20 toLeft"><strong>효촌마을<br>아파트</strong></li>
										<li class="bsStop21 toLeft"><strong>복합터미널</strong></li>
										<li class="bsStop22 toLeft"><strong>다솜요양병원</strong></li>
										<li class="bsStop23 cornerLB"><strong>한전</strong></li>
										<li class="bsStop24 toTop"><strong>증산도</strong></li>
									</ol>
								</div>
							</div>
						</div>
						<!-- //노선도 -->

						<!-- 탭 -->
						<p class="contsSubTit tyBullet">순환버스 배차시간표</p>
						<div class="tabMenuWrapper">
							<div class="tabMenu num4">
								<div>
									<div class="btnTab on"><a href="#freeShuttleBus2_1" id="bustab1"><span>1차 운행</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus2_2" id="bustab2"><span>2차 운행</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus2_3" id="bustab3"><span>3차 운행</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus2_4" id="bustab4"><span>4차 운행</span></a></div>
								</div>
							</div>

							<div class="tabContBox" id="freeShuttleBus2_1">
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:32</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>08:34</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>08:35</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>08:37</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>홍도육교</strong><span class="stopTime"><b class="hidden">시간</b><em>08:38</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>08:39</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>08:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>대전역</strong><span class="stopTime"><b class="hidden">시간</b><em>08:42</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>중앙시장</strong><span class="stopTime"><b class="hidden">시간</b><em>08:44</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>08:46</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>어진마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>08:48</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>판암4가</strong><span class="stopTime"><b class="hidden">시간</b><em>08:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>판암주공아파트 4단지</strong><span class="stopTime"><b class="hidden">시간</b><em>09:04</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>판암역</strong><span class="stopTime"><b class="hidden">시간</b><em>09:07</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>동양의원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:12</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>효동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>09:13</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>09:15</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>09:20</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>09:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>효촌마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>09:32</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>09:34</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>산림조합</strong><span class="stopTime"><b class="hidden">시간</b><em>09:38</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>웰니스병원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>다솜요양병원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:42</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>26</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>09:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>27</span>
											<div>
												<strong>증산도</strong><span class="stopTime"><b class="hidden">시간</b><em>09:48</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>28</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:55</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<div>-</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<div>-</div>
										</div>
									</li>
								</ul>
							</div>

							<div class="tabContBox" id="freeShuttleBus2_2">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>읍내동주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>10:34</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>10:35</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>읍내동 현대아파트 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>10:36</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>국세청</strong><span class="stopTime"><b class="hidden">시간</b><em>10:38</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>중앙병원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:39</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:41</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>10:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>(구)샤또호텔</strong><span class="stopTime"><b class="hidden">시간</b><em>10:46</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>10:48</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>용전4가</strong><span class="stopTime"><b class="hidden">시간</b><em>10:50</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>(구)성남육교</strong><span class="stopTime"><b class="hidden">시간</b><em>10:51</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>10:53</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>10:54</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>중앙시장</strong><span class="stopTime"><b class="hidden">시간</b><em>11:00</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>11:02</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>어진마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:04</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>시외버스정류장</strong><span class="stopTime"><b class="hidden">시간</b><em>11:05</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>신안동</strong><span class="stopTime"><b class="hidden">시간</b><em>11:29</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>11:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>11:31</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>효촌마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>11:32</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>11:34</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>다솜요양병원</strong><span class="stopTime"><b class="hidden">시간</b><em>11:36</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>11:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>26</span>
											<div>
												<strong>증산도</strong><span class="stopTime"><b class="hidden">시간</b><em>11:44</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>27</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>11:50</em></span>
											</div>
										</div>
									</li>
								</ul>
							</div>

							<div class="tabContBox" id="freeShuttleBus2_3">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>13:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>13:34</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>증산도</strong><span class="stopTime"><b class="hidden">시간</b><em>13:36</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>13:39</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>(구)샤또호텔</strong><span class="stopTime"><b class="hidden">시간</b><em>13:41</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>산림조합</strong><span class="stopTime"><b class="hidden">시간</b><em>13:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>웰니스병원</strong><span class="stopTime"><b class="hidden">시간</b><em>13:46</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>13:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>용전4가</strong><span class="stopTime"><b class="hidden">시간</b><em>13:52</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>(구)성남육교</strong><span class="stopTime"><b class="hidden">시간</b><em>13:54</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>13:56</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>13:58</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>중앙시장</strong><span class="stopTime"><b class="hidden">시간</b><em>14:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:02</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>효동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:04</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>신흥마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:06</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>시외버스정류장</strong><span class="stopTime"><b class="hidden">시간</b><em>14:08</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>신안동</strong><span class="stopTime"><b class="hidden">시간</b><em>14:11</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>14:13</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>효촌마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:31</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>14:33</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>다솜요양병원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:35</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>14:37</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>하나로병원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>26</span>
											<div>
												<strong>보람아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>14:42</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>27</span>
											<div>
												<strong>읍내현대아파트 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>14:44</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>28</span>
											<div>
												<strong>읍내동 현대아파트 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>14:46</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>29</span>
											<div>
												<strong>읍내동주민센터</strong><span class="stopTime"><b class="hidden">시간</b><em>14:48</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>30</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:50</em></span>
											</div>
										</div>
									</li>
								</ul>
							</div>

							<div class="tabContBox" id="freeShuttleBus2_4">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:34</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>오정4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:35</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>호남철교</strong><span class="stopTime"><b class="hidden">시간</b><em>15:37</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>15:39</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>홍도육교</strong><span class="stopTime"><b class="hidden">시간</b><em>15:41</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>한밭자이아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>15:42</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>삼성4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:43</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>대전역</strong><span class="stopTime"><b class="hidden">시간</b><em>15:44</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>중앙시장</strong><span class="stopTime"><b class="hidden">시간</b><em>15:47</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>인동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:48</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>어진마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>15:49</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>판암4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:52</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>판암주공아파트 4단지</strong><span class="stopTime"><b class="hidden">시간</b><em>15:55</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>판암역 </strong><span class="stopTime"><b class="hidden">시간</b><em>15:58</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>시외버스정류장</strong><span class="stopTime"><b class="hidden">시간</b><em>16:08</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>신안동</strong><span class="stopTime"><b class="hidden">시간</b><em>16:10</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>소제동우체국</strong><span class="stopTime"><b class="hidden">시간</b><em>16:12</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>성남4가</strong><span class="stopTime"><b class="hidden">시간</b><em>16:14</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>효촌마을아파트</strong><span class="stopTime"><b class="hidden">시간</b><em>16:16</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>복합터미널</strong><span class="stopTime"><b class="hidden">시간</b><em>16:18</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>다솜요양병원</strong><span class="stopTime"><b class="hidden">시간</b><em>15:20</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>한전</strong><span class="stopTime"><b class="hidden">시간</b><em>16:22</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>증산도</strong><span class="stopTime"><b class="hidden">시간</b><em>16:26</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>16:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<div>-</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<div>-</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<!-- //탭 -->
>>>>>>> refs/heads/202204
					</div>