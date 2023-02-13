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
							<p class="contsSubTit">대전광역시립장애인복지관</p>
							<div class="innerWrapper">
								<dl class="conBox">
									<dt>차량소개</dt>
									<dd>
										<ul>
											<li>오전 운행 : 진잠방향으로 운행</li>
											<li>오후 운행 : 유성방향으로 운행</li>
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
							<div class="tabMenu num2">
								<div>
									<div class="btnTab on"><a href="#freeShuttleBus3_2_1"><span>오전(진잠방향)</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus3_2_2"><span>오후(유성방향)</span></a></div>
								</div>
							</div>

							<div class="tabContBox" id="freeShuttleBus3_2_1">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>07:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>놀이터 옆</strong><span class="stopTime"><b class="hidden">시간</b><em>07:55</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>구봉마을@ 입구</strong><span class="stopTime"><b class="hidden">시간</b><em>08:00</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>가수원육교</strong><span class="stopTime"><b class="hidden">시간</b><em>08:05</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>그랜드예식장</strong><span class="stopTime"><b class="hidden">시간</b><em>08:10</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>서부병원맞은편</strong><span class="stopTime"><b class="hidden">시간</b><em>08:15</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>산성교회</strong><span class="stopTime"><b class="hidden">시간</b><em>08:20</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>문화육교</strong><span class="stopTime"><b class="hidden">시간</b><em>08:25</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>충대의대 주차장</strong><span class="stopTime"><b class="hidden">시간</b><em>08:30</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>충무체육관 목재소</strong><span class="stopTime"><b class="hidden">시간</b><em>08:40</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>새마을금고</strong><span class="stopTime"><b class="hidden">시간</b><em>08:50</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>신용보조기상사</strong><span class="stopTime"><b class="hidden">시간</b><em>09:10</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>삼성성결교회</strong><span class="stopTime"><b class="hidden">시간</b><em>09:12</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>미니스톱편의점</strong><span class="stopTime"><b class="hidden">시간</b><em>09:14</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>버스정류장</strong><span class="stopTime"><b class="hidden">시간</b><em>09:16</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>충남여고육교</strong><span class="stopTime"><b class="hidden">시간</b><em>09:18</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>SK주유소</strong><span class="stopTime"><b class="hidden">시간</b><em>09:20</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>한국건강검진센터</strong><span class="stopTime"><b class="hidden">시간</b><em>09:25</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>갈마농협</strong><span class="stopTime"><b class="hidden">시간</b><em>09:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>영일만횟집</strong><span class="stopTime"><b class="hidden">시간</b><em>09:35</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>공주 칼국수</strong><span class="stopTime"><b class="hidden">시간</b><em>09:45</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>구암역</strong><span class="stopTime"><b class="hidden">시간</b><em>09:50</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>10:00</em></span>
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

							<div class="tabContBox" id="freeShuttleBus3_2_2">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>16:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>구암역</strong><span class="stopTime"><b class="hidden">시간</b><em>17:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>성심병원</strong><span class="stopTime"><b class="hidden">시간</b><em>17:05</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>갈마주유소</strong><span class="stopTime"><b class="hidden">시간</b><em>17:10</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>갈마육교</strong><span class="stopTime"><b class="hidden">시간</b><em>17:15</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>롯데백화점</strong><span class="stopTime"><b class="hidden">시간</b><em>17:20</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>대순진리교회</strong><span class="stopTime"><b class="hidden">시간</b><em>17:25</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>충남여고</strong><span class="stopTime"><b class="hidden">시간</b><em>17:28</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>귀빈예식장</strong><span class="stopTime"><b class="hidden">시간</b><em>17:30</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>교육박물관</strong><span class="stopTime"><b class="hidden">시간</b><em>17:32</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>역전주유소</strong><span class="stopTime"><b class="hidden">시간</b><em>17:35</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>버스정류장</strong><span class="stopTime"><b class="hidden">시간</b><em>17:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>버스정류장</strong><span class="stopTime"><b class="hidden">시간</b><em>17:42</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>목재소맞은편</strong><span class="stopTime"><b class="hidden">시간</b><em>17:45</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>센츄럴파크@</strong><span class="stopTime"><b class="hidden">시간</b><em>17:50</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>문화초교</strong><span class="stopTime"><b class="hidden">시간</b><em>17:53</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>산성교회맞은편</strong><span class="stopTime"><b class="hidden">시간</b><em>17:55</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>서부병원</strong><span class="stopTime"><b class="hidden">시간</b><em>18:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>지하도버스정류장</strong><span class="stopTime"><b class="hidden">시간</b><em>18:05</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>가수원육교</strong><span class="stopTime"><b class="hidden">시간</b><em>18:10</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>원앙마을@ 후문</strong><span class="stopTime"><b class="hidden">시간</b><em>18:12</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>롯데마트</strong><span class="stopTime"><b class="hidden">시간</b><em>18:15</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>복지관</strong><span class="stopTime"><b class="hidden">시간</b><em>18:20</em></span>
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