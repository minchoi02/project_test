<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
					<div class="contsArea trafficInformation">

						<!-- 설명 -->
						<p class="textParaList">
							(사)대전장애인단체총연합회 모셔드림 에서는 장애인들의 교통 편의증진을 돕고자
							타기관과 협력하여장애인무료순환버스와 대전시내저상 버스의 정보를 안내하고 있습니다.
						</p>

						<div class="textsContsWrapper">
							<p class="contsSubTit">대전광역시장애인체육회</p>
							<div class="innerWrapper">
								<dl class="conBox">
									<dt>차량소개</dt>
									<dd>
										<ul>
											<li>동부노선(대덕구,중구,동구): 월~금요일운행</li>
											<li>상기 운행노선은 이용자의 이용률 등 여건에 따라서 다소 변경될 수 있습니다.(금요일 오전 운행)</li>
										</ul>
									</dd>

									<dt>문의전화</dt>
									<dd>042-537-5811</dd>
								</dl>
							</div>
						</div>
						<!-- //설명 -->

						<!-- 탭 -->
						<p class="contsSubTit tyBullet">순환버스 배차시간표</p>
						<div class="tabMenuWrapper">
							<div class="tabMenu num2">
								<div>
									<div class="btnTab on"><a href="#freeShuttleBus3_2_1"><span>동부노선(오전)</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus3_2_2"><span>동부노선(오후)</span></a></div>
								</div>
							</div>

							<div class="tabContBox" id="freeShuttleBus3_2_1">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>체육회(한밭운동장)</strong><span class="stopTime"><b class="hidden">시간</b><em>09:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>부사4가(여성의원앞)</strong><span class="stopTime"><b class="hidden">시간</b><em>09:04</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>신흥동</strong><span class="stopTime"><b class="hidden">시간</b><em>09:10</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>소제동(대성여상 입구)</strong><span class="stopTime"><b class="hidden">시간</b><em>09:15</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>성남효촌마을@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:18</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>용전동</strong><span class="stopTime"><b class="hidden">시간</b><em>09:22</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>송촌취수장</strong><span class="stopTime"><b class="hidden">시간</b><em>09:26</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>송촌동춘당</strong><span class="stopTime"><b class="hidden">시간</b><em>09:31</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>법동보람@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:36</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>법동주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:40</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>읍내현대@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:45</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>읍내동사무소</strong><span class="stopTime"><b class="hidden">시간</b><em>09:47</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:20</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>읍내동사무소</strong><span class="stopTime"><b class="hidden">시간</b><em>10:29</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>읍내현대@ 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>10:31</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>법동주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>10:36</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>법동보람@</strong><span class="stopTime"><b class="hidden">시간</b><em>10:40</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>송촌동춘당</strong><span class="stopTime"><b class="hidden">시간</b><em>10:44</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>송촌취수장</strong><span class="stopTime"><b class="hidden">시간</b><em>10:46</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>용전동KT앞</strong><span class="stopTime"><b class="hidden">시간</b><em>10:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>성남효촌마을@</strong><span class="stopTime"><b class="hidden">시간</b><em>10:54</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>소제동(대성여상 입구)</strong><span class="stopTime"><b class="hidden">시간</b><em>10:58</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>신흥동(신흥마을@)</strong><span class="stopTime"><b class="hidden">시간</b><em>11:03</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>관암주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>11:10</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>부가4가</strong><span class="stopTime"><b class="hidden">시간</b><em>11:21</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>26</span>
											<div>
												<strong>체육회(한밭운동장)</strong><span class="stopTime"><b class="hidden">시간</b><em>11:30</em></span>
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
												<strong>체육회(한밭운동장)</strong><span class="stopTime"><b class="hidden">시간</b><em>13:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>부사4가(여성의원앞)</strong><span class="stopTime"><b class="hidden">시간</b><em>13:34</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>신흥동</strong><span class="stopTime"><b class="hidden">시간</b><em>13:41</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>소제동(대성여상 입구)</strong><span class="stopTime"><b class="hidden">시간</b><em>13:44</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>성남효촌마을@</strong><span class="stopTime"><b class="hidden">시간</b><em>13:47</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>용전동</strong><span class="stopTime"><b class="hidden">시간</b><em>13:51</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>송촌취수장</strong><span class="stopTime"><b class="hidden">시간</b><em>13:54</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>송촌동춘당</strong><span class="stopTime"><b class="hidden">시간</b><em>13:59</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>법동보람@</strong><span class="stopTime"><b class="hidden">시간</b><em>14:04</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>법동주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>14:08</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>읍내현대@</strong><span class="stopTime"><b class="hidden">시간</b><em>14:12</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>읍내동사무소</strong><span class="stopTime"><b class="hidden">시간</b><em>14:14</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>읍내동사무소</strong><span class="stopTime"><b class="hidden">시간</b><em>14:58</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>읍내현대@ 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>15:02</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>법동주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>15:06</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>법동보람@</strong><span class="stopTime"><b class="hidden">시간</b><em>15:10</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>송촌동춘당</strong><span class="stopTime"><b class="hidden">시간</b><em>15:14</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>송촌취수장</strong><span class="stopTime"><b class="hidden">시간</b><em>15:18</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>용전동KT앞</strong><span class="stopTime"><b class="hidden">시간</b><em>15:22</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>성남효촌마을@</strong><span class="stopTime"><b class="hidden">시간</b><em>15:26</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>소제동(대성여상 입구)</strong><span class="stopTime"><b class="hidden">시간</b><em>15:30</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>신흥동(신흥마을@)</strong><span class="stopTime"><b class="hidden">시간</b><em>15:34</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>관암주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>15:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>부가4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:52</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>26</span>
											<div>
												<strong>체육회(한밭운동장)</strong><span class="stopTime"><b class="hidden">시간</b><em>16:00</em></span>
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
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
					<div class="contsArea trafficInformation">

						<!-- 설명 -->
						<p class="textParaList">
							(사)대전장애인단체총연합회 모셔드림 에서는 장애인들의 교통 편의증진을 돕고자
							타기관과 협력하여장애인무료순환버스와 대전시내저상 버스의 정보를 안내하고 있습니다.
						</p>

						<div class="textsContsWrapper">
							<p class="contsSubTit">대전광역시장애인체육회</p>
							<div class="innerWrapper">
								<dl class="conBox">
									<dt>차량소개</dt>
									<dd>
										<ul>
											<li>동부노선(대덕구,중구,동구): 월~금요일운행</li>
											<li>상기 운행노선은 이용자의 이용률 등 여건에 따라서 다소 변경될 수 있습니다.(금요일 오전 운행)</li>
										</ul>
									</dd>

									<dt>문의전화</dt>
									<dd>042-537-5811</dd>
								</dl>
							</div>
						</div>
						<!-- //설명 -->

						<!-- 탭 -->
						<p class="contsSubTit tyBullet">순환버스 배차시간표</p>
						<div class="tabMenuWrapper">
							<div class="tabMenu num2">
								<div>
									<div class="btnTab on"><a href="#freeShuttleBus3_2_1"><span>동부노선(오전)</span></a></div>
									<div class="btnTab"><a href="#freeShuttleBus3_2_2"><span>동부노선(오후)</span></a></div>
								</div>
							</div>

							<div class="tabContBox" id="freeShuttleBus3_2_1">
								<p class="textRight">(좌 → 우 순서입니다)</p>
								<ul class="busTimeTable">
									<li>
										<div class="busStopBox">
											<span>1</span>
											<div>
												<strong>체육회(한밭운동장)</strong><span class="stopTime"><b class="hidden">시간</b><em>09:00</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>부사4가(여성의원앞)</strong><span class="stopTime"><b class="hidden">시간</b><em>09:04</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>신흥동</strong><span class="stopTime"><b class="hidden">시간</b><em>09:10</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>소제동(대성여상 입구)</strong><span class="stopTime"><b class="hidden">시간</b><em>09:15</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>성남효촌마을@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:18</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>용전동</strong><span class="stopTime"><b class="hidden">시간</b><em>09:22</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>송촌취수장</strong><span class="stopTime"><b class="hidden">시간</b><em>09:26</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>송촌동춘당</strong><span class="stopTime"><b class="hidden">시간</b><em>09:31</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>법동보람@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:36</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>법동주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:40</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>읍내현대@</strong><span class="stopTime"><b class="hidden">시간</b><em>09:45</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>읍내동사무소</strong><span class="stopTime"><b class="hidden">시간</b><em>09:47</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>10:20</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>읍내동사무소</strong><span class="stopTime"><b class="hidden">시간</b><em>10:29</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>읍내현대@ 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>10:31</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>법동주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>10:36</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>법동보람@</strong><span class="stopTime"><b class="hidden">시간</b><em>10:40</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>송촌동춘당</strong><span class="stopTime"><b class="hidden">시간</b><em>10:44</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>송촌취수장</strong><span class="stopTime"><b class="hidden">시간</b><em>10:46</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>용전동KT앞</strong><span class="stopTime"><b class="hidden">시간</b><em>10:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>성남효촌마을@</strong><span class="stopTime"><b class="hidden">시간</b><em>10:54</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>소제동(대성여상 입구)</strong><span class="stopTime"><b class="hidden">시간</b><em>10:58</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>신흥동(신흥마을@)</strong><span class="stopTime"><b class="hidden">시간</b><em>11:03</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>관암주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>11:10</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>부가4가</strong><span class="stopTime"><b class="hidden">시간</b><em>11:21</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>26</span>
											<div>
												<strong>체육회(한밭운동장)</strong><span class="stopTime"><b class="hidden">시간</b><em>11:30</em></span>
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
												<strong>체육회(한밭운동장)</strong><span class="stopTime"><b class="hidden">시간</b><em>13:30</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>2</span>
											<div>
												<strong>부사4가(여성의원앞)</strong><span class="stopTime"><b class="hidden">시간</b><em>13:34</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>3</span>
											<div>
												<strong>신흥동</strong><span class="stopTime"><b class="hidden">시간</b><em>13:41</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>4</span>
											<div>
												<strong>소제동(대성여상 입구)</strong><span class="stopTime"><b class="hidden">시간</b><em>13:44</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>5</span>
											<div>
												<strong>성남효촌마을@</strong><span class="stopTime"><b class="hidden">시간</b><em>13:47</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>6</span>
											<div>
												<strong>용전동</strong><span class="stopTime"><b class="hidden">시간</b><em>13:51</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>7</span>
											<div>
												<strong>송촌취수장</strong><span class="stopTime"><b class="hidden">시간</b><em>13:54</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>8</span>
											<div>
												<strong>송촌동춘당</strong><span class="stopTime"><b class="hidden">시간</b><em>13:59</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>9</span>
											<div>
												<strong>법동보람@</strong><span class="stopTime"><b class="hidden">시간</b><em>14:04</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>10</span>
											<div>
												<strong>법동주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>14:08</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>11</span>
											<div>
												<strong>읍내현대@</strong><span class="stopTime"><b class="hidden">시간</b><em>14:12</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>12</span>
											<div>
												<strong>읍내동사무소</strong><span class="stopTime"><b class="hidden">시간</b><em>14:14</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>13</span>
											<div>
												<strong>체육재활원</strong><span class="stopTime"><b class="hidden">시간</b><em>14:50</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>14</span>
											<div>
												<strong>읍내동사무소</strong><span class="stopTime"><b class="hidden">시간</b><em>14:58</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>15</span>
											<div>
												<strong>읍내현대@ 정문</strong><span class="stopTime"><b class="hidden">시간</b><em>15:02</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>16</span>
											<div>
												<strong>법동주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>15:06</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>17</span>
											<div>
												<strong>법동보람@</strong><span class="stopTime"><b class="hidden">시간</b><em>15:10</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>18</span>
											<div>
												<strong>송촌동춘당</strong><span class="stopTime"><b class="hidden">시간</b><em>15:14</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>19</span>
											<div>
												<strong>송촌취수장</strong><span class="stopTime"><b class="hidden">시간</b><em>15:18</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>20</span>
											<div>
												<strong>용전동KT앞</strong><span class="stopTime"><b class="hidden">시간</b><em>15:22</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>21</span>
											<div>
												<strong>성남효촌마을@</strong><span class="stopTime"><b class="hidden">시간</b><em>15:26</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>22</span>
											<div>
												<strong>소제동(대성여상 입구)</strong><span class="stopTime"><b class="hidden">시간</b><em>15:30</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>23</span>
											<div>
												<strong>신흥동(신흥마을@)</strong><span class="stopTime"><b class="hidden">시간</b><em>15:34</em></span>
											</div>
										</div>
									</li>
									<li class="rowEven">
										<div class="busStopBox">
											<span>24</span>
											<div>
												<strong>관암주공3단지@</strong><span class="stopTime"><b class="hidden">시간</b><em>15:40</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>25</span>
											<div>
												<strong>부가4가</strong><span class="stopTime"><b class="hidden">시간</b><em>15:52</em></span>
											</div>
										</div>
									</li>
									<li>
										<div class="busStopBox">
											<span>26</span>
											<div>
												<strong>체육회(한밭운동장)</strong><span class="stopTime"><b class="hidden">시간</b><em>16:00</em></span>
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
>>>>>>> refs/heads/202204
					</div>