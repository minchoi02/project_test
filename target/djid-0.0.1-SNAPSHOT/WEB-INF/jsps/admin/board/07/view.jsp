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
					<col width="15%" />
					<col width="13%" />
					<col width="10%" />
					<col width="10%" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>제목</th>
						<td colspan="4"><strong>${view.TITLE}</strong></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>장소</td>
						<td colspan="4">${view.PLACE}</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td><fmt:formatDate value="${view.REG_DATE}" pattern="yyyy/MM/dd" /></td>
						<td>조회수</td>
						<td>${view.HIT }</td>
						<td></td>
					</tr>
					<tr>
						<td>
							일정
						</td>
						<td colspan="4" class="al"> 
							<fmt:formatDate value="${view.SDATE}" pattern="yyyy/MM/dd" />
							 ~  
							<fmt:formatDate value="${view.EDATE}" pattern="yyyy/MM/dd" /> 
						</td>
					</tr>
					<tr>
						<td colspan="5" class="Tcon">
							<c:choose>
								<c:when test="${!empty file_list }">
									<c:forEach var="flist" items="${file_list }" varStatus="status">
										<c:if test="${flist.TYPE == 'movie'}">
											<video src="/upload${flist.PATH}${flist.REFILENAME}" width="900px" height="600px" controls="controls">
												<!-- <source src="video.mp4" type="video/mp4" />
											    <source src="video.m4v" type="video/m4v" />
											    <source src="video.3gp" type="video/3gpp" />
											    <source src="video.wmv" type="video/x-ms-wmv" />																							 -->
											</video>
										</c:if>
									</c:forEach>
								</c:when>
							</c:choose>
							<br>
							${view.CONTENT}
						</td>
					</tr>
				</tbody>
			</table>
				<div class="btn_right">
					<span class="button02" id="btnSearch" ><a href="/admin/${bean.menuno}/${bean.board_name}/board_list.do?page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${!empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>" >목록</a></span>
					<%-- <span class="button02" id="btnSearch" ><a href="write?page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${!empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.encodeSV}</c:if>" >글쓰기</a></span> --%>
					<span class="button02" id="btnSearch" ><a href="/admin/${bean.menuno}/${bean.board_name}/board_modify.do?seq=${view.SEQ}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>" >수정하기</a></span>
					<span class="button02" id="btnSearch" ><a href="/admin/${bean.menuno}/${bean.board_name}/board_delete.do?seq=${view.SEQ}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>"  onclick="del(this.href); return false;">삭제하기</a></span>
				</div>
		</div>
</div>