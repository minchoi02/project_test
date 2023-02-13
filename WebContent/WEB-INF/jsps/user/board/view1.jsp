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
		    		$("#modifyFrm").prop("action", "/${bean.menu}/${bean.menu_sub}/modify.do");
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
			    		$("#delFrm").prop("action", "/${bean.menu}/${bean.menu_sub}/delete.do");
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
<form name="frm" id="frm" method="post">
	<input type="hidden" name="search_name" id="search_name" value="${bean.search_name}" />
	<input type="hidden" name="search_value" id="search_value" value="${bean.search_value}" />
	<input type="hidden" name="page" id="page" value="${bean.page}" />
	<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
	<input type="hidden" name="seq" id="seq" value="${view.SEQ}" />
</form>                
                <div class="add-table-style"> 
                    <table class="add-board-write">
                		<tbody>
                            <tr>
                                <th class="text-center">제목</th>
                                <td class="text-left"  colspan="3">${view.TITLE}</td>
                			</tr>
                            <tr>
                                <th class="text-center">작성일</th>
                                <td class="text-left"><fmt:formatDate value="${view.REG_DATE}" pattern="yyyy-MM-dd" /></td>
                                <th class="text-center">조회수</th>
                                <td class="text-left">${view.HIT}</td>
                			</tr>                			
                			<tr>
                                <th class="text-center">내용</th>
                                <td class="text-left content"  colspan="3">
                                	${view.CONTENT}
                                </td>
                			</tr>
                			<tr>
                                <th class="text-center">첨부파일</th>
                                <td class="text-left"  colspan="3">
                                	<c:choose>
									<c:when test="${!empty file_list }">
										<ul>
										<c:forEach var="flist" items="${file_list }" varStatus="status">
											<li><a href="javascript:download('${flist.FILENAME}','${flist.REFILENAME}','${flist.PATH}');">${flist.FILENAME } <c:if test="${fn:length(file_list) != status.count}"></c:if></a></li>
										</c:forEach>
										</ul>
									</c:when>
									<c:otherwise>
										<ul><li>첨부파일이 없습니다.</li></ul>
									</c:otherwise>
								</c:choose>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="text-center">
                        <c:if test="${!empty view.PRE_SEQ}"><a class="mt50 sub_btn blue_btn" href="#none" id="pre_view">이전</a></c:if>
                        <a class="mt10 sub_btn gray_btn" href="#" id="list_btn">목록</a>
                        <c:if test="${!empty view.NEXT_SEQ}"><a class="mt10 sub_btn blue_btn" href="#none" id="next_view">다음</a></c:if>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <!--서브감싸기-->
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
		    		$("#modifyFrm").prop("action", "/${bean.menu}/${bean.menu_sub}/modify.do");
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
			    		$("#delFrm").prop("action", "/${bean.menu}/${bean.menu_sub}/delete.do");
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
<form name="frm" id="frm" method="post">
	<input type="hidden" name="search_name" id="search_name" value="${bean.search_name}" />
	<input type="hidden" name="search_value" id="search_value" value="${bean.search_value}" />
	<input type="hidden" name="page" id="page" value="${bean.page}" />
	<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
	<input type="hidden" name="seq" id="seq" value="${view.SEQ}" />
</form>                
                <div class="add-table-style"> 
                    <table class="add-board-write">
                		<tbody>
                            <tr>
                                <th class="text-center">제목</th>
                                <td class="text-left"  colspan="3">${view.TITLE}</td>
                			</tr>
                            <tr>
                                <th class="text-center">작성일</th>
                                <td class="text-left"><fmt:formatDate value="${view.REG_DATE}" pattern="yyyy-MM-dd" /></td>
                                <th class="text-center">조회수</th>
                                <td class="text-left">${view.HIT}</td>
                			</tr>                			
                			<tr>
                                <th class="text-center">내용</th>
                                <td class="text-left content"  colspan="3">
                                	${view.CONTENT}
                                </td>
                			</tr>
                			<tr>
                                <th class="text-center">첨부파일</th>
                                <td class="text-left"  colspan="3">
                                	<c:choose>
									<c:when test="${!empty file_list }">
										<ul>
										<c:forEach var="flist" items="${file_list }" varStatus="status">
											<li><a href="javascript:download('${flist.FILENAME}','${flist.REFILENAME}','${flist.PATH}');">${flist.FILENAME } <c:if test="${fn:length(file_list) != status.count}"></c:if></a></li>
										</c:forEach>
										</ul>
									</c:when>
									<c:otherwise>
										<ul><li>첨부파일이 없습니다.</li></ul>
									</c:otherwise>
								</c:choose>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="text-center">
                        <c:if test="${!empty view.PRE_SEQ}"><a class="mt50 sub_btn blue_btn" href="#none" id="pre_view">이전</a></c:if>
                        <a class="mt10 sub_btn gray_btn" href="#" id="list_btn">목록</a>
                        <c:if test="${!empty view.NEXT_SEQ}"><a class="mt10 sub_btn blue_btn" href="#none" id="next_view">다음</a></c:if>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <!--서브감싸기-->
>>>>>>> refs/heads/202204
