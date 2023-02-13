<<<<<<< HEAD
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
	var title = "${view.SUBJECT}";
	$(".con_area img").each(function(index){
		index = index + 1;
		$(this).prop("alt", title + " 사진" + index);
	});
		
	$("#list_btn").click(function(){
		$("#seq").val("");
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/list.do");
		$("#frm").submit();
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
	<input type="hidden" name="year" id="year" value="${bean.year}" />
	<input type="hidden" name="month" id="month" value="${bean.month}" />	
	<input type="hidden" name="seq" id="seq" value="${view.SEQ}" />
</form>

					<div class="contsArea communicationNotice">						
						<p class="textParaList">교육 및 행사일정입니다.</p>
																		
						<div class="commView">
							<h4>${view.TITLE}</h4>
							<div class="dateInfo">
								<span><b>행사일정 : </b><em><fmt:formatDate value="${view.SDATE}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${view.SDATE}" pattern="yyyy-MM-dd" /></em></span>
								<span><b>행사장소 : </b><em>${view.PLACE}</em></span>
							</div>
							
							<div class="textInfo">
									<iframe src="/board/getContent.do?seq=${view.SEQ}&gubun=${view.BOARD_NAME}" style="width: 100%;" onload="setIFrameHeight(this);" scrolling="no" title="게시글 내용"></iframe>
							</div>
						
						</div>
						<div class="btnArea">							
							<a href="#" id="list_btn" class="btnTypeBasic sizeM"><span>목록</span></a>
						</div>
					</div>
=======
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
	var title = "${view.SUBJECT}";
	$(".con_area img").each(function(index){
		index = index + 1;
		$(this).prop("alt", title + " 사진" + index);
	});
		
	$("#list_btn").click(function(){
		$("#seq").val("");
		$("#frm").prop("action", "/${bean.menu}/${bean.menu_sub}/list.do");
		$("#frm").submit();
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
	<input type="hidden" name="year" id="year" value="${bean.year}" />
	<input type="hidden" name="month" id="month" value="${bean.month}" />	
	<input type="hidden" name="seq" id="seq" value="${view.SEQ}" />
</form>

					<div class="contsArea communicationNotice">						
						<p class="textParaList">교육 및 행사일정입니다.</p>
																		
						<div class="commView">
							<h4>${view.TITLE}</h4>
							<div class="dateInfo">
								<span><b>행사일정 : </b><em><fmt:formatDate value="${view.SDATE}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${view.SDATE}" pattern="yyyy-MM-dd" /></em></span>
								<span><b>행사장소 : </b><em>${view.PLACE}</em></span>
							</div>
							
							<div class="textInfo">
									<iframe src="/board/getContent.do?seq=${view.SEQ}&gubun=${view.BOARD_NAME}" style="width: 100%;" onload="setIFrameHeight(this);" scrolling="no" title="게시글 내용"></iframe>
							</div>
						
						</div>
						<div class="btnArea">							
							<a href="#" id="list_btn" class="btnTypeBasic sizeM"><span>목록</span></a>
						</div>
					</div>
>>>>>>> refs/heads/202204
					