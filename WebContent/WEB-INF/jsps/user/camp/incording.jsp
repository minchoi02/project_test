<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="imagetoolbar" content="no">
	<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
	<meta name="viewport" content="device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1.0,user-scalable=no">
	<meta name="format-detection" content="telephone=no, address=no, email=no">

	<meta name="keywords" content="Flexer" />
	<meta name="description" content="FLEXER 스포츠 영상 관리 시스템" />

	<meta property="og:type" content="website">
	<meta property="og:title" content="Flexer">
	<meta property="og:description" content="FLEXER 스포츠 영상 관리 시스템">

	<link rel="apple-touch-icon-precomposed" sizes="57x57" href="/images/common/apple-touch-icon-57x57.png" />
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="/images/common/apple-touch-icon-114x114.png" />
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/common/apple-touch-icon-72x72.png" />
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="/images/common/apple-touch-icon-144x144.png" />
	<link rel="apple-touch-icon-precomposed" sizes="60x60" href="/images/common/apple-touch-icon-60x60.png" />
	<link rel="apple-touch-icon-precomposed" sizes="120x120" href="/images/common/apple-touch-icon-120x120.png" />
	<link rel="apple-touch-icon-precomposed" sizes="76x76" href="/images/common/apple-touch-icon-76x76.png" />
	<link rel="apple-touch-icon-precomposed" sizes="152x152" href="/images/common/apple-touch-icon-152x152.png" />
	<link rel="icon" type="image/png" href="/images/common/favicon-196x196.png" sizes="196x196" />
	<link rel="icon" type="image/png" href="/images/common/favicon-96x96.png" sizes="96x96" />
	<link rel="icon" type="image/png" href="/images/common/favicon-32x32.png" sizes="32x32" />
	<link rel="icon" type="image/png" href="/images/common/favicon-16x16.png" sizes="16x16" />
	<link rel="icon" type="image/png" href="/images/common/favicon-128.png" sizes="128x128" />
	<meta name="application-name" content="Flexer"/>
	<meta name="msapplication-TileColor" content="#FFFFFF" />
	<meta name="msapplication-TileImage" content="/images/common/mstile-144x144.png" />
	<meta name="msapplication-square70x70logo" content="/images/common/mstile-70x70.png" />
	<meta name="msapplication-square150x150logo" content="/images/common/mstile-150x150.png" />
	<meta name="msapplication-wide310x150logo" content="/images/common/mstile-310x150.png" />
	<meta name="msapplication-square310x310logo" content="/images/common/mstile-310x310.png" />
	
	<title>FLEXER Sport Media Management System</title>
	
	<link rel="stylesheet" type="text/css" href="/css/common/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="/css/common/fontawesome-all.min.css">
	<link rel="stylesheet" type="text/css" href="/css/common/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="/css/common/al-range-slider.css">
	<link rel="stylesheet" type="text/css" href="/css/common/base.css" />
	<link rel="stylesheet" type="text/css" href="/css/common/common.css" />
	<link rel="stylesheet" type="text/css" href="/css/camp.css" />

	<script src="/js/common/jquery-3.3.1.min.js"></script>
	<script src="/js/common/jquery-ui.min.js"></script>
	<script src="/js/common/jquery.easing.1.3.js"></script>
	<script src="/js/common/swiper.min.js"></script>
	<script src="/js/common/al-range-slider.js"></script>
	<script src="/js/common/common.js"></script>
</head>
<body>

<div id="wrapper">
    <!-- 상단 헤더 { -->
    <header id="header" class="smooth">
        <div class="h1-mark">
            <h1>
				<a href="/camp/main.do" class="m-only">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 41.517 36.633">
						<path id="logoMark" d="M41.463,0H18.886C8.991,0,.452,7.6.018,17.493A18.325,18.325,0,0,0,18.325,36.633h1.212a14.653,14.653,0,0,0,14.653-14.6.072.072,0,0,0-.072-.072H28.094A11,11,0,0,0,39.075,11.053.072.072,0,0,0,39,10.981H30.536A11,11,0,0,0,41.517.072.072.072,0,0,0,41.445,0" transform="translate(0)" fill="#6950e6"/>
					</svg>
				</a>
                <a href="/camp/index.do" class="pc-only">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 360.074 111.141">
                        <g id="Flexer" transform="translate(283.5 87.395)">
                            <path id="logo_f" d="M46.041,97.294A16.257,16.257,0,0,0,62.3,81.1H16.257v21.528H0v16.13H16.257v21.528H32.515V119.012H46.041A16.257,16.257,0,0,0,62.3,102.819H32.515V97.548H46.041Z" transform="translate(-283.5 -116.992)" fill="#fff"/>
                            <path id="logo_l" d="M131.294,81H115.1v59.441h29.784a16.257,16.257,0,0,0,16.257-16.194H131.357V81.064h-.064" transform="translate(-325.506 -116.956)" fill="#fff"/>
                            <path id="logo_e1" d="M234.384,97.294A16.257,16.257,0,0,0,250.641,81.1H204.6v59.441h29.784a16.257,16.257,0,0,0,16.257-16.194H220.857v-5.271h13.527a16.257,16.257,0,0,0,16.257-16.194H220.857V97.611h13.527Z" transform="translate(-358.169 -116.992)" fill="#fff"/>
                            <path id="logo_x" d="M327.17,81.1l-7.748,13.4H319.3l-7.684-13.4h-18.67a.071.071,0,0,0-.064.127l17.146,29.657a.063.063,0,0,1,0,.064L292.877,140.6a.071.071,0,1,0,.063.127h18.67l7.748-13.4h.127l7.748,13.4H345.9a.071.071,0,0,0,.063-.127l-17.146-29.657a.064.064,0,0,1,0-.064l17.146-29.657a.071.071,0,0,0-.064-.127H327.17" transform="translate(-390.371 -116.988)" fill="#fff"/>
                            <path id="logo_e2" d="M421.984,97.294A16.257,16.257,0,0,0,438.241,81.1H392.2v59.441h29.784a16.257,16.257,0,0,0,16.257-16.194H408.457v-5.271h13.527a16.257,16.257,0,0,0,16.257-16.194H408.457V97.611h13.527Z" transform="translate(-426.633 -116.992)" fill="#fff"/>
                            <path id="logo_r" d="M535.87,102.655V97.321A16.321,16.321,0,0,0,519.549,81H481.7v59.441h16.257V118.976H505.9l7.811,13.463a16.257,16.257,0,0,0,22.1,5.969.064.064,0,0,0,0-.127l-11.558-20a.071.071,0,0,1,.063-.127,16.257,16.257,0,0,0,11.558-15.5m-37.849-5.4h21.592v5.334H497.957V97.321h.064" transform="translate(-459.296 -116.956)" fill="#fff"/>
                            <path id="logo_mark" d="M71.5,0H46.545C35.559,0,26.1,8.446,25.589,19.369A20.322,20.322,0,0,0,45.91,40.58h1.334A16.257,16.257,0,0,0,63.5,24.449h-6.8A12.193,12.193,0,0,0,68.9,12.256H59.437A12.193,12.193,0,0,0,71.63.064h-.064" transform="translate(-292.832 -87.395)" fill="#6950e6"/>
                        </g>
                    </svg>
                </a>
                <em>CAMP<span> Management</span></em>
            </h1>
        </div>

        <!-- GNB { -->
        <nav id="gnb">
            <ul class="nopm floats">
                <li><a href="/camp/member_list.do"><em><img src="/images/common/ico_people.svg" alt="Member"></em><span>Member</span></a></li>
                <li><a href="/camp/recording.do"><em><img src="/images/common/ico_recording.svg" alt="Recording"></em><span>Recording</span></a></li>
                <li class="active"><a href="/camp/videoclip.do"><em><img src="/images/common/ico_mediaclip.svg" alt="Video Clip"></em><span>Video Clip</span></a></li>
                <li><a href="/camp/setting.do"><em><img src="/images/common/ico_setting.svg" alt="Setting"></em><span>Setting</span></a></li>
            </ul>
        </nav>
        <!-- } GNB -->
    </header>
    <!-- } 상단 헤더 -->

	<!-- User Info { -->
	<aside class="user-info">
		<div class="member-area">
			<div class="pic"><img src="/images/sample_member1.jpg" alt="" /></div>
			<div class="txt">
				<em>Thomas Edward Patrick Brady Jr</em>
				<small>Camp / Tampa Bay Buccaneers</small>
			</div>
		</div>
		<div class="sign-out-area">
			<a href="./login.html"><i class="far fa-power-off"></i></a>
		</div>
	</aside>
	<!-- } User Info -->

	<!-- Container { -->
	<div id="container">
		<h1 class="big-tit">Video Clip</h1>
		
		<!-- Tab Menu { -->
		<div class="tab-menu smooth">
			<ul class="nopm floats tab2">
				<li><a href="/camp/videoclip.do">Unclassified</a></li>
				<li class="active"><a href="/camp/incording.do">Incording</a></li>
			</ul>
		</div>
		<!-- } Tab Menu -->

        <section id="incording" class="page-content">
            <div class="gallery-box floats">
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie1.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie2.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie3.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie4.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie5.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie6.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie7.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/common/movie_noimg.png" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
            </div>
            <div class="pagenation">
                <a href="#;" class="prev-next"><i class="far fa-chevron-left"></i></a>
                <a href="#;" class="num">235</a>
                <a href="#;" class="num">236</a>
                <a href="#;" class="num">237</a>
                <span class="on">238</span>
                <a href="#;" class="num">239</a>
                <a href="#;" class="num">240</a>
                <a href="#;" class="num">241</a>
                <a href="#;" class="num">242</a>
                <a href="#;" class="num">243</a>
                <a href="#;" class="num">244</a>
                <a href="#;" class="prev-next"><i class="far fa-chevron-right"></i></a>
            </div>
        </section>
	</div>
	<!-- } Container -->

    <!-- 하단 푸터 { -->
    <footer id="footer">
        Copyright ⓒ i-on communications. All rights reserved. Version 1.0
    </footer>
    <!-- } 하단 푸터 -->
</div>

</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="imagetoolbar" content="no">
	<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
	<meta name="viewport" content="device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=1.0,user-scalable=no">
	<meta name="format-detection" content="telephone=no, address=no, email=no">

	<meta name="keywords" content="Flexer" />
	<meta name="description" content="FLEXER 스포츠 영상 관리 시스템" />

	<meta property="og:type" content="website">
	<meta property="og:title" content="Flexer">
	<meta property="og:description" content="FLEXER 스포츠 영상 관리 시스템">

	<link rel="apple-touch-icon-precomposed" sizes="57x57" href="/images/common/apple-touch-icon-57x57.png" />
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="/images/common/apple-touch-icon-114x114.png" />
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/common/apple-touch-icon-72x72.png" />
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="/images/common/apple-touch-icon-144x144.png" />
	<link rel="apple-touch-icon-precomposed" sizes="60x60" href="/images/common/apple-touch-icon-60x60.png" />
	<link rel="apple-touch-icon-precomposed" sizes="120x120" href="/images/common/apple-touch-icon-120x120.png" />
	<link rel="apple-touch-icon-precomposed" sizes="76x76" href="/images/common/apple-touch-icon-76x76.png" />
	<link rel="apple-touch-icon-precomposed" sizes="152x152" href="/images/common/apple-touch-icon-152x152.png" />
	<link rel="icon" type="image/png" href="/images/common/favicon-196x196.png" sizes="196x196" />
	<link rel="icon" type="image/png" href="/images/common/favicon-96x96.png" sizes="96x96" />
	<link rel="icon" type="image/png" href="/images/common/favicon-32x32.png" sizes="32x32" />
	<link rel="icon" type="image/png" href="/images/common/favicon-16x16.png" sizes="16x16" />
	<link rel="icon" type="image/png" href="/images/common/favicon-128.png" sizes="128x128" />
	<meta name="application-name" content="Flexer"/>
	<meta name="msapplication-TileColor" content="#FFFFFF" />
	<meta name="msapplication-TileImage" content="/images/common/mstile-144x144.png" />
	<meta name="msapplication-square70x70logo" content="/images/common/mstile-70x70.png" />
	<meta name="msapplication-square150x150logo" content="/images/common/mstile-150x150.png" />
	<meta name="msapplication-wide310x150logo" content="/images/common/mstile-310x150.png" />
	<meta name="msapplication-square310x310logo" content="/images/common/mstile-310x310.png" />
	
	<title>FLEXER Sport Media Management System</title>
	
	<link rel="stylesheet" type="text/css" href="/css/common/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="/css/common/fontawesome-all.min.css">
	<link rel="stylesheet" type="text/css" href="/css/common/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="/css/common/al-range-slider.css">
	<link rel="stylesheet" type="text/css" href="/css/common/base.css" />
	<link rel="stylesheet" type="text/css" href="/css/common/common.css" />
	<link rel="stylesheet" type="text/css" href="/css/camp.css" />

	<script src="/js/common/jquery-3.3.1.min.js"></script>
	<script src="/js/common/jquery-ui.min.js"></script>
	<script src="/js/common/jquery.easing.1.3.js"></script>
	<script src="/js/common/swiper.min.js"></script>
	<script src="/js/common/al-range-slider.js"></script>
	<script src="/js/common/common.js"></script>
</head>
<body>

<div id="wrapper">
    <!-- 상단 헤더 { -->
    <header id="header" class="smooth">
        <div class="h1-mark">
            <h1>
				<a href="/camp/main.do" class="m-only">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 41.517 36.633">
						<path id="logoMark" d="M41.463,0H18.886C8.991,0,.452,7.6.018,17.493A18.325,18.325,0,0,0,18.325,36.633h1.212a14.653,14.653,0,0,0,14.653-14.6.072.072,0,0,0-.072-.072H28.094A11,11,0,0,0,39.075,11.053.072.072,0,0,0,39,10.981H30.536A11,11,0,0,0,41.517.072.072.072,0,0,0,41.445,0" transform="translate(0)" fill="#6950e6"/>
					</svg>
				</a>
                <a href="/camp/index.do" class="pc-only">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 360.074 111.141">
                        <g id="Flexer" transform="translate(283.5 87.395)">
                            <path id="logo_f" d="M46.041,97.294A16.257,16.257,0,0,0,62.3,81.1H16.257v21.528H0v16.13H16.257v21.528H32.515V119.012H46.041A16.257,16.257,0,0,0,62.3,102.819H32.515V97.548H46.041Z" transform="translate(-283.5 -116.992)" fill="#fff"/>
                            <path id="logo_l" d="M131.294,81H115.1v59.441h29.784a16.257,16.257,0,0,0,16.257-16.194H131.357V81.064h-.064" transform="translate(-325.506 -116.956)" fill="#fff"/>
                            <path id="logo_e1" d="M234.384,97.294A16.257,16.257,0,0,0,250.641,81.1H204.6v59.441h29.784a16.257,16.257,0,0,0,16.257-16.194H220.857v-5.271h13.527a16.257,16.257,0,0,0,16.257-16.194H220.857V97.611h13.527Z" transform="translate(-358.169 -116.992)" fill="#fff"/>
                            <path id="logo_x" d="M327.17,81.1l-7.748,13.4H319.3l-7.684-13.4h-18.67a.071.071,0,0,0-.064.127l17.146,29.657a.063.063,0,0,1,0,.064L292.877,140.6a.071.071,0,1,0,.063.127h18.67l7.748-13.4h.127l7.748,13.4H345.9a.071.071,0,0,0,.063-.127l-17.146-29.657a.064.064,0,0,1,0-.064l17.146-29.657a.071.071,0,0,0-.064-.127H327.17" transform="translate(-390.371 -116.988)" fill="#fff"/>
                            <path id="logo_e2" d="M421.984,97.294A16.257,16.257,0,0,0,438.241,81.1H392.2v59.441h29.784a16.257,16.257,0,0,0,16.257-16.194H408.457v-5.271h13.527a16.257,16.257,0,0,0,16.257-16.194H408.457V97.611h13.527Z" transform="translate(-426.633 -116.992)" fill="#fff"/>
                            <path id="logo_r" d="M535.87,102.655V97.321A16.321,16.321,0,0,0,519.549,81H481.7v59.441h16.257V118.976H505.9l7.811,13.463a16.257,16.257,0,0,0,22.1,5.969.064.064,0,0,0,0-.127l-11.558-20a.071.071,0,0,1,.063-.127,16.257,16.257,0,0,0,11.558-15.5m-37.849-5.4h21.592v5.334H497.957V97.321h.064" transform="translate(-459.296 -116.956)" fill="#fff"/>
                            <path id="logo_mark" d="M71.5,0H46.545C35.559,0,26.1,8.446,25.589,19.369A20.322,20.322,0,0,0,45.91,40.58h1.334A16.257,16.257,0,0,0,63.5,24.449h-6.8A12.193,12.193,0,0,0,68.9,12.256H59.437A12.193,12.193,0,0,0,71.63.064h-.064" transform="translate(-292.832 -87.395)" fill="#6950e6"/>
                        </g>
                    </svg>
                </a>
                <em>CAMP<span> Management</span></em>
            </h1>
        </div>

        <!-- GNB { -->
        <nav id="gnb">
            <ul class="nopm floats">
                <li><a href="/camp/member_list.do"><em><img src="/images/common/ico_people.svg" alt="Member"></em><span>Member</span></a></li>
                <li><a href="/camp/recording.do"><em><img src="/images/common/ico_recording.svg" alt="Recording"></em><span>Recording</span></a></li>
                <li class="active"><a href="/camp/videoclip.do"><em><img src="/images/common/ico_mediaclip.svg" alt="Video Clip"></em><span>Video Clip</span></a></li>
                <li><a href="/camp/setting.do"><em><img src="/images/common/ico_setting.svg" alt="Setting"></em><span>Setting</span></a></li>
            </ul>
        </nav>
        <!-- } GNB -->
    </header>
    <!-- } 상단 헤더 -->

	<!-- User Info { -->
	<aside class="user-info">
		<div class="member-area">
			<div class="pic"><img src="/images/sample_member1.jpg" alt="" /></div>
			<div class="txt">
				<em>Thomas Edward Patrick Brady Jr</em>
				<small>Camp / Tampa Bay Buccaneers</small>
			</div>
		</div>
		<div class="sign-out-area">
			<a href="./login.html"><i class="far fa-power-off"></i></a>
		</div>
	</aside>
	<!-- } User Info -->

	<!-- Container { -->
	<div id="container">
		<h1 class="big-tit">Video Clip</h1>
		
		<!-- Tab Menu { -->
		<div class="tab-menu smooth">
			<ul class="nopm floats tab2">
				<li><a href="/camp/videoclip.do">Unclassified</a></li>
				<li class="active"><a href="/camp/incording.do">Incording</a></li>
			</ul>
		</div>
		<!-- } Tab Menu -->

        <section id="incording" class="page-content">
            <div class="gallery-box floats">
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie1.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie2.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie3.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie4.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie5.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie6.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/sample_movie7.jpg" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
                <div class="gallery-item">
                    <a href="/camp/incording_view.do" class="pic"><img src="/images/common/movie_noimg.png" alt="" /></a>
                    <a href="/camp/incording_view.do" class="txt">
                        <strong>United States Camp United States Camp United States Camp</strong>
                        <span class="date-clipnum">00-00-2021 00:00:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;Clip Video : 8</span>
                    </a>
                </div>
            </div>
            <div class="pagenation">
                <a href="#;" class="prev-next"><i class="far fa-chevron-left"></i></a>
                <a href="#;" class="num">235</a>
                <a href="#;" class="num">236</a>
                <a href="#;" class="num">237</a>
                <span class="on">238</span>
                <a href="#;" class="num">239</a>
                <a href="#;" class="num">240</a>
                <a href="#;" class="num">241</a>
                <a href="#;" class="num">242</a>
                <a href="#;" class="num">243</a>
                <a href="#;" class="num">244</a>
                <a href="#;" class="prev-next"><i class="far fa-chevron-right"></i></a>
            </div>
        </section>
	</div>
	<!-- } Container -->

    <!-- 하단 푸터 { -->
    <footer id="footer">
        Copyright ⓒ i-on communications. All rights reserved. Version 1.0
    </footer>
    <!-- } 하단 푸터 -->
</div>

</body>
>>>>>>> refs/heads/202204
</html>