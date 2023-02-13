<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>

			<c:if test="${menu.menu_num eq '01'}">
				<!-- LNB -->
				<div class="localMenu" id="LNB">
					<span class="hidden">서브메뉴 시작</span>
					<h2><span>${menu.title}</span></h2>
					<div class="lnbDepth">
						<ul class="lnbDep1List">
							<li><a href="/custom_info/a_1.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '01'}">on</c:if>">개별맞춤형</a></li>
							<li><a href="/custom_info/a_2.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '02'}">on</c:if>">생애주기형</a></li>
						</ul>						
					</div>
					
					<c:if test="${not empty menu.signView}">
					<div class="player">
						<iframe width="212" height="120" src="${menu.signView.SRC}?<c:if test="${menu.signView.AUTO_YN eq 'Y'}">autoplay=1</c:if>&?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<div class="note">
							본 영상은 <span>"맞춤형 복지정보"</span>에<br/>대한 수화설명영상입니다.
						</div>
					</div>
					</c:if>
				</div>
				<!-- //LNB -->				
				
			</c:if>
			
			<c:if test="${menu.menu_num eq '02'}">
				<!-- LNB -->
				<div class="localMenu" id="LNB">
					<span class="hidden">서브메뉴 시작</span>

					<h2><span>${menu.title}</span></h2>
					<div class="lnbDepth">
						<ul class="lnbDep1List">
							<li><a href="/welfare_facility/b_1/list.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '01'}">on</c:if>">복지시설 검색</a></li>
							<li><a href="/welfare_facility/b_2/list.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '02'}">on</c:if>">편의시설 검색</a></li>
							<li><a href="/welfare_facility/b_3/list.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '03'}">on</c:if>">복지지도</a></li>
						</ul>
					</div>
					
					<c:if test="${not empty menu.signView}">
					<div class="player">
						<iframe width="212" height="120" src="${menu.signView.SRC}?<c:if test="${menu.signView.AUTO_YN eq 'Y'}">autoplay=1</c:if>&?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<div class="note">
							본 영상은 <span>"우리지역 복지시설"</span>에<br/>대한 수화설명영상입니다.
						</div>
					</div>
					</c:if>
				</div>
				<!-- //LNB -->
				
			</c:if>
			
			<c:if test="${menu.menu_num eq '03'}">
				<!-- LNB -->
				<div class="localMenu" id="LNB">
					<span class="hidden">서브메뉴 시작</span>
					<h2><span>${menu.title}</span></h2>
					<div class="lnbDepth">
						<ul class="lnbDep1List">
							<li><a href="/welfare_info/c_1/list.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '01'}">on</c:if>">복지 핫이슈</a></li>
							<li><a href="#" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '02'}">on</c:if>">장애인 일자리</a>
								<ul class="lnbDep2List">
									<li><a href="/welfare_info/c_2_1/list.do" class="lnbDep2 <c:if test="${menu.menu_num_sub_sub eq '01'}">on</c:if>">구인정보</a></li>
									<li><a href="/welfare_info/c_2_2/list.do" class="lnbDep2 <c:if test="${menu.menu_num_sub_sub eq '02'}">on</c:if>">구직정보</a></li>
								</ul>
							</li>
							<li><a href="/welfare_info/c_3/list.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '03'}">on</c:if>">복지 자료실</a></li>
						</ul>
					</div>
					<!-- 20190130 player 추가 -->
					
					<c:if test="${not empty menu.signView}">
					<div class="player">
						<iframe width="212" height="120" src="${menu.signView.SRC}?<c:if test="${menu.signView.AUTO_YN eq 'Y'}">autoplay=1</c:if>&?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<div class="note">
							본 영상은 <span>"복지 정보모아"</span>에<br/>대한 수화설명영상입니다.
						</div>
					</div>
					</c:if>
					
				</div>
				<!-- //LNB -->

			</c:if>
			
			<c:if test="${menu.menu_num eq '04'}">
				<!-- LNB -->
				<div class="localMenu" id="LNB">
					<span class="hidden">서브메뉴 시작</span>

					<h2><span>${menu.title}</span></h2>
					<div class="lnbDepth">
						<ul class="lnbDep1List">
							<li><a href="/bus_info/d_1_1.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '01'}">on</c:if>">해피콜</a></li>
							<li class="">
								<a href="#" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '02'}">on</c:if>">무료 순환버스</a>
								<ul class="lnbDep2List">
									<li><a href="/bus_info/d_2_1_1.do" class="lnbDep2 <c:if test="${menu.menu_num_sub eq '02' and menu.menu_num_sub_sub eq '01'}">on</c:if>">1호차</a></li>
									<li><a href="/bus_info/d_2_2_1.do" class="lnbDep2 <c:if test="${menu.menu_num_sub eq '02' and menu.menu_num_sub_sub eq '02'}">on</c:if>">2호차</a></li>
								</ul>
							</li>
							<li>
								<a href="#" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '03'}">on</c:if>">대전지역</a>
								<ul class="lnbDep2List">
									<li><a href="/bus_info/d_3_1.do" class="lnbDep2 <c:if test="${menu.menu_num_sub eq '03' and menu.menu_num_sub_sub eq '01'}">on</c:if>">저상버스 운행정보</a></li>
									<li>
										<a href="#" class="lnbDep2">무료운행버스</a>
										<ul class="lnbDep3List">
											<li><a href="/bus_info/d_3_2_1_1.do" class="lnbDep3 <c:if test="${menu.menu_num_sub eq '03' and menu.menu_num_sub_sub eq '02' and menu.menu_num_sub_sub_sub eq '01'}">on</c:if>">대전광역시장애인체육회</a></li>
											<li><a href="/bus_info/d_3_2_2_1.do" class="lnbDep3 <c:if test="${menu.menu_num_sub eq '03' and menu.menu_num_sub_sub eq '02' and menu.menu_num_sub_sub_sub eq '02'}">on</c:if>">대전광역시립장애인복지관</a></li>
											<li><a href="/bus_info/d_3_2_3_1.do" class="lnbDep3 <c:if test="${menu.menu_num_sub eq '03' and menu.menu_num_sub_sub eq '02' and menu.menu_num_sub_sub_sub eq '03'}">on</c:if>">대덕구장애인종합복지관</a></li>
											<li><a href="/bus_info/d_3_2_4_1.do" class="lnbDep3 <c:if test="${menu.menu_num_sub eq '03' and menu.menu_num_sub_sub eq '02' and menu.menu_num_sub_sub_sub eq '04'}">on</c:if>">유성구장애인종합복지관</a></li>
											<li><a href="/bus_info/d_3_2_5_1.do" class="lnbDep3 <c:if test="${menu.menu_num_sub eq '03' and menu.menu_num_sub_sub eq '02' and menu.menu_num_sub_sub_sub eq '05'}">on</c:if>">행복한우리복지관</a></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					
					
					<c:if test="${not empty menu.signView}">
					<div class="player">
						<iframe width="212" height="120" src="${menu.signView.SRC}?<c:if test="${menu.signView.AUTO_YN eq 'Y'}">autoplay=1</c:if>&?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<div class="note">
							본 영상은 <span>"장애인 교통정보"</span>에<br/>대한 수화설명영상입니다.
						</div>
					</div>
					</c:if>
				</div>
				<!-- //LNB -->
				
			</c:if>
			
			<c:if test="${menu.menu_num eq '05'}">
				<!-- LNB -->
				<div class="localMenu" id="LNB">
					<span class="hidden">서브메뉴 시작</span>
					<h2><span>${menu.title}</span></h2>
					<div class="lnbDepth">
						<ul class="lnbDep1List">
							<li><a href="/board/e_1/list.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '01'}">on</c:if>">공지사항</a></li>
							<li><a href="/board/e_2/list.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '02'}">on</c:if>">행사달력</a></li>
							<li><a href="#" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '03'}">on</c:if>">홍보게시판</a>
								<ul class="lnbDep2List">
									<li><a href="/board/e_3_1/list.do" class="lnbDep2 <c:if test="${menu.menu_num_sub eq '03' and menu.menu_num_sub_sub eq '01'}">on</c:if>">우리기관 홍보</a></li>
									<li><a href="/board/e_3_2/list.do" class="lnbDep2 <c:if test="${menu.menu_num_sub eq '03' and menu.menu_num_sub_sub eq '02'}">on</c:if>">나눔/이벤트</a></li>
								</ul>
							</li>
							<li><a href="/board/e_4/list.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '04'}">on</c:if>">자유게시판</a></li>
							<li><a href="/board/e_5/list.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '05'}">on</c:if>">상담게시판</a></li>
						</ul>
					</div>
					
					<c:if test="${not empty menu.signView}">
					<div class="player">
						<iframe width="212" height="120" src="${menu.signView.SRC}?<c:if test="${menu.signView.AUTO_YN eq 'Y'}">autoplay=1</c:if>&?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<div class="note">
							본 영상은 <span>"소통과 알림"</span>에<br/>대한 수화설명영상입니다.
						</div>
					</div>
					</c:if>
				
				</div>
				<!-- //LNB -->
			</c:if>
			
			<c:if test="${menu.menu_num eq '06'}">
				<!-- LNB -->
				<div class="localMenu" id="LNB">
					<span class="hidden">서브메뉴 시작</span>
					<h2><span>${menu.title}</span></h2>
					<div class="lnbDepth">
						<ul class="lnbDep1List">
							<li><a href="/iot/f_1.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '01'}">on</c:if>">IOT 서비스란?</a></li>
							<li><a href="/iot/f_2.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '02'}">on</c:if>">이용방법</a></li>
						</ul>
					</div>
					
					<c:if test="${not empty menu.signView}">
					<div class="player">
						<iframe width="212" height="120" src="${menu.signView.SRC}?<c:if test="${menu.signView.AUTO_YN eq 'Y'}">autoplay=1</c:if>&?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						<div class="note">
							본 영상은 <span>"IOT 서비스"</span>에<br/>대한 수화설명영상입니다.
						</div>
					</div>
					</c:if>
				
				</div>
				<!-- //LNB -->
			</c:if>
			
			<c:if test="${menu.menu_num eq '07'}">
				<!-- LNB -->
				<div class="localMenu" id="LNB">
					<span class="hidden">서브메뉴 시작</span>
					<h2><span>대전장애인단체<br>총연합회</span></h2>
					<div class="lnbDepth">
						<ul class="lnbDep1List">
							<li><a href="#" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '01'}">on</c:if>">인사말</a>
								<ul class="lnbDep2List">
									<li><a href="/federation/g_1_1.do" class="lnbDep2 <c:if test="${menu.menu_num_sub eq '01' and menu.menu_num_sub_sub eq '01'}">on</c:if>">인사말</a></li>
									<li><a href="/federation/g_1_2.do" class="lnbDep2 <c:if test="${menu.menu_num_sub eq '01' and menu.menu_num_sub_sub eq '02'}">on</c:if>">연합회 소개</a></li>
									<li><a href="/federation/g_1_3_1.do" class="lnbDep2 <c:if test="${menu.menu_num_sub eq '01' and menu.menu_num_sub_sub eq '03'}">on</c:if>">연혁</a></li>
								</ul>
							</li>
							<li><a href="/federation/g_1_4_1.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '02'}">on</c:if>">사업소개</a></li>
							<li><a href="/federation/g_2_1_1.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '03'}">on</c:if>">함께하는 사람들</a></li>
							<li><a href="/federation/g_3_1/list.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '04'}">on</c:if>">사진&amp;영상</a></li>
							<li><a href="/federation/g_4_1.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '05'}">on</c:if>">자원봉사&amp;후원안내</a></li>
							<li><a href="/federation/g_5.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '06'}">on</c:if>">찾아오시는 길</a></li>
							<li><a href="/federation/g_6/list.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '07'}">on</c:if>">직원게시판</a></li>
						</ul>
					</div>
					<div class="quickLinkLeft">
						<div class="linkbox">
							<a href="/welfare_info/c_3/list.do" class="qlink01"><span>복지자료실</span></a>
							<a href="javascript:alert('준비중입니다.');" class="qlink02"><span>백문백답</span></a>
						</div>
						<div class="telNumb">
							<p>
								<strong>문의전화</strong>
								<span>042-625-4678</span>
								<em>(09:30~18:30)</em>
							</p>
						</div>
					</div>
				</div>
				<!-- //LNB -->
			</c:if>
			
			<c:if test="${menu.menu_num eq '08' and (menu.menu_num_sub eq '05' or menu.menu_num_sub eq '06')}">
				<!-- LNB -->
				<div class="localMenu" id="LNB">
					<span class="hidden">서브메뉴 시작</span>

					<h2><span>${menu.title}</span></h2>
					<div class="lnbDepth">
						<ul class="lnbDep1List">
							<li><a href="/member/modify_1.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '05'}">on</c:if>">회원정보변경</a></li>
							<li><a href="/member/out_1.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '06'}">on</c:if>">회원탈퇴</a></li>
						</ul>
					</div>

				</div>
				<!-- //LNB -->
			</c:if>
			
			<c:if test="${menu.menu_num eq '09'}">
				<!-- LNB -->
				<div class="localMenu" id="LNB">
					<span class="hidden">서브메뉴 시작</span>

					<h2><span>${menu.title}</span></h2>
					<div class="lnbDepth">
						<ul class="lnbDep1List">
							<li><a href="/site_guide/h_1.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '01'}">on</c:if>">정보드림이란?</a></li>
							<li><a href="/site_guide/h_2.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '02'}">on</c:if>">이용안내</a></li>
							<li><a href="/site_guide/h_3.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '03'}">on</c:if>">사이트맵</a></li>
							<li><a href="/site_guide/h_4.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '04'}">on</c:if>">개인정보 처리방침</a></li>
							<li><a href="/site_guide/h_5.do" class="lnbDep1 <c:if test="${menu.menu_num_sub eq '05'}">on</c:if>">이메일 무단수집 거부</a></li>
						</ul>
					</div>

				</div>
				<!-- //LNB -->
			</c:if>
			
			<c:if test="${menu.menu_num eq '10'}">
			
			</c:if>