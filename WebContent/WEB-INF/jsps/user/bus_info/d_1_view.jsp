<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>

$(document).ready(function(){

	$('#listBtn').click(function(){
		location.href = "/bus_info/d_1/list.do?year=${bean.year}&month=${bean.month}";
	});
	
});

</script>
					<div class="contsArea trafficInformation">
						<p class="textParaList">탑승을 원하시는 날짜 하루전에만 예약이 가능합니다.</p>
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>해피콜 예약하기이며 예약자이름,비밀번호,예약일시,탑승자이름,탑승장소,도착장소,연락처 내용을 확인합니다.</caption>
								<colgroup>
									<col style="width: 170px">
									<col style="width: 759px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">예약자 이름</th>
										<td>${view.RESERV_NAME}</td>
									</tr>
									<%-- <tr>
										<th scope="row"><label for="password">비밀번호</label></th>
										<td><input type="password" id="password" class="wid40" value="1234" readonly="readonly"></td>
									</tr> --%>
									<tr>
										<th scope="row">예약일시</th>
										<td>
											${view.RESERV_YEAR}년 ${view.RESERV_MONTH}월 ${view.RESERV_DAY}일 ${view.RESERV_HOUR}시 ${view.RESERV_MINUTE}분											
										</td>
									</tr>
									<tr>
										<th scope="row">탑승자 이름</th>
										<td>${view.PASS_NAME}</td>
									</tr>
									<tr>
										<th scope="row">탑승장소</th>
										<td>${view.S_PLACE}</td>
									</tr>
									<tr>
										<th scope="row">도착장소</th>
										<td>${view.E_PLACE}</td>
									</tr>
									<tr>
										<th scope="row">연락처</th>
										<td>
											${view.TEL1}-${view.TEL2}-${view.TEL3}
										</td>
									</tr>
									<tr>
										<th scope="row">장애등급</th>
										<td>
											${view.GRADE}
										</td>
									</tr>
									<tr>
										<th scope="row">탑승인원</th>
										<td>
											${view.PERSON_CNT}명
										</td>
									</tr>
									<tr>
										<th scope="row">수급여부</th>
										<td>
											<c:choose>
												<c:when test="${view.SUPPLY_YN eq 'Y'}">수급</c:when>
												<c:otherwise>미수급</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th scope="row">상태</th>
										<td>
											${view.CONFIRM_YN}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btnArea center">
							<button type="button" class="btnTypeBasic sizeM" id="listBtn"><span>목록</span></button>
							<!-- <button type="button" class="btnTypeBasic sizeM colorGray"><span>취소</span></button> -->
						</div>
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>

$(document).ready(function(){

	$('#listBtn').click(function(){
		location.href = "/bus_info/d_1/list.do?year=${bean.year}&month=${bean.month}";
	});
	
});

</script>
					<div class="contsArea trafficInformation">
						<p class="textParaList">탑승을 원하시는 날짜 하루전에만 예약이 가능합니다.</p>
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>해피콜 예약하기이며 예약자이름,비밀번호,예약일시,탑승자이름,탑승장소,도착장소,연락처 내용을 확인합니다.</caption>
								<colgroup>
									<col style="width: 170px">
									<col style="width: 759px">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">예약자 이름</th>
										<td>${view.RESERV_NAME}</td>
									</tr>
									<%-- <tr>
										<th scope="row"><label for="password">비밀번호</label></th>
										<td><input type="password" id="password" class="wid40" value="1234" readonly="readonly"></td>
									</tr> --%>
									<tr>
										<th scope="row">예약일시</th>
										<td>
											${view.RESERV_YEAR}년 ${view.RESERV_MONTH}월 ${view.RESERV_DAY}일 ${view.RESERV_HOUR}시 ${view.RESERV_MINUTE}분											
										</td>
									</tr>
									<tr>
										<th scope="row">탑승자 이름</th>
										<td>${view.PASS_NAME}</td>
									</tr>
									<tr>
										<th scope="row">탑승장소</th>
										<td>${view.S_PLACE}</td>
									</tr>
									<tr>
										<th scope="row">도착장소</th>
										<td>${view.E_PLACE}</td>
									</tr>
									<tr>
										<th scope="row">연락처</th>
										<td>
											${view.TEL1}-${view.TEL2}-${view.TEL3}
										</td>
									</tr>
									<tr>
										<th scope="row">장애등급</th>
										<td>
											${view.GRADE}
										</td>
									</tr>
									<tr>
										<th scope="row">탑승인원</th>
										<td>
											${view.PERSON_CNT}명
										</td>
									</tr>
									<tr>
										<th scope="row">수급여부</th>
										<td>
											<c:choose>
												<c:when test="${view.SUPPLY_YN eq 'Y'}">수급</c:when>
												<c:otherwise>미수급</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th scope="row">상태</th>
										<td>
											${view.CONFIRM_YN}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btnArea center">
							<button type="button" class="btnTypeBasic sizeM" id="listBtn"><span>목록</span></button>
							<!-- <button type="button" class="btnTypeBasic sizeM colorGray"><span>취소</span></button> -->
						</div>
>>>>>>> refs/heads/202204
					</div>