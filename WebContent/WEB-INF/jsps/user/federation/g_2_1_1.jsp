<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
					<div class="contsArea history">
						<div class="tabMenu num2">
							<div>
								<div class="btnTab on"><a href="#personalizedTab01"><span>조직도</span></a></div>
								<div class="btnTab"><a href="#personalizedTab02"><span>회원단체</span></a></div>
							</div>
						</div>
						<div class="tabContBox" id="personalizedTab01">
							<span class="hidden">조직도</span>

							<div  class="organizationChart">
								<ul class="chartDepth1">
									<li><strong class="organText horizonlLine"><span>고문/자문</span></strong></li>
									<li>
										<a href="#organText01" class="organText verticalLine"><span>회장</span></a>
										<div class="chartDep1Box">
											<ul class="chartDepth2">
												<li>
													<a href="#organText02" class="organText"><span>회장단</span></a>
													<div class="chartDep2Box">
														<ul class="chartDepth3">
															<li><a href="#organText03" class="organText horizonlLine"><span>제위원회</span></a></li>
															<li><strong class="organText"><span>후원회</span></strong></li>
															<li>
																<a href="#organText04" class="organText"><span>사무처장</span></a>
																<div class="chartDep3Box">
																	<ul class="chartDepth4">
																		<li>
																			<a href="#organText05" class="organText horizonlLine"><span>본부장</span></a>
																			<div class="chartDep4Box">
																				<ul class="chartDepth5">
																					<li><a href="#organText06" class="organText horizonlLine"><span>기획실</span></a></li>
																					<li><a href="#organText07" class="organText darkBg verticalLine"><span>대회홍보협력실</span></a></li>
																					<li><a href="#organText08" class="organText darkBg verticalLine"><span>행정실</span></a></li>
																				</ul>
																			</div>
																		</li>
																		<li><strong class="organText"><span>의료지원센터</span></strong></li>
																	</ul>
																</div>
															</li>
															<li><strong class="organText"><span>편의시설설치 시민촉진단</span></strong></li>
														</ul>
													</div>
												</li>
											</ul>
										</div>
									</li>
									<li><strong class="organText"><span>이사회/총회</span></strong></li>
								</ul>
							</div>


							<!-- 조직도 상세정보 -->
							<div class="organizationInfo" id="organText01">
								<p class="contsSubTit tyBullet">회장</p>
								<div class="organcon01">
									<p class="name">황 경 아 (黃敬兒, Hwang Kyoung ah)</p>
									<p class="organtit">경력</p>
									<ul class="listLDotted02">
										<li>(사)대전광역시장애인단체총연합회 회장<li>
										<li>(사)대전광역시척수장애인협회 회장<li>
										<li>(사)한국장애인단체총연맹 공동대표<li>
										<li>열린사이버대학교 사회복지학과 특임교수</li>
									</ul>
								</div>
							</div>

							<div class="organizationInfo" id="organText02">
								<p class="contsSubTit tyBullet">회장단</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 회장단 이며 부회장 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:140px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">성명</th>
												<th scope="col">직책</th>
												<th scope="col">소속기관</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list1}" varStatus="status">
											<tr>
												<td>${list.GUBUN2}</td>
												<td>${list.NAME}</td>
												<td>${list.POSITION}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText03">
								<p class="contsSubTit tyBullet">제위원회</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 제위원회 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:140px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">성명</th>
												<th scope="col">직책</th>
												<th scope="col">소속기관</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list2}" varStatus="status">
											<tr>
												<td>${list.GUBUN2}</td>
												<td>${list.NAME}</td>
												<td>${list.POSITION}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText04">
								<p class="contsSubTit tyBullet">사무처장</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 사무처장 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:140px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">성명</th>
												<th scope="col">직책</th>
												<th scope="col">소속기관</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list3}" varStatus="status">
											<tr>
												<td>${list.GUBUN2}</td>
												<td>${list.NAME}</td>
												<td>${list.POSITION}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText05">
								<p class="contsSubTit tyBullet">본부장</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 본부장 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:140px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">성명</th>
												<th scope="col">직책</th>
												<th scope="col">소속기관</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list4}" varStatus="status">
											<tr>
												<td>${list.GUBUN2}</td>
												<td>${list.NAME}</td>
												<td>${list.POSITION}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText06">
								<p class="contsSubTit tyBullet">기획실</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 기획실 이며 전화,팩스 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:410px">
											<col style="width:110px">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">전화</th>
												<td>${view5.TEL}</td>
												<th scope="row">팩스</th>
												<td class="left line">${view5.FAX}</td>
											</tr>
										</tbody>
									</table>
									<table class="boardTypeCol type03">
										<caption> 기획실 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:110px">
											<col style="width:150px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">직책</th>
												<th scope="col">성명</th>
												<th scope="col">전화</th>
												<th scope="col">주요업무</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list5}" varStatus="status">
											<tr>
												<c:if test="${status.count eq 1}">
													<th rowspan="${fn:length(list5)}">${view5.GUBUN}</th>
												</c:if>													
												<td>${list.POSITION}</td>
												<td>${list.NAME}</td>
												<td>${list.TEL2}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText07">
								<p class="contsSubTit tyBullet">대외홍보협력실</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 대외홍보협력실 이며 전화,팩스 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:410px">
											<col style="width:110px">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">전화</th>
												<td>${view6.TEL}</td>
												<th scope="row">팩스</th>
												<td class="left line">${view6.FAX}</td>
											</tr>
										</tbody>
									</table>
									<table class="boardTypeCol type03">
										<caption> 대외홍보협력실 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:110px">
											<col style="width:150px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">직책</th>
												<th scope="col">성명</th>
												<th scope="col">전화</th>
												<th scope="col">주요업무</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list6}" varStatus="status">
											<tr>
												<c:if test="${status.count eq 1}">
													<th rowspan="${fn:length(list6)}">${view6.GUBUN}</th>
												</c:if>													
												<td>${list.POSITION}</td>
												<td>${list.NAME}</td>
												<td>${list.TEL2}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText08">
								<p class="contsSubTit tyBullet">행정실</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 대외홍보협력실 이며 전화,팩스 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:410px">
											<col style="width:110px">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">전화</th>
												<td>${view7.TEL}</td>
												<th scope="row">팩스</th>
												<td class="left line">${view7.FAX}</td>
											</tr>
										</tbody>
									</table>
									<table class="boardTypeCol type03">
										<caption> 행정실 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:110px">
											<col style="width:150px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">직책</th>
												<th scope="col">성명</th>
												<th scope="col">전화</th>
												<th scope="col">주요업무</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list7}" varStatus="status">
											<tr>
												<c:if test="${status.count eq 1}">
													<th rowspan="${fn:length(list7)}">${view7.GUBUN}</th>
												</c:if>													
												<td>${list.POSITION}</td>
												<td>${list.NAME}</td>
												<td>${list.TEL2}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- //조직도 상세정보 -->
						</div>

						<div class="tabContBox" id="personalizedTab02">
							<span class="hidden">회원단체</span>
							<p class="dateRight">2018. 07. 04.</p>
							<ul class="memberList">
								<li>
									<strong>1</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 1번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">국제장애인문화교류 대전시협회</td>
													<th scope="row">대표자</th>
													<td class="left">문선우</td>
													<th scope="row">전화</th>
													<td class="left">042-631-7007</td>
													<th scope="row">팩스</th>
													<td class="left line">042-672-4482</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">seonu3003@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">대덕구 오정동 495-6</td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>2</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 2번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전교통장애인재활협회</td>
													<th scope="row">대표자</th>
													<td class="left">최정규</td>
													<th scope="row">전화</th>
													<td class="left">042)631-1010</td>
													<th scope="row">팩스</th>
													<td class="left line">042-672-4482</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">cjg0409@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 703호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>3</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 3번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전근육장애인협회(준)</td>
													<th scope="row">대표자</th>
													<td class="left">정민영</td>
													<th scope="row">전화</th>
													<td class="left">042)524-6778</td>
													<th scope="row">팩스</th>
													<td class="left line">042)524-6779</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">readymix@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 계룡로 825(용두동) 희영빌딩 1층 </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>4</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 4번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전뇌병변장애인인권협회</td>
													<th scope="row">대표자</th>
													<td class="left">유선경</td>
													<th scope="row">전화</th>
													<td class="left">042)252-0512</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-0524</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djkshb@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 708호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>5</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 5번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전시각장애인연합회</td>
													<th scope="row">대표자</th>
													<td class="left">이상용</td>
													<th scope="row">전화</th>
													<td class="left">042)226-8038</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-8041</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djbu8040@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문산로 44, 3층  </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>6</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 6번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전장애우권익문제연구소</td>
													<th scope="row">대표자</th>
													<td class="left">김동철</td>
													<th scope="row">전화</th>
													<td class="left">042)672-1482~3</td>
													<th scope="row">팩스</th>
													<td class="left line">042)672-1484</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djcowalk@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">동구 대전로 913, 온누리빌딩 3층  </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>7</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 7번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전장애인문화협회</td>
													<th scope="row">대표자</th>
													<td class="left">김지환</td>
													<th scope="row">전화</th>
													<td class="left">042)274-5581</td>
													<th scope="row">팩스</th>
													<td class="left line">042)320-5590</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">tjmunwha7232@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">동구 삼성동 272-9번지 은호빌딩6층</td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>8</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 8번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전장애인부모회</td>
													<th scope="row">대표자</th>
													<td class="left">이선옥</td>
													<th scope="row">전화</th>
													<td class="left">042)488-9457</td>
													<th scope="row">팩스</th>
													<td class="left line">042)538-9457</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">dotori-hanal@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 704호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>9</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 9번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전장애인자립생활센터총연합회</td>
													<th scope="row">대표자</th>
													<td class="left">정민영</td>
													<th scope="row">전화</th>
													<td class="left">042)524-6778</td>
													<th scope="row">팩스</th>
													<td class="left line">042)524-6779</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">ddil2008@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">- </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>10</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 10번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전장애인정보화협회</td>
													<th scope="row">대표자</th>
													<td class="left">송희성</td>
													<th scope="row">전화</th>
													<td class="left">-</td>
													<th scope="row">팩스</th>
													<td class="left line">-</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">suurek@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">- </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>11</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 11번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전점자도서관</td>
													<th scope="row">대표자</th>
													<td class="left">이재화</td>
													<th scope="row">전화</th>
													<td class="left">042)252-0055</td>
													<th scope="row">팩스</th>
													<td class="left line">042)252-0013</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djdosg@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 서문로 10 </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>12</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 12번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전정신장애인애호인협회</td>
													<th scope="row">대표자</th>
													<td class="left">노정호</td>
													<th scope="row">전화</th>
													<td class="left">-</td>
													<th scope="row">팩스</th>
													<td class="left line">-</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">no670722@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">유성구 와룡로136번길 75 203동2105호(봉산동,봉산휴먼시아2단지) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>13</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 13번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전지적발달장애인복지협회</td>
													<th scope="row">대표자</th>
													<td class="left">정학수</td>
													<th scope="row">전화</th>
													<td class="left">042)625-3010</td>
													<th scope="row">팩스</th>
													<td class="left line">042)625-3095</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djaidd@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">대덕구 대화10길 103</td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>14</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 14번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전척수장애인협회</td>
													<th scope="row">대표자</th>
													<td class="left">황경아</td>
													<th scope="row">전화</th>
													<td class="left">042)255-0080</td>
													<th scope="row">팩스</th>
													<td class="left line">042)255-0081</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">kscia0080@daum.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 707호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>15</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 16번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대한안마사협회 대전지회</td>
													<th scope="row">대표자</th>
													<td class="left">진준영</td>
													<th scope="row">전화</th>
													<td class="left">042)222-0353~4</td>
													<th scope="row">팩스</th>
													<td class="left line">042)222-0320</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">anma0320@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 대흥로 10번길 53  </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>16</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 16번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">새날장애인이룸센터(준)</td>
													<th scope="row">대표자</th>
													<td class="left">조태흥</td>
													<th scope="row">전화</th>
													<td class="left">042)226-0527</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-0524</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djdpi@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 708호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>17</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption>17번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국농아인협회 대전시협회</td>
													<th scope="row">대표자</th>
													<td class="left">박종희</td>
													<th scope="row">전화</th>
													<td class="left">042)673-1518</td>
													<th scope="row">팩스</th>
													<td class="left line">042)673-1517</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">deafss@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">동구 중앙로 200번길 66, 205호(중앙스퀘어)</td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>18</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 18번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국예술문화진흥회 대전충남장애인예술협회</td>
													<th scope="row">대표자</th>
													<td class="left">이환수</td>
													<th scope="row">전화</th>
													<td class="left">042)221-0423</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-8462</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">hwansoo423@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">유성구 원신흥로37, 1004동 1906호(원신흥동,휴먼시아10단지)</td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>19</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 19번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장루장애인협회 대전지부</td>
													<th scope="row">대표자</th>
													<td class="left">박현택</td>
													<th scope="row">전화</th>
													<td class="left">042)536-5070</td>
													<th scope="row">팩스</th>
													<td class="left line">-</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">pht1964@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 702호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>20</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 20번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장애경제인협회 대전ㆍ충남지회</td>
													<th scope="row">대표자</th>
													<td class="left">배영철</td>
													<th scope="row">전화</th>
													<td class="left">042)637-0025</td>
													<th scope="row">팩스</th>
													<td class="left line">044-865-0719</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">kc0025@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">세종시 다솜1로 164, 202-703(도램마을 2단지) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>21</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 21번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장애인문화관광진흥회 대전시협회</td>
													<th scope="row">대표자</th>
													<td class="left">송영섭</td>
													<th scope="row">전화</th>
													<td class="left">042-255-3119</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-3112</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">ktad3112@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 708호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>22</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption>22번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장애인선교단체총연합회 대전충청지부</td>
													<th scope="row">대표자</th>
													<td class="left">여광조</td>
													<th scope="row">전화</th>
													<td class="left">042)221-0813</td>
													<th scope="row">팩스</th>
													<td class="left line">042)254-0817</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djmilal@daum.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 대둔산로 200번길 23-11, 101호 </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>23</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption>23번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장애인IT협회대전IT협회</td>
													<th scope="row">대표자</th>
													<td class="left">최지환</td>
													<th scope="row">전화</th>
													<td class="left">070-8125-3131</td>
													<th scope="row">팩스</th>
													<td class="left line">070-8125-3131</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djitad@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">동구 중앙로 193번길 33(중동) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>24</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption>24번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장애인연맹 대전DPI</td>
													<th scope="row">대표자</th>
													<td class="left">신석훈</td>
													<th scope="row">전화</th>
													<td class="left">042)226-0527</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-0524</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djdpi@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 708호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
							</ul>
						</div>

=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
					<div class="contsArea history">
						<div class="tabMenu num2">
							<div>
								<div class="btnTab on"><a href="#personalizedTab01"><span>조직도</span></a></div>
								<div class="btnTab"><a href="#personalizedTab02"><span>회원단체</span></a></div>
							</div>
						</div>
						<div class="tabContBox" id="personalizedTab01">
							<span class="hidden">조직도</span>

							<div  class="organizationChart">
								<ul class="chartDepth1">
									<li><strong class="organText horizonlLine"><span>고문/자문</span></strong></li>
									<li>
										<a href="#organText01" class="organText verticalLine"><span>회장</span></a>
										<div class="chartDep1Box">
											<ul class="chartDepth2">
												<li>
													<a href="#organText02" class="organText"><span>회장단</span></a>
													<div class="chartDep2Box">
														<ul class="chartDepth3">
															<li><a href="#organText03" class="organText horizonlLine"><span>제위원회</span></a></li>
															<li><strong class="organText"><span>후원회</span></strong></li>
															<li>
																<a href="#organText04" class="organText"><span>사무처장</span></a>
																<div class="chartDep3Box">
																	<ul class="chartDepth4">
																		<li>
																			<a href="#organText05" class="organText horizonlLine"><span>본부장</span></a>
																			<div class="chartDep4Box">
																				<ul class="chartDepth5">
																					<li><a href="#organText06" class="organText horizonlLine"><span>기획실</span></a></li>
																					<li><a href="#organText07" class="organText darkBg verticalLine"><span>대회홍보협력실</span></a></li>
																					<li><a href="#organText08" class="organText darkBg verticalLine"><span>행정실</span></a></li>
																				</ul>
																			</div>
																		</li>
																		<li><strong class="organText"><span>의료지원센터</span></strong></li>
																	</ul>
																</div>
															</li>
															<li><strong class="organText"><span>편의시설설치 시민촉진단</span></strong></li>
														</ul>
													</div>
												</li>
											</ul>
										</div>
									</li>
									<li><strong class="organText"><span>이사회/총회</span></strong></li>
								</ul>
							</div>


							<!-- 조직도 상세정보 -->
							<div class="organizationInfo" id="organText01">
								<p class="contsSubTit tyBullet">회장</p>
								<div class="organcon01">
									<p class="name">황 경 아 (黃敬兒, Hwang Kyoung ah)</p>
									<p class="organtit">경력</p>
									<ul class="listLDotted02">
										<li>(사)대전광역시장애인단체총연합회 회장<li>
										<li>(사)대전광역시척수장애인협회 회장<li>
										<li>(사)한국장애인단체총연맹 공동대표<li>
										<li>열린사이버대학교 사회복지학과 특임교수</li>
									</ul>
								</div>
							</div>

							<div class="organizationInfo" id="organText02">
								<p class="contsSubTit tyBullet">회장단</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 회장단 이며 부회장 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:140px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">성명</th>
												<th scope="col">직책</th>
												<th scope="col">소속기관</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list1}" varStatus="status">
											<tr>
												<td>${list.GUBUN2}</td>
												<td>${list.NAME}</td>
												<td>${list.POSITION}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText03">
								<p class="contsSubTit tyBullet">제위원회</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 제위원회 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:140px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">성명</th>
												<th scope="col">직책</th>
												<th scope="col">소속기관</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list2}" varStatus="status">
											<tr>
												<td>${list.GUBUN2}</td>
												<td>${list.NAME}</td>
												<td>${list.POSITION}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText04">
								<p class="contsSubTit tyBullet">사무처장</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 사무처장 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:140px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">성명</th>
												<th scope="col">직책</th>
												<th scope="col">소속기관</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list3}" varStatus="status">
											<tr>
												<td>${list.GUBUN2}</td>
												<td>${list.NAME}</td>
												<td>${list.POSITION}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText05">
								<p class="contsSubTit tyBullet">본부장</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 본부장 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:140px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">성명</th>
												<th scope="col">직책</th>
												<th scope="col">소속기관</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list4}" varStatus="status">
											<tr>
												<td>${list.GUBUN2}</td>
												<td>${list.NAME}</td>
												<td>${list.POSITION}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText06">
								<p class="contsSubTit tyBullet">기획실</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 기획실 이며 전화,팩스 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:410px">
											<col style="width:110px">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">전화</th>
												<td>${view5.TEL}</td>
												<th scope="row">팩스</th>
												<td class="left line">${view5.FAX}</td>
											</tr>
										</tbody>
									</table>
									<table class="boardTypeCol type03">
										<caption> 기획실 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:110px">
											<col style="width:150px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">직책</th>
												<th scope="col">성명</th>
												<th scope="col">전화</th>
												<th scope="col">주요업무</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list5}" varStatus="status">
											<tr>
												<c:if test="${status.count eq 1}">
													<th rowspan="${fn:length(list5)}">${view5.GUBUN}</th>
												</c:if>													
												<td>${list.POSITION}</td>
												<td>${list.NAME}</td>
												<td>${list.TEL2}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText07">
								<p class="contsSubTit tyBullet">대외홍보협력실</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 대외홍보협력실 이며 전화,팩스 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:410px">
											<col style="width:110px">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">전화</th>
												<td>${view6.TEL}</td>
												<th scope="row">팩스</th>
												<td class="left line">${view6.FAX}</td>
											</tr>
										</tbody>
									</table>
									<table class="boardTypeCol type03">
										<caption> 대외홍보협력실 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:110px">
											<col style="width:150px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">직책</th>
												<th scope="col">성명</th>
												<th scope="col">전화</th>
												<th scope="col">주요업무</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list6}" varStatus="status">
											<tr>
												<c:if test="${status.count eq 1}">
													<th rowspan="${fn:length(list6)}">${view6.GUBUN}</th>
												</c:if>													
												<td>${list.POSITION}</td>
												<td>${list.NAME}</td>
												<td>${list.TEL2}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<div class="organizationInfo" id="organText08">
								<p class="contsSubTit tyBullet">행정실</p>
								<div class="commList">
									<table class="boardTypeCol type03">
										<caption> 대외홍보협력실 이며 전화,팩스 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:410px">
											<col style="width:110px">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">전화</th>
												<td>${view7.TEL}</td>
												<th scope="row">팩스</th>
												<td class="left line">${view7.FAX}</td>
											</tr>
										</tbody>
									</table>
									<table class="boardTypeCol type03">
										<caption> 행정실 이며 성명,직책,소속기관 정보 내용입니다.</caption>
										<colgroup>
											<col style="width:110px">
											<col style="width:110px">
											<col style="width:150px">
											<col style="width:150px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">직책</th>
												<th scope="col">성명</th>
												<th scope="col">전화</th>
												<th scope="col">주요업무</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list" items="${list7}" varStatus="status">
											<tr>
												<c:if test="${status.count eq 1}">
													<th rowspan="${fn:length(list7)}">${view7.GUBUN}</th>
												</c:if>													
												<td>${list.POSITION}</td>
												<td>${list.NAME}</td>
												<td>${list.TEL2}</td>
												<td class="left">${list.ETC}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- //조직도 상세정보 -->
						</div>

						<div class="tabContBox" id="personalizedTab02">
							<span class="hidden">회원단체</span>
							<p class="dateRight">2018. 07. 04.</p>
							<ul class="memberList">
								<li>
									<strong>1</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 1번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">국제장애인문화교류 대전시협회</td>
													<th scope="row">대표자</th>
													<td class="left">문선우</td>
													<th scope="row">전화</th>
													<td class="left">042-631-7007</td>
													<th scope="row">팩스</th>
													<td class="left line">042-672-4482</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">seonu3003@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">대덕구 오정동 495-6</td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>2</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 2번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전교통장애인재활협회</td>
													<th scope="row">대표자</th>
													<td class="left">최정규</td>
													<th scope="row">전화</th>
													<td class="left">042)631-1010</td>
													<th scope="row">팩스</th>
													<td class="left line">042-672-4482</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">cjg0409@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 703호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>3</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 3번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전근육장애인협회(준)</td>
													<th scope="row">대표자</th>
													<td class="left">정민영</td>
													<th scope="row">전화</th>
													<td class="left">042)524-6778</td>
													<th scope="row">팩스</th>
													<td class="left line">042)524-6779</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">readymix@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 계룡로 825(용두동) 희영빌딩 1층 </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>4</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 4번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전뇌병변장애인인권협회</td>
													<th scope="row">대표자</th>
													<td class="left">유선경</td>
													<th scope="row">전화</th>
													<td class="left">042)252-0512</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-0524</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djkshb@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 708호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>5</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 5번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전시각장애인연합회</td>
													<th scope="row">대표자</th>
													<td class="left">이상용</td>
													<th scope="row">전화</th>
													<td class="left">042)226-8038</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-8041</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djbu8040@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문산로 44, 3층  </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>6</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 6번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전장애우권익문제연구소</td>
													<th scope="row">대표자</th>
													<td class="left">김동철</td>
													<th scope="row">전화</th>
													<td class="left">042)672-1482~3</td>
													<th scope="row">팩스</th>
													<td class="left line">042)672-1484</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djcowalk@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">동구 대전로 913, 온누리빌딩 3층  </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>7</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 7번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전장애인문화협회</td>
													<th scope="row">대표자</th>
													<td class="left">김지환</td>
													<th scope="row">전화</th>
													<td class="left">042)274-5581</td>
													<th scope="row">팩스</th>
													<td class="left line">042)320-5590</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">tjmunwha7232@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">동구 삼성동 272-9번지 은호빌딩6층</td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>8</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 8번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전장애인부모회</td>
													<th scope="row">대표자</th>
													<td class="left">이선옥</td>
													<th scope="row">전화</th>
													<td class="left">042)488-9457</td>
													<th scope="row">팩스</th>
													<td class="left line">042)538-9457</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">dotori-hanal@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 704호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>9</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 9번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전장애인자립생활센터총연합회</td>
													<th scope="row">대표자</th>
													<td class="left">정민영</td>
													<th scope="row">전화</th>
													<td class="left">042)524-6778</td>
													<th scope="row">팩스</th>
													<td class="left line">042)524-6779</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">ddil2008@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">- </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>10</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 10번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전장애인정보화협회</td>
													<th scope="row">대표자</th>
													<td class="left">송희성</td>
													<th scope="row">전화</th>
													<td class="left">-</td>
													<th scope="row">팩스</th>
													<td class="left line">-</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">suurek@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">- </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>11</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 11번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전점자도서관</td>
													<th scope="row">대표자</th>
													<td class="left">이재화</td>
													<th scope="row">전화</th>
													<td class="left">042)252-0055</td>
													<th scope="row">팩스</th>
													<td class="left line">042)252-0013</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djdosg@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 서문로 10 </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>12</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 12번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전정신장애인애호인협회</td>
													<th scope="row">대표자</th>
													<td class="left">노정호</td>
													<th scope="row">전화</th>
													<td class="left">-</td>
													<th scope="row">팩스</th>
													<td class="left line">-</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">no670722@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">유성구 와룡로136번길 75 203동2105호(봉산동,봉산휴먼시아2단지) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>13</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 13번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전지적발달장애인복지협회</td>
													<th scope="row">대표자</th>
													<td class="left">정학수</td>
													<th scope="row">전화</th>
													<td class="left">042)625-3010</td>
													<th scope="row">팩스</th>
													<td class="left line">042)625-3095</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djaidd@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">대덕구 대화10길 103</td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>14</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 14번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대전척수장애인협회</td>
													<th scope="row">대표자</th>
													<td class="left">황경아</td>
													<th scope="row">전화</th>
													<td class="left">042)255-0080</td>
													<th scope="row">팩스</th>
													<td class="left line">042)255-0081</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">kscia0080@daum.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 707호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>15</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 16번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">대한안마사협회 대전지회</td>
													<th scope="row">대표자</th>
													<td class="left">진준영</td>
													<th scope="row">전화</th>
													<td class="left">042)222-0353~4</td>
													<th scope="row">팩스</th>
													<td class="left line">042)222-0320</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">anma0320@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 대흥로 10번길 53  </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>16</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 16번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">새날장애인이룸센터(준)</td>
													<th scope="row">대표자</th>
													<td class="left">조태흥</td>
													<th scope="row">전화</th>
													<td class="left">042)226-0527</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-0524</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djdpi@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 708호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>17</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption>17번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국농아인협회 대전시협회</td>
													<th scope="row">대표자</th>
													<td class="left">박종희</td>
													<th scope="row">전화</th>
													<td class="left">042)673-1518</td>
													<th scope="row">팩스</th>
													<td class="left line">042)673-1517</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">deafss@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">동구 중앙로 200번길 66, 205호(중앙스퀘어)</td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>18</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 18번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국예술문화진흥회 대전충남장애인예술협회</td>
													<th scope="row">대표자</th>
													<td class="left">이환수</td>
													<th scope="row">전화</th>
													<td class="left">042)221-0423</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-8462</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">hwansoo423@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">유성구 원신흥로37, 1004동 1906호(원신흥동,휴먼시아10단지)</td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>19</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 19번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장루장애인협회 대전지부</td>
													<th scope="row">대표자</th>
													<td class="left">박현택</td>
													<th scope="row">전화</th>
													<td class="left">042)536-5070</td>
													<th scope="row">팩스</th>
													<td class="left line">-</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">pht1964@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 702호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>20</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 20번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장애경제인협회 대전ㆍ충남지회</td>
													<th scope="row">대표자</th>
													<td class="left">배영철</td>
													<th scope="row">전화</th>
													<td class="left">042)637-0025</td>
													<th scope="row">팩스</th>
													<td class="left line">044-865-0719</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">kc0025@hanmail.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">세종시 다솜1로 164, 202-703(도램마을 2단지) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>21</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption> 21번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장애인문화관광진흥회 대전시협회</td>
													<th scope="row">대표자</th>
													<td class="left">송영섭</td>
													<th scope="row">전화</th>
													<td class="left">042-255-3119</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-3112</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">ktad3112@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 708호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>22</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption>22번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장애인선교단체총연합회 대전충청지부</td>
													<th scope="row">대표자</th>
													<td class="left">여광조</td>
													<th scope="row">전화</th>
													<td class="left">042)221-0813</td>
													<th scope="row">팩스</th>
													<td class="left line">042)254-0817</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djmilal@daum.net</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 대둔산로 200번길 23-11, 101호 </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>23</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption>23번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장애인IT협회대전IT협회</td>
													<th scope="row">대표자</th>
													<td class="left">최지환</td>
													<th scope="row">전화</th>
													<td class="left">070-8125-3131</td>
													<th scope="row">팩스</th>
													<td class="left line">070-8125-3131</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djitad@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">동구 중앙로 193번길 33(중동) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
								<li>
									<strong>24</strong>
									<div class="commList">
										<table class="boardTypeCol type04">
											<caption>24번 기관명,대표자,전화,팩스,이메일,주소 입니다.</caption>
											<colgroup>
												<col style="width:65px">
												<col style="width:auto">
												<col style="width:65px">
												<col style="width:80px">
												<col style="width:60px">
												<col style="width:140px">
												<col style="width:60px">
												<col style="width:130px">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">기관명</th>
													<td class="left">한국장애인연맹 대전DPI</td>
													<th scope="row">대표자</th>
													<td class="left">신석훈</td>
													<th scope="row">전화</th>
													<td class="left">042)226-0527</td>
													<th scope="row">팩스</th>
													<td class="left line">042)226-0524</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td class="left">djdpi@naver.com</td>
													<th scope="row">주소</th>
													<td class="left line" colspan="5">중구 보문로 246, 708호(대흥동,대림빌딩) </td>
												</tr>
											</tbody>
										</table>
									</div>
								</li>
							</ul>
						</div>

>>>>>>> refs/heads/202204
					</div>