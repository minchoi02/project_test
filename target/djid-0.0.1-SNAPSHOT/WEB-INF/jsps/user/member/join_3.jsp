<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script>
$(document).ready(function() {
	
	$("#mainBtn").click(function(){
		location.href = "/main.do";
	});
	
	$("#modifyBtn").click(function(){
		
	});
	
});	
</script>
					<div class="contents member" id="contents">
					<span class="hidden">본문시작</span>
					<div class="contsArea member">
						<h2><img src="/assets/user/images/member_title03.png" alt="회원가입완료"></h2>
						<div class="confirmBg">
							<p>
								<strong>정보드림 홈페이지 회원이 되신것을 진심으로 환영합니다</strong>
								정보드림 홈페이지의 다양한 서비스를 쾌적하게 이용하시기 바랍니다.
							</p>
							<div class="btnArea">
								<button type="button" id="mainBtn" class="btnTypeBasic sizeM"><span>메인화면으로 이동</span></button>
								<!-- <button type="button" id="modifyBtn" class="btnTypeBasic sizeM colorGray"><span>회원정보변경</span></button> -->
							</div>
						</div>
					</div>

				</div>