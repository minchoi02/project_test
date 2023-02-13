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

	<input type="hidden" name="search_title" id="search_title" value="${bean.search_title}" />
	<input type="hidden" name="search_value" id="search_value" value="${bean.search_value}" />
</form>

<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
		
		<div class="conBox">	
			
			<table class="tbv" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
				<colgroup>
					<col width="15%" >
					<col width="85%" >
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							${view.ID } 
						</td>
					</tr>					
					<tr>
						<th>이름</th>
						<td>
							${view.NAME} 
						</td>
					</tr>
					<tr>
						<th>권한</th>
						<td>
							<c:choose>
								<c:when test="${view.GRADE eq 'A'}">슈퍼관리자</c:when>
								<c:otherwise>관리자</c:otherwise>
							</c:choose> 
						</td>
					</tr>
					<c:if test="${view.GRADE != 'A'}">
					<tr>
						<th>메뉴권한</th>
						<td> 
							<c:forEach var="list" items="${selType29List}" varStatus="status">
								<label for="menu_${status.count}">
									<input type="checkbox" name="menu" class="menu" id="menu_${status.count}" value="${list.SEQ}" disabled="disabled" <c:if test="${fn:contains(view.MENU, list.SEQ)}">checked="checked"</c:if> /> ${list.CODE_DESC}
								</label>
								<c:if test="${status.count == 4}"><br/></c:if>
							</c:forEach> 
						</td>
					</tr>
					</c:if>
					<tr>
						<th>메모</th>
						<td>
							<c:choose>
								<c:when test="${empty view.MEMO}">-</c:when>
								<c:otherwise>${view.MEMO}</c:otherwise>
							</c:choose> 
						</td>
					</tr>
					<tr>
						<th>가입일시</th>
						<td>
							<fmt:formatDate value="${view.REG_DATE}" pattern="yyyy-MM-dd hh:mm:ss" />
						</td>
					</tr>
				</tbody>
			</table>
				<c:if test="${view.GRADE != 'A'}">
					<div class="btn_right">
						<span class="button02" id="btnSearch" ><a href="javascript:goList();" >목록</a></span>
						<span class="button02" id="btnSearch" ><a href="javascript:goModify();" >수정하기</a></span>
						<span class="button02" id="btnSearch" ><a href="javascript:goDel();" >탈퇴처리</a></span>
					</div>
				</c:if>
		</div>
</div>