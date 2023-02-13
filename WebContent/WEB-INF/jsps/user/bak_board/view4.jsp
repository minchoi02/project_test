<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>

function download(o, c, t){
	location.href='/download.do?filename='+encodeURI(o)+'&refilename='+c+'&path='+t;
}

function setIFrameHeight(obj){
    if(obj.contentDocument){
        obj.height = obj.contentDocument.body.offsetHeight + 40;
    } else {
        obj.height = obj.contentWindow.document.body.scrollHeight;
    }
}

$(document).ready(function(){
	var title = "${view.SUBJECT}";
	$(".con_area img").each(function(index){
		index = index + 1;
		$(this).prop("alt", title + " 사진" + index);
	});
	
	$("#next_view").click(function(){
		$("#seq").val("${view.NEXT_SEQ}");
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/view.do");
		$("#frm").submit();
	});
	
	$("#pre_view").click(function(){
		$("#seq").val("${view.PRE_SEQ}");
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/view.do");
		$("#frm").submit();
	});
	
	$("#list_btn").click(function(){
		$("#seq").val("");
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/list.do");
		$("#frm").submit();
	});
	
	$("#modifyBtn").click(function(){
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/modify.do");
		$("#frm").submit();
	});
	
	$("#deleteBtn").click(function(){
		if(confirm("정말 삭제하시겠습니까?")){
			$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/delete.do");
			$("#frm").submit();	
		}		
	});
	
	$("#freeModifyBtn").click(function(){
		
		if( !valCheck('modifyPwd', '비밀번호를 입력해주세요.') ) return;
		
		$.ajax({
		    url: '/board/pwdConfirm.do?seq='+$('#modifySeq').val()+'&pwd='+$('#modifyPwd').val(),
		    type : "POST",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(r){
		    	if(r == 1){
		    		$("#modifyFrm").prop("action", "/board/${bean.menu_sub}/modify.do");
		    		$("#modifyFrm").submit();
		    	}else if(r == 0){
		    		alert('비밀번호가 일치하지 않습니다.');
		    		$("#modifyPwd").val("");
		    		$('#modifyPwd').focus();
		    	}else{
		    		alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
		    	}
		    }
		});

	});
	
	$("#freeDelBtn").click(function(){
		
		if( !valCheck('delPwd', '비밀번호를 입력해주세요.') ) return;
		
		$.ajax({
		    url: '/board/pwdConfirm.do?seq='+$('#delSeq').val()+'&pwd='+$('#delPwd').val(),
		    type : "POST",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(r){
		    	if(r == 1){
		    		if(confirm("정말 삭제하시겠습니까?")){
			    		$("#delFrm").prop("action", "/board/${bean.menu_sub}/delete.do");
			    		$("#delFrm").submit();
		    		}
		    	}else if(r == 0){
		    		alert('비밀번호가 일치하지 않습니다.');
		    		$("#delPwd").val("");
		    		$('#delPwd').focus();
		    	}else{
		    		alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
		    	}
		    }
		});

	});
});

</script>
<style>
.textInfo img {
	max-width: 100% !important;
	height: auto !important;
}
</style>
<form name="frm" id="frm" method="post">
	<input type="hidden" name="search_name" id="search_name" value="${bean.search_name}" />
	<input type="hidden" name="search_value" id="search_value" value="${bean.search_value}" />
	<input type="hidden" name="page" id="page" value="${bean.page}" />
	<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
	<input type="hidden" name="seq" id="seq" value="${view.SEQ}" />
</form>

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
												
						<div class="commView">
							<h4>${view.TITLE}</h4>
							<div class="dateInfo">
								<span><b>작성일 : </b><em><fmt:formatDate value="${view.REG_DATE}" pattern="yyyy-MM-dd" /></em></span>
								<span><b>조회수 : </b><em>${view.HIT}</em></span>
							</div>
							
							<c:if test="${bean.board_name ne 'counseling'}">
								<div class="textInfo">
									<iframe src="/board/getContent.do?seq=${view.SEQ}&gubun=${view.BOARD_NAME}" style="width: 100%;" onload="setIFrameHeight(this);" scrolling="no" title="게시글 내용"></iframe>
								</div>
							</c:if>
							<c:if test="${bean.board_name eq 'counseling' and bean.answerYn ne 'Y'}">
								<div class="textInfo">
									<iframe src="/board/getContent.do?seq=${view.SEQ}&gubun=${view.BOARD_NAME}" style="width: 100%;" onload="setIFrameHeight(this);" scrolling="no" title="게시글 내용"></iframe>
								</div>
							</c:if>
							<c:if test="${bean.board_name eq 'counseling' and bean.answerYn eq 'Y'}">	
								<!-- 상담게시판 질문 -->
								<div class="textInfoAnswer">
									<b>질문내용 : </b>
									<p><iframe src="/board/getContent.do?seq=${view.SEQ}&gubun=${view.BOARD_NAME}" style="width: 100%;" onload="setIFrameHeight(this);" scrolling="no" title="게시글 내용"></iframe></p>
								</div>
								<!--//상담게시판 질문 -->
								<div class="textInfo">
									<p class="answer"></p>
									${view.ANSWER}
								</div>
							</c:if>

							<div class="fileInfo">
								<b>첨부파일</b>
								<c:choose>
									<c:when test="${!empty file_list }">
										<ul>
										<c:forEach var="flist" items="${file_list }" varStatus="status">
											<li><a href="javascript:download('${flist.FILENAME}','${flist.REFILENAME}','${flist.PATH}');">${flist.FILENAME } <c:if test="${fn:length(file_list) != status.count}">/</c:if></a></li>
										</c:forEach>
										</ul>
									</c:when>
									<c:otherwise>
										<ul><li>첨부파일이 없습니다.</li></ul>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="prevNext">
								<c:if test="${!empty view.PRE_SEQ}"><p class="prev"><b>이전글 : </b><a href="#none" id="pre_view">${view.PRE_TITLE}</a></p></c:if>
								<c:if test="${empty view.PRE_SEQ}"><p class="prev"><b>이전글 : </b><a href="#none">이전글이 없습니다.</a></p></c:if>
								<c:if test="${!empty view.NEXT_SEQ}"><p class="next"><b>다음글 : </b><a href="#none" id="next_view">${view.NEXT_TITLE}</a></p></c:if>
								<c:if test="${empty view.NEXT_SEQ}"><p class="next"><b>다음글 : </b><a href="#none">다음글이 없습니다.</a></p></c:if>													
							</div>
						</div>
						<div class="btnArea">
							<c:if test="${bean.board_name eq 'free'}">
								<a href="#" class="btnTypeBasic sizeM colorGreen2" onclick="layerPopUp(this,'#layerPassword');"><span>수정</span></a>
								<a href="#" class="btnTypeBasic sizeM colorGray" onclick="layerPopUp(this,'#layerPassword2');"><span>삭제</span></a>
							</c:if>
							<c:if test="${bean.board_name eq 'promote' or bean.board_name eq 'event' or bean.board_name eq 'counseling'}">
								<c:if test="${userSession.SEQ eq view.MEMBER_SEQ}">
									<a href="#" id="modifyBtn" class="btnTypeBasic sizeM colorGreen2"><span>수정</span></a>
									<a href="#" id="deleteBtn" class="btnTypeBasic sizeM colorGray"><span>삭제</span></a>
								</c:if>
							</c:if>
							<c:if test="${bean.board_name eq 'empl' and userSession.KIND eq '직원'}">
								<c:if test="${userSession.SEQ eq view.MEMBER_SEQ}">
									<a href="#" id="modifyBtn" class="btnTypeBasic sizeM colorGreen2"><span>수정</span></a>
									<a href="#" id="deleteBtn" class="btnTypeBasic sizeM colorGray"><span>삭제</span></a>
								</c:if>
							</c:if>
							<a href="#" id="list_btn" class="btnTypeBasic sizeM"><span>목록</span></a>
						</div>
					</div>
					
					<c:if test="${bean.board_name eq 'free'}">
						<form name="modifyFrm" id="modifyFrm" method="post">
							<input type="hidden" id="modifySeq" name="seq" value="${view.SEQ}" />
							<!-- 레이어 팝업 -->
							<div class="layerWrapper confirmPassword" id="layerPassword">
								<div class="layerBox">
									<div class="layerHeader">
										<strong>비밀번호 확인</strong>
									</div>
									<div class="layerBody">
										<div class="innerBox">
											<p class="formbox">
												<label for="inputPassword">글 작성시 입력한 비밀번호를 입력해주세요.</label><input type="password" id="modifyPwd" name="pwd">
											</p>
											<div class="btnWrapper">
												<button type="button" id="freeModifyBtn" class="btnTypeBasic colorBlueGray sizeS"><span>확인</span></button>
												<button type="button" class="btnTypeBasic colorGray sizeS btnCloseLayer"><span>취소</span></button><!-- 닫기기능 .btnCloseLayer -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						<!-- //레이어팝업 -->
					</c:if>
					
					<c:if test="${bean.board_name eq 'free'}">
						<form name="delFrm" id="delFrm" method="post">
							<input type="hidden" id="delSeq" name="seq" value="${view.SEQ}" />
							<!-- 레이어 팝업 -->
							<div class="layerWrapper confirmPassword" id="layerPassword2">
								<div class="layerBox">
									<div class="layerHeader">
										<strong>비밀번호 확인</strong>
									</div>
									<div class="layerBody">
										<div class="innerBox">
											<p class="formbox">
												<label for="inputPassword">글 작성시 입력한 비밀번호를 입력해주세요.</label><input type="password" id="delPwd" name="pwd">
											</p>
											<div class="btnWrapper">
												<button type="button" id="freeDelBtn" class="btnTypeBasic colorBlueGray sizeS"><span>확인</span></button>
												<button type="button" class="btnTypeBasic colorGray sizeS btnCloseLayer"><span>취소</span></button><!-- 닫기기능 .btnCloseLayer -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						<!-- //레이어팝업 -->
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>

function download(o, c, t){
	location.href='/download.do?filename='+encodeURI(o)+'&refilename='+c+'&path='+t;
}

function setIFrameHeight(obj){
    if(obj.contentDocument){
        obj.height = obj.contentDocument.body.offsetHeight + 40;
    } else {
        obj.height = obj.contentWindow.document.body.scrollHeight;
    }
}

$(document).ready(function(){
	var title = "${view.SUBJECT}";
	$(".con_area img").each(function(index){
		index = index + 1;
		$(this).prop("alt", title + " 사진" + index);
	});
	
	$("#next_view").click(function(){
		$("#seq").val("${view.NEXT_SEQ}");
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/view.do");
		$("#frm").submit();
	});
	
	$("#pre_view").click(function(){
		$("#seq").val("${view.PRE_SEQ}");
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/view.do");
		$("#frm").submit();
	});
	
	$("#list_btn").click(function(){
		$("#seq").val("");
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/list.do");
		$("#frm").submit();
	});
	
	$("#modifyBtn").click(function(){
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/modify.do");
		$("#frm").submit();
	});
	
	$("#deleteBtn").click(function(){
		if(confirm("정말 삭제하시겠습니까?")){
			$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/delete.do");
			$("#frm").submit();	
		}		
	});
	
	$("#freeModifyBtn").click(function(){
		
		if( !valCheck('modifyPwd', '비밀번호를 입력해주세요.') ) return;
		
		$.ajax({
		    url: '/board/pwdConfirm.do?seq='+$('#modifySeq').val()+'&pwd='+$('#modifyPwd').val(),
		    type : "POST",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(r){
		    	if(r == 1){
		    		$("#modifyFrm").prop("action", "/board/${bean.menu_sub}/modify.do");
		    		$("#modifyFrm").submit();
		    	}else if(r == 0){
		    		alert('비밀번호가 일치하지 않습니다.');
		    		$("#modifyPwd").val("");
		    		$('#modifyPwd').focus();
		    	}else{
		    		alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
		    	}
		    }
		});

	});
	
	$("#freeDelBtn").click(function(){
		
		if( !valCheck('delPwd', '비밀번호를 입력해주세요.') ) return;
		
		$.ajax({
		    url: '/board/pwdConfirm.do?seq='+$('#delSeq').val()+'&pwd='+$('#delPwd').val(),
		    type : "POST",
		    error: function(){
		    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
		    },
		    success: function(r){
		    	if(r == 1){
		    		if(confirm("정말 삭제하시겠습니까?")){
			    		$("#delFrm").prop("action", "/board/${bean.menu_sub}/delete.do");
			    		$("#delFrm").submit();
		    		}
		    	}else if(r == 0){
		    		alert('비밀번호가 일치하지 않습니다.');
		    		$("#delPwd").val("");
		    		$('#delPwd').focus();
		    	}else{
		    		alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
		    	}
		    }
		});

	});
});

</script>
<style>
.textInfo img {
	max-width: 100% !important;
	height: auto !important;
}
</style>
<form name="frm" id="frm" method="post">
	<input type="hidden" name="search_name" id="search_name" value="${bean.search_name}" />
	<input type="hidden" name="search_value" id="search_value" value="${bean.search_value}" />
	<input type="hidden" name="page" id="page" value="${bean.page}" />
	<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
	<input type="hidden" name="seq" id="seq" value="${view.SEQ}" />
</form>

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
												
						<div class="commView">
							<h4>${view.TITLE}</h4>
							<div class="dateInfo">
								<span><b>작성일 : </b><em><fmt:formatDate value="${view.REG_DATE}" pattern="yyyy-MM-dd" /></em></span>
								<span><b>조회수 : </b><em>${view.HIT}</em></span>
							</div>
							
							<c:if test="${bean.board_name ne 'counseling'}">
								<div class="textInfo">
									<iframe src="/board/getContent.do?seq=${view.SEQ}&gubun=${view.BOARD_NAME}" style="width: 100%;" onload="setIFrameHeight(this);" scrolling="no" title="게시글 내용"></iframe>
								</div>
							</c:if>
							<c:if test="${bean.board_name eq 'counseling' and bean.answerYn ne 'Y'}">
								<div class="textInfo">
									<iframe src="/board/getContent.do?seq=${view.SEQ}&gubun=${view.BOARD_NAME}" style="width: 100%;" onload="setIFrameHeight(this);" scrolling="no" title="게시글 내용"></iframe>
								</div>
							</c:if>
							<c:if test="${bean.board_name eq 'counseling' and bean.answerYn eq 'Y'}">	
								<!-- 상담게시판 질문 -->
								<div class="textInfoAnswer">
									<b>질문내용 : </b>
									<p><iframe src="/board/getContent.do?seq=${view.SEQ}&gubun=${view.BOARD_NAME}" style="width: 100%;" onload="setIFrameHeight(this);" scrolling="no" title="게시글 내용"></iframe></p>
								</div>
								<!--//상담게시판 질문 -->
								<div class="textInfo">
									<p class="answer"></p>
									${view.ANSWER}
								</div>
							</c:if>

							<div class="fileInfo">
								<b>첨부파일</b>
								<c:choose>
									<c:when test="${!empty file_list }">
										<ul>
										<c:forEach var="flist" items="${file_list }" varStatus="status">
											<li><a href="javascript:download('${flist.FILENAME}','${flist.REFILENAME}','${flist.PATH}');">${flist.FILENAME } <c:if test="${fn:length(file_list) != status.count}">/</c:if></a></li>
										</c:forEach>
										</ul>
									</c:when>
									<c:otherwise>
										<ul><li>첨부파일이 없습니다.</li></ul>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="prevNext">
								<c:if test="${!empty view.PRE_SEQ}"><p class="prev"><b>이전글 : </b><a href="#none" id="pre_view">${view.PRE_TITLE}</a></p></c:if>
								<c:if test="${empty view.PRE_SEQ}"><p class="prev"><b>이전글 : </b><a href="#none">이전글이 없습니다.</a></p></c:if>
								<c:if test="${!empty view.NEXT_SEQ}"><p class="next"><b>다음글 : </b><a href="#none" id="next_view">${view.NEXT_TITLE}</a></p></c:if>
								<c:if test="${empty view.NEXT_SEQ}"><p class="next"><b>다음글 : </b><a href="#none">다음글이 없습니다.</a></p></c:if>													
							</div>
						</div>
						<div class="btnArea">
							<c:if test="${bean.board_name eq 'free'}">
								<a href="#" class="btnTypeBasic sizeM colorGreen2" onclick="layerPopUp(this,'#layerPassword');"><span>수정</span></a>
								<a href="#" class="btnTypeBasic sizeM colorGray" onclick="layerPopUp(this,'#layerPassword2');"><span>삭제</span></a>
							</c:if>
							<c:if test="${bean.board_name eq 'promote' or bean.board_name eq 'event' or bean.board_name eq 'counseling'}">
								<c:if test="${userSession.SEQ eq view.MEMBER_SEQ}">
									<a href="#" id="modifyBtn" class="btnTypeBasic sizeM colorGreen2"><span>수정</span></a>
									<a href="#" id="deleteBtn" class="btnTypeBasic sizeM colorGray"><span>삭제</span></a>
								</c:if>
							</c:if>
							<c:if test="${bean.board_name eq 'empl' and userSession.KIND eq '직원'}">
								<c:if test="${userSession.SEQ eq view.MEMBER_SEQ}">
									<a href="#" id="modifyBtn" class="btnTypeBasic sizeM colorGreen2"><span>수정</span></a>
									<a href="#" id="deleteBtn" class="btnTypeBasic sizeM colorGray"><span>삭제</span></a>
								</c:if>
							</c:if>
							<a href="#" id="list_btn" class="btnTypeBasic sizeM"><span>목록</span></a>
						</div>
					</div>
					
					<c:if test="${bean.board_name eq 'free'}">
						<form name="modifyFrm" id="modifyFrm" method="post">
							<input type="hidden" id="modifySeq" name="seq" value="${view.SEQ}" />
							<!-- 레이어 팝업 -->
							<div class="layerWrapper confirmPassword" id="layerPassword">
								<div class="layerBox">
									<div class="layerHeader">
										<strong>비밀번호 확인</strong>
									</div>
									<div class="layerBody">
										<div class="innerBox">
											<p class="formbox">
												<label for="inputPassword">글 작성시 입력한 비밀번호를 입력해주세요.</label><input type="password" id="modifyPwd" name="pwd">
											</p>
											<div class="btnWrapper">
												<button type="button" id="freeModifyBtn" class="btnTypeBasic colorBlueGray sizeS"><span>확인</span></button>
												<button type="button" class="btnTypeBasic colorGray sizeS btnCloseLayer"><span>취소</span></button><!-- 닫기기능 .btnCloseLayer -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						<!-- //레이어팝업 -->
					</c:if>
					
					<c:if test="${bean.board_name eq 'free'}">
						<form name="delFrm" id="delFrm" method="post">
							<input type="hidden" id="delSeq" name="seq" value="${view.SEQ}" />
							<!-- 레이어 팝업 -->
							<div class="layerWrapper confirmPassword" id="layerPassword2">
								<div class="layerBox">
									<div class="layerHeader">
										<strong>비밀번호 확인</strong>
									</div>
									<div class="layerBody">
										<div class="innerBox">
											<p class="formbox">
												<label for="inputPassword">글 작성시 입력한 비밀번호를 입력해주세요.</label><input type="password" id="delPwd" name="pwd">
											</p>
											<div class="btnWrapper">
												<button type="button" id="freeDelBtn" class="btnTypeBasic colorBlueGray sizeS"><span>확인</span></button>
												<button type="button" class="btnTypeBasic colorGray sizeS btnCloseLayer"><span>취소</span></button><!-- 닫기기능 .btnCloseLayer -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						<!-- //레이어팝업 -->
>>>>>>> refs/heads/202204
					</c:if>