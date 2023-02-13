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
	function goModify() {
		var $f = $("#frm");
		if($("#start_time").val().length != 4) {
			alert("시작시간을 정확히 입력해주세요.");
			return false;
		} 
		if($("#end_time").val().length != 4) {
			alert("종료시간을 정확히 입력해주세요.");
			return false;
		} 
		$f.submit();
	}
</script>

<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>

		<div class="conBox">
			<form name="frm" id="frm" method="post" action="/admin/chat/update.do" enctype="multipart/form-data" accept-charset="utf-8">
				<table class="tbv" style="margin-top: 10px;" summary="글입력하기">
					<caption> 등록</caption>
					<colgroup>
						<col width="35%">
						<col width="65%">
					</colgroup>
					<tbody>
						<tr>
							<th>상담상태</th>
							<td>
								<select name="chat_use">
									<option value="Y" <c:if test="${chatConf.CHAT_USE eq 'Y'}">selected</c:if>>상담중</option>
									<option value="N" <c:if test="${chatConf.CHAT_USE eq 'N'}">selected</c:if>>상담종료</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>시작시간</th>
							<td>
								<input type="text" name="start_time" id="start_time" value="${chatConf.STARTTIME }" style="width: 200px;">
								(예 : 오전 10시 - 1000, 오후 2시 - 1400)
							</td>
						</tr>
						<tr>
							<th>종료시간</th>
							<td>
								<input type="text" name="end_time" id="end_time" value="${chatConf.ENDTIME }" style="width: 200px;">
								(예 : 오전 10시 - 1000, 오후 2시 - 1400)
							</td>
						</tr>
					</tbody>
				</table>
				
			</form>

			<div class="btn_right">
				<span class="button02" id="btnSearch" ><a href="javascript:goModify();" >수정하기</a></span>
			</div>
		</div>
</div>