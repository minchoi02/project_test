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
	<!-- // 헤더 -->

	<!--메인감싸기-->
	<div id="mainContainer">
    	
    	<!--메인비주얼 검색-->
        <div class="main_visual scrollreveal">
        	<!-- main cover (s) -->
            <!--<div id="mainCover">
                <div class="video_mask"></div>
                <div class="video">
                    <video src="/img/td00470004551_1080p.mov" autoplay muted loop poster="#"></video>
                </div>
            </div>-->
            <!-- main cover (e) -->
            
            <!-- 페이드 추가-->
            <style>
            .swiper {width: 100%;height: 100%;}
            .swiper-slide {background-position: center;background-size: cover;}
            .swiper-slide img {display: block;width: 120%;}
			.main_fade {position:absolute;width:100%;z-index:-1;}
			@media screen and (max-width:1024px) {
			.swiper-slide img {width:auto;}
			#mainCover .video video {width:300%;}
			}
            </style>
            <!-- Swiper -->
            <div class="main_fade">
                <div class="swiper mySwiper1">
                    <div class="swiper-wrapper">

                        <div class="swiper-slide">
							<div id="mainCover">
								<div class="video_mask"></div>
								<div class="video mobile-style">
									<video src="/img/main_video.mp4" autoplay muted loop playsinline poster=""></video>
                                </div>
                                <div class="video pc-style">
									<video src="/img/main_video_old.mp4" autoplay muted loop playsinline poster=""></video>
								</div>
							</div>						
						</div>

						<div class="swiper-slide"><img src="/img/main_visual_bg.jpg" /></div>
                        

					</div>
                </div>
            </div>
			<!-- Initialize Swiper -->
            <script>
            var swiper = new Swiper(".mySwiper1", {
				autoplay: {
					delay: 10000,
					disableOnInteraction: false,
				},
                spaceBetween: 30,
                effect: "fade",
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
            });
            </script>
            <!-- 페이드 추가-->
            
            <div class="main_face">
                <div class="main_comment">
                    <h1>뿌리산업의 스마트화</h1>
                    <span>디지털 엔지니어링과 함께!</span>
                </div>
                <div class="sub_comment">디지털 엔지니어링 기반 구축을 통하여 지역 뿌리 기업의 제품,<Br />공정 혁신과 기술역량을 업그레이드합니다.</div>
                <form name="totalSearchForm" id="totalSearchForm" method="post">
                <div class="main_search">
                        <input type="text" name="keyword" value="" placeholder="검색어를 입력하세요" required="" id="keyword" class="" size="15" maxlength="20">
                        <button type="submit" value="검색" id="totalSearchBtn" class="main_search_btn"><i class="xi-search"></i></button>
                </div>
                </form>
                <div class="main_search_icon">
                    <div class="list">
                        <a href="/supply/product_list.do">
                            <div class="img"><img src="/img/main_search_icon1.png" /></div>
                            <div class="txt">제품제작</div>
                        </a>
                    </div>
                    <div class="list">
                        <a href="/supply/technical_list.do">
                            <div class="img"><img src="/img/main_search_icon2.png" /></div>
                            <div class="txt">기술지원</div>
                        </a>
                    </div>
                    <div class="list">
                        <a href="/reservation/infor_list.do">
                            <div class="img"><img src="/img/main_search_icon3.png" /></div>
                            <div class="txt">장비이용안내</div>
                        </a>
                    </div>
                    <div class="list">
                        <a href="/reservation/own_list.do">
                            <div class="img"><img src="/img/main_search_icon4.png" /></div>
                            <div class="txt">보유장비현황</div>
                        </a>
                    </div>
                    <div class="list">
                        <a href="/infor/origine_list.do">
                            <div class="img"><img src="/img/main_search_icon5.png" /></div>
                            <div class="txt">기업정보</div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!--//메인비주얼 검색-->
        
        <style>
		.swiper {
        width: 100%;
        height: 100%;
        margin-left: auto;
        margin-right: auto;
		overflow:visible;
        }

        .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        height: calc((100% - 30px) / 2);
		}
		</style>
		
        <!--사업공고/입찰공고-->
		<div class="main_business scrollreveal">
        	<div class="inner">
            	<div class="tab_cover">
					<ul id="tab">
						<li><a href="#;">진행중인 사업공고</a></li>
                        <li><a href="#;">뿌리산업 사업공고</a></li>
                        <li><a href="#;">대전테크노파크 사업공고</a></li>
                        <li><a href="#;">기타 사업공고</a></li>
                    </ul>
                	<div class="tab_con" id="tab_con">
                        <div class="content">
                        	<div class="slide">
                                <div class="swiper mySwiper">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9198#u" target="_blank">
                                            <h1>[대전테크노파크] 『스마트혁신기술 도시적용사업』공고</h1>
                                            <p>신청기간 : 2022-03-07 ~ 2022-04-15</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9111#u" target="_blank">
                                            <h1>[대전테크노파크] 2022년 중소기업 IP(지식재산) 바로지원 사업 모집공고</h1>
                                            <p>신청기간 : 2022-02-07 ~ 2022-03-31</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9176#u" target="_blank">
                                            <h1>[대전테크노파크] [3UP] 2022년도 창업지원기반조성사업 모집 공고</h1>
                                            <p>신청기간 : 2022-02-25 ~ 2022-03-28</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9175#u" target="_blank">
                                            <h1>[대전테크노파크] [3UP] 2022년도 시장창조(해외수요처확장지원) 지원사업 모집 공고</h1>
                                            <p>신청기간 : 2022-02-25 ~ 2022-03-28</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9174#u" target="_blank">
                                            <h1>[대전테크노파크] [3UP] 2022년도 강소기업디자인지원사업(브랜드, 제품디자인개발지원) 모집 공고</h1>
                                            <p>신청기간 : 2022-02-25 ~ 2022-03-28</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9173#u" target="_blank">
                                            <h1>[대전테크노파크] [3UP] 2022년도 사업화종합지원사업 모집 공고</h1>
                                            <p>신청기간 : 2022-02-25 ~ 2022-03-28</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9168#u" target="_blank">
                                            <h1>[대전테크노파크] 2022년 대전지역스타기업육성사업 지원기업 모집 공고</h1>
                                            <p>신청기간 : 2022-02-23 ~ 2022-03-22</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.kpic.re.kr/html/?pmode=business&smode=view&seq=4152&strCategory=" target="_blank">
                                            <h1>[뿌리산업] [고용추천서 발급] 뿌리산업 외국인 숙련기능인력 점수제 비자(E-7-4) 산업통상자원부 고용추천서 발급 공고</h1>
                                            <p>신청기간 : 2022-02-09 ~ 2099-12-31</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.kpic.re.kr/html/?pmode=business&smode=view&seq=4151&strCategory=" target="_blank">
                                            <h1>[뿌리산업] [2022년 뿌리산업 부처추천] 2022년 외국인 숙련기능인력 점수제 비자(E-7-4) 전환 관련 뿌리산업 분야...</h1>
                                            <p>신청기간 : 2022-02-09 ~ 2022-12-30</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9035#u" target="_blank">
                                            <h1>[대전테크노파크] 지능형로봇센터 디지털제조장비 고도화사업 지원기업 모집 공고</h1>
                                            <p>신청기간 : 2022-01-19 ~ 2022-05-31 </p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                    </div><div class="swiper-pagination"></div>
                                </div>
                            </div>
                        </div>
                        <div class="content">
                        	<div class="slide">
                                <div class="swiper mySwiper_2">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                        	<a href="https://www.kpic.re.kr/html/?pmode=business&smode=view&seq=4152&strCategory=" target="_blank">
                                            <h1>[고용추천서 발급] 뿌리산업 외국인 숙련기능인력 점수제 비자(E-7-4) 산업통상자원부 고용추천서 발급 공고</h1>
                                            <p>신청기간 : 2022-02-09 ~ 2099-12-31</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.kpic.re.kr/html/?pmode=business&smode=view&seq=4151&strCategory=" target="_blank">
                                            <h1>[2022년 뿌리산업 부처추천] 2022년 외국인 숙련기능인력 점수제 비자(E-7-4) 전환 관련 뿌리산업 분야...</h1>
                                            <p>신청기간 : 2022-02-09 ~ 2022-12-30</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.kpic.re.kr/html/?pmode=business&smode=view&seq=4150&strCategory=" target="_blank">
                                            <h1>[2022년 근로자 기량검증] 2022년 외국인 숙련기능인력 점수제 비자(E-7-4) 전환 관련 뿌리산업 분야...</h1>
                                            <p>신청기간 : 	2022-02-09 ~ 2022-12-30</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.kpic.re.kr/html/?pmode=business&smode=view&seq=4124&strCategory=" target="_blank">
                                            <h1>2022년도 뿌리기업 자동화 첨단화 지원사업 공고</h1>
                                            <p>신청기간 : 	2022-01-24 ~ 2022-02-25</p>
                                            <span class="gray">완료</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.kpic.re.kr/html/?pmode=business&smode=view&seq=4102&strCategory=" target="_blank">
                                            <h1>2022년 디지털 뿌리 명장 교육센터 수행기관 모집 공고</h1>
                                            <p>신청기간 : 2022-01-11 ~ 2022-02-11</p>
                                            <span class="gray">완료</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.kpic.re.kr/html/?pmode=business&smode=view&seq=4101&strCategory=" target="_blank">
                                            <h1>2022년 뿌리산업 특화단지 지정과 지원사업 공고</h1>
                                            <p>신청기간 : 2022-01-11 ~ 2022-02-11</p>
                                            <span class="gray">완료</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="#;" target="_blank">
                                            <h1>2021년 강원지역 지역 주력사업 수혜기업 모집 공고문</h1>
                                            <p>신청기간 : 2021-04-13 ~ 2021-04-23</p>
                                            <span class="gray">완료</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.kpic.re.kr/html/?pmode=business&smode=view&seq=4100&strCategory=" target="_blank">
                                            <h1>2022년 지능형 뿌리공정 시스템 구축사업 공고</h1>
                                            <p>신청기간 : 	2022-01-11 ~ 2022-02-11</p>
                                            <span class="gray">완료</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.kpic.re.kr/html/?pmode=business&smode=view&seq=4092&strCategory=" target="_blank">
                                            <h1>(유학생)2022년 외국인 숙련기능인력 비자(E-7-4) 전환 관련 뿌리산업 분야 외국인유학생 상반기 기량검증 계획 공고</h1>
                                            <p>신청기간 : 	2022-01-06 ~ 2022-01-11</p>
                                            <span class="gray">완료</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.kpic.re.kr/html/?pmode=business&smode=view&seq=4030&strCategory=" target="_blank">
                                            <h1>차세대 핵심뿌리기술 고시를 위한 검토 결과 온라인 의견 수렴</h1>
                                            <p>신청기간 : 2021-11-30 ~ 2021-12-09</p>
                                            <span class="gray">완료</span>
                                            </a>
                                        </div>
                                    </div><div class="swiper-pagination2"></div>
                                </div>
                            </div>
                        </div>
                        <div class="content">
                        	<div class="slide">
                                <div class="swiper mySwiper_3">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9198#u" target="_blank">
                                            <h1>『스마트혁신기술 도시적용사업』공고</h1>
                                            <p>신청기간 : 2022-03-07 ~ 2022-04-15</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9111#u" target="_blank">
                                            <h1>2022년 중소기업 IP(지식재산) 바로지원 사업 모집공고</h1>
                                            <p>신청기간 : 2022-02-07 ~ 2022-03-31</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9176#u" target="_blank">
                                            <h1>[3UP] 2022년도 창업지원기반조성사업 모집 공고</h1>
                                            <p>신청기간 : 2022-02-25 ~ 2022-03-28</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9175#u" target="_blank">
                                            <h1>[3UP] 2022년도 시장창조(해외수요처확장지원) 지원사업 모집 공고</h1>
                                            <p>신청기간 : 2022-02-25 ~ 2022-03-28</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9174#u" target="_blank">
                                            <h1>[3UP] 2022년도 강소기업디자인지원사업(브랜드, 제품디자인개발지원) 모집 공고</h1>
                                            <p>신청기간 : 2022-02-25 ~ 2022-03-28</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9173#u" target="_blank">
                                            <h1>[3UP] 2022년도 사업화종합지원사업 모집 공고</h1>
                                            <p>신청기간 : 2022-02-25 ~ 2022-03-28</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9168#u" target="_blank">
                                            <h1>2022년 대전지역스타기업육성사업 지원기업 모집 공고</h1>
                                            <p>신청기간 : 2022-02-23 ~ 2022-03-22</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9035#u" target="_blank">
                                            <h1>지능형로봇센터 디지털제조장비 고도화사업 지원기업 모집 공고</h1>
                                            <p>신청기간 : 2022-01-19 ~ 2022-05-31 </p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9187#u" target="_blank">
                                            <h1>2022년 에너지융합산업 경쟁력강화 지원사업 기업 모집 공고</h1>
                                            <p>신청기간 : 2022-03-03 ~ 2022-03-17</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                        	<a href="https://www.djtp.or.kr/sub010101/view/id/9194#u" target="_blank">
                                            <h1>2022년 나노융합분야 국내전시회 참가지원사업 기업 모집</h1>
                                            <p>신청기간 : 2022-02-25 ~ 2022-03-16</p>
                                            <span class="blue">진행중</span>
                                            </a>
                                        </div>
                                    </div><div class="swiper-pagination3"></div>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="content">
                        	<div class="slide">
                                <div class="swiper mySwiper_4">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                        </div>
                                        <div class="swiper-slide">
                                        </div>
                                        <div class="swiper-slide">
                                        </div>
                                        <div class="swiper-slide">
                                        </div>
                                        <div class="swiper-slide">
                                        </div>
                                        <div class="swiper-slide">
                                        </div>
                                    </div><div class="swiper-pagination4"></div>
                                </div>
                            </div>
                        </div> -->
                	</div>
                </div>
            </div>
		</div>
        <!--//사업공고/입찰공고-->
        <!-- Initialize Swiper -->
        
		<script>
		var swiper = new Swiper(".mySwiper", {
			slidesPerView: 3,
			autoplay: {
				delay: 100000,
				disableOnInteraction: false,
			},
			grid: {
				rows: 2,
			},
			spaceBetween: 0,
			pagination: {
				el: ".swiper-pagination",
				clickable: true,
			},
			breakpoints: {
				320: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				480: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				640: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				768: {
					slidesPerView: 2,
					spaceBetween: 0,
				},
				1024: {
					slidesPerView: 3,
					spaceBetween: 0,
				},
			},
		});

		var swiper = new Swiper(".mySwiper_2", {
			slidesPerView: 3,
			autoplay: {
				delay: 100000,
				disableOnInteraction: false,
			},
			grid: {
				rows: 2,
			},
			spaceBetween: 0,
			pagination: {
				el: ".swiper-pagination2",
				clickable: true,
			},
			breakpoints: {
				320: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				480: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				640: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				768: {
					slidesPerView: 2,
					spaceBetween: 0,
				},
				1024: {
					slidesPerView: 3,
					spaceBetween: 0,
				},
			},
		});
		
		var swiper = new Swiper(".mySwiper_3", {
			slidesPerView: 3,
			autoplay: {
				delay: 100000,
				disableOnInteraction: false,
			},
			grid: {
				rows: 2,
			},
			spaceBetween: 0,
			pagination: {
				el: ".swiper-pagination3",
				clickable: true,
			},
			breakpoints: {
				320: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				480: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				640: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				768: {
					slidesPerView: 2,
					spaceBetween: 0,
				},
				1024: {
					slidesPerView: 3,
					spaceBetween: 0,
				},
			},
		});
		
		var swiper = new Swiper(".mySwiper_4", {
			slidesPerView: 3,
			autoplay: {
				delay: 100000,
				disableOnInteraction: false,
			},
			grid: {
				rows: 2,
			},
			spaceBetween: 0,
			pagination: {
				el: ".swiper-pagination4",
				clickable: true,
			},
			breakpoints: {
				320: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				480: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				640: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				768: {
					slidesPerView: 2,
					spaceBetween: 0,
				},
				1024: {
					slidesPerView: 3,
					spaceBetween: 0,
				},
			},
		});

        </script>
        
        <!-- 공지사항 -->
        <div id="section4" class="section section04">
            <div class="sectionCon">
                <div class="title scrollreveal">
                    <p class="mainTit">Notice & Media</p>
                    <h1 class="sec_top_tx">D-ENG의 소식을 전해드립니다.</h1>
                </div>
                <div class="noti-content scrollreveal">
                    <div class="left">
                        <div class="hp014">
                            <ul>
                                <li>
                                    <a href="#;" class="lt_img"><img src="/img/notice_img1.jpg" alt=""></a>
                                    <div class="It_subject">
                                    	<h1><b>뿌리기술 전문기업</b>신청안내</h1>
                                        <h2>뿌리기술 전문기업 온라인 신청 및 접수하여 가입이 가능합니다.</h2>
                                        <span><a href="https://www.root-tech.org/certification/guide.php" target="_blank">신청하기</a></span>
                                    </div>
        
                                </li>
                                <li>
                                    <a href="#;" class="lt_img"><img src="/img/notice_img2.jpg" alt=""></a>
                                    <div class="It_subject">
                                    	<h1><b>뿌리기술 전문기업</b>현황 확인</h1>
                                        <h2>인증받은 뿌리기술전문 기업들을 확인할수 있습니다.</h2>
                                        <span><a href="https://www.root-tech.org/community/company.php"  target="_blank">확인하기</a></span>
                                    </div>
        		          		</li>
                            </ul>
                        </div>
                    </div>
                    <div class="right">
                        <div class="hp001">
                            <ul>
                            	<c:forEach var="list" items="${noticeTop5List}">
                            		<li>
                                    	<a href="board/notice/view.do?seq=${list.SEQ}">
										<c:choose>
											<c:when test="${fn:length(list.TITLE) > 36}">
												<c:out value="${fn:substring(list.TITLE,0,32)}"/>....
											</c:when>
											<c:otherwise>
												<c:out value="${list.TITLE}"/>
											</c:otherwise> 
										</c:choose>
                                    	</a>
                                    	<span class="lt_date"><fmt:formatDate value="${list.REG_DATE}" pattern="yyyy.MM.dd" /></span>
                                	</li>
								</c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="more-btn" data-aos="fade-up" data-aos-delay="700" data-aos-duration="700" data-aos-once="true">
                        <a href="board/notice/list.do">더보기</a></div>
                </div>
            </div>
        </div>
        <!-- //공지사항 -->  
        
        <!-- 파트너 -->
        <div class="main_partner">
        	<div class="title scrollreveal">
            	<p class="mainTit">Related Partners</p>
				<h1 class="sec_top_tx">D-ENG와 함께하는 뿌리기업을 소개합니다.</h1>
            </div>
            <div class="content scrollreveal">
            	<div class="slide">
                	<div class="swiper mySwiper3">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                            	<div class="img"><img src="/img/partner_img1.jpg" /></div>
                                <div class="txt">
                                	<h2>㈜휴비스</h2>
                                    <p>용접 품질평가·제어시스템기술</p>
                                </div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><img src="/img/partner_img2.jpg" /></div>
                                <div class="txt">
                                	<h2>진성라이너</h2>
                                    <p>주철의 금형주조기술</p>
                                </div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><img src="/img/partner_img3.jpg" /></div>
                                <div class="txt">
                                	<h2>㈜지스</h2>
                                    <p>고속/정밀 레이저용접 장비 및 공정 기술</p>
                                </div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><img src="/img/partner_img4.jpg" /></div>
                                <div class="txt">
                                	<h2>㈜제니컴</h2>
                                    <p>광학기기용 기능성 투명소재/금속 소재 표면구조 제어 및 표면처리 기술</p>
                                </div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><img src="/img/partner_img5.jpg" /></div>
                                <div class="txt">
                                	<h2>㈜네오세라</h2>
                                    <p>분위기 자동제어 가스질화·가스 침탄 기술</p>
                                </div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><img src="/img/partner_img6.jpg" /></div>
                                <div class="txt">
                                	<h2>㈜진합</h2>
                                    <p>초정밀 냉간 다단포머 성형기술</p>
                                </div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><img src="/img/partner_img7.jpg" /></div>
                                <div class="txt">
                                	<h2>태창금속산업㈜</h2>
                                    <p>주조 대형 구조용 비철 주조기술 (용탕 주입량 1ton/회 이상)</p>
                                </div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><img src="/img/partner_img8.jpg" /></div>
                                <div class="txt">
                                	<h2>㈜다이나맥</h2>
                                    <p>강재의 온간-냉간-열간 공정복합성형기술</p>
                                </div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><img src="/img/partner_img9.jpg" /></div>
                                <div class="txt">
                                	<h2>㈜한스코</h2>
                                    <p>초대형 주철·주강 기술</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-button-next-"></div>
					<div class="swiper-button-prev-"></div>
                </div>
            </div>
        </div>
        <!-- Initialize Swiper -->
		<script>
            var swiper = new Swiper(".mySwiper3", {
                slidesPerView: 4,
                spaceBetween: 30,
				navigation: {
				  nextEl: ".swiper-button-next-",
				  prevEl: ".swiper-button-prev-",
				},
				breakpoints: {
				320: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				480: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				640: {
					slidesPerView: 1,
					spaceBetween: 0,
				},
				768: {
					slidesPerView: 2,
					spaceBetween: 30,
				},
				1024: {
					slidesPerView: 4,
					spaceBetween: 30,
				},
			},
                
            });
        </script>
        <!-- //파트너 -->




        <div class="main_partner2">
        	<div class="title scrollreveal">
            	<p class="mainTit">Partners</p>
				<h1 class="sec_top_tx">D-ENG의 유관기관을 소개합니다.</h1>
            </div>
            <div class="content scrollreveal">
            	<div class="slide">
                	<div class="swiper mySwiper4">
                        <div class="swiper-wrapper">
                        	<div class="swiper-slide">
                            	<div class="img"><a href="http://www.motie.go.kr/" target="_blank"><img src="/img/main_part6.jpg" /></a></div>
                            </div>
                        	<div class="swiper-slide">
                            	<div class="img"><a href="https://www.mss.go.kr/" target="_blank"><img src="/img/main_part5.jpg" /></a></div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><a href="https://www.daejeon.go.kr/" target="_blank"><img src="/img/main_part4.jpg" /></a></div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><a href="https://www.kisti.re.kr/" target="_blank"><img src="/img/main_part1.jpg" /></a></div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><a href="https://www.djtp.or.kr/" target="_blank"><img src="/img/main_part2.jpg" /></a></div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><a href="https://www.hanbat.ac.kr/" target="_blank"><img src="/img/main_part3.jpg" /></a></div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><a href="https://www.kitech.re.kr/" target="_blank"><img src="/img/main_part7.jpg" /></a></div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><a href="https://www.nst.re.kr/" target="_blank"><img src="/img/main_part8.jpg" /></a></div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><a href="https://www.kpic.re.kr/" target="_blank"><img src="/img/main_part9.jpg" /></a></div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><a href="https://www.kimm.re.kr/" target="_blank"><img src="/img/main_part10.jpg" /></a></div>
                            </div>
	                      	<div class="swiper-slide">
                            	<div class="img"><a href="http://www.kiks.or.kr/" target="_blank"><img src="/img/main_part11.jpg" /></a></div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><a href="https://www.keti.re.kr/" target="_blank"><img src="/img/main_part12.jpg" /></a></div>
                            </div>
                            <div class="swiper-slide">
                            	<div class="img"><a href="http://www.ricee.or.kr/" target="_blank"><img src="/img/main_part13.jpg" /></a></div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
                </div>
            </div>
        </div>
        <!-- Initialize Swiper -->
		<script>
            var swiper = new Swiper(".mySwiper4", {
                slidesPerView: 6,
                spaceBetween: 30,
				navigation: {
				  nextEl: ".swiper-button-next",
				  prevEl: ".swiper-button-prev",
				},
				breakpoints: {
				320: {
					slidesPerView: 3,
					spaceBetween: 10,
				},
				480: {
					slidesPerView: 3,
					spaceBetween: 10,
				},
				640: {
					slidesPerView: 3,
					spaceBetween: 10,
				},
				768: {
					slidesPerView: 4,
					spaceBetween: 30,
				},
				1024: {
					slidesPerView: 6,
					spaceBetween: 35,
				},
			},
                
            });
        </script>

        <!-- //유관기관 -->
	</div>
    <!--메인감싸기-->
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
                        <span>(재)대전테크노파크</span>
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
    
<script src="/js/tab.js"></script>
