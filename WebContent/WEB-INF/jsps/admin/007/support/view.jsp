<<<<<<< HEAD
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

	<input type="hidden" name="search_title" id="search_title" value="${bean.search_title}" />
	<input type="hidden" name="search_value" id="search_value" value="${bean.search_value}" />
</form>

<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
		
		<div class="conBox">	
			
			<table  class="tbv" style="margin-top: 10px;"  summary="글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="30%" >
									<col width="20%" >
									<col width="30%" >
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											${view.NAME} 
										</td>
										<th>성별</th>
										<td>
											${view.SEX } 
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td>
											${view.TEL1}-${view.TEL2}-${view.TEL3} 
										</td>
										<th>생년월일</th>
										<td>
											${view.BIRTH_YEAR}년 ${view.BIRTH_MONTH}월 ${view.BIRTH_DAY}일																					
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td colspan="3">
											 ${view.EMAIL1}@${view.EMAIL2}
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3">
											(${view.ZIP_CD}) ${view.ADDR1} ${view.ADDR2}				 
										</td>
									</tr>
									<tr>
										<th>후원방식</th>
										<td colspan="3">
											${view.SUPPORT_KIND}  
										</td>
									</tr>
									<tr>
										<th>후원금액</th>
										<td colspan="3">
											<fmt:formatNumber value="${view.SUPPORT_PRICE}" pattern="#,###.##"/> 원
										</td>
									</tr>
									<tr <c:if test="${view.SUPPORT_KIND eq '계좌이체'}">style="display: none;"</c:if>>
										<th>이체일자</th>
										<td colspan="3">
											${view.SUPPORT_TRANSFER_DAY}
										</td>
									</tr>
									<tr <c:if test="${view.SUPPORT_KIND eq '계좌이체'}">style="display: none;"</c:if>>
										<th>주민등록번호</th>
										<td colspan="3">
											${view.REG_NO1}-*******
										</td>
									</tr>
									<tr>
										<th>후원동기</th>
										<td colspan="3">
											<c:choose>
												<c:when test="${fn:contains(MOTIVE_LIST, '기타')}">
													${MOTIVE_LIST}(${view.ETC})
												</c:when>
												<c:otherwise>
													${MOTIVE_LIST}
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>하고싶은말</th>
										<td colspan="3">
											${view.VIEW_CONTENT}
										</td>
									</tr>
								</tbody>
							</table>
				<div class="btn_right">
					<span class="button02" id="btnSearch" ><a href="javascript:goList();" >목록</a></span>
					<span class="button02" id="btnSearch" ><a href="javascript:goModify();" >수정하기</a></span>
					<span class="button02" id="btnSearch" ><a href="javascript:goDel();" >삭제</a></span>
				</div>
		</div>
=======
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

	<input type="hidden" name="search_title" id="search_title" value="${bean.search_title}" />
	<input type="hidden" name="search_value" id="search_value" value="${bean.search_value}" />
</form>

<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
		
		<div class="conBox">	
			
			<table  class="tbv" style="margin-top: 10px;"  summary="글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="20%" >
									<col width="30%" >
									<col width="20%" >
									<col width="30%" >
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											${view.NAME} 
										</td>
										<th>성별</th>
										<td>
											${view.SEX } 
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td>
											${view.TEL1}-${view.TEL2}-${view.TEL3} 
										</td>
										<th>생년월일</th>
										<td>
											${view.BIRTH_YEAR}년 ${view.BIRTH_MONTH}월 ${view.BIRTH_DAY}일																					
										</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td colspan="3">
											 ${view.EMAIL1}@${view.EMAIL2}
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3">
											(${view.ZIP_CD}) ${view.ADDR1} ${view.ADDR2}				 
										</td>
									</tr>
									<tr>
										<th>후원방식</th>
										<td colspan="3">
											${view.SUPPORT_KIND}  
										</td>
									</tr>
									<tr>
										<th>후원금액</th>
										<td colspan="3">
											<fmt:formatNumber value="${view.SUPPORT_PRICE}" pattern="#,###.##"/> 원
										</td>
									</tr>
									<tr <c:if test="${view.SUPPORT_KIND eq '계좌이체'}">style="display: none;"</c:if>>
										<th>이체일자</th>
										<td colspan="3">
											${view.SUPPORT_TRANSFER_DAY}
										</td>
									</tr>
									<tr <c:if test="${view.SUPPORT_KIND eq '계좌이체'}">style="display: none;"</c:if>>
										<th>주민등록번호</th>
										<td colspan="3">
											${view.REG_NO1}-*******
										</td>
									</tr>
									<tr>
										<th>후원동기</th>
										<td colspan="3">
											<c:choose>
												<c:when test="${fn:contains(MOTIVE_LIST, '기타')}">
													${MOTIVE_LIST}(${view.ETC})
												</c:when>
												<c:otherwise>
													${MOTIVE_LIST}
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>하고싶은말</th>
										<td colspan="3">
											${view.VIEW_CONTENT}
										</td>
									</tr>
								</tbody>
							</table>
				<div class="btn_right">
					<span class="button02" id="btnSearch" ><a href="javascript:goList();" >목록</a></span>
					<span class="button02" id="btnSearch" ><a href="javascript:goModify();" >수정하기</a></span>
					<span class="button02" id="btnSearch" ><a href="javascript:goDel();" >삭제</a></span>
				</div>
		</div>
>>>>>>> refs/heads/202204
</div>