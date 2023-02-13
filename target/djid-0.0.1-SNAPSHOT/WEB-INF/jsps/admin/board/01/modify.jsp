<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script type="text/javascript" src="/assets/user/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>

<script>
var file_cnt = ${fn:length(file_list)};

function file_plus(){
	if(file_cnt >= 5){
		alert("최대 5개 까지만 등록 가능합니다.");
		return;
	}
	file_cnt++;
	$("#f_cnt").val( Number($("#f_cnt").val())+1 );

	var html = '<span id="file'+file_cnt+'span"><br/>';
		html+= '<input type="file" name="file'+file_cnt+'" id="file'+file_cnt+'" value="" style="width:400px;height:22px;margin-bottom: 5px;" /></span>';

	$("#file_list").append(html);
}

function file_minus(){
	if(file_cnt == 1){
		alert("더 이상 삭제할 수 없습니다.");
		return;
	}
	$("#file"+file_cnt+"span").remove();
	file_cnt--;
	$("#f_cnt").val( Number($("#f_cnt").val())-1 );
}
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
											<input type="text" name="title" id="title" value="${view.TITLE }" style="width:100%;"> 
										</td>
									</tr>
									<tr>
										<th><label for="NOTICE_Y">상위공지등록</label></th>
										<td colspan="3">
											<input type="radio" name="notice_yn" id="notice_yn" value="Y" <c:if test="${view.NOTICE_YN eq 'Y'}">checked="checked"</c:if>>공지
											&nbsp;
											<input type="radio" name="notice_yn" id="notice_yn" value="N" <c:if test="${view.NOTICE_YN eq 'N'}">checked="checked"</c:if>>미공지											 
										</td>
									</tr>
									<tr>
										<th><label for="ATTACH">첨부파일</label></th>
										<td colspan="3" style="text-align:left;">
											<c:set var="q" value="0" />
											<c:if test="${!empty file_list }">
												<c:forEach var="list" items="${file_list}">
													<c:set var="q" value="${q+1 }" />
													<input type="hidden" name="pre_file_${q}" value="${list.SEQ}">
													<input type="hidden" name="pre_filepath_${q}" value="${list.PATH}">
													<input type="hidden" name="pre_refilename_${q}" value="${list.REFILENAME}">
													<input type="file" name="file${q}" id="file${q}" value="" style="width:400px;height:22px;" onchange="chgImg();"/>
													<input type="checkbox" name="file${q}_del" value="Y"> 기존파일삭제<br/>
													<a href="#none"> ${list.FILENAME}</a><br/>
												</c:forEach>
											</c:if>
											<c:if test="${empty file_list }">
												<input type="file" name="file1" id="file1" value="" style="width:400px;height:22px;"/>
											</c:if>
											<input type="hidden" name="f_cnt" id="f_cnt" value="${q }" />
											
											<span id="file_list">
												
											</span>
											<br/>
											<input type="button" value="+" onclick="file_plus();">
											<input type="button" value="-" onclick="file_minus();">
											
											첨부파일 용량은 최대 20 MB 입니다.
										</td>
									</tr>
									<tr >
										<td colspan="4">
											<input type="hidden" name="fileYn" id="fileYn" value="N">
											<input type="hidden" name="thumYn" id="thumYn" value="N">
											<input type="hidden" name="movieYn" id="movieYn" value="N">
											<input type="hidden" name="type" id="type" value="${bean.board_name}">
											<input type="hidden" name="board_name" id="board_name" value="${bean.gubun}"><!-- 게시판 아이디 -->
											
											<textarea name="content" id="content" rows="10" cols="100" style="width:100%; height:400px; display:none;">${view.CONTENT}</textarea>
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
								<span class="button02" id="btnSearch" ><a href="#" id="modifyBtn" >수정</a></span>
								<span class="button02" id="btnSearch" ><a href="board_list.do?board_name=${bean.board_name}&page=${bean.page}&pagelistno=${bean.pagelistno}<c:if test="${! empty bean.search_value }">&search_name=${bean.search_name}&search_value=${bean.search_value}</c:if>">목록</a></span>
							</div>
							<!-- </p> -->
					<input type="hidden" id="seq" name="seq" value="${view.SEQ}">
				</form>
			</div>
		</div>
<script type="text/javascript">

function emailChk(email){  
	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
	   
	if(regex.test(email) === false) {  
	    return true;  
	} else { 
	    return false;
	}  
}


$(document).ready(function() {
	
	var board_name = "${bean.board_name}";
	
	$("#modifyBtn").click(function() {
		
		if( !valCheck('title', '제목을입력하세요') ) return;
		
		if(board_name == 'review' || board_name == 'freeBoard'){
			if( !valCheck('fname', '이름을 입력하세요') ) return;			
			if( !valCheck('email', '이메일을 입력하세요') ) return;	
			if( emailChk($("#email").val()) ){
				alert("잘못된 이메일 형식입니다.");
				$("#email").focus();
				return;
			}
			
			if( !valCheck('pwd', '비밀번호를 입력하세요') ) return;
		}
			
			
		if($("#file1").val() != ''){
			$("#fileYn").val("Y");
		}
		
		if(confirm('수정하시겠습니까?')){
			$("#frm").submit();	
		}
	});
});	
</script>