<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<%
	pageContext.setAttribute("crlf", "\n");
%>
<style>
.edu_table tr td{
	text-align: center;
}
.edu_table tr{
	height: 30px;
}
</style>
<script type="text/javascript">
function cinsert() {
	 var contents = $('#contents').val();
	if (contents == '' || contents == null) {
		alert('내용을 입력하세요.');
		$('#contents').focus();
		return;
	}
	
	if(confirm('등록하시겠습니까?')){
		$('#c_form').submit();	
	}
	return;
}



function download(o, c, t){
	location.href='/download?filename='+encodeURI(o)+'&refilename='+c+'&path='+t;
}

function goList(){
	$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/list.do");
	$("#frm").submit();
}

function goDel(){
	if(confirm('정말 삭제하시겠습니까?')){
		$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/delete.do");
		$("#frm").submit();
	}
}

function goModify(){
	$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/modify.do");
	$("#frm").submit();
}

$(document).ready(function(){
	
	/* 본문 이미지 화면 오버시 사이즈 재조절 */
	if($('.Tcon img').length > 0){
		$('.Tcon img').bind("click",function(e){
			clickCHk = false;
			var url = $(this).attr('src');
			
			$.fancybox({'href'			: 	url});
			return false;
		});
		$('.Tcon img').attr("class", "cursor: hand");
		
		
		// 이미지가 본문보다 클경우
		$('.Tcon img').each(function(){  
			var img_wd = $(this).css('width');
				img_wd = new Number( img_wd.replace('px', '') );
            if(img_wd > 980 ){
            	$(this).css('width', '100%');	
            }				
		});
	}
	
});

</script>
<form id="frm" name="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/list.do">
	<input type="hidden" name="page" id="page" value="${bean.page}" />
	<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
	
	<input type="hidden" name="seq" id="seq" value="${bean.seq}" />

	<input type="hidden" name="search_kind_seq" id="frm_search_kind_seq" value="${bean.search_kind_seq}" />	
	<input type="hidden" name="search_area_seq" id="frm_search_area_seq" value="${bean.search_area_seq}" />
	<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
</form>

<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
		
		<div class="conBox">
	
							<div style="width:1016px;margin:0 auto;margin-top:25px;">기본정보</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="15%" >
									<col width="25%" >
									<col width="20%" >
									<col width="30%" >
								</colgroup>
								<tbody>
									<tr>
										<th colspan="2">성명</th>
										<td>
											${view.NAME}																					
										</td>
										<th>생년월일</th>
										<td>
											${view.BIRTH_YEAR}-${view.BIRTH_MONTH}-${view.BIRTH_DAY}
										</td>
									</tr>
									<tr>
										<th colspan="2">주소</th>
										<td colspan="3">
											(${view.ZIP_CD}) ${view.ADDR1} ${view.ADDR2}																							
										</td>
									</tr>
									<tr>
										<th colspan="2">연락처</th>
										<td>
											${view.TEL1}-${view.TEL2}-${view.TEL3}																					
										</td>
										<th>이메일</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.EMAIL}">${view.EMAIL}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>										
										<th rowspan="3" style="height: 120px;">장애유형<br/>및<br/>등급</th>
										<th>장애유형</th>
										<td>
											${view.KIND}
										</td>
										<th>장애발생시기</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.OCCUR_DATE}">${view.OCCUR_DATE}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>장애급수</th>
										<td>
											${view.LEVEL}
										</td>
										<th>장애등록일</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.REGIST_DATE}">${view.REGIST_DATE}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>장애부위</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.PART}">${view.PART}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
										<th>진료/치료</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.CURE}">${view.CURE}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">학력사항</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv edu_table"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="18%" >
									<col width="27%" >
									<col width="27%" >
									<col width="23%" >
								</colgroup>
								<tbody id="edu_tbody">
									<tr>
										<th>학교명(기관명)</th>
										<th>기간</th>
										<th>교육/훈련내용</th>
										<th>기타</th>
									</tr>
									<c:if test="${empty edu_list}">
										<tr>
											<td colspan="4" style="text-align:center;">등록된 학력사항이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty edu_list}">
										<c:forEach var="list" items="${edu_list}">
										<tr>
											<td>${list.EDU_NAME}</td>
											<td>
												<fmt:formatDate value="${list.EDU_SDATE}" pattern="yyyy-MM-dd" />
												~
												<fmt:formatDate value="${list.EDU_EDATE}" pattern="yyyy-MM-dd" />
											</td>
											<td>${list.EDU_CONTENT}</td>
											<td>${list.EDU_ETC }</td>
										</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">경력사항</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv edu_table"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="18%" >
									<col width="27%" >
									<col width="27%" >
									<col width="23%" >
								</colgroup>
								<tbody id="career_tbody">
									<tr>
										<th>사업체명</th>
										<th>기간</th>
										<th>담당직무</th>
										<th>급여</th>
									</tr>
									<c:if test="${empty career_list}">
										<tr>
											<td colspan="4" style="text-align:center;">등록된 경력사항이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty career_list}">
										<c:forEach var="list" items="${career_list}">
										<tr>
											<td>${list.CAREER_NAME}</td>
											<td>
												<fmt:formatDate value="${list.CAREER_SDATE}" pattern="yyyy-MM-dd" />
												~
												<fmt:formatDate value="${list.CAREER_EDATE}" pattern="yyyy-MM-dd" />
											</td>
											<td>${list.CAREER_CONTENT}</td>
											<td>${list.CAREER_ETC }</td>
										</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">생활적용능력</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
										<th>외모/청결상태</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.LIFE_ABILITY1}">${view.LIFE_ABILITY1}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>일상생활</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.LIFE_ABILITY2}">${view.LIFE_ABILITY2}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>이동능력(교통)</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.LIFE_ABILITY3}">${view.LIFE_ABILITY3}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>의사소통</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.LIFE_ABILITY4}">${view.LIFE_ABILITY4}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>대인관계</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.LIFE_ABILITY5}">${view.LIFE_ABILITY5}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>자격 및 면허</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.LIFE_ABILITY6}">${view.LIFE_ABILITY6}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>기타</th>
										<td>
											<c:choose>
												<c:when test="${not empty view.LIFE_ABILITY7}">${view.LIFE_ABILITY7}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</td>
									</tr>						
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">취업욕구</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="15%" >
									<col width="25%" >
									<col width="20%" >
									<col width="30%" >
								</colgroup>
								<tbody>
									<tr>
										<th rowspan="2">희망직종</th>
										<th>직종</th>										
										<td>
											${view.SECTORS}																					
										</td>
										<th>응답</th>
										<td>				
											${view.RESPONSE} 																					
										</td>
									</tr>
									<tr>
										<th>사유</th>										
										<td>
											${view.REASON}																					
										</td>
										<th>성별</th>
										<td>
											${view.SEX}																												
										</td>
									</tr>
									<tr>
										<th rowspan="3">취업조건</th>
										<th>근무지역 1지</th>										
										<td>
											${view.AREA1_GUGUN} ${view.AREA1_DONGRI}
										</td>
										<th>희망임금</th>
										<td>
											월 <fmt:formatNumber value="${view.SALARY}" pattern="#,###.##"/> 만원											 																					
										</td>
									</tr>
									<tr>
										<th>근무지역 2지</th>										
										<td>
											${view.AREA2_GUGUN} ${view.AREA2_DONGRI}																				
										</td>
										<th>근무시간</th>
										<td>
											${view.SHOUR}:${view.SMINUTE} ~ ${view.EHOUR}${view.EMINUTE}																												
										</td>
									</tr>
									<tr>
										<th>고용형태</th>										
										<td>
											<c:choose>
												<c:when test="${not empty view.EMP}">${view.EMP}</c:when>
												<c:otherwise>-</c:otherwise>
											</c:choose>																					
										</td>
										<th>기숙여부</th>
										<td>
											<c:choose>
												<c:when test="${view.DORMITORY_YN eq 'Y'}">유</c:when>
												<c:otherwise>무</c:otherwise>
											</c:choose>
										</td>
									</tr>									
									<tr>
										<th colspan="2">자기소개</th>
										<td colspan="3">
											${view.VIEW_CONTENT1}																				
										</td>
									</tr>
									<tr>
										<th colspan="2">취업시 고려사항</th>
										<td colspan="3">
											${view.VIEW_CONTENT2}																				
										</td>
									</tr>									
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">상태정보</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="30%" >
									<col width="20%" >
									<col width="30%" >
								</colgroup>
								<tbody>
									<tr>
										<th>상태</th>
										<td colspan="3">
											${view.STATUS}
										</td>
									</tr>
								</tbody>
							</table>
			
			
			
				<div class="btn_right">
					<span class="button02" id="btnSearch" ><a href="javascript:goList();" >목록</a></span>
					<span class="button02" id="btnSearch" ><a href="javascript:goModify();" >수정하기</a></span>
					<span class="button02" id="btnSearch" ><a href="javascript:goDel();" >삭제하기</a></span>
				</div>
		</div>
</div>