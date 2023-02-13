<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>

function setIFrameHeight(obj){
    if(obj.contentDocument){
        obj.height = obj.contentDocument.body.offsetHeight + 40;
    } else {
        obj.height = obj.contentWindow.document.body.scrollHeight;
    }
}

$(document).ready(function(){


	$('#btnSearch').click(function () {
	//	if(! valCheck('search_value','검색어를 입력하세요')) return;
	//	if(! lenCheck('search_value',2, '검색어는 2글자 이상 입력하세요')) return;
		//$('#page').val(1);
		//$('#pagelistno').val(1);
		$('#searchForm').submit();
	});
	
	$(document).on("click", ".panelTitle", function(){
		var seq = $(this).attr("param");		
		$(this).next().children("iframe").attr("src", "/custom_info/getContent.do?seq=" + seq);
	});

});

function moveTab(group_seq){
	
	var loading = "";
		loading+= "<div style='width: 100%; height: 400px; text-align: center; padding-top: 100px;'>";
		loading+= "	<img src='/assets/user/images/loading.gif' style='width: 100px; height: 100px;'/>";
		loading+= "</div>";
	$("#personalizedTab" + group_seq).children(".accordionConts").html(loading);
	
	$("#group_seq").val(group_seq);
	var formData = $("#searchForm").serialize();
	
	$.ajax({
	    url: '/custom_info/a_1_moveTab.do',
	    type : "POST",
	    data: formData,
	    error: function(){
	    	alert('에러가 발생했습니다. 관리자에 문의하세요.');
	    },
	    success: function(list){
	    	
	    	var html = "";
	    		html+= "<ul>";
	    		
	    		for (var i = 0; i < list.length; i++) {
					var seq = list[i].SEQ;
					var title = list[i].TITLE;
					
					console.log(title);
					
					html += "<li>";
					html += " <a href='##' class='panelTitle' param='" + seq + "'><strong>" + title + "</strong><span class='hidden'>내용열기</span></a> ";
					html += " <div class='panelContent'>";
					html += " 	<iframe src='' style='width: 100%; height: 100vh;'  title='복지 내용'></iframe>";
					html += " </div>";
					html += "</li>";
				}

				html+= "</ul>";
	    	$("#personalizedTab" + group_seq).children(".accordionConts").html(html);
	    	fn_panelAccordion();
	    	$('iframe').iframeAutoHeight({heightOffset: 10});
	    }
	});
}
</script>

		<form name="searchForm" id="searchForm" method="post" action="/custom_info/a_1.do">
			<input type="hidden" name="group_seq" id="group_seq" value="" />
					<div class="contsArea personalizedInfo">
						<p class="textPara_top">'개별맞춤' 메뉴를 선택 후 검색하시면 원하시는 '복지서비스' 정보를 보실 수 있습니다.</p>

						<!-- 검색박스 -->
						<div class="searchBoxWrap">
							<p class="rowOptions">
								<span>
									<label for="search_type_seq">장애유형</label>
									<select name="search_type_seq" id="search_type_seq">
										<option value="">전체</option>
										<c:forEach var="list" items="${selType4List}">
											<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_type_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
										</c:forEach>
									</select>	
								</span>
								<span>
									<label for="search_grade_seq">장애등급</label>
									<select name="search_grade_seq" id="search_grade_seq">
										<option value="">전체</option>
										<c:forEach var="list" items="${selType5List}">
											<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_grade_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
										</c:forEach>
									</select>
								</span>
								<span>
									<label for="search_area_seq">지역</label>
									<select name="search_area_seq" id="search_area_seq">
										<option value="">전체</option>
										<c:forEach var="list" items="${selType6List}">
											<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_area_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
										</c:forEach>
									</select>	
								</span>
								<span class="">
									<label for="search_sex_seq">성별</label>
									<select id="search_sex_seq" name="search_sex_seq">
										<option value="">선택</option>
										<c:forEach var="list" items="${selType3List}">
											<option value="${list.SEQ}" <c:if test="${list.SEQ != '' and list.SEQ == bean.search_sex_seq}">selected="selected"</c:if>>${list.CODE_DESC}</option>
										</c:forEach>
									</select>
								</span>
							</p>
							<p class="rowSrchWords">
								<span><label for="search_content">검색어</label><input type="text" id="search_content" name="search_content" value="${bean.search_content}"></span>
								<span><button type="button" id="btnSearch" class="btnTypeBasic">검색</button></span>
							</p>
						</div>
						<!-- //검색박스 -->

						<!-- 탭 -->
						<div class="tabMenuWrapper">
							<div class="tabMenu num6">
								<div>
									<div class="btnTab"><a href="#personalizedTab1" onclick="moveTab('1')"><span>생활안정 (<em>${search_count_1}</em>)</span></a></div>
									<div class="btnTab"><a href="#personalizedTab2" onclick="moveTab('2')"><span>가족지원 (<em>${search_count_2}</em>)</span></a></div>
									<div class="btnTab"><a href="#personalizedTab3" onclick="moveTab('3')"><span>고용 (<em>${search_count_3}</em>)</span></a></div>
									<div class="btnTab"><a href="#personalizedTab4" onclick="moveTab('4')"><span>거주이용 (<em>${search_count_4}</em>)</span></a></div>
									<div class="btnTab"><a href="#personalizedTab5" onclick="moveTab('5')"><span>교육·상담 (<em>${search_count_5}</em>)</span></a></div>
									<div class="btnTab"><a href="#personalizedTab6" onclick="moveTab('6')"><span>건강·의료 (<em>${search_count_6}</em>)</span></a></div>

									<div class="btnTab"><a href="#personalizedTab7" onclick="moveTab('7')"><span>문화·여가 (<em>${search_count_7}</em>)</span></a></div>
									<div class="btnTab"><a href="#personalizedTab8" onclick="moveTab('8')"><span>편의 (<em>${search_count_8}</em>)</span></a></div>
									<div class="btnTab"><a href="#personalizedTab9" onclick="moveTab('9')"><span>보조기기 (<em>${search_count_9}</em>)</span></a></div>
									<div class="btnTab"><a href="#personalizedTab10" onclick="moveTab('10')"><span>바우처 (<em>${search_count_10}</em>)</span></a></div>
									<div class="btnTab"><a href="#personalizedTab177" onclick="moveTab('177')"><span>기타 (<em>${search_count_11}</em>)</span></a></div>
									<div class="btnTab typeViewAll"><a href="#personalizedTaball" onclick="moveTab('all')"><span>전체 정보보기</span></a></div>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTab1">
								<p class="contsSubTit">생활안정(<span>${search_count_1}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTab2">
								<p class="contsSubTit">가족지원(<span>${search_count_2}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list_2}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTab3">
								<p class="contsSubTit">고용(<span>${search_count_3}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list_3}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTab4">
								<p class="contsSubTit">거주이용(<span>${search_count_4}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list_4}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTab5">
								<p class="contsSubTit">교육·상담(<span>${search_count_5}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list_5}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTab6">
								<p class="contsSubTit">건강·의료(<span>${search_count_6}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list_6}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTab7">
								<p class="contsSubTit">문화·여가(<span>${search_count_7}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list_7}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTab8">
								<p class="contsSubTit">편의(<span>${search_count_8}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list_8}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTab9">
								<p class="contsSubTit">보조기기(<span>${search_count_9}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list_9}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTab10">
								<p class="contsSubTit">바우처(<span>${search_count_10}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list_10}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTab177">
								<p class="contsSubTit">기타(<span>${search_count_11}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list_11}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>

							<div class="tabContBox" id="personalizedTaball">
								<p class="contsSubTit">전체 정보보기(<span>${search_count_total}</span>)</p>
								<div class="accordionConts">
									<ul>
										<c:forEach var="list" items="${search_list_total}">
											<li>
												<a href="#" class="panelTitle" param="${list.SEQ}"><strong>${list.TITLE}</strong><span class="hidden">내용열기</span></a>
												<div class="panelContent">
													<iframe src="" style="width: 100%; height: 100vh;"  title="복지 내용"></iframe>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>


						</div>
						<!-- //탭 -->
					</div>
			</form>