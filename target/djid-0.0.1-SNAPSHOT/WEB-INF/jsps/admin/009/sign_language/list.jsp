<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

$(document).ready(function(){


	$('#search_type_code_seq').change(function () {
	//	if(! valCheck('search_value','검색어를 입력하세요')) return;
	//	if(! lenCheck('search_value',2, '검색어는 2글자 이상 입력하세요')) return;
		$('#page').val(1);
		$('#pagelistno').val(1);
		$('#searchForm').submit();
	});
	
});

function goUpdate(seq){

	$("#src").val($("#src"+seq).val());
	$("#show_yn").val($("#show_yn"+seq).val());
	$("#auto_yn").val($("#auto_yn"+seq).val());
	$("#seq").val(seq);

	$("#frm").attr("action", "/admin/009/sign_language/update.do");
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
											<td align="left">총 :  ${fn:length(list)} 개</td>
										</tr>
									</table>
									<form action="/admin/${bean.menuno}/${bean.board_name}/insert.do" name="frm" id="frm" method="post">
									<input type="hidden" name="page" id="page" value="${bean.page}" />
									<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
									
									<input type="hidden" name="seq" id="seq" value=""/>
									<input type="hidden" name="src" id="src" value=""/>
									<input type="hidden" name="show_yn" id="show_yn" value=""/>
									<input type="hidden" name="auto_yn" id="auto_yn" value=""/>									
									
									<table class="tbl" border="0" cellpadding="0" cellspacing="0" style="width: 95%;">
										<colgroup>
											<col width="25%" />
											<col width="18%" />
											<col/>
											<col width="12%" />
											<col width="8%" />
										</colgroup>
										<thead>
											<tr>
												<th>미리보기</th>
												<th>메뉴명</th>
												<th>유튜브 링크</th>
												<th>노출/자동재생</th>
												<th>저장</th>
											</tr>
										</thead>
										<tbody>											
											<c:if test="${empty list}">
												<tr>
													<td colspan="6" style="text-align:center;">등록된 영상이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${!empty list}">
												<c:forEach var="list" items="${list}" varStatus="status">
													<tr>
														<td style="text-align: center;">
															<iframe width="212" height="120" src="${list.SRC}<c:if test="${list.AUTO_YN eq 'Y'}">?autoplay=1</c:if>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
														</td>
														<td style="text-align: center;"><b>${list.MENU}</b></td>
														<td style="text-align: center;">
															<input type="text" name="list_src" id="src${list.SEQ}" value="${list.SRC}" style="width: 100%;"/>
														</td>
														<td style="text-align: center;">
															<select name="list_show_yn" id="show_yn${list.SEQ}">
																<option value="N" <c:if test="${list.SHOW_YN eq 'N'}">selected="selected"</c:if>>비노출</option>
																<option value="Y" <c:if test="${list.SHOW_YN eq 'Y'}">selected="selected"</c:if>>노출</option>																
															</select>
															<br/><br/>
															<select name="list_auto_yn" id="auto_yn${list.SEQ}">
																<option value="N" <c:if test="${list.AUTO_YN eq 'N'}">selected="selected"</c:if>>정지</option>
																<option value="Y" <c:if test="${list.AUTO_YN eq 'Y'}">selected="selected"</c:if>>자동재생</option>																
															</select>
														</td>
														<td style="text-align: center;">
															<span class="button02" id="btnSearch" ><a href="javascript:goUpdate('${list.SEQ}');">저장</a></span>
														</td>
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