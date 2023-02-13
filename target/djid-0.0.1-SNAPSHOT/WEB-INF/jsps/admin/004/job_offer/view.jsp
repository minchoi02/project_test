<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<%
	pageContext.setAttribute("crlf", "\n");
%>
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
	
							<div style="width:1016px;margin:0 auto;margin-top:25px;">구인제목</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
										<th>구인제목</th>
										<td>
											${view.TITLE}																					
										</td>
									</tr>
									<tr>
										<th>모집기간</th>
										<td>
											<fmt:formatDate value="${view.SDATE}" pattern="yyyy-MM-dd" />
											~
											<fmt:formatDate value="${view.EDATE}" pattern="yyyy-MM-dd" />
										</td>
									</tr>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">구인내용</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
										<th>구인유형</th>
										<td>
											${view.TYPE}																		
										</td>
									</tr>
									<tr>
										<th>고용형태</th>
										<td>
											${view.EMP} 
											<c:if test="${not empty view.EMP_INT}">(수습: ${view.EMP_INT}개월)</c:if>
										</td>
									</tr>
									<tr>
										<th>모집인원</th>
										<td>
											${view.SEX} 
											<c:if test="${not empty view.SEX_CNT}">(인원: ${view.SEX_CNT}명)</c:if>
										</td>
									</tr>
									<tr>
										<th>직종</th>
										<td>
											${view.JOB_FAMILY}
										</td>
									</tr>
									<tr>
										<th>업무상세내용</th>
										<td>
											${view.VIEW_CONTENT}
										</td>
									</tr>
									<tr>
										<th>연령</th>
										<td>
											${view.AGE_STR} 
											<c:if test="${not empty view.AGE_INT and view.AGE_STR eq '연령제한'}">(제한: ${view.AGE_INT})</c:if>
										</td>
									</tr>
									<tr>
										<th>혼인</th>
										<td>
											${view.MARRY}
										</td>
									</tr>
									<tr>
										<th>학력</th>
										<td>
											${view.EDU}
										</td>
									</tr>
									<tr>
										<th>우대자격증</th>
										<td>
											${view.CERT}
										</td>
									</tr>
									<tr>
										<th>제출서류</th>
										<td>
											<c:if test="${view.DOCUMENT1_YN eq 'Y'}">
											[이력서] 
											</c:if>
											<c:if test="${view.DOCUMENT2_YN eq 'Y'}">
											[자기소개서] 
											</c:if>
											<c:if test="${view.DOCUMENT3_YN eq 'Y'}">
											[성적증명서] 
											</c:if>
											<c:if test="${view.DOCUMENT4_YN eq 'Y'}">
											[졸업증명서] 
											</c:if>
											<c:if test="${view.DOCUMENT5_YN eq 'Y'}">
											[주민등록등본] 
											</c:if>
											<c:if test="${view.DOCUMENT6_YN eq 'Y'}">
											[기타: ${view.DOCUMENT_ETC}] 
											</c:if>
											<c:if test="${view.DOCUMENT1_YN ne 'Y' && view.DOCUMENT2_YN ne 'Y' && view.DOCUMENT3_YN ne 'Y' && view.DOCUMENT4_YN ne 'Y' && view.DOCUMENT5_YN ne 'Y' && view.DOCUMENT6_YN ne 'Y'}">
											없음
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">근로조건</div>
							<div style="width:1016px;border-bottom:1px solid #ccc;margin:0 auto;margin-top:3px;"></div>
							<table  class="tbv"  summary="공지사항 글입력하기" style="margin-top: 10px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="90%" >
								</colgroup>
								<tbody>
									<tr>
										<th>근무시간</th>
										<td>
											${view.SHOUR}:${view.SMINUTE} ~ ${view.EHOUR}:${view.EMINUTE}																
										</td>
									</tr>
									<tr>
										<th>급여</th>
										<td>
											${view.SALARY_KIND} 
											<c:if test="${not empty view.SALARY}">(<fmt:formatNumber value="${view.SALARY}" pattern="\#,###.##"/>원)</c:if>
										</td>
									</tr>
									<tr>
										<th>근무지역</th>
										<td>
											대전시 ${view.GUGUN} ${view.DONGRI}
										</td>
									</tr>
									<tr>
										<th>식사제공</th>
										<td>
											<c:if test="${view.EAT1_YN eq 'Y'}">
											[조식] 
											</c:if>
											<c:if test="${view.EAT2_YN eq 'Y'}">
											[중식] 
											</c:if>
											<c:if test="${view.EAT3_YN eq 'Y'}">
											[석식] 
											</c:if>
											<c:if test="${view.EAT1_YN ne 'Y' && view.EAT2_YN ne 'Y' && view.EAT3_YN ne 'Y'}">
											없음
											</c:if>
										</td>
									</tr>
									<tr>
										<th>기숙사</th>
										<td>
											<c:if test="${view.DORMITORY_YN eq 'Y'}">
											유
											</c:if>
											<c:if test="${view.DORMITORY_YN ne 'Y'}">
											무
											</c:if>
										</td>
									</tr>
									<tr>
										<th>퇴직금</th>
										<td>
											<c:if test="${view.SERVERANCEPAY_YN eq 'Y'}">
											유
											</c:if>
											<c:if test="${view.SERVERANCEPAY_YN ne 'Y'}">
											무
											</c:if>
										</td>
									</tr>
									<tr>
										<th>4대보험</th>
										<td>
											<c:if test="${view.INSURANCE1_YN eq 'Y'}">
											[산재보험] 
											</c:if>
											<c:if test="${view.INSURANCE2_YN eq 'Y'}">
											[고용보험] 
											</c:if>
											<c:if test="${view.INSURANCE3_YN eq 'Y'}">
											[건강보험] 
											</c:if>
											<c:if test="${view.INSURANCE4_YN eq 'Y'}">
											[국민연금] 
											</c:if>
											<c:if test="${view.INSURANCE1_YN ne 'Y' && view.INSURANCE2_YN ne 'Y' && view.INSURANCE3_YN ne 'Y' && view.INSURANCE4_YN ne 'Y'}">
											없음
											</c:if>
										</td>
									</tr>									
								</tbody>
							</table>
							
							<div style="width:1016px;margin:0 auto;margin-top:25px;">업체정보</div>
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
										<th>업체명</th>
										<td>${view.COMPANY_NAME}</td>
										<th>대표자명</th>
										<td>${view.COMPANY_CEO_NAME}</td>
									</tr>
									<tr>
										<th>사업자등록번호</th>
										<td>${view.COMPANY_NUMBER}</td>
										<th>홈페이지</th>
										<td>${view.COMPANY_DOMAIN}</td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td>
											${view.COMPANY_TEL}
										</td>
										<th>팩스</th>
										<td>
											${view.COMPANY_FAX}
										</td>
									</tr>
									<tr>
										<th>업종</th>
										<td>${view.COMPANY_SECTORS}</td>
										<th>생산품</th>
										<td>${view.COMPANY_PRODUCT}</td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3">
											<c:if test="${not empty view.ZIP_CD and not empty view.ADDR1}">
											(${view.ZIP_CD}) ${view.ADDR1}
											</c:if>
											${view.ADDR2}											 											
										</td>
									</tr>
									<tr>
										<th>근로자수</th>
										<td colspan="3">
											<c:if test="${not empty view.PERSON1}">
												남자: ${view.PERSON1}명
											</c:if>
											<c:if test="${not empty view.PERSON2}">
												여자: ${view.PERSON2}명
											</c:if>											 											
										</td>
									</tr>
									<tr>
										<th>담당자명</th>
										<td>${view.MANAGER_NAME}</td>
										<th>연락처</th>
										<td>
											${view.MANAGER_TEL}											 											
										</td>
									</tr>
									<tr>
										<th>장애인 고용현황</th>
										<td colspan="3">
											<c:if test="${view.DISABLES_EMP_YN eq 'Y'}">
											유
											</c:if>
											<c:if test="${view.DISABLES_EMP_YN ne 'Y'}">
											무
											</c:if>
											<c:if test="${view.DISABLES_EMP_YN eq 'Y'}">(인원: ${view.DISABLES_EMP}명)</c:if>
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