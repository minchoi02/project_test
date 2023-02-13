<<<<<<< HEAD
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
                           		<li><a href="/intro/greeting.do" target="_self">인사말</a></li>
                           		<li><a href="/intro/support.do" target="_self">사업배경</a></li>
                                <li><a href="/intro/introduction.do" target="_self">사업소개</a></li>
                                <li><a href="/intro/industry.do" target="_self">뿌리산업이란?</a></li>
						    </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:997">
                   <a href="/board/business_list.do" target="_self">사업공고</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>사업공고</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/board/business_list.do" target="_self">사업공고</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:997">
                   <a href="/infor/origine_list.do" target="_self">기업지원</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>기업지원</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/board/business_list.do" target="_self">기업지원 신청하기</a></li>
                               <li><a href="/supply/technical_list.do" target="_self">기술지원 현황</a></li>
							   <li><a href="/infor/origine_list.do" target="_self">기업정보</a></li>
                               <li><a href="/infor/promote_list.do" target="_self">기업홍보동영상</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:996">
                   <a href="/supply/product_list.do" target="_self">수요·공급</a>
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
                   <a href="/board/list1.do" target="_self">정보마당</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>정보마당</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/board/list1.do" target="_self">공지사항</a></li>
                               <li><a href="/board/outdata_list.do" target="_self">보도자료 및 동향</a></li>
                               <li><a href="/board/data_list.do" target="_self">자료실</a></li>
                               <li><a href="/board/qna_list.do" target="_self">Q&A</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
            </ul>
            <!-- // 상단메뉴 -->
        </div>
       <!-- // 헤더 하단 -->
   </div> 
=======
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
                           		<li><a href="/intro/greeting.do" target="_self">인사말</a></li>
                           		<li><a href="/intro/support.do" target="_self">사업배경</a></li>
                                <li><a href="/intro/introduction.do" target="_self">사업소개</a></li>
                                <li><a href="/intro/industry.do" target="_self">뿌리산업이란?</a></li>
						    </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:997">
                   <a href="/board/business_list.do" target="_self">사업공고</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>사업공고</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/board/business_list.do" target="_self">사업공고</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:997">
                   <a href="/infor/origine_list.do" target="_self">기업지원</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>기업지원</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/board/business_list.do" target="_self">기업지원 신청하기</a></li>
                               <li><a href="/supply/technical_list.do" target="_self">기술지원 현황</a></li>
							   <li><a href="/infor/origine_list.do" target="_self">기업정보</a></li>
                               <li><a href="/infor/promote_list.do" target="_self">기업홍보동영상</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
               <li class="" style="z-index:996">
                   <a href="/supply/product_list.do" target="_self">수요·공급</a>
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
                   <a href="/board/list1.do" target="_self">정보마당</a>
                   <div class="menu-item">
                       <div class="inner">
                           <!-- 대메뉴 이름 -->
                           <div class="titleArea"><span>정보마당</span></div>
                           <!-- // 대메뉴 이름 -->
                           <ul class="sub">
                               <li><a href="/board/list1.do" target="_self">공지사항</a></li>
                               <li><a href="/board/outdata_list.do" target="_self">보도자료 및 동향</a></li>
                               <li><a href="/board/data_list.do" target="_self">자료실</a></li>
                               <li><a href="/board/qna_list.do" target="_self">Q&A</a></li>
                           </ul>
                       </div>
                   </div>
               </li>
            </ul>
            <!-- // 상단메뉴 -->
        </div>
       <!-- // 헤더 하단 -->
   </div> 
>>>>>>> refs/heads/202204
<!-- // 헤더 -->