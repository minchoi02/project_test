<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
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
					<div class="contsArea communicationNotice">
						<c:if test="${bean.board_name eq 'notice'}">
							<p class="textParaList">공지사항을 안내하여 드립니다.</p>
						</c:if>
						<c:if test="${bean.board_name eq 'data'}">
							<p class="textParaList">장애인 복지와 관련된 다양한 서식, 자료들을 공유합니다.</p>
						</c:if>
						<c:if test="${bean.board_name eq 'promote'}">
							<p class="textParaList">대전광역시, 유관기관 등의 다양한 행사와 프로그램 지원소식 등 정보를 나누는 공간입니다.</p>
						</c:if>
						<c:if test="${bean.board_name eq 'event'}">
							<p class="textParaList">우리지역의 다양한 이벤트의 참여기회를 나누고 공유합니다.</p>
						</c:if>
						<c:if test="${bean.board_name eq 'counseling'}">
							<p class="textParaList">장애인 복지에 관련된 사항을 편리하게 상담을 받아보실 수 있습니다.</p>
						</c:if>
						
						<form name="searchForm" id="searchForm" method="post">
							<div class="searchTypeBoard">
								<div class="srchInnerBox">
									<select id="search_name" name="search_name" title="검색유형 선택">
										<option value="title" <c:if test="${bean.search_name eq 'title' }">selected=selected</c:if>>제목</option>
			              				<option value="content" <c:if test="${bean.search_name eq 'content' }">selected=selected</c:if>>내용</option>
									</select>
									<input type="text" id="search_value" name="search_value" value="${bean.search_value }" placeholder="내용을 입력해 주세요" title="검색할 내용">
									<button type="button" class="btnTypeBasic" id="btnSearch">
										<span>검색</span>
									</button>
								</div>
							</div>
						</form>
						
						<form name="frm" id="frm" method="post">
							<input type="hidden" name="search_name" value="${bean.search_name}" />
							<input type="hidden" name="search_value" value="${bean.search_value}" />
							<input type="hidden" name="page" id="page" value="${bean.page}" />
							<input type="hidden" name="seq" id="seq" value="" />
							<input type="hidden" name="answerYn" id="answerYn" value="N" />
							
							<!-- list -->
							<div class="commList">
								<table class="boardTypeCol">
									<caption>공지사항 목록이며 번호, 제목, 첨부파일, 등록일, 조회수를 제공하고 제목 링크를 통해 상세페이지로 이동합니다.</caption>
									<colgroup>
										<col style="width: 90px">
										<col style="width: 440px">
										<col style="width: 95px">
										<col style="width: 100px">
										<c:if test="${bean.board_name ne 'counseling'}">
											<col style="width: 115px">
										</c:if>
										
										<col style="width: 90px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">첨부파일</th>
											<th scope="col">등록자</th>
											<c:if test="${bean.board_name ne 'counseling'}">
												<th scope="col">등록일</th>
											</c:if>
											
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${!empty nlist}">
											<c:forEach var="list" items="${nlist}">
												<tr>
													<td><img src="/assets/user/images/icon_noti.png" alt="공지"></td>
													<td class="left"><a href="javascript:goView('${list.SEQ}');">${list.TITLE}</a></td>
													<td><c:if test="${list.F_CNT gt 0 }"><img src="/assets/user/images/icon_file.png" alt="파일" class="am" /></c:if></td>
													<td>${list.NAME}</td>
													<c:if test="${bean.board_name ne 'counseling'}">
														<td><fmt:formatDate value="${list.REG_DATE}" pattern="yyyy-MM-dd" /></td>
													</c:if>
													
													<td>${list.HIT}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty list and empty nlist}">
											<tr>
												<td colspan="6" style="text-align:center;">등록된 글이 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${bean.board_name eq 'pr'}">
											<c:if test="${!empty list}">
												<c:forEach var="listA" items="${list}">
													<tr>
														<c:set var="q" value="${q+1 }" />
				    										<td>${pageCount -q +1 }</td>      
														<c:if test="${bean.board_name ne 'counseling'}">
															<td class="left"><a href="javascript:goViewPr('${listA.SEQ}');">${listA.TITLE}</a></td>
														</c:if>
														<c:if test="${bean.board_name eq 'counseling'}">			    									
															<td class="left consul"><a href="javascript:goView('${listA.SEQ}');" class="consulQ"><span>Q</span>${listA.TITLE}</a></td>
														</c:if>
														<td><c:if test="${listA.F_CNT gt 0 }"><img src="/assets/user/images/icon_file.png" alt="파일" class="am" /></c:if></td>
														<td>${listA.NAME}</td>
														<c:if test="${bean.board_name ne 'counseling'}">	
															<td><fmt:formatDate value="${listA.REG_DATE}" pattern="yyyy-MM-dd" /></td>
														</c:if>
														
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
										</c:if>
										<c:if test="${bean.board_name ne 'pr'}">
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
														<td><c:if test="${listA.F_CNT gt 0 }"><img src="/assets/user/images/icon_file.png" alt="파일" class="am" /></c:if></td>
														<td>${listA.NAME}</td>
														<c:if test="${bean.board_name ne 'counseling'}">	
															<td><fmt:formatDate value="${listA.REG_DATE}" pattern="yyyy-MM-dd" /></td>
														</c:if>
														
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
										</c:if>
									</tbody>
								</table>
							</div>
							<!--//list -->
							
							<c:if test="${bean.board_name eq 'promote' or bean.board_name eq 'event' or bean.board_name eq 'pr' or bean.board_name eq 'free' or bean.board_name eq 'counseling'}">
								<div class="btnArea">
									<a href="/${bean.menu}/${bean.menu_sub}/write.do" class="btnTypeBasic sizeM"><span>글쓰기</span></a>
								</div>
							</c:if>
							
							<c:if test="${bean.board_name eq 'empl' and userSession.KIND eq '직원'}">
								<div class="btnArea">
									<a href="/${bean.menu}/${bean.menu_sub}/write.do" class="btnTypeBasic sizeM"><span>글쓰기</span></a>
								</div>
							</c:if>
						
							${navi}
						</form>
					</div>
					
					
					
					<c:if test="${bean.board_name eq 'pr'}">
						<form name="modifyFrm" id="modifyFrm" method="post">
							<input type="hidden" id="modifySeq" name="seq" value="" />
							<!-- 레이어 팝업 -->
							<div class="layerWrapper confirmPassword" id="layerPassword">
								<div class="layerBox">
									<div class="layerHeader">
										<strong>비밀번호 확인</strong>
									</div>
									<div class="layerBody">
										<div class="innerBox">
											<p class="formbox">
												<label for="modifyPwd">글 작성시 입력한 비밀번호를 입력해주세요.</label><input type="password" id="modifyPwd" name="pwd">
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