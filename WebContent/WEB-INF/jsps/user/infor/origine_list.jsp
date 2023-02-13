<<<<<<< HEAD
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
		$("#searchForm").attr("action", "/infor/origine_list.do");
		$('#searchForm').submit();
	});
	
	$('#search_area_seq').change(function () {
		var thisVal = $(this).val();
		if(thisVal == "38"){
			$('#daejeonArea1').click();
		}else if(thisVal == "37"){
			$('#daejeonArea2').click();
		}else if(thisVal == "40"){
			$('#daejeonArea3').click();
		}else if(thisVal == "39"){
			$('#daejeonArea4').click();
		}else if(thisVal == "41"){
			$('#daejeonArea5').click();
		}
	});
		
	
});

function goView(seq){
	
	$("#frm_search_kind_seq").val($("#search_kind_seq").val());
	$("#frm_search_area_seq").val($("#search_area_seq").val());
	$("#frm_search_content").val($("#search_content").val());
	
	$("#seq").val(seq);
	$("#frm").attr("action", "/infor/origine_view.do");
	$("#frm").submit();
}

function download(o, c, t){
	location.href='/download.do?filename='+encodeURI(o)+'&refilename='+c+'&path='+t;
}

</script>
	            
                <div class="add-board-total scrollreveal">

					<div class="process_txt">
						<div class="process_wrap">
							<div class="box1">
								<h1>뿌리기업 리스트 <span>총 674개사</span></h1>
							</div>

							<div class="box2">
								<div class="list">
									<div class="num"><i class="xi-opacity"></i>&nbsp;&nbsp;<span class="txt">주조</span>&nbsp; <span class="spnum">39</span>개사</div>
									
								</div>

								<div class="list">
									<div class="num"><i class="xi-valign-center"></i>&nbsp;&nbsp;<span class="txt">금형</span>&nbsp; <span class="spnum">154</span>개사</div>
								</div>


							</div>

							<div class="box3">
								<div class="list">
									<div class="num"><i class="xi-spinner-1"></i>&nbsp;&nbsp;<span class="txt">용접</span>&nbsp; <span class="spnum">160</span>개사</div>
								</div>

								<div class="list">
									<div class="num"><i class="xi-lightbulb-o"></i>&nbsp;&nbsp;<span class="txt">열처리</span>&nbsp; <span class="spnum">18</span>개사</div>
								</div>


							</div>


							<div class="box4">
								<div class="list">
									<div class="num"><i class="xi-expand-square"></i>&nbsp;&nbsp;<span class="txt">표면처리</span>&nbsp; <span class="spnum">100</span>개사</div>
								</div>

								<div class="list">
									<div class="num"><i class="xi-wrench"></i>&nbsp;&nbsp;<span class="txt">소성가공</span>&nbsp; <span class="spnum">203</span>개사</div>

								</div>

							</div>
						</div>
					</div>
                    <div class="add-search">
                    	<div class="search-input root">
                            <div class="add-check location">
								<input type="checkbox"/> <span class="check_tit">주조</span>
								<input type="checkbox"/> <span class="check_tit">금형</span>
								<input type="checkbox"/> <span class="check_tit">소성가공</span>
								<input type="checkbox"/> <span class="check_tit">용접</span>
								<input type="checkbox"/> <span class="check_tit">표면처리</span>
								<input type="checkbox"/> <span class="check_tit">열처리</span>
                            </div>

                            <div class="add-keyword">
                                <h1>키워드</h1>
                                <input class="" type="text" placeholder="검색어를 입력하세요." >
                            </div>
                        </div>
                        <div class="search-btn"><button type="button" class="rs_btn"><i class="xi-rotate-right"></i> 초기화</button><button type="button" class="sc_btn"><i class="xi-search"></i> 검색</button></div>
                    </div>
                    <div class="add-board">
                    <div class="count"><!-- 총 <span>30</span> · 금일 <span>0건</span>의 게시물이 있습니다. --></div>

                    <div class="text-right">
                        <a href="javascript:download('뿌리기업현황 다운로드.xlsx','origine_company.xlsx','/file/');" class="sub_btn gray_btn"><i class="xi-folder-download-o"></i> 뿌리기업현황 다운로드</a>                        
                    </div>
                    <form name="frm" id="frm" method="post">
					<input type="hidden" name="page" id="page" value="${bean.page}" />
					<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
					
					<input type="hidden" name="seq" id="seq" value="" />
					
					<input type="hidden" name="search_kind_seq" id="frm_search_kind_seq" value="${bean.search_kind_seq}" />
					<input type="hidden" name="search_area_seq" id="frm_search_area_seq" value="${bean.search_area_seq}" />
					<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
					
                    <table width="100%" class="add-board-style" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="mobile-none">번호</td>
                            <td>기업명</td>
                            <td>대표자</td>
                            <td>주소</td>
                            <td>전화번호</td>
							<td>업종</td>
							<td>홈페이지</td>
                        </tr>
                        <c:if test="${!empty list}">
							<c:forEach var="list" items="${list}">
							<c:set var="q" value="${q+1 }" />
		                        <tr>
		                            <td class="mobile-none">${pageCount -q +1 }</td>
		                            <td><a href="javascript:goView('${list.SEQ}');">${list.FNAME}</a></td>
		                            <td><a href="javascript:goView('${list.SEQ}');">${list.FCEO}</a></td>
		                            <td><a href="javascript:goView('${list.SEQ}');">${list.FZIPCODE} ${list.FADDRESS1} ${list.FADDRESS2}</a></td>
		                            <td><a href="tel:042-934-1685">${fn:substring(list.FPHONE,0,fn:length(list.FPHONE)-3)}***</a></td>
		                            <td>${list.FCATEGORY_NM}</td>
		                            <td></td>
		                        </tr>
	                        </c:forEach>
						</c:if>
						<c:if test="${empty list and empty nlist}">
							<tr>
								<td colspan="7" style="text-align:center;">등록된 글이 없습니다.</td>
							</tr>
						</c:if>		
                    </table>
                    ${navi}
                    </form>
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

$(document).ready(function(){

	$('#btnSearch').click(function () {
	//	if(! valCheck('search_value','검색어를 입력하세요')) return;
	//	if(! lenCheck('search_value',2, '검색어는 2글자 이상 입력하세요')) return;
		$('#page').val(1);
		$('#pagelistno').val(1);
		$("#searchForm").attr("action", "/infor/origine_list.do");
		$('#searchForm').submit();
	});
	
	$('#search_area_seq').change(function () {
		var thisVal = $(this).val();
		if(thisVal == "38"){
			$('#daejeonArea1').click();
		}else if(thisVal == "37"){
			$('#daejeonArea2').click();
		}else if(thisVal == "40"){
			$('#daejeonArea3').click();
		}else if(thisVal == "39"){
			$('#daejeonArea4').click();
		}else if(thisVal == "41"){
			$('#daejeonArea5').click();
		}
	});
		
	
});

function goView(seq){
	
	$("#frm_search_kind_seq").val($("#search_kind_seq").val());
	$("#frm_search_area_seq").val($("#search_area_seq").val());
	$("#frm_search_content").val($("#search_content").val());
	
	$("#seq").val(seq);
	$("#frm").attr("action", "/infor/origine_view.do");
	$("#frm").submit();
}

function download(o, c, t){
	location.href='/download.do?filename='+encodeURI(o)+'&refilename='+c+'&path='+t;
}

</script>
	            
                <div class="add-board-total scrollreveal">

					<div class="process_txt">
						<div class="process_wrap">
							<div class="box1">
								<h1>뿌리기업 리스트 <span>총 674개사</span></h1>
							</div>

							<div class="box2">
								<div class="list">
									<div class="num"><i class="xi-opacity"></i>&nbsp;&nbsp;<span class="txt">주조</span>&nbsp; <span class="spnum">39</span>개사</div>
									
								</div>

								<div class="list">
									<div class="num"><i class="xi-valign-center"></i>&nbsp;&nbsp;<span class="txt">금형</span>&nbsp; <span class="spnum">154</span>개사</div>
								</div>


							</div>

							<div class="box3">
								<div class="list">
									<div class="num"><i class="xi-spinner-1"></i>&nbsp;&nbsp;<span class="txt">용접</span>&nbsp; <span class="spnum">160</span>개사</div>
								</div>

								<div class="list">
									<div class="num"><i class="xi-lightbulb-o"></i>&nbsp;&nbsp;<span class="txt">열처리</span>&nbsp; <span class="spnum">18</span>개사</div>
								</div>


							</div>


							<div class="box4">
								<div class="list">
									<div class="num"><i class="xi-expand-square"></i>&nbsp;&nbsp;<span class="txt">표면처리</span>&nbsp; <span class="spnum">100</span>개사</div>
								</div>

								<div class="list">
									<div class="num"><i class="xi-wrench"></i>&nbsp;&nbsp;<span class="txt">소성가공</span>&nbsp; <span class="spnum">203</span>개사</div>

								</div>

							</div>
						</div>
					</div>
                    <div class="add-search">
                    	<div class="search-input root">
                            <div class="add-check location">
								<input type="checkbox"/> <span class="check_tit">주조</span>
								<input type="checkbox"/> <span class="check_tit">금형</span>
								<input type="checkbox"/> <span class="check_tit">소성가공</span>
								<input type="checkbox"/> <span class="check_tit">용접</span>
								<input type="checkbox"/> <span class="check_tit">표면처리</span>
								<input type="checkbox"/> <span class="check_tit">열처리</span>
                            </div>

                            <div class="add-keyword">
                                <h1>키워드</h1>
                                <input class="" type="text" placeholder="검색어를 입력하세요." >
                            </div>
                        </div>
                        <div class="search-btn"><button type="button" class="rs_btn"><i class="xi-rotate-right"></i> 초기화</button><button type="button" class="sc_btn"><i class="xi-search"></i> 검색</button></div>
                    </div>
                    <div class="add-board">
                    <div class="count"><!-- 총 <span>30</span> · 금일 <span>0건</span>의 게시물이 있습니다. --></div>

                    <div class="text-right">
                        <a href="javascript:download('뿌리기업현황 다운로드.xlsx','origine_company.xlsx','/file/');" class="sub_btn gray_btn"><i class="xi-folder-download-o"></i> 뿌리기업현황 다운로드</a>                        
                    </div>
                    <form name="frm" id="frm" method="post">
					<input type="hidden" name="page" id="page" value="${bean.page}" />
					<input type="hidden" name="pagelistno" id="pagelistno" value="${bean.pagelistno}" />
					
					<input type="hidden" name="seq" id="seq" value="" />
					
					<input type="hidden" name="search_kind_seq" id="frm_search_kind_seq" value="${bean.search_kind_seq}" />
					<input type="hidden" name="search_area_seq" id="frm_search_area_seq" value="${bean.search_area_seq}" />
					<input type="hidden" name="search_content" id="frm_search_content" value="${bean.search_content}" />
					
                    <table width="100%" class="add-board-style" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="mobile-none">번호</td>
                            <td>기업명</td>
                            <td>대표자</td>
                            <td>주소</td>
                            <td>전화번호</td>
							<td>업종</td>
							<td>홈페이지</td>
                        </tr>
                        <c:if test="${!empty list}">
							<c:forEach var="list" items="${list}">
							<c:set var="q" value="${q+1 }" />
		                        <tr>
		                            <td class="mobile-none">${pageCount -q +1 }</td>
		                            <td><a href="javascript:goView('${list.SEQ}');">${list.FNAME}</a></td>
		                            <td><a href="javascript:goView('${list.SEQ}');">${list.FCEO}</a></td>
		                            <td><a href="javascript:goView('${list.SEQ}');">${list.FZIPCODE} ${list.FADDRESS1} ${list.FADDRESS2}</a></td>
		                            <td><a href="tel:042-934-1685">${fn:substring(list.FPHONE,0,fn:length(list.FPHONE)-3)}***</a></td>
		                            <td>${list.FCATEGORY_NM}</td>
		                            <td></td>
		                        </tr>
	                        </c:forEach>
						</c:if>
						<c:if test="${empty list and empty nlist}">
							<tr>
								<td colspan="7" style="text-align:center;">등록된 글이 없습니다.</td>
							</tr>
						</c:if>		
                    </table>
                    ${navi}
                    </form>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <!--서브감싸기-->
>>>>>>> refs/heads/202204
