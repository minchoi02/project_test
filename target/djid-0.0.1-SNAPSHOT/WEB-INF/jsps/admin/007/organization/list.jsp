<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

$(document).ready(function(){


	
});

function goView(seq){
	
	$("#seq").val(seq);
	$("#frm").attr("action", "/admin/007/organization/view.do");
	$("#frm").submit();
}

</script>
<div id="contents_bg">
	
		<div class="con_tit">
			${menu.menuname}
		</div>
 
		<div class="conBox">
			
					<table border="0" style="width:100%;margin-top:10px;">
						<tr valign="top">
							<td align="center" id="list_area_td">
								<div id="list_area_div">
									<table style="width: 95%;">
										<colgroup>
											<col width="100%" />
										</colgroup>
										<tr>
											<td align="left">총 :  ${cnt} 개</td>
										</tr>
									</table>
									<form action="/admin/${bean.menuno}/${bean.board_name}/insert.do" name="frm" id="frm" method="post">
									<input type="hidden" name="page" id="page" value="${bean.page}" />
									<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
									
									<input type="hidden" name="seq" id="seq" value="" />
									
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="15%" />
											<col width="65%" />
											<col width="20%" />
										</colgroup>
										<thead>
											<tr>
												<th>번호</th>
												<th>조직도</th>
												<th>상세보기</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}" varStatus="status">
													<tr>
            											<td>${status.count}</td>
            											<td>${list.GUBUN}</td>
            											<td><span class="button01"><a href="javascript:goView('${list.SEQ}')">상세보기</a></span></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
									</form>
								</div>
							</td>
						</tr>
					</table>
			</div> 
		</div>