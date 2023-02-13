<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
					<div class="contsArea trafficInformation">

						<!-- 설명 -->
						<p class="textParaList">
							(사)대전장애인단체총연합회 모셔드림 에서는 장애인들의 교통 편의증진을 돕고자 타기관과 협력하여장애인무료순환버스와 대전시내저상 버스의 정보를 안내하고 있습니다.
						</p>

						<div class="textsContsWrapper">
							<p class="contsSubTit">유성구장애인종합복지관</p>
							<div class="innerWrapper">
								<dl class="conBox">
									<dt>차량소개</dt>
									<dd>
										<p>셔틀버스 노선운행 순화안내</p>
										<ul class="listDashed type2">
											<li>운행 : 월~ 금 (토.공휴일은 운행 안함)</li>
											<li>대상 : 장애인, 임산부, 노약자는 누그든 무료 이용</li>
											<li>순환노선 : 유성구 외곽지역 순회(1,2코스)</li>
											<li>버스 : 뉴-슈퍼에어로시티 초저상버스 CNG</li>
										</ul>

										<ul class="listTexts mgtMedium">
											<li>1코스: 송강동,전민동,신성동,유성구청,재활병원 방면</li>
											<li>2코스: 원내동,대정동,지회,온천역,반석역,반석4단지 방면</li>
										</ul>
									</dd>

									<dt>문의전화</dt>
									<dd>042-822-3637</dd>
								</dl>
							</div>
						</div>
						<!-- //노선도 -->

						<!-- 탭 -->
						<p class="contsSubTit tyBullet">순환버스 배차시간표</p>
						<div class="tabMenuWrapper">
							<div class="tabMenu num4">
								<div>
									<div class="btnTab on"><a href="#freeShuttleBus3_3_1"><span>1코스 - 출발</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus3_3_2"><span>1코스 - 귀가</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus3_3_3"><span>2코스 - 출발</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus3_3_4"><span>2코스 - 귀가</span></a></div>
								</div>
							</div>

							<div class="tabContBox" id="freeShuttleBus3_3_1">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>송강마을 101동 뒤</strong><span class="stopTime"><b class="hidden">시간</b><em>08:25</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>한마을@ 115동 건너</strong><span class="stopTime"><b class="hidden">시간</b><em>08:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>테크노벨리@ 502동 승강장</strong><span class="stopTime"><b class="hidden">시간</b><em>08:38</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>테크노벨리@ 1202동 건너</strong><span class="stopTime"><b class="hidden">시간</b><em>08:39</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>세종@ 105동 옆</strong><span class="stopTime"><b class="hidden">시간</b><em>08:50</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>엑스포@ 409동 건너</strong><span class="stopTime"><b class="hidden">시간</b><em>08:53</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>연구단지4가 성당입구</strong><span class="stopTime"><b class="hidden">시간</b><em>09:05</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>신성동 천문대 승강장</strong><span class="stopTime"><b class="hidden">시간</b><em>09:08</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>유성구청앞</strong><span class="stopTime"><b class="hidden">시간</b><em>09:17</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>대전재활병원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:22</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>정대동이가촌</strong><span class="stopTime"><b class="hidden">시간</b><em>09:28</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>월드컵지하철역</strong><span class="stopTime"><b class="hidden">시간</b><em>09:31</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>노은지하철역</strong><span class="stopTime"><b class="hidden">시간</b><em>09:35</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>09:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>&nbsp;</span>
											<div>
												<strong></strong><span class="stopTime"><b class="hidden">시간</b><em></em></span>
											</div>
										</div>
									</li>
								</ul>
							</div>

							<div class="tabContBox" id="freeShuttleBus3_3_2">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>13:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>반석역</strong><span class="stopTime"><b class="hidden">시간</b><em>13:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>반석마을4</strong><span class="stopTime"><b class="hidden">시간</b><em>13:47</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>반석마을6</strong><span class="stopTime"><b class="hidden">시간</b><em>13:49</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>반석마을7</strong><span class="stopTime"><b class="hidden">시간</b><em>13:51</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>노은동지하철역</strong><span class="stopTime"><b class="hidden">시간</b><em>14:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>장대동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:10</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>드림월드@ 임실피자</strong><span class="stopTime"><b class="hidden">시간</b><em>14:12</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>대전재활병원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:15</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>유성구청앞</strong><span class="stopTime"><b class="hidden">시간</b><em>14:22</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>신성동 천문대</strong><span class="stopTime"><b class="hidden">시간</b><em>14:28</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>연구단지4가</strong><span class="stopTime"><b class="hidden">시간</b><em>14:32</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>익스포@</strong><span class="stopTime"><b class="hidden">시간</b><em>14:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>세종@</strong><span class="stopTime"><b class="hidden">시간</b><em>14:42</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>테크노벨리@ 승강자</strong><span class="stopTime"><b class="hidden">시간</b><em>14:48</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>테크노벨리@ 공원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>한마음@</strong><span class="stopTime"><b class="hidden">시간</b><em>15:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>송강마을@</strong><span class="stopTime"><b class="hidden">시간</b><em>15:10</em></span>
											</div>
										</div>
									</li>
								</ul>
							</div>

							<div class="tabContBox" id="freeShuttleBus3_3_3">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>진잠동사무소</strong><span class="stopTime"><b class="hidden">시간</b><em>10:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>샘물타운@</strong><span class="stopTime"><b class="hidden">시간</b><em>10:42</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>미메이드@</strong><span class="stopTime"><b class="hidden">시간</b><em>10:45</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>대정동홈플러스앞</strong><span class="stopTime"><b class="hidden">시간</b><em>10:47</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>대정2동</strong><span class="stopTime"><b class="hidden">시간</b><em>10:48</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>시립복지관입구</strong><span class="stopTime"><b class="hidden">시간</b><em>10:49</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>(구)유성구지회앞</strong><span class="stopTime"><b class="hidden">시간</b><em>10:53</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>유성호텔4가</strong><span class="stopTime"><b class="hidden">시간</b><em>10:56</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>장대4가 이가촌앞</strong><span class="stopTime"><b class="hidden">시간</b><em>11:00</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>반석역</strong><span class="stopTime"><b class="hidden">시간</b><em>11:05</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>반석4단지</strong><span class="stopTime"><b class="hidden">시간</b><em>11:07</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>반석1단지</strong><span class="stopTime"><b class="hidden">시간</b><em>11:09</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>11:25</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>&nbsp;</span>
											<div>
												<strong></strong><span class="stopTime"><b class="hidden">시간</b><em></em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>&nbsp;</span>
											<div>
												<strong></strong><span class="stopTime"><b class="hidden">시간</b><em></em></span>
											</div>
										</div>
									</li>
								</ul>
							</div>
							
							<div class="tabContBox" id="freeShuttleBus3_3_4">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>16:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>반석역</strong><span class="stopTime"><b class="hidden">시간</b><em>16:05</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>반석4단지</strong><span class="stopTime"><b class="hidden">시간</b><em>16:09</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>반석1단지</strong><span class="stopTime"><b class="hidden">시간</b><em>16:12</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>장대동4가</strong><span class="stopTime"><b class="hidden">시간</b><em>16:25</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>유성호텔4가</strong><span class="stopTime"><b class="hidden">시간</b><em>16:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>(구)유성구지회앞</strong><span class="stopTime"><b class="hidden">시간</b><em>16:35</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>시립복지관입구</strong><span class="stopTime"><b class="hidden">시간</b><em>16:42</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>대정2동</strong><span class="stopTime"><b class="hidden">시간</b><em>16:45</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>대정동홈플러스앞</strong><span class="stopTime"><b class="hidden">시간</b><em>16:47</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>미메이드@</strong><span class="stopTime"><b class="hidden">시간</b><em>16:52</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>진잠동사무소</strong><span class="stopTime"><b class="hidden">시간</b><em>17:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>샘물타운@</strong><span class="stopTime"><b class="hidden">시간</b><em>17:05</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>&nbsp;</span>
											<div>
												<strong></strong><span class="stopTime"><b class="hidden">시간</b><em></em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>&nbsp;</span>
											<div>
												<strong></strong><span class="stopTime"><b class="hidden">시간</b><em></em></span>
											</div>
										</div>
									</li>
								</ul>
							</div>

						</div>
						<!-- //탭 -->
					</div>