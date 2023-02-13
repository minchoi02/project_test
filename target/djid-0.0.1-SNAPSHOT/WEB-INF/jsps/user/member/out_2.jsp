<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>
$(document).ready(function() {
	
	$("#outBtn").click(function() {
		if(confirm("정말 탈퇴 신청을 하시겠습니까?")){
			location.href = "/member/out_3.do";
		}
	});
	
	$("#cancelBtn").click(function(e){
		location.href = "/member/out_1.do";
	});
});	
</script>
					<div class="contsArea member">
						<div class="innerBoxMem modify">
							<p class="h3tit mbt50">회원탈퇴를 신청하실 경우 아래 주의사항을 확인 해주시기 바랍니다.</span></p>
							<ol class="modifyList">
								<li>1. 회원탈퇴 후에도 <strong>동일한 정보</strong>(아이디 제외)로 재가입이 가능합니다.</li>
								<li>2. 회원님의 아이디로 작성 된 게시물은 <strong>삭제되지 않고 게스트(guest)로 변경되어 보존</strong>됩니다.</li>
							</ol>
							<div class="btnArea">
								<button type="button" id="outBtn" class="btnTypeBasic sizeM"><span>탈퇴신청</span></button>
								<button type="button" id="cancelBtn" class="btnTypeBasic sizeM colorGray"><span>취소</span></button>
							</div>
						</div>
					</div>