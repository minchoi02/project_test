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
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/board_insert.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
					<input type="hidden" name="id" id="id" value="${adminInfo.ID}" >
					<input type="hidden" name="member_seq" id="member_seq" value="${adminInfo.SEQ}" >
					<input type="hidden" name="name" id="name" value="${adminInfo.NAME}">
					<input type="hidden" name="visible" id="visible" value="99">
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
											<input type="text" name="title" id="title" value="${view.TITLE }" style="width:100%;">
										</td>
									</tr>
									<tr>
									<tr>
										<th><label for="THUM">썸네일</label></th>
										<td colspan="2" style="text-align:left;">
											<input type="file" name="thum_img" id="thum_img" value="" style="width:400px;height:22px;" />
											&nbsp;썸네일 크기는 231*173 입니다.
											
										</td>
									</tr>
									<tr>
										<th><label for="FILE">첨부파일</label></th>
										<td colspan="2" style="text-align:left;">
											<input type="file" name="file1" id="file1" value="" style="width:400px;height:22px;" />
										</td>
									</tr>
									<tr>
										<th><label for="contents">내용</label></th>
										<td colspan="2">
											<input type="hidden" name="fileYn" id="fileYn" value="N">
											<input type="hidden" name="thumYn" id="thumYn" value="N">
											<input type="hidden" name="movieYn" id="movieYn" value="N">
											<input type="hidden" name="type" id="type" value="${bean.board_name}">
											<input type="hidden" name="board_name" id="board_name" value="${bean.gubun}"><!-- 게시판 아이디 -->
											<textarea name="content" id="content" rows="10" cols="100" style="width:865px; height:400px; display:none;"></textarea>
											<script type="text/javascript">
												CKEDITOR.replace( 'content', {
													width: "100%",
													height: "400px",
													filebrowserUploadUrl: '/file/ckeditorImageUpload.do'
												});
											</script>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="insertBtn" >확인</a></span>
								<span class="button02" id="btnSearch" ><a href="board_list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
						
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${bean.seq }">
					<input type="hidden" id="search_name" name="search_name" value="${bean.search_name }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
					<input type="hidden" name="ref" id="ref"  value="${bean.ref }">
					<input type="hidden" name="ref_step" id="ref_step"  value="${bean.ref_step }">
					<input type="hidden" name="ref_level" id="ref_level"  value="${bean.ref_level }">
				</form>
			</div>
		</div>
<script type="text/javascript">

$(document).ready(function() {

var board_name = "${bean.board_name}";

	$("#insertBtn").click(function() {
		if( !valCheck('title', '제목을입력하세요') ) return;		
		
		if($("#file1").val() != ''){
			$("#fileYn").val("Y");
		}

		if($("#thum_img").val() == ''){
			alert("썸네일을 등록해주세요.");
			return;
		}
		
		if($("#thum_img").val() != ''){
			$("#thumYn").val("Y");
		}
		
		if(confirm('등록하시겠습니까?')){			
			$("#frm").submit();	
		}
		
	});

});	

</script>		
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
				<form name="frm" id="frm" method="post" action="/admin/${bean.menuno}/${bean.board_name}/board_insert.do"  method="post" enctype="multipart/form-data" accept-charset="utf-8">
					<input type="hidden" name="id" id="id" value="${adminInfo.ID}" >
					<input type="hidden" name="member_seq" id="member_seq" value="${adminInfo.SEQ}" >
					<input type="hidden" name="name" id="name" value="${adminInfo.NAME}">
					<input type="hidden" name="visible" id="visible" value="99">
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
											<input type="text" name="title" id="title" value="${view.TITLE }" style="width:100%;">
										</td>
									</tr>
									<tr>
									<tr>
										<th><label for="THUM">썸네일</label></th>
										<td colspan="2" style="text-align:left;">
											<input type="file" name="thum_img" id="thum_img" value="" style="width:400px;height:22px;" />
											&nbsp;썸네일 크기는 231*173 입니다.
											
										</td>
									</tr>
									<tr>
										<th><label for="FILE">첨부파일</label></th>
										<td colspan="2" style="text-align:left;">
											<input type="file" name="file1" id="file1" value="" style="width:400px;height:22px;" />
										</td>
									</tr>
									<tr>
										<th><label for="contents">내용</label></th>
										<td colspan="2">
											<input type="hidden" name="fileYn" id="fileYn" value="N">
											<input type="hidden" name="thumYn" id="thumYn" value="N">
											<input type="hidden" name="movieYn" id="movieYn" value="N">
											<input type="hidden" name="type" id="type" value="${bean.board_name}">
											<input type="hidden" name="board_name" id="board_name" value="${bean.gubun}"><!-- 게시판 아이디 -->
											<textarea name="content" id="content" rows="10" cols="100" style="width:865px; height:400px; display:none;"></textarea>
											<script type="text/javascript">
												CKEDITOR.replace( 'content', {
													width: "100%",
													height: "400px",
													filebrowserUploadUrl: '/file/ckeditorImageUpload.do'
												});
											</script>
										</td>
									</tr>
								</tbody>
							</table>
							<!-- <p style="padding-right:48px;"> -->
							<div class="btn_right">
								<span class="button02" id="btnSearch" ><a href="#" id="insertBtn" >확인</a></span>
								<span class="button02" id="btnSearch" ><a href="board_list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
						
					<!-- 답글관련 -->
					<input type="hidden" id="page" name="page" value="${bean.page}">
					<input type="hidden" id="pagelistno" name="pagelistno" value="${bean.pagelistno }">
					<input type="hidden" id="seq" name="seq" value="${bean.seq }">
					<input type="hidden" id="search_name" name="search_name" value="${bean.search_name }">
					<input type="hidden" id="search_value" name="search_value" value="${bean.search_value }">
					<input type="hidden" name="ref" id="ref"  value="${bean.ref }">
					<input type="hidden" name="ref_step" id="ref_step"  value="${bean.ref_step }">
					<input type="hidden" name="ref_level" id="ref_level"  value="${bean.ref_level }">
				</form>
			</div>
		</div>
<script type="text/javascript">

$(document).ready(function() {

var board_name = "${bean.board_name}";

	$("#insertBtn").click(function() {
		if( !valCheck('title', '제목을입력하세요') ) return;		
		
		if($("#file1").val() != ''){
			$("#fileYn").val("Y");
		}

		if($("#thum_img").val() == ''){
			alert("썸네일을 등록해주세요.");
			return;
		}
		
		if($("#thum_img").val() != ''){
			$("#thumYn").val("Y");
		}
		
		if(confirm('등록하시겠습니까?')){			
			$("#frm").submit();	
		}
		
	});

});	

</script>		
>>>>>>> refs/heads/202204
	