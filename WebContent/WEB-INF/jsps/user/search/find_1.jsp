<<<<<<< HEAD
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="imagetoolbar" content="no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta property="og:image" content="">
    <meta name="description" content="">
    <meta property="og:type" content="" />
    <meta property="og:title" content="">
    <meta property="og:description" content="">
    <meta property="og:image" content="">
    <meta property="og:url" content="">
    <link rel="shortcut icon" href="">
    <link rel="apple-touch-icon" href="" />

    <link rel="canonical" href="">
    <title>D-ENG 디지털 엔지니어링 기업지원 플랫폼</title>
    <!-- 스타일시트 -->
    <link rel="stylesheet" href="/css/reset.css" />
    <!--폰트-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="/css/simple-line-icons.css" />
    <link rel="stylesheet" href="/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
    <!--폰트-->
	<link rel="stylesheet" href="/css/layout.css" />
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/sub.css" />
    <link rel="stylesheet" href="/css/responsive.css" />
    <!--<link rel="stylesheet" href="/css/swiper.min.css" />-->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/css/board.css" />
    <link rel="stylesheet" href="/css/headroom.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="http://hp001.shop-websrepublic.co.kr/js/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/tab.css" />
    <!-- 스타일시트 -->

    <script src="/js/jquery-1.11.1.min.js?ver=170901"></script>
	<!-- 스크립트 -->
    <script src="/js/easing.js"></script>
    <script src="/js/common.js"></script>
    <script src="/js/sub.js"></script>
    <!--<script src="/js/swiper.min.js"></script>-->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="/js/TweenMax.js"></script>
    <script src="/js/headroom.js"></script>
    <script src="/js/jqueryheadroommin.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <!-- 스크립트 -->
    <script>
		var menuTop = 0;
		var menuSub = 0;
		
		
		function sliceByByte(str, maxByte) {

			for(b=i=0;c=str.charCodeAt(i);) {
		      b+=c>>7?2:1;
		      if (b > maxByte)
		      break;
		      i++;
		    }
		    
		  	return str.substring(0,i);
		 }
	
	</script>
	<script>
	$(document).ready(function() {
		$("#keyword").keyup(function(e){ if(e.keyCode == 13) $('#totalSearchBtn').click(); });
		$('#totalSearchBtn').click(function () {
			
			var keyword = $("#keyword").val(); 
			if(keyword == ""){
				alert("검색어를 입력해주세요.");  $("#keyword").focus(); return;
			}
			if(keyword.length < 2){
				alert("검색어는 두 글자 이상 입력해주세요.");  $("#keyword").focus(); return;				
			}
			$("#totalSearchForm").prop("action", "/search/find_1.do");
			$("#totalSearchForm").submit();
		});
	});
	</script>
</head>

<body>

<div id="page-loader">
    <div class="inner2">
        <div class="spinner">
          <div class="double-bounce1"></div>
          <div class="double-bounce2"></div>
        </div>
    </div>
</div>

<!-- 전체 감싸기 -->
<div id="wrapper">

    <!-- 헤더 -->
    <div id="header">
        <!-- 메뉴호출시 마스크 시작 -->
        <div class="mask"></div>
        <!-- 메뉴호출시 마스크 끝 -->
        <!-- 모바일메뉴 버튼 -->
        <button id="gnbTrigger">
            <span class="bar1"></span>
            <span class="bar2"></span>
            <span class="bar3"></span>
        </button>
        <!-- // 모바일메뉴 버튼 -->
    	<!-- 헤더 상단 -->
        <div class="top">
            <div class="mobile-tel"><span>빠른상담</span>
                <p><a href="tel:1800-9356">1800-9356</a></p>
            </div>
            <!-- 로고 -->
            <h1 id="logo"><a href="/"><img src="/img/logo.png" class="pc" alt="Logo" /><img src="/img/logom.png" class="mobile" alt="Logo" /></a></h1>
            <!-- // 로고 -->
		</div>
        <!-- // 헤더 상단 -->

        <!-- 우측 링크 -->
        <div class="right-link clearfix">
            <ul>
                <li><a href="/member/join_1.do"><i class="xi-pen"></i></a></li>
                <li><a href="/member/login.do"><i class="xi-unlock-o"></i></a></li>
                
                <!-- 로그인 후 <li><a href="#;"><i class="xi-user-o"></i></a></li>
                <li><a href="#;"><i class="xi-lock-o"></i></a></li>-->
            </ul>
        </div>
        <!-- // 우측 링크 -->
            
    <style>
            .btm::-webkit-scrollbar {
                display: none;
            }
        </style>
        <!-- 헤더 하단 -->
        <div class="btm" style="-ms-overflow-style:none;">
            <!-- 모바일로그인 -->
            <div class="m_loginArea">
                <ul>
                    <li><a href="#;">회원가입</a></li>
                    <li>|</li>
                    <li><a href="#;">로그인</a></li>
                </ul>
            </div>
            <!-- // 모바일로그인 -->
            <!-- 상단메뉴 -->
            <ul id="nav">
                <!-- 관리자연동시 주석해제 -->

                <!-- 수동관리시 주석 -->
               <li class="" style="z-index:999">
                   <a href="/intro/support.do" target="_self">소개</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>소개</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                           		<li><a href="/intro/support.do" target="_self">사업배경</a></li>
                                <li><a href="/intro/introduction.do" target="_self">사업소개</a></li>
                                <li><a href="/intro/greeting.do" target="_self">인사말</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               
               <li class="" style="z-index:997">
                   <a href="/infor/origine_list.do" target="_self">기업·기관정보</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>기업·기관정보</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/infor/origine_list.do" target="_self">기업정보</a></li>
                               <li><a href="/infor/promote_list.do" target="_self">기업홍보동영상</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:996">
                   <a href="/supply/product_list.do" target="_self">수요·공급품목</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>수요·공급품목</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/supply/product_list.do" target="_self">제품제작</a></li>
                               <li><a href="/supply/technical_list.do" target="_self">기술지원</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:994">
                   <a href="/reservation/infor_list.do" target="_self">장비활용</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>장비활용</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/reservation/infor_list.do" target="_self">장비이용안내</a></li>
                               <li><a href="/reservation/own_list.do" target="_self">보유장비현황</a></li>
                               <li><a href="/reservation/introduction_list.do" target="_self">장비도입계획</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:998">
                   <a href="/board/notice/list.do" target="_self">정보마당</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>정보마당</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/board/notice/list.do" target="_self">공지사항</a></li>
                               <li><a href="/board/business/list.do" target="_self">사업공고</a></li>
                               <li><a href="/board/outdata/list.do" target="_self">보도자료 및 동향</a></li>
                               <li><a href="/board/data/list.do" target="_self">자료실</a></li>
                               <li><a href="/board/qna/list.do" target="_self">Q&A</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
            </ul>
            <!-- // 상단메뉴 -->
        </div>
        <!-- // 헤더 하단 -->

        
    </div> 
	<!-- // 헤더 -->

	<!--서브감싸기-->
	<div id="subContainer">

		<style>
		    .inner.searching { padding-top:180px;}
			.search_result {border:3px solid #2969b3; background:#fff; padding:40px 30px; text-align:center;}
			.search_result input {padding:25px; width:50%; }
			.search_result button {background:#2969b3; color:#fff; padding:12px 20px;}
		    .inner.searching .result_num {font-size:20px; padding:30px 0px;  border-bottom:1px solid #eee;}
		    .inner.searching .result_num span {color:#2969b3;}
			.result_list_tit{position:relative; margin-top:20px;}
			.result_list_tit h1 a{ font-size:25px; color:#2969b3; width:90%; display:inline-block; margin-bottom:30px; }
			.result_list_tit h1 span{font-size:16px; color:#666;}
			.result_list_tit span a{font-size:14px; text-align:right; display:inline;}

			.list_line{ border-bottom:1px solid #eee; padding:20px 0px;}
			.result_list {margin-bottom:20px;}
			.result_list h2{font-size:18px; color:#000; font-weight:bold;}
			.result_list span{font-size:15px; white-space: normal; overflow: hidden; text-overflow: ellipsis; word-wrap: break-word;display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;}

		
			@media screen and (max-width:759px) { 

			.search_result{border:none; padding:0px;}
			.search_result input {width:70%;}
			.search_result button {background:#2969b3; color:#fff; padding:7px 15px;}
		    .inner.searching .result_num {font-size:15px; padding:30px 0px;  border-bottom:1px solid #eee; text-align:center;}

			.result_list_tit{position:relative; margin-top:0px;}
			.result_list_tit h1 a{ font-size:18px; color:#2969b3; width:90%; display:inline-block; margin-bottom:30px; }
			.result_list h2{font-size:15px; color:#000; font-weight:bold;}
			.result_list span{font-size:13px; white-space: normal; overflow: hidden; text-overflow: ellipsis; word-wrap: break-word;display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;}


			}
		
		</style>
		
		<form name="thebogiFrm" id="thebogiFrm" method="post">
			<input type="hidden" name="keyword" id="sss" value="${bean.keyword}" />
			<input type="hidden" name="gubun" id="gubun" value="" />
		</form>
        
        <div id="sub_container" data-menu="1" data-sub="1">
        	
            <div class="inner searching">


                <div class="search_result">
                    <form name="searchForm" id="searchForm" method="post">
                        <input type="text" name="keyword" id="inner_keyword" value="${bean.keyword}" placeholder="검색어를 입력하세요" required="" size="50" maxlength="50">
                        <button type="submit" value="검색" class="main_search_btn"  id="innerSearchBtn"><i class="xi-search"></i></button>
                    </form>
                </div>

				<p class="result_num"><span>'${bean.keyword}'</span>검색어로 <span>'${totalCount}'</span>개의 결과를 찾았습니다.</p>


				<div class="list_line">

					<div class="result_list_tit">
						<h1><a href="#">메뉴<span>( ${menuCount}개 )</span></a></h1>
					</div>

					<c:forEach var="list" items="${menuTop3List}">
						<div class="result_list">
						<h2>
						<c:choose>
							<c:when test="${empty list.MENU4 and empty list.MENU5}">
								${list.MENU3}
							</c:when>
							<c:when test="${empty list.MENU5}">
								${list.MENU4}
							</c:when>
							<c:when test="${not empty list.MENU5}">
								${list.MENU5}
							</c:when>
						</c:choose>
						</h2>
						<span>
							<a href="${list.LINK}" target="_blank">
								<c:if test="${not empty list.MENU1}">
									${list.MENU1}
								</c:if>
								<c:if test="${not empty list.MENU2}">
									&gt; ${list.MENU2}
								</c:if>
								<c:if test="${not empty list.MENU3}">
									&gt; ${list.MENU3}
								</c:if>
								<c:if test="${not empty list.MENU4}">
									&gt; ${list.MENU4}
								</c:if>
								<c:if test="${not empty list.MENU5}">
									&gt; ${list.MENU5}
								</c:if>
							</a>
						</span>
						</div>
					</c:forEach>
					
				</div>

				<div class="list_line">

					<div class="result_list_tit">
						<h1><a href="#">카테고리 타이틀<span>( 35개 )</span></a></h1>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>


					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>





				</div>







				<div class="list_line">

					<div class="result_list_tit">
						<h1><a href="#">카테고리 타이틀<span>( 35개 )</span></a></h1>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>


					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>


					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>




                    <nav class="pg_wrap">
                        <span class="pg">
                            <a href="#;" class="pg_page pg_start"></a>
                            <strong class="pg_current">1</strong></span>
                            <a href="#;" class="pg_page">2</span></a>
                            <a href="#;" class="pg_page">3</span></a>
                            <a href="#;" class="pg_page pg_end"></a>
                        </span>
                    </nav>
					<br/>






				</div>

                
                
            </div>
        </div>
        
		
        
        
              
	</div>
    <!--서브감싸기-->
    <style>
    #footer {margin-top:0px;}
    </style>
	
<!-- 푸터 -->
    <div id="footer">
        <div class="inner">
        <!-- 그리드 감싸기 -->
            <div class="foot_wrap">
                <div class="foot_info">
                    <div class="address">
                        <span>대전 테크노파크</span>
                        <span>[34839]대전광역시 중구 중앙로 119, 15층 대전테크노파크  &nbsp; | &nbsp;   Tel 1811.1582  &nbsp; | &nbsp;    Fax. 042)251.2859</span>
                        <span>Copyright 2021 D-ENG. ALL REIGHTS RESERVED.</span>
                    </div>
                    <h3><a href="/member/policy.do">개인정보 취급방침</a> &nbsp;·&nbsp; <a href="/member/email.do">이메일무단수집거부</a></h3>
                </div>
                <div class="foot_customer">
                    <div class="family_list">
                    	<div class="family">
                            <a href="javascript:;">전국테크노파크</a>
                            <ul class="dropdown">
                                <li><a href="http://www.gwtp.or.kr/" target="_blank" rel="noopener noreferrer">강원테크노파크</a></li>
				                <li><a href="http://www.gtp.or.kr" target="_blank" rel="noopener noreferrer">경기테크노파크</a></li>
				                <li><a href="http://www.gdtp.or.kr/" target="_blank" rel="noopener noreferrer">경기대진테크노파크</a></li>
				                <li><a href="http://www.gjtp.or.kr" target="_blank" rel="noopener noreferrer">광주테크노파크</a></li>
				                <li><a href="http://www.gntp.or.kr/" target="_blank" rel="noopener noreferrer">경남테크노파크</a></li>
				                <li><a href="http://www.gbtp.or.kr/" target="_blank" rel="noopener noreferrer">경북테크노파크</a></li>
				                <li><a href="http://www.ttp.org" target="_blank" rel="noopener noreferrer">대구테크노파크</a></li>
				                <li><a href="http://www.btp.or.kr/" target="_blank" rel="noopener noreferrer">부산테크노파크</a></li>
				                <li><a href="http://itp.or.kr" target="_blank" rel="noopener noreferrer">인천테크노파크</a></li>
				                <li><a href="http://www.seoultp.or.kr/" target="_blank" rel="noopener noreferrer">서울테크노파크</a></li>
				    			<li><a href="http://www.sjtp.or.kr/" target="_blank" rel="noopener noreferrer">세종테크노파크</a></li>
				                <li><a href="http://www.utp.or.kr/" target="_blank" rel="noopener noreferrer">울산테크노파크</a></li>
				                <li><a href="http://www.jntp.or.kr/" target="_blank" rel="noopener noreferrer">전남테크노파크</a></li>
				                <li><a href="http://www.jbtp.or.kr/" target="_blank" rel="noopener noreferrer">전북테크노파크</a></li>
				                <li><a href="http://www.jejutp.or.kr/" target="_blank" rel="noopener noreferrer">제주테크노파크</a></li>
				                <li><a href="http://www.ctp.or.kr" target="_blank" rel="noopener noreferrer">충남테크노파크</a></li>
				                <li><a href="http://www.cbtp.or.kr" target="_blank" rel="noopener noreferrer">충북테크노파크</a></li>
				                <li><a href="http://www.ptp.or.kr/" target="_blank" rel="noopener noreferrer">포항테크노파크</a></li>
				                <li><a href="http://technopark.kr" target="_blank" rel="noopener noreferrer">한국테크노파크진흥회</a></li>
                            </ul>
                        </div>
                        <div class="family2">
                            <a href="javascript:;">유관기업</a>
                            <ul class="dropdown">
                                <li><a href="https://www.daejeon.go.kr/" target="_blank" rel="noopener noreferrer">대전광역시</a></li>
				            	<li><a href="https://www.mss.go.kr/" target="_blank" rel="noopener noreferrer">중소벤처기업부</a></li>
				            	<li><a href="https://www.mss.go.kr/site/daejeon/main.do" target="_blank" rel="noopener noreferrer">대전충남지방중소벤처기업청</a></li>
				            	<li><a href="http://www.djba.or.kr/" target="_blank" rel="noopener noreferrer">대전경제통상진흥원</a></li>
				            	<li><a href="http://www.dicia.or.kr/" target="_blank" rel="noopener noreferrer">대전정보문화산업진흥원</a></li>
				            	<li><a href="https://www.sinbo.or.kr/" target="_blank" rel="noopener noreferrer">대전신용보증재단</a></li>
				            	<li><a href="https://ccei.creativekorea.or.kr/daejeon/" target="_blank" rel="noopener noreferrer">대전창조경제혁신센터</a></li>
				            	<li><a href="http://daejeoncci.korcham.net/" target="_blank" rel="noopener noreferrer">대전상공회의소</a></li>
				            	<li><a href="http://dc.kita.net/" target="_blank" rel="noopener noreferrer">한국무역협회 대전충남지역본부</a></li>
				            	<li><a href="https://www.innopolis.or.kr/" target="_blank" rel="noopener noreferrer">연구개발특구진흥재단</a></li>
				            	<li><a href="http://www.djic.or.kr/" target="_blank" rel="noopener noreferrer">대전산업단지관리공단</a></li>
				            	<li><a href="https://www.semas.or.kr/" target="_blank" rel="noopener noreferrer">소상공인시장진흥공단 대전충청지역본부</a></li>
				            	<li><a href="http://daejeon.wbiz.or.kr/" target="_blank" rel="noopener noreferrer">한국여성경제인협회 대전지회</a></li>
				            	<li><a href="https://www.kodit.co.kr/" target="_blank" rel="noopener noreferrer">신용보증기금</a></li>
				            	<li><a href="http://www.kbiz.or.kr/home/homeIndex.do?menuCode=dc" target="_blank" rel="noopener noreferrer">중소기업중앙회 대전세종충남지역본부</a></li>
				            	<li><a href="http://www.smtech.go.kr" target="_blank" rel="noopener noreferrer">SMTECH</a></li>
				            	<li><a href="http://www.bizinfo.go.kr" target="_blank" rel="oopener noreferrer">기업마당</a></li>
				            	<li><a href="http://www.etube.re.kr" target="_blank" rel="oopener noreferrer">e-Tube</a></li>
				            	<li><a href="http://www.itts.or.kr" target="_blank" rel="oopener noreferrer">ITTS(산업기술종합서비스)</a></li>
				            	<li><a href="http://www.techforce.or.kr" target="_blank" rel="oopener noreferrer">Tech-force NET(산업기술 인력 통합정보망)</a></li>
				            	<li><a href="http://www.ntis.go.kr" target="_blank" rel="oopener noreferrer">NTIS(국가과학기술지식정보서비스)</a></li>
				            	<li><a href="http://www.ntb.kr" target="_blank" rel="oopener noreferrer">NTB기술은행</a></li>
				            	<li><a href="http://www.data.go.kr" target="_blank" rel="oopener noreferrer">공공데이터 포털</a></li>
				            	<li><a href="http://www.k-pass.kr" target="_blank" rel="oopener noreferrer">K-Pass(사업관리시스템)</a></li>
				            	<li><a href="http://www.k-startup.go.kr" target="_blank" rel="oopener noreferrer">K-Startup</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        <!-- // 그리드 감싸기 -->
        </div>
    </div>
    <!-- // 푸터 -->
</div>
<!-- // 전체 감싸기 -->
    
=======
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="imagetoolbar" content="no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta property="og:image" content="">
    <meta name="description" content="">
    <meta property="og:type" content="" />
    <meta property="og:title" content="">
    <meta property="og:description" content="">
    <meta property="og:image" content="">
    <meta property="og:url" content="">
    <link rel="shortcut icon" href="">
    <link rel="apple-touch-icon" href="" />

    <link rel="canonical" href="">
    <title>D-ENG 디지털 엔지니어링 기업지원 플랫폼</title>
    <!-- 스타일시트 -->
    <link rel="stylesheet" href="/css/reset.css" />
    <!--폰트-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="/css/simple-line-icons.css" />
    <link rel="stylesheet" href="/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=PT+Serif" rel="stylesheet">
    <!--폰트-->
	<link rel="stylesheet" href="/css/layout.css" />
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/sub.css" />
    <link rel="stylesheet" href="/css/responsive.css" />
    <!--<link rel="stylesheet" href="/css/swiper.min.css" />-->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/css/board.css" />
    <link rel="stylesheet" href="/css/headroom.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="http://hp001.shop-websrepublic.co.kr/js/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/tab.css" />
    <!-- 스타일시트 -->

    <script src="/js/jquery-1.11.1.min.js?ver=170901"></script>
	<!-- 스크립트 -->
    <script src="/js/easing.js"></script>
    <script src="/js/common.js"></script>
    <script src="/js/sub.js"></script>
    <!--<script src="/js/swiper.min.js"></script>-->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="/js/TweenMax.js"></script>
    <script src="/js/headroom.js"></script>
    <script src="/js/jqueryheadroommin.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <!-- 스크립트 -->
    <script>
		var menuTop = 0;
		var menuSub = 0;
		
		
		function sliceByByte(str, maxByte) {

			for(b=i=0;c=str.charCodeAt(i);) {
		      b+=c>>7?2:1;
		      if (b > maxByte)
		      break;
		      i++;
		    }
		    
		  	return str.substring(0,i);
		 }
	
	</script>
	<script>
	$(document).ready(function() {
		$("#keyword").keyup(function(e){ if(e.keyCode == 13) $('#totalSearchBtn').click(); });
		$('#totalSearchBtn').click(function () {
			
			var keyword = $("#keyword").val(); 
			if(keyword == ""){
				alert("검색어를 입력해주세요.");  $("#keyword").focus(); return;
			}
			if(keyword.length < 2){
				alert("검색어는 두 글자 이상 입력해주세요.");  $("#keyword").focus(); return;				
			}
			$("#totalSearchForm").prop("action", "/search/find_1.do");
			$("#totalSearchForm").submit();
		});
	});
	</script>
</head>

<body>

<div id="page-loader">
    <div class="inner2">
        <div class="spinner">
          <div class="double-bounce1"></div>
          <div class="double-bounce2"></div>
        </div>
    </div>
</div>

<!-- 전체 감싸기 -->
<div id="wrapper">

    <!-- 헤더 -->
    <div id="header">
        <!-- 메뉴호출시 마스크 시작 -->
        <div class="mask"></div>
        <!-- 메뉴호출시 마스크 끝 -->
        <!-- 모바일메뉴 버튼 -->
        <button id="gnbTrigger">
            <span class="bar1"></span>
            <span class="bar2"></span>
            <span class="bar3"></span>
        </button>
        <!-- // 모바일메뉴 버튼 -->
    	<!-- 헤더 상단 -->
        <div class="top">
            <div class="mobile-tel"><span>빠른상담</span>
                <p><a href="tel:1800-9356">1800-9356</a></p>
            </div>
            <!-- 로고 -->
            <h1 id="logo"><a href="/"><img src="/img/logo.png" class="pc" alt="Logo" /><img src="/img/logom.png" class="mobile" alt="Logo" /></a></h1>
            <!-- // 로고 -->
		</div>
        <!-- // 헤더 상단 -->

        <!-- 우측 링크 -->
        <div class="right-link clearfix">
            <ul>
                <li><a href="/member/join_1.do"><i class="xi-pen"></i></a></li>
                <li><a href="/member/login.do"><i class="xi-unlock-o"></i></a></li>
                
                <!-- 로그인 후 <li><a href="#;"><i class="xi-user-o"></i></a></li>
                <li><a href="#;"><i class="xi-lock-o"></i></a></li>-->
            </ul>
        </div>
        <!-- // 우측 링크 -->
            
    <style>
            .btm::-webkit-scrollbar {
                display: none;
            }
        </style>
        <!-- 헤더 하단 -->
        <div class="btm" style="-ms-overflow-style:none;">
            <!-- 모바일로그인 -->
            <div class="m_loginArea">
                <ul>
                    <li><a href="#;">회원가입</a></li>
                    <li>|</li>
                    <li><a href="#;">로그인</a></li>
                </ul>
            </div>
            <!-- // 모바일로그인 -->
            <!-- 상단메뉴 -->
            <ul id="nav">
                <!-- 관리자연동시 주석해제 -->

                <!-- 수동관리시 주석 -->
               <li class="" style="z-index:999">
                   <a href="/intro/support.do" target="_self">소개</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>소개</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                           		<li><a href="/intro/support.do" target="_self">사업배경</a></li>
                                <li><a href="/intro/introduction.do" target="_self">사업소개</a></li>
                                <li><a href="/intro/greeting.do" target="_self">인사말</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               
               <li class="" style="z-index:997">
                   <a href="/infor/origine_list.do" target="_self">기업·기관정보</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>기업·기관정보</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/infor/origine_list.do" target="_self">기업정보</a></li>
                               <li><a href="/infor/promote_list.do" target="_self">기업홍보동영상</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:996">
                   <a href="/supply/product_list.do" target="_self">수요·공급품목</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>수요·공급품목</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/supply/product_list.do" target="_self">제품제작</a></li>
                               <li><a href="/supply/technical_list.do" target="_self">기술지원</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:994">
                   <a href="/reservation/infor_list.do" target="_self">장비활용</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>장비활용</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/reservation/infor_list.do" target="_self">장비이용안내</a></li>
                               <li><a href="/reservation/own_list.do" target="_self">보유장비현황</a></li>
                               <li><a href="/reservation/introduction_list.do" target="_self">장비도입계획</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:998">
                   <a href="/board/notice/list.do" target="_self">정보마당</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>정보마당</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/board/notice/list.do" target="_self">공지사항</a></li>
                               <li><a href="/board/business/list.do" target="_self">사업공고</a></li>
                               <li><a href="/board/outdata/list.do" target="_self">보도자료 및 동향</a></li>
                               <li><a href="/board/data/list.do" target="_self">자료실</a></li>
                               <li><a href="/board/qna/list.do" target="_self">Q&A</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
            </ul>
            <!-- // 상단메뉴 -->
        </div>
        <!-- // 헤더 하단 -->

        
    </div> 
	<!-- // 헤더 -->

	<!--서브감싸기-->
	<div id="subContainer">

		<style>
		    .inner.searching { padding-top:180px;}
			.search_result {border:3px solid #2969b3; background:#fff; padding:40px 30px; text-align:center;}
			.search_result input {padding:25px; width:50%; }
			.search_result button {background:#2969b3; color:#fff; padding:12px 20px;}
		    .inner.searching .result_num {font-size:20px; padding:30px 0px;  border-bottom:1px solid #eee;}
		    .inner.searching .result_num span {color:#2969b3;}
			.result_list_tit{position:relative; margin-top:20px;}
			.result_list_tit h1 a{ font-size:25px; color:#2969b3; width:90%; display:inline-block; margin-bottom:30px; }
			.result_list_tit h1 span{font-size:16px; color:#666;}
			.result_list_tit span a{font-size:14px; text-align:right; display:inline;}

			.list_line{ border-bottom:1px solid #eee; padding:20px 0px;}
			.result_list {margin-bottom:20px;}
			.result_list h2{font-size:18px; color:#000; font-weight:bold;}
			.result_list span{font-size:15px; white-space: normal; overflow: hidden; text-overflow: ellipsis; word-wrap: break-word;display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;}

		
			@media screen and (max-width:759px) { 

			.search_result{border:none; padding:0px;}
			.search_result input {width:70%;}
			.search_result button {background:#2969b3; color:#fff; padding:7px 15px;}
		    .inner.searching .result_num {font-size:15px; padding:30px 0px;  border-bottom:1px solid #eee; text-align:center;}

			.result_list_tit{position:relative; margin-top:0px;}
			.result_list_tit h1 a{ font-size:18px; color:#2969b3; width:90%; display:inline-block; margin-bottom:30px; }
			.result_list h2{font-size:15px; color:#000; font-weight:bold;}
			.result_list span{font-size:13px; white-space: normal; overflow: hidden; text-overflow: ellipsis; word-wrap: break-word;display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;}


			}
		
		</style>
		
		<form name="thebogiFrm" id="thebogiFrm" method="post">
			<input type="hidden" name="keyword" id="sss" value="${bean.keyword}" />
			<input type="hidden" name="gubun" id="gubun" value="" />
		</form>
        
        <div id="sub_container" data-menu="1" data-sub="1">
        	
            <div class="inner searching">


                <div class="search_result">
                    <form name="searchForm" id="searchForm" method="post">
                        <input type="text" name="keyword" id="inner_keyword" value="${bean.keyword}" placeholder="검색어를 입력하세요" required="" size="50" maxlength="50">
                        <button type="submit" value="검색" class="main_search_btn"  id="innerSearchBtn"><i class="xi-search"></i></button>
                    </form>
                </div>

				<p class="result_num"><span>'${bean.keyword}'</span>검색어로 <span>'${totalCount}'</span>개의 결과를 찾았습니다.</p>


				<div class="list_line">

					<div class="result_list_tit">
						<h1><a href="#">메뉴<span>( ${menuCount}개 )</span></a></h1>
					</div>

					<c:forEach var="list" items="${menuTop3List}">
						<div class="result_list">
						<h2>
						<c:choose>
							<c:when test="${empty list.MENU4 and empty list.MENU5}">
								${list.MENU3}
							</c:when>
							<c:when test="${empty list.MENU5}">
								${list.MENU4}
							</c:when>
							<c:when test="${not empty list.MENU5}">
								${list.MENU5}
							</c:when>
						</c:choose>
						</h2>
						<span>
							<a href="${list.LINK}" target="_blank">
								<c:if test="${not empty list.MENU1}">
									${list.MENU1}
								</c:if>
								<c:if test="${not empty list.MENU2}">
									&gt; ${list.MENU2}
								</c:if>
								<c:if test="${not empty list.MENU3}">
									&gt; ${list.MENU3}
								</c:if>
								<c:if test="${not empty list.MENU4}">
									&gt; ${list.MENU4}
								</c:if>
								<c:if test="${not empty list.MENU5}">
									&gt; ${list.MENU5}
								</c:if>
							</a>
						</span>
						</div>
					</c:forEach>
					
				</div>

				<div class="list_line">

					<div class="result_list_tit">
						<h1><a href="#">카테고리 타이틀<span>( 35개 )</span></a></h1>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>


					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>





				</div>







				<div class="list_line">

					<div class="result_list_tit">
						<h1><a href="#">카테고리 타이틀<span>( 35개 )</span></a></h1>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>


					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>


					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>

					<div class="result_list">
						<h2><a href="#">통신중계서비스 제공</a></h2>
						<span>
						통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 다른 사람과 전화 통화를 원하는 통신중계서비스 제공 청각 또는 언어장애인이 전화로 의사소통을 할 수 있도록 중계사(문자, 수어)를 통해 통신중계서비스를 제공합니다. 지원대상 청각 또는, 언어장애인과 전화 통화를 하는 사람에게 지원합니다. 통신중계서비스 제공 청각 또는 언어장애인이 
						</span>
					</div>




                    <nav class="pg_wrap">
                        <span class="pg">
                            <a href="#;" class="pg_page pg_start"></a>
                            <strong class="pg_current">1</strong></span>
                            <a href="#;" class="pg_page">2</span></a>
                            <a href="#;" class="pg_page">3</span></a>
                            <a href="#;" class="pg_page pg_end"></a>
                        </span>
                    </nav>
					<br/>






				</div>

                
                
            </div>
        </div>
        
		
        
        
              
	</div>
    <!--서브감싸기-->
    <style>
    #footer {margin-top:0px;}
    </style>
	
<!-- 푸터 -->
    <div id="footer">
        <div class="inner">
        <!-- 그리드 감싸기 -->
            <div class="foot_wrap">
                <div class="foot_info">
                    <div class="address">
                        <span>대전 테크노파크</span>
                        <span>[34839]대전광역시 중구 중앙로 119, 15층 대전테크노파크  &nbsp; | &nbsp;   Tel 1811.1582  &nbsp; | &nbsp;    Fax. 042)251.2859</span>
                        <span>Copyright 2021 D-ENG. ALL REIGHTS RESERVED.</span>
                    </div>
                    <h3><a href="/member/policy.do">개인정보 취급방침</a> &nbsp;·&nbsp; <a href="/member/email.do">이메일무단수집거부</a></h3>
                </div>
                <div class="foot_customer">
                    <div class="family_list">
                    	<div class="family">
                            <a href="javascript:;">전국테크노파크</a>
                            <ul class="dropdown">
                                <li><a href="http://www.gwtp.or.kr/" target="_blank" rel="noopener noreferrer">강원테크노파크</a></li>
				                <li><a href="http://www.gtp.or.kr" target="_blank" rel="noopener noreferrer">경기테크노파크</a></li>
				                <li><a href="http://www.gdtp.or.kr/" target="_blank" rel="noopener noreferrer">경기대진테크노파크</a></li>
				                <li><a href="http://www.gjtp.or.kr" target="_blank" rel="noopener noreferrer">광주테크노파크</a></li>
				                <li><a href="http://www.gntp.or.kr/" target="_blank" rel="noopener noreferrer">경남테크노파크</a></li>
				                <li><a href="http://www.gbtp.or.kr/" target="_blank" rel="noopener noreferrer">경북테크노파크</a></li>
				                <li><a href="http://www.ttp.org" target="_blank" rel="noopener noreferrer">대구테크노파크</a></li>
				                <li><a href="http://www.btp.or.kr/" target="_blank" rel="noopener noreferrer">부산테크노파크</a></li>
				                <li><a href="http://itp.or.kr" target="_blank" rel="noopener noreferrer">인천테크노파크</a></li>
				                <li><a href="http://www.seoultp.or.kr/" target="_blank" rel="noopener noreferrer">서울테크노파크</a></li>
				    			<li><a href="http://www.sjtp.or.kr/" target="_blank" rel="noopener noreferrer">세종테크노파크</a></li>
				                <li><a href="http://www.utp.or.kr/" target="_blank" rel="noopener noreferrer">울산테크노파크</a></li>
				                <li><a href="http://www.jntp.or.kr/" target="_blank" rel="noopener noreferrer">전남테크노파크</a></li>
				                <li><a href="http://www.jbtp.or.kr/" target="_blank" rel="noopener noreferrer">전북테크노파크</a></li>
				                <li><a href="http://www.jejutp.or.kr/" target="_blank" rel="noopener noreferrer">제주테크노파크</a></li>
				                <li><a href="http://www.ctp.or.kr" target="_blank" rel="noopener noreferrer">충남테크노파크</a></li>
				                <li><a href="http://www.cbtp.or.kr" target="_blank" rel="noopener noreferrer">충북테크노파크</a></li>
				                <li><a href="http://www.ptp.or.kr/" target="_blank" rel="noopener noreferrer">포항테크노파크</a></li>
				                <li><a href="http://technopark.kr" target="_blank" rel="noopener noreferrer">한국테크노파크진흥회</a></li>
                            </ul>
                        </div>
                        <div class="family2">
                            <a href="javascript:;">유관기업</a>
                            <ul class="dropdown">
                                <li><a href="https://www.daejeon.go.kr/" target="_blank" rel="noopener noreferrer">대전광역시</a></li>
				            	<li><a href="https://www.mss.go.kr/" target="_blank" rel="noopener noreferrer">중소벤처기업부</a></li>
				            	<li><a href="https://www.mss.go.kr/site/daejeon/main.do" target="_blank" rel="noopener noreferrer">대전충남지방중소벤처기업청</a></li>
				            	<li><a href="http://www.djba.or.kr/" target="_blank" rel="noopener noreferrer">대전경제통상진흥원</a></li>
				            	<li><a href="http://www.dicia.or.kr/" target="_blank" rel="noopener noreferrer">대전정보문화산업진흥원</a></li>
				            	<li><a href="https://www.sinbo.or.kr/" target="_blank" rel="noopener noreferrer">대전신용보증재단</a></li>
				            	<li><a href="https://ccei.creativekorea.or.kr/daejeon/" target="_blank" rel="noopener noreferrer">대전창조경제혁신센터</a></li>
				            	<li><a href="http://daejeoncci.korcham.net/" target="_blank" rel="noopener noreferrer">대전상공회의소</a></li>
				            	<li><a href="http://dc.kita.net/" target="_blank" rel="noopener noreferrer">한국무역협회 대전충남지역본부</a></li>
				            	<li><a href="https://www.innopolis.or.kr/" target="_blank" rel="noopener noreferrer">연구개발특구진흥재단</a></li>
				            	<li><a href="http://www.djic.or.kr/" target="_blank" rel="noopener noreferrer">대전산업단지관리공단</a></li>
				            	<li><a href="https://www.semas.or.kr/" target="_blank" rel="noopener noreferrer">소상공인시장진흥공단 대전충청지역본부</a></li>
				            	<li><a href="http://daejeon.wbiz.or.kr/" target="_blank" rel="noopener noreferrer">한국여성경제인협회 대전지회</a></li>
				            	<li><a href="https://www.kodit.co.kr/" target="_blank" rel="noopener noreferrer">신용보증기금</a></li>
				            	<li><a href="http://www.kbiz.or.kr/home/homeIndex.do?menuCode=dc" target="_blank" rel="noopener noreferrer">중소기업중앙회 대전세종충남지역본부</a></li>
				            	<li><a href="http://www.smtech.go.kr" target="_blank" rel="noopener noreferrer">SMTECH</a></li>
				            	<li><a href="http://www.bizinfo.go.kr" target="_blank" rel="oopener noreferrer">기업마당</a></li>
				            	<li><a href="http://www.etube.re.kr" target="_blank" rel="oopener noreferrer">e-Tube</a></li>
				            	<li><a href="http://www.itts.or.kr" target="_blank" rel="oopener noreferrer">ITTS(산업기술종합서비스)</a></li>
				            	<li><a href="http://www.techforce.or.kr" target="_blank" rel="oopener noreferrer">Tech-force NET(산업기술 인력 통합정보망)</a></li>
				            	<li><a href="http://www.ntis.go.kr" target="_blank" rel="oopener noreferrer">NTIS(국가과학기술지식정보서비스)</a></li>
				            	<li><a href="http://www.ntb.kr" target="_blank" rel="oopener noreferrer">NTB기술은행</a></li>
				            	<li><a href="http://www.data.go.kr" target="_blank" rel="oopener noreferrer">공공데이터 포털</a></li>
				            	<li><a href="http://www.k-pass.kr" target="_blank" rel="oopener noreferrer">K-Pass(사업관리시스템)</a></li>
				            	<li><a href="http://www.k-startup.go.kr" target="_blank" rel="oopener noreferrer">K-Startup</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        <!-- // 그리드 감싸기 -->
        </div>
    </div>
    <!-- // 푸터 -->
</div>
<!-- // 전체 감싸기 -->
    
>>>>>>> refs/heads/202204
<script src="/js/tab.js"></script>