<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
					<div class="contsArea siteService">
						<p class="textParaList">
							메뉴를 클릭하시면 해당 페이지로 이동합니다.
						</p>

						<div class="sitemap">
							<div>
								<strong>맞춤형 복지정보</strong>
								<ul>
									<li><a href="/custom_info/a_1.do">개별맞춤형</a></li>
									<li><a href="/custom_info/a_2.do">생애주기형</a></li>
								</ul>
							</div>
							<div>
								<strong>우리지역 복지시설</strong>
								<ul>
									<li><a href="/welfare_facility/b_1/list.do">복지시설 검색</a></li>
									<li><a href="/welfare_facility/b_2/list.do">편의시설 검색</a></li>
									<li><a href="/welfare_facility/b_3/list.do">복지지도</a>
										<ul>
											<li><a href="/welfare_facility/b_3/list.do">· 복지시설</a></li>
											<li><a href="/welfare_facility/b_4/list.do">· 편의시설</a></li>
										</ul>
									</li>
								</ul>
							</div>
							<div>
								<strong>복지 정보모아</strong>
								<ul>
									<li><a href="/welfare_info/c_1/list.do">복지 핫이슈</a></li>
									<li><a href="/welfare_info/c_2_1/list.do">장애인 일자리</a>
										<ul>
											<li><a href="/welfare_info/c_2_1/list.do">· 구인정보</a></li>
											<li><a href="/welfare_info/c_2_2/list.do">· 구직정보</a></li>
										</ul>
									</li>
									<li><a href="/welfare_info/c_3/list.do">복지 자료실</a></li>
								</ul>
							</div>
							<div>
								<strong>장애인 교통정보</strong>
								<ul>
									<li><a href="/bus_info/d_1_1.do">해피콜</a></li>
									<li><a href="/bus_info/d_2_1_1.do">무료 순환버스</a>
										<ul>
											<li><a href="/bus_info/d_2_1_1.do">· 1호차</a></li>
											<li><a href="/bus_info/d_2_2_1.do">· 2호차</a></li>
										</ul>
									</li>
									<li><a href="/bus_info/d_3_1">대전지역</a>
										<ul>
											<li><a href="/bus_info/d_3_1.do">· 저상시내버스 운행정보 </a></li>
											<li><a href="/bus_info/d_3_2_1_1.do">· 무료운행버스</a>
												<ul>
													<li><a href="/bus_info/d_3_2_1_1.do">- 대전광역시 장애인체육회</a></li>
													<li><a href="/bus_info/d_3_2_2_1.do">- 대전광역시시립장애인복지관</a></li>
													<li><a href="/bus_info/d_3_2_3_1.do">- 대덕구장애인종합복지관</a></li>
													<li><a href="/bus_info/d_3_2_4_1.do">- 유성구장애인종합복지관</a></li>
													<li><a href="/bus_info/d_3_2_5_1.do">- 행복한우리복지관</a></li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>

						<div class="sitemap">
							<div>
								<strong>소통과 알림</strong>
								<ul>
									<li><a href="/board/e_1/list.do">공지사항</a></li>
									<li><a href="/board/e_2/list.do">행사달력</a></li>
									<li><a href="/board/e_3_1/list.do">홍보게시판</a>
										<ul>
											<li><a href="/board/e_3_1/list.do">· 우리기관홍보</a></li>
											<li><a href="/board/e_3_2/list.do">· 나눔/이벤트</a></li>
										</ul>
									</li>
									<li><a href="/board/e_4/list.do">자유게시판</a></li>
									<li><a href="/board/e_5/list.do">상담게시판</a></li>
								</ul>
							</div>
							<div>
								<strong>lOT 서비스</strong>
								<ul>
									<li><a href="/iot/f_1.do">IoT 서비스란?</a></li>
									<li><a href="/iot/f_2.do">이용방법</a></li>
								</ul>
							</div>
							<div>
								<strong>대전장애인단체총연합회</strong>
								<ul>
									<li><a href="/federation/g_1_1.do">인사말</a>
										<ul>
											<li><a href="/federation/g_1_1.do">· 인사말</a></li>
											<li><a href="/federation/g_1_2.do">· 연합회 소개</a></li>
											<li><a href="/federation/g_1_3_1.do">· 연혁</a></li>
										</ul>
									</li>
									<li><a href="/federation/g_1_4_1.do">사업소개</a></li>
									<li><a href="/federation/g_2_1_1.do">함께하는 사람들</a>
										<ul>
											<li><a href="/federation/g_2_1_1.do">· 조직도</a></li>
											<li><a href="/federation/g_2_1_1.do">· 회원단체</a></li>
										</ul>
									</li>
									<li><a href="/federation/g_3_1/list.do">사진&영상</a></li>
									<li><a href="/federation/g_4_1.do">자원봉사&후원안내</a></li>
									<li><a href="/federation/g_5.do">찾아오시는길</a></li>
									<li><a href="/federation/g_6/list.do">직원 게시판</a></li>
								</ul>
							</div>
							<div>
								<strong>홈페이지 이용방법</strong>
								<ul>
									<li><a href="/site_guide/h_1.do">정보드림이란?</a></li>
									<li><a href="/site_guide/h_2.do">이용안내</a></li>
									<li><a href="/site_guide/h_3.do">사이트맵</a></li>
									<li><a href="/site_guide/h_4.do">개인정보 처리방침</a></li>
									<li><a href="/site_guide/h_5.do">이메일무단수집거부</a></li>
								</ul>
							</div>
						</div>
					</div>