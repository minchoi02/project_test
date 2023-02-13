<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="/assets/user/js/jquery.form.min.js"></script>
<script src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	$(".onlynum").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/g,"") );} );
	
	var board_name = "${bean.board_name}";
	
	/*
	* 글 수정 버튼
	*/
	$("#updateBtn").click(function() {
		
		if( !valCheck('title', '제목을 입력해주세요.') ) return;
		
		<c:if test="${bean.board_name eq 'free' || bean.board_name eq 'pr'}">
		if( !valCheck('fname', '이름을 입력해주세요.') ) return;
		if( !valCheck('pwd', '비밀번호를 입력해주세요.') ) return;
		</c:if>
		
		var checkCaptcha = false;
		
		if ( $('#captcha_input').val() == "" ) {
            alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
            $("#captcha_input").focus();
            return;
	     } else {
	            $.ajax({
                   url: '/validateCaptcha.do',
                   type: 'POST',
                   dataType: 'text',
                   data: 'captcha_input=' + $('#captcha_input').val(),
                   async: false,      
                   success: function(resp) {
                         if(resp.indexOf("Y") != -1){
                        	 
                         }else{
                        	 alert("보안문자 입력 값이 일치하지 않습니다. 새로운 문자를 다시 입력해주세요.");
                        	 reloadCaptcha();
	                         $('#captcha_input').val('');
	                         checkCaptcha = true;
	                        return;
                         }
                         
                   }
	            });
	     }
		
		if(checkCaptcha){
			return;
		}
		
		if($("#file1").val() != ''){
			$("#fileYn").val("Y");
		}
		
		if(confirm('수정하시겠습니까?')){
			$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/update.do");
			$("#frm").submit();
		}
		
	});
	
	$("#cancelBtn").click(function() {
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/view.do");
		$("#frm").submit();
	});		
	
});	

function imgRefresh(){
    $("#captchaImg").attr("src", "/captchaImage.do?id=" + Math.random());
}

function reloadCaptcha(){
	var timeData = new Date();
	var reloadNum = timeData.getTime();
	var captchaUrl = '/captchaImage.do';
	$('#captchaImg').attr('src',captchaUrl+'?'+reloadNum);
}

function playAudio(){
	var timeData = new Date();
	var reloadNum = timeData.getTime();
	var browserInfo = navigator.userAgent.toLowerCase();
	if((browserInfo.indexOf("msie") >= 0 || browserInfo.indexOf("trident") >= 0)){
		var htmlString = '<object type="audio/x-wav" data="/captchaAudio.do?' + reloadNum + '" width="0" height="0"><param name="src" value="/captchaAudio.do?' + reloadNum +'"/><param name="autostart" value="true" /><param name="controller" value="false" /></object>';
		document.getElementById('audioPlayer').innerHTML = htmlString;
		document.getElementById('captcha_input').focus();
	}else if(browserInfo.indexOf("chrome") >= 0 || browserInfo.indexOf("firefox") >= 0 || browserInfo.indexOf("safari") >= 0){
		var htmlString = '<audio controls autoplay style="height:0px;width:0px;"><source src="/captchaAudio.do?' + reloadNum + '" type="audio/wav"></audio>';
		document.getElementById('audioPlayer').innerHTML = htmlString;
		document.getElementById('captcha_input').focus();
	}else{
		// 예외처리 필요
	}
}
</script>

		<form name="frm" id="frm" method="post" method="post" enctype="multipart/form-data" accept-charset="utf-8">
					
					<input type="hidden" name="seq" id="seq" value="${view.SEQ}" >
					<input type="hidden" name="pwd" id="pwd" value="${bean.pwd}" >
					
					<input type="hidden" name="id" id="id" value="${userSession.ID}" >
					<%-- <input type="hidden" name="member_seq" id="member_seq" value="${userSession.SEQ}" >
					<input type="hidden" name="name" id="name" value="${userSession.NAME}"> --%>
					<input type="hidden" name="visible" id="visible" value="99">
					
					<input type="hidden" name="fileYn" id="fileYn" value="N">
					<input type="hidden" name="thumYn" id="thumYn" value="N">
					
					<input type="hidden" name="page" id="page" value="${bean.page}" />
					<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
					<input type="hidden" name="search_name" id="search_name" value="${bean.search_name}" />
					<input type="hidden" name="search_value" id="search_value" value="${bean.search_value}" />
					
					<div class="contsArea communicationNotice">
						
						<c:if test="${bean.board_name eq 'notice'}">
							<p class="textParaList">공지사항을 안내하여 드립니다.</p>
						</c:if>
						<c:if test="${bean.board_name eq 'data'}">
							<p class="textParaList">장애인 복지와 관련된 다양한 서식, 자료들을 공유합니다.</p>
						</c:if>
						<c:if test="${bean.board_name eq 'promote' or bean.board_name eq 'event'}">
							<p class="textParaList">대전광역시, 유관기관 등의 다양한 행사와 프로그램 지원소식 등 정보를 나누는 공간입니다.</p>
						</c:if>
						<c:if test="${bean.board_name eq 'counseling'}">
							<p class="textParaList">장애인 복지에 관련된 사항을 편리하게 상담을 받아보실 수 있습니다.</p>
						</c:if>
						
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>자유게시판 글쓰기이며 제목, 파일첨부, 내용, 자동등록방지 내용을 입력합니다.</caption><!-- 2018.11.19 캡션 내용에서 등록일 삭제 -->
								<colgroup>
									<col style="width: 170px">
									<col style="width: *">
									<col style="width: 170px">
									<col style="width: *">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="title">제목</label></th>
										<td colspan="3"><input type="text" name="title" id="title" value="${view.TITLE}" class="wid85"></td>
									</tr>
									<c:if test="${bean.board_name eq 'free' || bean.board_name eq 'pr'}">									
										<tr>
											<th scope="row"><label for="fname">이름</label></th>
											<td colspan="3">
												<input type="text" id="fname" name="name" value="${view.NAME}">
											</td>											
										</tr>
									</c:if>
									<tr>
										<th scope="row"><label for="file1">파일첨부</label></th>
										<td colspan="3">											
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
												<input type="file" id="file1" name="file1">
											</c:if>
											<input type="hidden" name="f_cnt" id="f_cnt" value="${q }" />
											<p class="fileNoti">* 파일첨부용량은 최대 5MB이며,<strong>파일이 여러개일 경우 압축하여 1개의 파일</strong>로 올려주세요.</p>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="content">내용</label></th>
										<td colspan="3">
											<textarea id="content" name="content">${view.CONTENT}</textarea>
											<script type="text/javascript">
												CKEDITOR.replace( 'content', {
													width: "100%",
													height: "300px",
													filebrowserUploadUrl: '/file/ckeditorImageUpload.do'
												});
											</script>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="captcha">자동등록방지</label></th>
										<td colspan="3" class="captchaArea">
											<a href="#none" onclick="playAudio();"><img src="/assets/user/images/common/audio.png" class="vm" style="width: 35px; height: 37px" alt="보안문자 음성 듣기"/>
											 <span class="captcha">											 	
											 	<img src="/captchaImage.do" id="captchaImg" class="vm" style="width: 148px; height: 36px" alt="보안문자 이미지">
											 </span>
											 <input type="text" id="captcha_input" name="captcha_input" title="보안문자 입력하기">
											 <button type="button" id="reload" onclick="javascript:reloadCaptcha();" class="btnTypeBasic colorGray"><span>새로고침</span></button>
											 <div id="audioPlayer" style="display: none;"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btnArea center">
							<button type="button" id="updateBtn" class="btnTypeBasic sizeM"><span>완료</span></button>
							<button type="button" id="cancelBtn" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
						</div>
					</div>
					
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script src="/assets/user/js/jquery.form.min.js"></script>
<script src="/assets/editor/ckeditor/ckeditor.js" charset="utf-8"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	$(".onlynum").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/g,"") );} );
	
	var board_name = "${bean.board_name}";
	
	/*
	* 글 수정 버튼
	*/
	$("#updateBtn").click(function() {
		
		if( !valCheck('title', '제목을 입력해주세요.') ) return;
		
		<c:if test="${bean.board_name eq 'free' || bean.board_name eq 'pr'}">
		if( !valCheck('fname', '이름을 입력해주세요.') ) return;
		if( !valCheck('pwd', '비밀번호를 입력해주세요.') ) return;
		</c:if>
		
		var checkCaptcha = false;
		
		if ( $('#captcha_input').val() == "" ) {
            alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
            $("#captcha_input").focus();
            return;
	     } else {
	            $.ajax({
                   url: '/validateCaptcha.do',
                   type: 'POST',
                   dataType: 'text',
                   data: 'captcha_input=' + $('#captcha_input').val(),
                   async: false,      
                   success: function(resp) {
                         if(resp.indexOf("Y") != -1){
                        	 
                         }else{
                        	 alert("보안문자 입력 값이 일치하지 않습니다. 새로운 문자를 다시 입력해주세요.");
                        	 reloadCaptcha();
	                         $('#captcha_input').val('');
	                         checkCaptcha = true;
	                        return;
                         }
                         
                   }
	            });
	     }
		
		if(checkCaptcha){
			return;
		}
		
		if($("#file1").val() != ''){
			$("#fileYn").val("Y");
		}
		
		if(confirm('수정하시겠습니까?')){
			$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/update.do");
			$("#frm").submit();
		}
		
	});
	
	$("#cancelBtn").click(function() {
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/view.do");
		$("#frm").submit();
	});		
	
});	

function imgRefresh(){
    $("#captchaImg").attr("src", "/captchaImage.do?id=" + Math.random());
}

function reloadCaptcha(){
	var timeData = new Date();
	var reloadNum = timeData.getTime();
	var captchaUrl = '/captchaImage.do';
	$('#captchaImg').attr('src',captchaUrl+'?'+reloadNum);
}

function playAudio(){
	var timeData = new Date();
	var reloadNum = timeData.getTime();
	var browserInfo = navigator.userAgent.toLowerCase();
	if((browserInfo.indexOf("msie") >= 0 || browserInfo.indexOf("trident") >= 0)){
		var htmlString = '<object type="audio/x-wav" data="/captchaAudio.do?' + reloadNum + '" width="0" height="0"><param name="src" value="/captchaAudio.do?' + reloadNum +'"/><param name="autostart" value="true" /><param name="controller" value="false" /></object>';
		document.getElementById('audioPlayer').innerHTML = htmlString;
		document.getElementById('captcha_input').focus();
	}else if(browserInfo.indexOf("chrome") >= 0 || browserInfo.indexOf("firefox") >= 0 || browserInfo.indexOf("safari") >= 0){
		var htmlString = '<audio controls autoplay style="height:0px;width:0px;"><source src="/captchaAudio.do?' + reloadNum + '" type="audio/wav"></audio>';
		document.getElementById('audioPlayer').innerHTML = htmlString;
		document.getElementById('captcha_input').focus();
	}else{
		// 예외처리 필요
	}
}
</script>

		<form name="frm" id="frm" method="post" method="post" enctype="multipart/form-data" accept-charset="utf-8">
					
					<input type="hidden" name="seq" id="seq" value="${view.SEQ}" >
					<input type="hidden" name="pwd" id="pwd" value="${bean.pwd}" >
					
					<input type="hidden" name="id" id="id" value="${userSession.ID}" >
					<%-- <input type="hidden" name="member_seq" id="member_seq" value="${userSession.SEQ}" >
					<input type="hidden" name="name" id="name" value="${userSession.NAME}"> --%>
					<input type="hidden" name="visible" id="visible" value="99">
					
					<input type="hidden" name="fileYn" id="fileYn" value="N">
					<input type="hidden" name="thumYn" id="thumYn" value="N">
					
					<input type="hidden" name="page" id="page" value="${bean.page}" />
					<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
					<input type="hidden" name="search_name" id="search_name" value="${bean.search_name}" />
					<input type="hidden" name="search_value" id="search_value" value="${bean.search_value}" />
					
					<div class="contsArea communicationNotice">
						
						<c:if test="${bean.board_name eq 'notice'}">
							<p class="textParaList">공지사항을 안내하여 드립니다.</p>
						</c:if>
						<c:if test="${bean.board_name eq 'data'}">
							<p class="textParaList">장애인 복지와 관련된 다양한 서식, 자료들을 공유합니다.</p>
						</c:if>
						<c:if test="${bean.board_name eq 'promote' or bean.board_name eq 'event'}">
							<p class="textParaList">대전광역시, 유관기관 등의 다양한 행사와 프로그램 지원소식 등 정보를 나누는 공간입니다.</p>
						</c:if>
						<c:if test="${bean.board_name eq 'counseling'}">
							<p class="textParaList">장애인 복지에 관련된 사항을 편리하게 상담을 받아보실 수 있습니다.</p>
						</c:if>
						
						<div class="commWrite">
							<table class="boardTypeRow">
								<caption>자유게시판 글쓰기이며 제목, 파일첨부, 내용, 자동등록방지 내용을 입력합니다.</caption><!-- 2018.11.19 캡션 내용에서 등록일 삭제 -->
								<colgroup>
									<col style="width: 170px">
									<col style="width: *">
									<col style="width: 170px">
									<col style="width: *">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="title">제목</label></th>
										<td colspan="3"><input type="text" name="title" id="title" value="${view.TITLE}" class="wid85"></td>
									</tr>
									<c:if test="${bean.board_name eq 'free' || bean.board_name eq 'pr'}">									
										<tr>
											<th scope="row"><label for="fname">이름</label></th>
											<td colspan="3">
												<input type="text" id="fname" name="name" value="${view.NAME}">
											</td>											
										</tr>
									</c:if>
									<tr>
										<th scope="row"><label for="file1">파일첨부</label></th>
										<td colspan="3">											
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
												<input type="file" id="file1" name="file1">
											</c:if>
											<input type="hidden" name="f_cnt" id="f_cnt" value="${q }" />
											<p class="fileNoti">* 파일첨부용량은 최대 5MB이며,<strong>파일이 여러개일 경우 압축하여 1개의 파일</strong>로 올려주세요.</p>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="content">내용</label></th>
										<td colspan="3">
											<textarea id="content" name="content">${view.CONTENT}</textarea>
											<script type="text/javascript">
												CKEDITOR.replace( 'content', {
													width: "100%",
													height: "300px",
													filebrowserUploadUrl: '/file/ckeditorImageUpload.do'
												});
											</script>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="captcha">자동등록방지</label></th>
										<td colspan="3" class="captchaArea">
											<a href="#none" onclick="playAudio();"><img src="/assets/user/images/common/audio.png" class="vm" style="width: 35px; height: 37px" alt="보안문자 음성 듣기"/>
											 <span class="captcha">											 	
											 	<img src="/captchaImage.do" id="captchaImg" class="vm" style="width: 148px; height: 36px" alt="보안문자 이미지">
											 </span>
											 <input type="text" id="captcha_input" name="captcha_input" title="보안문자 입력하기">
											 <button type="button" id="reload" onclick="javascript:reloadCaptcha();" class="btnTypeBasic colorGray"><span>새로고침</span></button>
											 <div id="audioPlayer" style="display: none;"></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btnArea center">
							<button type="button" id="updateBtn" class="btnTypeBasic sizeM"><span>완료</span></button>
							<button type="button" id="cancelBtn" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
						</div>
					</div>
					
>>>>>>> refs/heads/202204
		</form>