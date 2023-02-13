<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('.sdate').datepicker({
		'dateFormat':'yy-mm-dd',
		'monthNames':['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	});
	
	$('.edate').datepicker({
		'dateFormat':'yy-mm-dd',
		'monthNames':['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	});
});
</script>
<div id="contents_bg">
		<div class="con_tit">
			${menu.menuname}
		</div>
	
		<div class="conBox">
				<form name="frm" id="frm" method="post" action="board_update.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
					<input type="hidden" name="id" id="id" value="${adminInfo.ID}" >
					<input type="hidden" name="member_seq" id="member_seq" value="${adminInfo.SEQ}" >
					<input type="hidden" name="name" id="name" value="${adminInfo.NAME}">
					<input type="hidden" name="visible" id="visible" value="99">
					<input type="hidden" name="fileYn" id="fileYn" value="N">
							<table  class="tbv"  summary="공지사항 글입력하기">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="20%" >
									<col width="*" >
								</colgroup>
								<tbody>
									<tr>
										<th><label for="SUBJECT">제목</label></th>
										<td colspan="2">
											<input type="text" name="title" id="title" value="${view.TITLE}" style="width:50%;"> 
										</td>
									</tr>
									<tr>
										<th><label for="IMAGE">이미지</label></th>
										<td colspan="2" style="text-align:left;">
											<input type="file" name="file1" id="file1" value="" style="width:400px;height:22px;" />
											<br>
											${view.FILENAME}
										</td>
									</tr>
									<tr>
										<th><label for="WIDTH_HEIGTH">팝업 크기</label></th>
										<td colspan="2" style="text-align:left;">
											가로 <input type="text" name="width" id="width" value="${view.WIDTH}" style="width:50px" />
											새로 <input type="text" name="height" id="height" value="${view.HEIGHT}" style="width:50px" /> (팝업 세로크기는 이미지 세로크기+20의 크기로 설정해주세요)
										</td>
									</tr>
									<tr>
										<th><label for="TOP_LEFT">여백 설정</label></th>
										<td colspan="2" style="text-align:left;">
											좌측 <input type="text" name="left" id="left" value="${view.LEFT_PADDING}" style="width:50px" />
											상단 <input type="text" name="top" id="top" value="${view.TOP}" style="width:50px" />
										</td>
									</tr>
									<tr>
										<th><label for="LINK">링크</label></th>
										<td colspan="2">
											<input type="text" name="link" id="link" value="${view.LINK}" style="width:80%;">
										</td>
									</tr>
									<tr>
										<th><label for="GESI_DATE">게시 일정</label></th>
										<td colspan="2">
											<input type="text" class="sdate" name="gesi_sd" id="gesi_sd" value="<fmt:formatDate value="${view.GESI_SD}" pattern="yyyy-MM-dd" />" readonly="readonly" style="width:80px;"> ~ 
											<input type="text" class="edate" name="gesi_ed" id="gesi_ed" value="<fmt:formatDate value="${view.GESI_ED}" pattern="yyyy-MM-dd" />" readonly="readonly" style="width:80px;">
										</td>
									</tr>
									<tr>
										<th><label for="SORT">우선순위</label></th>
										<td colspan="2">
											<select id="sort" name="sort" style="width: 50px">
												<option value="1" <c:if test="${view.SORT eq '1'}">selected="selected"</c:if> >1</option>
												<option value="2" <c:if test="${view.SORT eq '2'}">selected="selected"</c:if> >2</option>
												<option value="3" <c:if test="${view.SORT eq '3'}">selected="selected"</c:if> >3</option>
												<option value="4" <c:if test="${view.SORT eq '4'}">selected="selected"</c:if> >4</option>
												<option value="5" <c:if test="${view.SORT eq '5'}">selected="selected"</c:if> >5</option>
											</select> 
										</td>
									</tr>
									<tr>
										<th><label for="LINK">차단 구분</label></th>
										<td colspan="2">
											<input type="radio" name="block_gubun" value="TODAY" <c:if test="${view.BLOCK_GUBUN eq 'TODAY'}">checked="checked"</c:if>/> 하루동안 열지 않음
											&nbsp;
											<input type="radio" name="block_gubun" value="NEVER" <c:if test="${view.BLOCK_GUBUN eq 'NEVER'}">checked="checked"</c:if>/> 다시 열지 않음
										</td>
									</tr>
									<tr>
										<th><label for="LINK_WINDOW">링크 형식</label></th>
										<td colspan="2">
											<input type="radio" name="link_window" id="link_window" value="_self" <c:if test="${view.LINK_WINDOW eq '_self'}">checked="checked"</c:if>/> 현재 창
											&nbsp;
											<input type="radio" name="link_window" id="link_window" value="_blank" <c:if test="${view.LINK_WINDOW eq '_blank'}">checked="checked"</c:if>/> 새 창
										</td>
									</tr>
									<tr>
										<th><label for="USE_YN">노출여부</label></th>
										<td colspan="2">
											<input type="radio" name="use_yn" id="use_yn" value="Y" <c:if test="${view.USE_YN eq 'Y'}">checked="checked"</c:if>/> 게시
											&nbsp;
											<input type="radio" name="use_yn" id="use_yn" value="N" <c:if test="${view.USE_YN eq 'N'}">checked="checked"</c:if>/> 미게시
										</td>
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#none" id="modifyBtn" >수정</a></span>
								<span class="button02" id="btnSearch" ><a href="board_list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
					<input type="hidden" id="seq" name="seq" value="${view.SEQ}">
				</form>
			</div>
		</div>
<script type="text/javascript">

$(document).ready(function() {
	
	$("#modifyBtn").click(function() {
		
		if( !valCheck('title', '제목을 입력해주세요.') ) return;		
		
		if($("#file1").val() != ''){
			$("#fileYn").val("Y");
		}else{
			$("#fileYn").val("N");
		}
		if( !valCheck('width', '가로크기를 입력해주세요.') ) return;
		if( !valCheck('height', '세로크기를 입력해주세요.') ) return;
		if( !valCheck('left', '좌측 여백을 입력해주세요.') ) return;
		if( !valCheck('top', '상단 여백을 입력해주세요.') ) return;
		if( !valCheck('link', '링크를 입력해주세요.') ) return;
		if( !valCheck('gesi_sd', '게시 일정을 입력해주세요.') ) return;
		if( !valCheck('gesi_ed', '게시 일정을 입력해주세요.') ) return;
		
		if(confirm('수정하시겠습니까?')){
			$("#frm").submit();	
		}
	});
});	
</script>