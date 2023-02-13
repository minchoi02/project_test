<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<script type="text/javascript">
function logout(){
	if(confirm('로그아웃하시겠습니까?')){
		location.href='/djads/logout.do';
	}
}
</script>
<div class="header">
	<h2><a href="#"><img src="/assets/admin/images/logo.png" alt="" /></a></h2>
	<ul class="gnb bg02">
		<li class="mtit1">메뉴 1</li>
		<li><a href="/admin/001/member/list.do" target="_self">회원관리</a></li>
		<li><a href="/admin/009/popup/board_list.do" target="_self">노출관리</a></li>
		<li><a href="/admin/010/master/list.do" target="_self">관리자관리</a></li>
		<li><a href="/admin/008/code_welfare/list.do" target="_self">코드관리</a></li>
		<li><a href="/admin/chat/conf.do" target="_self">채팅관리</a></li>
		<li><a href="/admin/011/menu/menu_statistics.do" target="_self">메뉴통계</a></li>
	</ul>
	<ul class="gnb bg03">
		<li class="mtit2">메뉴 2</li>
		<li><a href="/admin/002/welfare/list.do" target="_self">맞춤형 복지정보</a></li>
		<li><a href="/admin/003/facility/list.do" target="_self">우리지역 복지시설</a></li>
		<li><a href="/admin/004/news/list.do" target="_self">복지정보모아</a></li>
		<li><a href="/admin/005/reserv/list.do" target="_self">장애인 교통정보</a></li>
		<li><a href="/admin/006/notice/board_list.do" target="_self">소통과 알림</a></li>
		<li class="w7"><a href="/admin/007/organization/list.do" target="_self">대전장애인단체총연합회</a></li>
	</ul>
</div>

