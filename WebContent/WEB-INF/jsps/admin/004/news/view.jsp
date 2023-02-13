<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script type="text/javascript">

function goList(){
	$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/list.do");
	$("#frm").submit();
}

function goUpdate(){
	
	var thum_img = $("#thum_img").val();
	var thum_alt = $("#thum_alt").val();
	
	if(thum_alt == ""){
		alert("썸네일 대체어를 입력해주세요.");
		return;
	}
	
	if(confirm("수정하시겠습니까?")){
		$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/thum_update.do");
		$("#frm").submit();	
	}
	
}

function goDefaultThum(){
	if(confirm("썸네일을 기본값으로 변경하시겠습니까?")){
		$("#frm").prop("action", "/admin/004/news/thum_default_update.do");
		$("#frm").submit();
	}
}

$(document).ready(function(){
		
});

</script>
<form id="frm" name="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/list.do" enctype="multipart/form-data" accept-charset="utf-8">
	<input type="hidden" name="page" id="page" value="${bean.page}" />
	<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
	
	<input type="hidden" name="seq" id="seq" value="${bean.seq}" />

	<input type="hidden" name="search_title" id="search_title" value="${bean.search_title}" />
	<input type="hidden" name="search_value" id="search_value" value="${bean.search_value}" />


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
						<th>기사 제목</th>
						<td>
							${view.TITLE} 
						</td>
					</tr>
					<tr>
						<th>기사 본문</th>
						<td>
							${view.DESCRIPTION} 
						</td>
					</tr>
					<tr>
						<th>기사 링크</th>
						<td>
							<a href="${view.LINK}" target="_blank">${view.LINK}</a> 
						</td>
					</tr>
					<tr>
						<th>등록 일시</th>
						<td>
							<fmt:formatDate value="${view.PUB_DATE}" pattern="yyyy-MM-dd hh:mm:ss" />
						</td>
					</tr>
					<tr>
						<th>썸네일</th>
						<td>
							<img src="${view.THUM_IMG}" alt="${view.THUM_ALT}" style="width: 180px; height: 122px;" onerror="this.src='/assets/user/images/new_default.png'" /> 
						</td>
					</tr>
					<tr>
						<th>썸네일 수정</th>
						<td>
							<input type="file" name="thum_img" id="thum_img" /> 
							<c:if test="${fn:indexOf(view.THUM_IMG, 'new_default.png') == -1}">
								<span class="button02" id="btnSearch" ><a href="javascript:goDefaultThum();" >썸네일을 기본값으로 변경</a></span>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>썸네일 대체어</th>
						<td>
							<input type="text" name="thum_alt" id="thum_alt" style="width: 100%;" value="${view.THUM_ALT}"/>
						</td>
					</tr>
				</tbody>
			</table>
				<div class="btn_right">
					<span class="button02" id="btnSearch" ><a href="javascript:goUpdate();" >수정완료</a></span>
					<span class="button02" id="btnSearch" ><a href="javascript:goList();" >목록</a></span>
				</div>
		</div>
</div>

=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script type="text/javascript">

function goList(){
	$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/list.do");
	$("#frm").submit();
}

function goUpdate(){
	
	var thum_img = $("#thum_img").val();
	var thum_alt = $("#thum_alt").val();
	
	if(thum_alt == ""){
		alert("썸네일 대체어를 입력해주세요.");
		return;
	}
	
	if(confirm("수정하시겠습니까?")){
		$("#frm").attr("action", "/admin/${bean.menuno}/${bean.board_name}/thum_update.do");
		$("#frm").submit();	
	}
	
}

function goDefaultThum(){
	if(confirm("썸네일을 기본값으로 변경하시겠습니까?")){
		$("#frm").prop("action", "/admin/004/news/thum_default_update.do");
		$("#frm").submit();
	}
}

$(document).ready(function(){
		
});

</script>
<form id="frm" name="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/list.do" enctype="multipart/form-data" accept-charset="utf-8">
	<input type="hidden" name="page" id="page" value="${bean.page}" />
	<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
	
	<input type="hidden" name="seq" id="seq" value="${bean.seq}" />

	<input type="hidden" name="search_title" id="search_title" value="${bean.search_title}" />
	<input type="hidden" name="search_value" id="search_value" value="${bean.search_value}" />


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
						<th>기사 제목</th>
						<td>
							${view.TITLE} 
						</td>
					</tr>
					<tr>
						<th>기사 본문</th>
						<td>
							${view.DESCRIPTION} 
						</td>
					</tr>
					<tr>
						<th>기사 링크</th>
						<td>
							<a href="${view.LINK}" target="_blank">${view.LINK}</a> 
						</td>
					</tr>
					<tr>
						<th>등록 일시</th>
						<td>
							<fmt:formatDate value="${view.PUB_DATE}" pattern="yyyy-MM-dd hh:mm:ss" />
						</td>
					</tr>
					<tr>
						<th>썸네일</th>
						<td>
							<img src="${view.THUM_IMG}" alt="${view.THUM_ALT}" style="width: 180px; height: 122px;" onerror="this.src='/assets/user/images/new_default.png'" /> 
						</td>
					</tr>
					<tr>
						<th>썸네일 수정</th>
						<td>
							<input type="file" name="thum_img" id="thum_img" /> 
							<c:if test="${fn:indexOf(view.THUM_IMG, 'new_default.png') == -1}">
								<span class="button02" id="btnSearch" ><a href="javascript:goDefaultThum();" >썸네일을 기본값으로 변경</a></span>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>썸네일 대체어</th>
						<td>
							<input type="text" name="thum_alt" id="thum_alt" style="width: 100%;" value="${view.THUM_ALT}"/>
						</td>
					</tr>
				</tbody>
			</table>
				<div class="btn_right">
					<span class="button02" id="btnSearch" ><a href="javascript:goUpdate();" >수정완료</a></span>
					<span class="button02" id="btnSearch" ><a href="javascript:goList();" >목록</a></span>
				</div>
		</div>
</div>

>>>>>>> refs/heads/202204
</form>