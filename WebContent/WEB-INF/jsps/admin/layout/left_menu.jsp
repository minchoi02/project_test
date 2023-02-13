<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
	<c:if test="${menu.fmenu eq 1}">
		<ul class="leftMenu">
			<li class="stit">회원관리</li>
			<li><a href="/admin/001/member/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 회원 </a></li>
			<li><a href="/admin/001/drop/list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 탈퇴요청 </a></li>			
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 2}">
		<ul class="leftMenu">
			<li class="stit">맞춤형 복지정보</li>
			<li><a href="/admin/002/welfare/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 맞춤형 </a></li>
			<li><a href="/admin/002/life_cycle/list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 생애주기형 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 3}">
		<ul class="leftMenu">
			<li class="stit">우리지역 복지시설</li>
			<li><a href="/admin/003/facility/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 복지시설 검색 </a></li>
			<li><a href="/admin/003/convenience/list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 편의시설 검색 </a></li>
			<li><a href="/admin/003/comment/list.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 댓글 관리 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 4}">
		<ul class="leftMenu">
			<li class="stit">복지정보모아</li>
			<li><a href="/admin/004/news/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 복지 핫이슈 </a></li>
			<li><a href="/admin/004/daejeon_news/board_list.do" <c:if test="${menu.smenu eq 5 }">class="act"</c:if>> 대전 복지뉴스 </a></li>
			<li><a href="/admin/004/job_offer/list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 장애인일자리 - 구인 </a></li>
			<li><a href="/admin/004/hunt_job/list.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 장애인일자리 - 구직 </a></li>
			<li><a href="/admin/004/data/board_list.do" <c:if test="${menu.smenu eq 4 }">class="act"</c:if>> 복지 자료실 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 5}">
		<ul class="leftMenu">
			<li class="stit">장애인 교통정보</li>
			<li><a href="/admin/005/reserv/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 해피콜 - 예약목록 </a></li>
			<li><a href="/admin/005/setting/list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 해피콜 예약/마감 설정 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 6}">   
		<ul class="leftMenu">
			<li class="stit">소통과 알림 ${menu.smenu}</li>
			<li><a href="/admin/006/notice/board_list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 공지사항 </a></li>
			<li><a href="/admin/006/calendar/board_list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 행사달력 </a></li>
			<li><a href="/admin/006/promote/board_list.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 홍보게시판 - 우리기관홍보</a></li>
			<li><a href="/admin/006/institute/board_list.do" <c:if test="${menu.smenu eq 7 }">class="act"</c:if>> 홍보게시판 - 유관기관홍보</a></li>
			<li><a href="/admin/006/event/board_list.do" <c:if test="${menu.smenu eq 4 }">class="act"</c:if>> 홍보게시판 - 나눔/이벤트 </a></li>
			<li><a href="/admin/006/pr/board_list.do" <c:if test="${menu.smenu eq 8 }">class="act"</c:if>> 이벤트게시판 </a></li>
			<li><a href="/admin/006/free/board_list.do" <c:if test="${menu.smenu eq 5 }">class="act"</c:if>> 자유게시판 </a></li>
			<li><a href="/admin/006/counseling/board_list.do" <c:if test="${menu.smenu eq 6 }">class="act"</c:if>> 상담게시판 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 7}">
		<ul class="leftMenu">
			<li class="stit">대전장애인단체총연합회</li>
			<li><a href="/admin/007/organization/list.do" <c:if test="${menu.smenu eq 6 }">class="act"</c:if>> 함께하는 사람들 </a></li>
			<li><a href="/admin/007/gallery/board_list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 사진게시판 </a></li>
			<li><a href="/admin/007/movie/board_list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 영상게시판 </a></li>
			<li><a href="/admin/007/volunteer/list.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 자원봉사신청</a></li>
			<li><a href="/admin/007/support/list.do" <c:if test="${menu.smenu eq 4 }">class="act"</c:if>> 후원신청 </a></li>
			<li><a href="/admin/007/empl/board_list.do" <c:if test="${menu.smenu eq 5 }">class="act"</c:if>> 직원게시판 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 8}">
		<ul class="leftMenu">
			<li class="stit">코드관리</li>
			<li><a href="/admin/008/code_welfare/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 코드관리 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 9}">
		<ul class="leftMenu">
			<li class="stit">노출관리</li>
			<li><a href="/admin/009/popup/board_list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 팝업관리 </a></li>
			<li><a href="/admin/009/slide/board_list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 슬라이드관리 </a></li>
			<li><a href="/admin/009/sign_language/list.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 수어영상관리 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 10}">
		<ul class="leftMenu">
			<li class="stit">관리자관리</li>
			<li><a href="/admin/010/master/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 관리자관리 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 11}">
		<ul class="leftMenu">
			<li class="stit">채팅관리</li>
			<li><a href="/admin/chat/conf.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 채팅관리 </a></li> 
			<li><a href="/admin/chat/chat.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 상담하기 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 12}">
		<ul class="leftMenu">
			<li class="stit">메뉴통계</li>
			<li><a href="/admin/011/menu/menu_statistics.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 메뉴통계</a></li>
			<li><a href="/admin/011/menu/months_statistics.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 월별통계</a></li>
			<li><a href="/admin/011/menu/days_statistics.do" <c:if test="${menu.smenu eq 4 }">class="act"</c:if>> 일별통계</a></li>
			<li><a href="/admin/011/menu/weeks_statistics.do" <c:if test="${menu.smenu eq 5 }">class="act"</c:if>> 요일별통계</a></li>
			<li><a href="/admin/011/menu/menu_log.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 메뉴로그</a></li>
		</ul>
	</c:if>
	
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
	<c:if test="${menu.fmenu eq 1}">
		<ul class="leftMenu">
			<li class="stit">회원관리</li>
			<li><a href="/admin/001/member/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 회원 </a></li>
			<li><a href="/admin/001/drop/list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 탈퇴요청 </a></li>			
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 2}">
		<ul class="leftMenu">
			<li class="stit">맞춤형 복지정보</li>
			<li><a href="/admin/002/welfare/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 맞춤형 </a></li>
			<li><a href="/admin/002/life_cycle/list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 생애주기형 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 3}">
		<ul class="leftMenu">
			<li class="stit">우리지역 복지시설</li>
			<li><a href="/admin/003/facility/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 복지시설 검색 </a></li>
			<li><a href="/admin/003/convenience/list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 편의시설 검색 </a></li>
			<li><a href="/admin/003/comment/list.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 댓글 관리 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 4}">
		<ul class="leftMenu">
			<li class="stit">복지정보모아</li>
			<li><a href="/admin/004/news/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 복지 핫이슈 </a></li>
			<li><a href="/admin/004/daejeon_news/board_list.do" <c:if test="${menu.smenu eq 5 }">class="act"</c:if>> 대전 복지뉴스 </a></li>
			<li><a href="/admin/004/job_offer/list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 장애인일자리 - 구인 </a></li>
			<li><a href="/admin/004/hunt_job/list.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 장애인일자리 - 구직 </a></li>
			<li><a href="/admin/004/data/board_list.do" <c:if test="${menu.smenu eq 4 }">class="act"</c:if>> 복지 자료실 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 5}">
		<ul class="leftMenu">
			<li class="stit">장애인 교통정보</li>
			<li><a href="/admin/005/reserv/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 해피콜 - 예약목록 </a></li>
			<li><a href="/admin/005/setting/list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 해피콜 예약/마감 설정 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 6}">   
		<ul class="leftMenu">
			<li class="stit">소통과 알림 ${menu.smenu}</li>
			<li><a href="/admin/006/notice/board_list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 공지사항 </a></li>
			<li><a href="/admin/006/calendar/board_list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 행사달력 </a></li>
			<li><a href="/admin/006/promote/board_list.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 홍보게시판 - 우리기관홍보</a></li>
			<li><a href="/admin/006/institute/board_list.do" <c:if test="${menu.smenu eq 7 }">class="act"</c:if>> 홍보게시판 - 유관기관홍보</a></li>
			<li><a href="/admin/006/event/board_list.do" <c:if test="${menu.smenu eq 4 }">class="act"</c:if>> 홍보게시판 - 나눔/이벤트 </a></li>
			<li><a href="/admin/006/pr/board_list.do" <c:if test="${menu.smenu eq 8 }">class="act"</c:if>> 이벤트게시판 </a></li>
			<li><a href="/admin/006/free/board_list.do" <c:if test="${menu.smenu eq 5 }">class="act"</c:if>> 자유게시판 </a></li>
			<li><a href="/admin/006/counseling/board_list.do" <c:if test="${menu.smenu eq 6 }">class="act"</c:if>> 상담게시판 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 7}">
		<ul class="leftMenu">
			<li class="stit">대전장애인단체총연합회</li>
			<li><a href="/admin/007/organization/list.do" <c:if test="${menu.smenu eq 6 }">class="act"</c:if>> 함께하는 사람들 </a></li>
			<li><a href="/admin/007/gallery/board_list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 사진게시판 </a></li>
			<li><a href="/admin/007/movie/board_list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 영상게시판 </a></li>
			<li><a href="/admin/007/volunteer/list.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 자원봉사신청</a></li>
			<li><a href="/admin/007/support/list.do" <c:if test="${menu.smenu eq 4 }">class="act"</c:if>> 후원신청 </a></li>
			<li><a href="/admin/007/empl/board_list.do" <c:if test="${menu.smenu eq 5 }">class="act"</c:if>> 직원게시판 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 8}">
		<ul class="leftMenu">
			<li class="stit">코드관리</li>
			<li><a href="/admin/008/code_welfare/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 코드관리 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 9}">
		<ul class="leftMenu">
			<li class="stit">노출관리</li>
			<li><a href="/admin/009/popup/board_list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 팝업관리 </a></li>
			<li><a href="/admin/009/slide/board_list.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 슬라이드관리 </a></li>
			<li><a href="/admin/009/sign_language/list.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 수어영상관리 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 10}">
		<ul class="leftMenu">
			<li class="stit">관리자관리</li>
			<li><a href="/admin/010/master/list.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 관리자관리 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 11}">
		<ul class="leftMenu">
			<li class="stit">채팅관리</li>
			<li><a href="/admin/chat/conf.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 채팅관리 </a></li> 
			<li><a href="/admin/chat/chat.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 상담하기 </a></li>
		</ul>
	</c:if>
	<c:if test="${menu.fmenu eq 12}">
		<ul class="leftMenu">
			<li class="stit">메뉴통계</li>
			<li><a href="/admin/011/menu/menu_statistics.do" <c:if test="${menu.smenu eq 1 }">class="act"</c:if>> 메뉴통계</a></li>
			<li><a href="/admin/011/menu/months_statistics.do" <c:if test="${menu.smenu eq 3 }">class="act"</c:if>> 월별통계</a></li>
			<li><a href="/admin/011/menu/days_statistics.do" <c:if test="${menu.smenu eq 4 }">class="act"</c:if>> 일별통계</a></li>
			<li><a href="/admin/011/menu/weeks_statistics.do" <c:if test="${menu.smenu eq 5 }">class="act"</c:if>> 요일별통계</a></li>
			<li><a href="/admin/011/menu/menu_log.do" <c:if test="${menu.smenu eq 2 }">class="act"</c:if>> 메뉴로그</a></li>
		</ul>
	</c:if>
	
>>>>>>> refs/heads/202204
	