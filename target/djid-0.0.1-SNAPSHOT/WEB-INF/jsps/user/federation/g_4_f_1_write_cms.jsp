<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
					<div class="contsArea communicationNotice">
						<p class="contsSubTit tyBullet">정보입력</p>
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>자유게시판 글쓰기이며 제목, 파일첨부, 내용, 등록일, 자동등록방지 내용을 입력합니다.</caption>
								<colgroup>
									<col style="width: 150px">
									<col style="width: 360px">
									<col style="width: 110px">
									<col style="width: *">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="us_name">이름</label></th>
										<td><input type="text" id="us_name" class="wid40"></td>
										<th scope="row">성별</th>
										<td class="checkArea">
											<input type="radio" id="male" name="radio"> <label for="male">남</label>
											<input type="radio" id="female" name="radio"> <label for="female">여</label>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="cellPhone">연락처</label></th>
										<td class="typePhone">
											<select id="cellPhone">
												<option value="">구분</option>
											</select>
											<input type="text" title="휴대폰 가운데  4자리" class="phone">
											<input type="text" title="휴대폰 마지막 4자리" class="phone">
										</td>
										<th scope="row"><label for="date">생년월일</label></th>
										<td class="typePhone">
											<select id="date" class="date">
												<option value="">년</option>
											</select>
											<select title="월" class="date">
												<option value="">월</option>
											</select>
											<select title="일" class="date">
												<option value="">일</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="email">이메일</label></th>
										<td colspan="3" class="typeEmail">
											<input type="text" id="email">
											<i>@</i>
											<select title="주소 선택">
												<option value="">직접입력</option>
											</select>
											<input type="text" title="이메일 주소 직접 입력">
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="address">주소</label></th>
										<td colspan="3" class="address">
											<input type="text" id="address">
											<button type="button" class="btnTypeBasic colorGray"><span>검색</span></button>
											<p>
												<input type="text" title="상세주소1">
												<input type="text" title="상세주소2">
											</p>
										</td>
									</tr>
									<tr>
										<th scope="row">후원방식</th>
										<td colspan="3" class="checkArea">
											<input type="radio" id="bank1" name="radio1" checked="checked"> <label for="bank1">CMS 자동이체</label>
											<input type="radio" id="bank2" name="radio1"> <label for="bank2">계좌이체</label>
										</td>
									</tr>
									<tr>
										<th scope="row">후원금액</th>
										<td colspan="3" class="checkArea">
											<input type="radio" id="money1" name="radio2"> <label for="money1">3,000원</label>
											<input type="radio" id="money2" name="radio2"> <label for="money2">5,000원</label>
											<input type="radio" id="money3" name="radio2"> <label for="money3">10,000원</label>
											<input type="radio" id="money4" name="radio2"> <label for="money4">20,000원</label>
											<input type="text" title="기타 내용">
										</td>
									</tr>
									<tr>
										<th scope="row">이체일자</th>
										<td  colspan="3" class="checkArea">
											<input type="checkbox" id="day1"> <label for="day1">5일</label>
											<input type="checkbox" id="day2"> <label for="day2">10일</label>
											<input type="checkbox" id="day3"> <label for="day3">15일</label>
											<input type="checkbox" id="day4"> <label for="day4">20일</label>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="idnum">주민등록번호</label></th>
										<td  colspan="3" class="idnumArea">
											<input type="text" id="idnum">
											 <i>-</i>
											<input type="text" title="주민등록번호 뒷자리">
										</td>
									</tr>
									<tr>
										<th scope="row">참여동기</th>
										<td  colspan="3" class="checkArea">
											<input type="checkbox" id="check1"> <label for="check1">직원권유</label>
											<input type="checkbox" id="check2"> <label for="check2">지역발전</label>
											<input type="checkbox" id="check3"> <label for="check3">언론보도</label>
											<input type="checkbox" id="check4"> <label for="check4">기타</label>
											<input type="text" title="기타 내용">
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="contents">하고싶은말</label></th>
										<td colspan="3"><textarea id="contents" placeholder="내용을 입력해주세요"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<p class="contsSubTit tyBullet mbt20">개인정보수집이용동의</p>
						<div class="termsScroll mbt50">
							1. 수집하는 개인정보의 항목 및 수집방법<br><br>

							(사)대전장애인단체총연합회는 회원서비스를 위하여 이용자들에게 맞춤식 서비스를 비롯한 보다
							 더 향상된 양질의 서비스를 제공하기 위하여 이용자 개인의 정보를 수집하고 있습니다.<br><br>

							&lt;필수항목&gt;<br>
							- 아이디, 비밀번호, 생년월일, 이름, 연락처,  이메일, 닉네임 : 회원제 서비스 이용에 따른 본인 확인 절차에 이용
						</div>
						<div class="btnArea center">
							<button type="button" class="btnTypeBasic sizeM"><span>신청완료</span></button>
							<button type="button" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
						</div>
					</div>