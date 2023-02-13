<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>

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
					<input type="file" name="file1" id="file1" style="display: none;" />
							<table  class="tbv"  summary="공지사항 글입력하기" style="width: 950px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="20%" >
									<col width="10%" >
									<col width="20%" >
								</colgroup>
								<tbody>
									<tr>
										<th><label for="SUBJECT">제목</label></th>
										<td colspan="3">
											${view.TITLE} 
										</td>
									</tr>
									<tr>
										<th><label for="ATTACH">첨부파일</label></th>
										<td colspan="3" class="al"> 
											<img src="/assets/user/images/common/icon_fileb.png" alt="파일" class="am mr10" /> 
											<c:choose>
												<c:when test="${!empty file_list }">
													<c:forEach var="flist" items="${file_list }" varStatus="status">
														<c:if test="${flist.TYPE != 'movie'}">
														<a href="javascript:download('${flist.FILENAME}','${flist.REFILENAME}','${flist.PATH}');">${flist.FILENAME }</a>
														</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<span class="fc06">첨부파일이 없습니다.</span>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<input type="hidden" name="fileYn" id="fileYn" value="N">
									<input type="hidden" name="thumYn" id="thumYn" value="N">
									<input type="hidden" name="movieYn" id="movieYn" value="N">
									<input type="hidden" name="type" id="type" value="${bean.board_name}">
									<input type="hidden" name="board_name" id="board_name" value="${bean.gubun}"><!-- 게시판 아이디 -->
									
									<tr>
										<th colspan="4"><strong>질문 내용</strong></th>
									</tr>
									<tr>
										<td colspan="4" style="padding: 27px; 25px;">
											<iframe src="/admin/getContent.do?seq=${view.SEQ}&gubun=${view.BOARD_NAME}" style="width: 100%;" onload="setIFrameHeight(this);" scrolling="no" frameborder="0" framespacing="0" marginheight="0" marginwidth="0" vspace="0"></iframe>
										</td>
									</tr>
									<tr>
										<th colspan="4"><strong>답변</strong></th>
									</tr>
									<tr>
										<td colspan="4">											
											<textarea name="answer" id="answer" rows="10" cols="100" style="width:100%; height:300px; display:none;">${view.ANSWER}</textarea>
											<script type="text/javascript">
												CKEDITOR.replace( 'answer', {
													width: "100%",
													height: "300px",
													filebrowserUploadUrl: '/file/ckeditorImageUpload.do'
												});
											</script>	
										</td>
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="modifyBtn" >수정</a></span>
								<span class="button02" id="btnSearch" ><a href="board_list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
					<input type="hidden" id="seq" name="seq" value="${view.SEQ}">
				</form>
			</div>
		</div>
<script type="text/javascript">


$(document).ready(function() {
	
	var board_name = "${bean.board_name}";
	
	$("#modifyBtn").click(function() {

		if(confirm('답변을 등록하시겠습니까?')){
			$("#frm").submit();	
		}
	});
});	
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>

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
					<input type="file" name="file1" id="file1" style="display: none;" />
							<table  class="tbv"  summary="공지사항 글입력하기" style="width: 950px;">
								<caption>${menu.submenu} 등록</caption>
								<colgroup>
									<col width="10%" >
									<col width="20%" >
									<col width="10%" >
									<col width="20%" >
								</colgroup>
								<tbody>
									<tr>
										<th><label for="SUBJECT">제목</label></th>
										<td colspan="3">
											${view.TITLE} 
										</td>
									</tr>
									<tr>
										<th><label for="ATTACH">첨부파일</label></th>
										<td colspan="3" class="al"> 
											<img src="/assets/user/images/common/icon_fileb.png" alt="파일" class="am mr10" /> 
											<c:choose>
												<c:when test="${!empty file_list }">
													<c:forEach var="flist" items="${file_list }" varStatus="status">
														<c:if test="${flist.TYPE != 'movie'}">
														<a href="javascript:download('${flist.FILENAME}','${flist.REFILENAME}','${flist.PATH}');">${flist.FILENAME }</a>
														</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<span class="fc06">첨부파일이 없습니다.</span>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<input type="hidden" name="fileYn" id="fileYn" value="N">
									<input type="hidden" name="thumYn" id="thumYn" value="N">
									<input type="hidden" name="movieYn" id="movieYn" value="N">
									<input type="hidden" name="type" id="type" value="${bean.board_name}">
									<input type="hidden" name="board_name" id="board_name" value="${bean.gubun}"><!-- 게시판 아이디 -->
									
									<tr>
										<th colspan="4"><strong>질문 내용</strong></th>
									</tr>
									<tr>
										<td colspan="4" style="padding: 27px; 25px;">
											<iframe src="/admin/getContent.do?seq=${view.SEQ}&gubun=${view.BOARD_NAME}" style="width: 100%;" onload="setIFrameHeight(this);" scrolling="no" frameborder="0" framespacing="0" marginheight="0" marginwidth="0" vspace="0"></iframe>
										</td>
									</tr>
									<tr>
										<th colspan="4"><strong>답변</strong></th>
									</tr>
									<tr>
										<td colspan="4">											
											<textarea name="answer" id="answer" rows="10" cols="100" style="width:100%; height:300px; display:none;">${view.ANSWER}</textarea>
											<script type="text/javascript">
												CKEDITOR.replace( 'answer', {
													width: "100%",
													height: "300px",
													filebrowserUploadUrl: '/file/ckeditorImageUpload.do'
												});
											</script>	
										</td>
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="modifyBtn" >수정</a></span>
								<span class="button02" id="btnSearch" ><a href="board_list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
					<input type="hidden" id="seq" name="seq" value="${view.SEQ}">
				</form>
			</div>
		</div>
<script type="text/javascript">


$(document).ready(function() {
	
	var board_name = "${bean.board_name}";
	
	$("#modifyBtn").click(function() {

		if(confirm('답변을 등록하시겠습니까?')){
			$("#frm").submit();	
		}
	});
});	
>>>>>>> refs/heads/202204
</script>