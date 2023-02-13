<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<%@ page isELIgnored ="false" %>
<style>
td.left {text-align:left;}
td.left a {display:block;width:300px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis}
</style>
<script>
$(document).ready(function(){

	$('#btnSearch').click(function () {
	//	if(! valCheck('search_value','검색어를 입력하세요')) return;
	//	if(! lenCheck('search_value',2, '검색어는 2글자 이상 입력하세요')) return;
		$('#page').val(1);
		$('#pagelistno').val(1);
		$("#searchForm").prop("action", "/${bean.menu}/${bean.menu_sub}/list.do");
		$('#searchForm').submit();
	});
	
	$('input[name="search_value"]').keydown(function() {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	        $("#btnSearch").click();
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
		    		location.href = '/${bean.menu}/${bean.menu_sub}/view.do?seq=' + $("input[type=hidden][name=seq]").val();
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
	
});

function goView(seq){
// 	$("#seq").val(seq);
// 	$("#frm").attr("action", "/${bean.menu}/${bean.menu_sub}/view.do");
// 	$("#frm").submit();
	location.href = '/${bean.menu}/${bean.menu_sub}/view.do?seq=' + seq;
}

function goViewPr(seq){
	
	$("input[type=hidden][name=seq]").val(seq);
	
	layerPopUp(this,'#layerPassword');
	
	//location.href = '/${bean.menu}/${bean.menu_sub}/view.do?seq=' + seq;
}


function goAnswerView(seq){
	
	$("#seq").val(seq);
	$("#answerYn").val("Y");
	$("#frm").attr("action", "/${bean.menu}/${bean.menu_sub}/view.do");
	$("#frm").submit();
}

</script>
            
                <div class="add-board-total scrollreveal">
					
					<form name="searchForm" id="searchForm" method="post">
                    <div class="add-search">
                    	<div class="search-input notice">
                            <div class="add-model">
                            	<h1>검색</h1>
                                <select id="search_name" name="search_name" title="검색유형 선택">
                                  <option value="title" <c:if test="${bean.search_name eq 'title' }">selected=selected</c:if>>제목</option>
                                  <option value="content" <c:if test="${bean.search_name eq 'content' }">selected=selected</c:if>>내용</option>
                                </select>
                                <input type="text" class="" id="search_value" name="search_value" value="${bean.search_value }" placeholder="내용을 입력해 주세요" title="검색할 내용" >
                                <div class="search-btn"><button type="button" class="sc_btn" id="btnSearch"><i class="xi-search"></i> 검색</button></div>
                            </div>
                         </div>   
                    </div>
                    </form>
                    <div class="add-board">
                        <!-- <div class="count">총 <span>30</span> · 금일 <span>0건</span>의 게시물이 있습니다.</div> -->
                        <table width="100%" class="add-board-style" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="mobile-none">번호</td>
                                <td>제목</td>
                                <td>작성자</td>
                                <td>작성일</td>
                                <td>첨부파일</td>
                                <td>조회수</td>
                            </tr>
                            <c:if test="${!empty nlist}">
								<c:forEach var="list" items="${nlist}">
									<tr>
		                                <td class="mobile-none"><img src="/assets/user/images/icon_noti.png" alt="공지"></td>
		                                <td class="left"><a href="javascript:goView('${list.SEQ}');">${list.TITLE}</a></td>
		                                <td class="mobile-none">${list.NAME}</td>
	                                	<c:if test="${bean.board_name ne 'counseling'}">
											<td><fmt:formatDate value="${list.REG_DATE}" pattern="yyyy-MM-dd" /></td>
										</c:if>
		                                <td class="mobile-none"><c:if test="${list.F_CNT gt 0 }"><i class="xi-file-text"></i></c:if></td>
		                                <td class="mobile-none">${list.HIT}</td>
		                            </tr>
								</c:forEach>
							</c:if>
							<c:if test="${!empty list}">
								<c:forEach var="listA" items="${list}">
									<tr>
										<c:set var="q" value="${q+1 }" />
    										<td>${pageCount -q +1 }</td>      
										<c:if test="${bean.board_name ne 'counseling'}">
											<td class="left"><a href="javascript:goView('${listA.SEQ}');">${listA.TITLE}</a></td>
										</c:if>
										<c:if test="${bean.board_name eq 'counseling'}">			    									
											<td class="left consul"><a href="javascript:goView('${listA.SEQ}');" class="consulQ"><span>Q</span>${listA.TITLE}</a></td>
										</c:if>
										<td>${listA.NAME}</td>
										<c:if test="${bean.board_name ne 'counseling'}">	
											<td><fmt:formatDate value="${listA.REG_DATE}" pattern="yyyy-MM-dd" /></td>
										</c:if>
										<td><c:if test="${listA.F_CNT gt 0 }"><i class="xi-file-text"></i></c:if></td>
										<td>${listA.HIT}</td>
									</tr>
									<c:if test="${bean.board_name eq 'counseling' and not empty listA.ANSWER}">
										<tr>
	    									<td></td>			    									
											<td class="left consul"><a href="javascript:goAnswerView('${listA.SEQ}');" class="consulA"><span>A</span>${listA.TITLE}</a></td>
											<td></td>
											<td></td>  
											<c:if test="${bean.board_name ne 'counseling'}">	
												<td></td>
											</c:if>
											
											<td></td>
										</tr>
									</c:if>
									
								</c:forEach>
							</c:if>
							<c:if test="${empty list and empty nlist}">
								<tr>
									<td colspan="6" style="text-align:center;">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
                        </table>
    					${navi}
                        <!-- <div class="text-right"><a class="mt50 sub_btn blue_btn" href="./sub2_write.php?top=2&sub=1">글쓰기</a></div> -->
                    </div>
                </div>
            </div>
        </div>
	</div>
    <!--서브감싸기-->
	
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<%@ page isELIgnored ="false" %>
<style>
td.left {text-align:left;}
td.left a {display:block;width:300px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis}
</style>
<script>
$(document).ready(function(){

	$('#btnSearch').click(function () {
	//	if(! valCheck('search_value','검색어를 입력하세요')) return;
	//	if(! lenCheck('search_value',2, '검색어는 2글자 이상 입력하세요')) return;
		$('#page').val(1);
		$('#pagelistno').val(1);
		$("#searchForm").prop("action", "/${bean.menu}/${bean.menu_sub}/list.do");
		$('#searchForm').submit();
	});
	
	$('input[name="search_value"]').keydown(function() {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	        $("#btnSearch").click();
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
		    		location.href = '/${bean.menu}/${bean.menu_sub}/view.do?seq=' + $("input[type=hidden][name=seq]").val();
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
	
});

function goView(seq){
// 	$("#seq").val(seq);
// 	$("#frm").attr("action", "/${bean.menu}/${bean.menu_sub}/view.do");
// 	$("#frm").submit();
	location.href = '/${bean.menu}/${bean.menu_sub}/view.do?seq=' + seq;
}

function goViewPr(seq){
	
	$("input[type=hidden][name=seq]").val(seq);
	
	layerPopUp(this,'#layerPassword');
	
	//location.href = '/${bean.menu}/${bean.menu_sub}/view.do?seq=' + seq;
}


function goAnswerView(seq){
	
	$("#seq").val(seq);
	$("#answerYn").val("Y");
	$("#frm").attr("action", "/${bean.menu}/${bean.menu_sub}/view.do");
	$("#frm").submit();
}

</script>
            
                <div class="add-board-total scrollreveal">
					
					<form name="searchForm" id="searchForm" method="post">
                    <div class="add-search">
                    	<div class="search-input notice">
                            <div class="add-model">
                            	<h1>검색</h1>
                                <select id="search_name" name="search_name" title="검색유형 선택">
                                  <option value="title" <c:if test="${bean.search_name eq 'title' }">selected=selected</c:if>>제목</option>
                                  <option value="content" <c:if test="${bean.search_name eq 'content' }">selected=selected</c:if>>내용</option>
                                </select>
                                <input type="text" class="" id="search_value" name="search_value" value="${bean.search_value }" placeholder="내용을 입력해 주세요" title="검색할 내용" >
                                <div class="search-btn"><button type="button" class="sc_btn" id="btnSearch"><i class="xi-search"></i> 검색</button></div>
                            </div>
                         </div>   
                    </div>
                    </form>
                    <div class="add-board">
                        <!-- <div class="count">총 <span>30</span> · 금일 <span>0건</span>의 게시물이 있습니다.</div> -->
                        <table width="100%" class="add-board-style" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="mobile-none">번호</td>
                                <td>제목</td>
                                <td>작성자</td>
                                <td>작성일</td>
                                <td>첨부파일</td>
                                <td>조회수</td>
                            </tr>
                            <c:if test="${!empty nlist}">
								<c:forEach var="list" items="${nlist}">
									<tr>
		                                <td class="mobile-none"><img src="/assets/user/images/icon_noti.png" alt="공지"></td>
		                                <td class="left"><a href="javascript:goView('${list.SEQ}');">${list.TITLE}</a></td>
		                                <td class="mobile-none">${list.NAME}</td>
	                                	<c:if test="${bean.board_name ne 'counseling'}">
											<td><fmt:formatDate value="${list.REG_DATE}" pattern="yyyy-MM-dd" /></td>
										</c:if>
		                                <td class="mobile-none"><c:if test="${list.F_CNT gt 0 }"><i class="xi-file-text"></i></c:if></td>
		                                <td class="mobile-none">${list.HIT}</td>
		                            </tr>
								</c:forEach>
							</c:if>
							<c:if test="${!empty list}">
								<c:forEach var="listA" items="${list}">
									<tr>
										<c:set var="q" value="${q+1 }" />
    										<td>${pageCount -q +1 }</td>      
										<c:if test="${bean.board_name ne 'counseling'}">
											<td class="left"><a href="javascript:goView('${listA.SEQ}');">${listA.TITLE}</a></td>
										</c:if>
										<c:if test="${bean.board_name eq 'counseling'}">			    									
											<td class="left consul"><a href="javascript:goView('${listA.SEQ}');" class="consulQ"><span>Q</span>${listA.TITLE}</a></td>
										</c:if>
										<td>${listA.NAME}</td>
										<c:if test="${bean.board_name ne 'counseling'}">	
											<td><fmt:formatDate value="${listA.REG_DATE}" pattern="yyyy-MM-dd" /></td>
										</c:if>
										<td><c:if test="${listA.F_CNT gt 0 }"><i class="xi-file-text"></i></c:if></td>
										<td>${listA.HIT}</td>
									</tr>
									<c:if test="${bean.board_name eq 'counseling' and not empty listA.ANSWER}">
										<tr>
	    									<td></td>			    									
											<td class="left consul"><a href="javascript:goAnswerView('${listA.SEQ}');" class="consulA"><span>A</span>${listA.TITLE}</a></td>
											<td></td>
											<td></td>  
											<c:if test="${bean.board_name ne 'counseling'}">	
												<td></td>
											</c:if>
											
											<td></td>
										</tr>
									</c:if>
									
								</c:forEach>
							</c:if>
							<c:if test="${empty list and empty nlist}">
								<tr>
									<td colspan="6" style="text-align:center;">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
                        </table>
    					${navi}
                        <!-- <div class="text-right"><a class="mt50 sub_btn blue_btn" href="./sub2_write.php?top=2&sub=1">글쓰기</a></div> -->
                    </div>
                </div>
            </div>
        </div>
	</div>
    <!--서브감싸기-->
	
>>>>>>> refs/heads/202204
