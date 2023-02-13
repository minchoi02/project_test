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
	
			<table class="tbv" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
				<colgroup>
					<col width="20%" >
					<col width="80%" >
				</colgroup>
				<tbody>
					<tr>
						<th>지역</th>
						<td>
							${view.AREA} 
						</td>
					</tr>
					<tr>
						<th>구분</th>
						<td>
							${view.KIND_STR} 
						</td>
					</tr>
					<tr>
						<th>시설유형</th>
						<td>
							${view.KIND} 
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<c:choose>
								<c:when test="${not empty view.TEL1}">
									${view.TEL1}-${view.TEL2}-${view.TEL3}
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>팩스번호</th>
						<td>
							<c:choose>
								<c:when test="${not empty view.FAX1}">
									${view.FAX1}-${view.FAX2}-${view.FAX3}
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>(${view.ZIP_CD})${view.ADDR1} ${view.ADDR2}</td>
					</tr>
					<tr>
						<th>좌표</th>
						<td>
							<c:choose>
								<c:when test="${not empty view.LAT}">
									${view.LAT}, ${view.LON}
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>홈페이지</th>
						<td>
							<c:choose>
								<c:when test="${not empty view.DOMAIN}">
									${view.DOMAIN}
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>시설 이미지</th>
						<td>
							<c:if test="${not empty view.IMG1}">
								<img src="/upload${view.IMG1}" style="width: 243px; height: 137px;"/>
							</c:if>
							<c:if test="${not empty view.IMG2}">
								<img src="/upload${view.IMG2}" style="width: 243px; height: 137px;"/>
							</c:if>
							<c:if test="${not empty view.IMG3}">
								<img src="/upload${view.IMG3}" style="width: 243px; height: 137px;"/>
							</c:if>
							<c:if test="${empty view.IMG1 and empty view.IMG2 and empty view.IMG3}">
								-
							</c:if>
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
	
			<table class="tbv" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
				<colgroup>
					<col width="20%" >
					<col width="80%" >
				</colgroup>
				<tbody>
					<tr>
						<th>지역</th>
						<td>
							${view.AREA} 
						</td>
					</tr>
					<tr>
						<th>구분</th>
						<td>
							${view.KIND_STR} 
						</td>
					</tr>
					<tr>
						<th>시설유형</th>
						<td>
							${view.KIND} 
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<c:choose>
								<c:when test="${not empty view.TEL1}">
									${view.TEL1}-${view.TEL2}-${view.TEL3}
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>팩스번호</th>
						<td>
							<c:choose>
								<c:when test="${not empty view.FAX1}">
									${view.FAX1}-${view.FAX2}-${view.FAX3}
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>(${view.ZIP_CD})${view.ADDR1} ${view.ADDR2}</td>
					</tr>
					<tr>
						<th>좌표</th>
						<td>
							<c:choose>
								<c:when test="${not empty view.LAT}">
									${view.LAT}, ${view.LON}
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>홈페이지</th>
						<td>
							<c:choose>
								<c:when test="${not empty view.DOMAIN}">
									${view.DOMAIN}
								</c:when>
								<c:otherwise>
									-
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>시설 이미지</th>
						<td>
							<c:if test="${not empty view.IMG1}">
								<img src="/upload${view.IMG1}" style="width: 243px; height: 137px;"/>
							</c:if>
							<c:if test="${not empty view.IMG2}">
								<img src="/upload${view.IMG2}" style="width: 243px; height: 137px;"/>
							</c:if>
							<c:if test="${not empty view.IMG3}">
								<img src="/upload${view.IMG3}" style="width: 243px; height: 137px;"/>
							</c:if>
							<c:if test="${empty view.IMG1 and empty view.IMG2 and empty view.IMG3}">
								-
							</c:if>
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
>>>>>>> refs/heads/202204
</div>