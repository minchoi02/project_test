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
							<p class="contsSubTit">대덕구장애인종합복지관</p>
							<div class="innerWrapper">
								<dl class="conBox">
									<dt>차량소개</dt>
									<dd>
										<p>1일 3회 운행</p>
										<ul class="listDashed type2">
											<li>등원셔틀</li>
											<li>점심셔틀</li>
											<li>귀가셔틀</li>
										</ul>
									</dd>

									<dt>문의전화</dt>
									<dd>042-540-3500</dd>
								</dl>
							</div>
						</div>
						<!-- //노선도 -->

						<!-- 탭 -->
						<p class="contsSubTit tyBullet">순환버스 배차시간표</p>
						<div class="tabMenuWrapper">
							<div class="tabMenu num3">
								<div>
									<div class="btnTab on"><a href="#freeShuttleBus3_3_1"><span>등원셔틀</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus3_3_2"><span>점심셔틀</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus3_3_3"><span>귀가셔틀</span></a></div>
								</div>
							</div>

							<div class="tabContBox" id="freeShuttleBus3_3_1">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>08:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>성심병원</strong><span class="stopTime"><b class="hidden">시간</b><em>08:55</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>대덕구청</strong><span class="stopTime"><b class="hidden">시간</b><em>09:00</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>한국병원</strong><span class="stopTime"><b class="hidden">시간</b><em>09:05</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>사또호텔</strong><span class="stopTime"><b class="hidden">시간</b><em>09:10</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>한국전력</strong><span class="stopTime"><b class="hidden">시간</b><em>09:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>한마음@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>법동주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:00</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>와동현대@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:00</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>신대@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:00</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>10:00</em></span>
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
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>11:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>수영장</strong><span class="stopTime"><b class="hidden">시간</b><em>11:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>오정오거리</strong><span class="stopTime"><b class="hidden">시간</b><em>11:50</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>한남병원</strong><span class="stopTime"><b class="hidden">시간</b><em>11:55</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>한마음@</strong><span class="stopTime"><b class="hidden">시간</b><em>12:00</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>법동주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>12:05</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>12:10</em></span>
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

							<div class="tabContBox" id="freeShuttleBus3_3_3">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>17:20</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>대한통운앞</strong><span class="stopTime"><b class="hidden">시간</b><em>17:25</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>읍내현대@</strong><span class="stopTime"><b class="hidden">시간</b><em>17:30</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>법동영진@</strong><span class="stopTime"><b class="hidden">시간</b><em>17:35</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>대전병원</strong><span class="stopTime"><b class="hidden">시간</b><em>17:40</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>오정사가</strong><span class="stopTime"><b class="hidden">시간</b><em>17:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>한남병원</strong><span class="stopTime"><b class="hidden">시간</b><em>17:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>중리사가</strong><span class="stopTime"><b class="hidden">시간</b><em>17:55</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>보람@</strong><span class="stopTime"><b class="hidden">시간</b><em>18:00</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>18:10</em></span>
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