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



function download(o, c, t){
	location.href='/download.do?filename='+encodeURI(o)+'&refilename='+c+'&path='+t;
}

function del(url){
	if(confirm('삭제하시겠습니까?')){
		location.href = url;	
	}
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
            	$(this).css('height', 'auto');
            }				
		});
	}
	
});

</script>
<style>
.Tcon img {
	max-width: 100% !important;
	height: auto !important;
}
</style>
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
		
		<div class="conBox">
			<table class="tbv" border="0" cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="10%" />
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th><label for="SUBJECT">제목</label></th>
						<td colspan="2">
							${view.TITLE } 
						</td>
					</tr>
					<tr>
						<th><label for="IMAGE">이미지</label></th>
						<td colspan="2" style="text-align:left;">
							<img src="/upload/data/${view.FILENAME}" style="width: 200px; height: auto;">
						</td>
					</tr>
					<%-- <tr>
						<th><label for="WIDTH_HEIGTH">팝업 크기</label></th>
						<td colspan="2" style="text-align:left;">
							가로: ${view.WIDTH}
							<br>
							새로: ${view.HEIGHT}
						</td>
					</tr>
					<tr>
						<th><label for="TOP_LEFT">여백 설정</label></th>
						<td colspan="2" style="text-align:left;">
							좌측: ${view.LEFT}
							<br>
							상단: ${view.TOP }
						</td>
					</tr> --%>
					<tr>
						<th><label for="LINK">링크</label></th>
						<td colspan="2">
							<a href="${view.LINK}" target="_blank"">${view.LINK}</a>
						</td>
					</tr>
					<tr>
						<th><label for="GESI_DATE">게시 일정</label></th>
						<td colspan="2">
							<fmt:formatDate value="${view.GESI_SD}" pattern="yyyy-MM-dd" />
							~
							<fmt:formatDate value="${view.GESI_ED}" pattern="yyyy-MM-dd" /> 
						</td>
					</tr>
					<tr>
						<th><label for="SORT">우선순위</label></th>
						<td colspan="2">
							${view.SORT}
						</td>
					</tr>
					<%-- <tr>
						<th><label for="LINK">차단 구분</label></th>
						<td colspan="2">
							<c:if test="${view.BLOCK_GUBUN eq 'TODAY'}">
								하루 동안 열지 않음
							</c:if>
							<c:if test="${view.BLOCK_GUBUN eq 'NEVER'}">
								계속 열지 않음
							</c:if>							
						</td>
					</tr>
					<tr>
						<th><label for="LINK_WINDOW">링크 형식</label></th>
						<td colspan="2">
							<c:if test="${view.LINK_WINDOW eq '_blank'}">
								새 창
							</c:if>
							<c:if test="${view.LINK_WINDOW eq '_self'}">
								현재 창
							</c:if>
						</td>
					</tr> --%>
					<tr>
						<th><label for="USE_YN">노출여부</label></th>
						<td colspan="2">
							<c:if test="${view.USE_YN eq 'Y'}">
								게시
							</c:if>
							<c:if test="${view.USE_YN eq 'N'}">
								게시
							</c:if>
						</td>
					</tr>
					<tr>
						<th><label for="REG_DATE">등록일</label></th>
						<td colspan="2">
							<fmt:formatDate value="${view.REG_DATE}" pattern="yyyy-MM-dd" />   
						</td>
					</tr>
					<tr>
						<th><label for="VIDEO">동영상</label></th>
						<td colspan="2" style="text-align:left;">
							${view.VIDEOOFILENAME ne null ? view.VIDEOOFILENAME : ''} 
						</td>
					</tr>
				</tbody>
			</table>
				<div class="btn_right">
					<span class="button02" id="btnSearch" ><a href="/admin/${bean.menuno}/${bean.board_name}/board_list.do?page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${!empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>" >목록</a></span>
					
					<span class="button02" id="btnSearch" ><a href="/admin/${bean.menuno}/${bean.board_name}/board_modify.do?seq=${view.SEQ}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>" >수정하기</a></span>
					<span class="button02" id="btnSearch" ><a href="/admin/${bean.menuno}/${bean.board_name}/board_delete.do?seq=${view.SEQ}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>"  onclick="del(this.href); return false;">삭제하기</a></span>
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



function download(o, c, t){
	location.href='/download.do?filename='+encodeURI(o)+'&refilename='+c+'&path='+t;
}

function del(url){
	if(confirm('삭제하시겠습니까?')){
		location.href = url;	
	}
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
            	$(this).css('height', 'auto');
            }				
		});
	}
	
});

</script>
<style>
.Tcon img {
	max-width: 100% !important;
	height: auto !important;
}
</style>
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
		
		<div class="conBox">
			<table class="tbv" border="0" cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="10%" />
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th><label for="SUBJECT">제목</label></th>
						<td colspan="2">
							${view.TITLE } 
						</td>
					</tr>
					<tr>
						<th><label for="IMAGE">이미지</label></th>
						<td colspan="2" style="text-align:left;">
							<img src="/upload/data/${view.FILENAME}" style="width: 200px; height: auto;">
						</td>
					</tr>
					<%-- <tr>
						<th><label for="WIDTH_HEIGTH">팝업 크기</label></th>
						<td colspan="2" style="text-align:left;">
							가로: ${view.WIDTH}
							<br>
							새로: ${view.HEIGHT}
						</td>
					</tr>
					<tr>
						<th><label for="TOP_LEFT">여백 설정</label></th>
						<td colspan="2" style="text-align:left;">
							좌측: ${view.LEFT}
							<br>
							상단: ${view.TOP }
						</td>
					</tr> --%>
					<tr>
						<th><label for="LINK">링크</label></th>
						<td colspan="2">
							<a href="${view.LINK}" target="_blank"">${view.LINK}</a>
						</td>
					</tr>
					<tr>
						<th><label for="GESI_DATE">게시 일정</label></th>
						<td colspan="2">
							<fmt:formatDate value="${view.GESI_SD}" pattern="yyyy-MM-dd" />
							~
							<fmt:formatDate value="${view.GESI_ED}" pattern="yyyy-MM-dd" /> 
						</td>
					</tr>
					<tr>
						<th><label for="SORT">우선순위</label></th>
						<td colspan="2">
							${view.SORT}
						</td>
					</tr>
					<%-- <tr>
						<th><label for="LINK">차단 구분</label></th>
						<td colspan="2">
							<c:if test="${view.BLOCK_GUBUN eq 'TODAY'}">
								하루 동안 열지 않음
							</c:if>
							<c:if test="${view.BLOCK_GUBUN eq 'NEVER'}">
								계속 열지 않음
							</c:if>							
						</td>
					</tr>
					<tr>
						<th><label for="LINK_WINDOW">링크 형식</label></th>
						<td colspan="2">
							<c:if test="${view.LINK_WINDOW eq '_blank'}">
								새 창
							</c:if>
							<c:if test="${view.LINK_WINDOW eq '_self'}">
								현재 창
							</c:if>
						</td>
					</tr> --%>
					<tr>
						<th><label for="USE_YN">노출여부</label></th>
						<td colspan="2">
							<c:if test="${view.USE_YN eq 'Y'}">
								게시
							</c:if>
							<c:if test="${view.USE_YN eq 'N'}">
								게시
							</c:if>
						</td>
					</tr>
					<tr>
						<th><label for="REG_DATE">등록일</label></th>
						<td colspan="2">
							<fmt:formatDate value="${view.REG_DATE}" pattern="yyyy-MM-dd" />   
						</td>
					</tr>
					<tr>
						<th><label for="VIDEO">동영상</label></th>
						<td colspan="2" style="text-align:left;">
							${view.VIDEOOFILENAME ne null ? view.VIDEOOFILENAME : ''} 
						</td>
					</tr>
				</tbody>
			</table>
				<div class="btn_right">
					<span class="button02" id="btnSearch" ><a href="/admin/${bean.menuno}/${bean.board_name}/board_list.do?page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${!empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>" >목록</a></span>
					
					<span class="button02" id="btnSearch" ><a href="/admin/${bean.menuno}/${bean.board_name}/board_modify.do?seq=${view.SEQ}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>" >수정하기</a></span>
					<span class="button02" id="btnSearch" ><a href="/admin/${bean.menuno}/${bean.board_name}/board_delete.do?seq=${view.SEQ}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>"  onclick="del(this.href); return false;">삭제하기</a></span>
				</div>
		</div>
>>>>>>> refs/heads/202204
</div>