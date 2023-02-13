<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>


 
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="shortcut icon" type="image/x-icon" href="http://www.d-eng.or.kr/favicon.ico" />
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=1280">
	<meta property="og:title" content="D-ENG 디지털 엔지니어링 기업지원 플랫폼"/>
	<meta property="og:image" content=""/>
	<meta property="og:description" content="D-ENG 디지털 엔지니어링 기업지원 플랫폼"/>
	<title>D-ENG 디지털 엔지니어링 기업지원 플랫폼</title>
	<script src="/assets/common/js/validation.js"></script>
</head>
<body>
<script>
	var menuTop = "${menu.top}";
<<<<<<< HEAD
=======
	console.log("메뉴명여영여영"+menuTop);
>>>>>>> refs/remotes/origin/master
	var menuSub = "${menu.sub}";
</script>
<t:insertAttribute name="header" />
<c:if test="${!(menu.menu_num eq '08')}">
<!--서브감싸기-->
	<div id="subContainer">
    	<!--서브비주얼 -->
        <div class="sub_visual sub${menu.top} scrollreveal">
        	<div class="sub_comment">
            	<h1>${menu.title}</h1>
                <span>뿌리산업의 스마트화, D-ENG가 함께 합니다.</span>
            </div>
        </div>
        <!--//서브비주얼-->
        
        <div id="sub_container" data-menu="1" data-sub="1">
        	<!-- 상단 서브메뉴 -->
			<div id="subnav" class="scrollreveal">
			    <div class="inner">
			        <!-- 홈 링크 -->
			        <div class="title">
			        <a href="/"><i class="xi-home"></i></a>
			        </div>
			        <!-- // 홈 링크 -->
			        <!-- 1차 메뉴 -->
			        <div class="dropdown depth1">
			            <a href="javascript:;">
			            <span></span>
			            </a>
			            <ul class="mnuList"></ul>
			        </div>
			        <!-- // 1차 메뉴 -->
			        <!-- 2차 메뉴 -->
			        <div class="dropdown depth2">
			            <a href="javascript:;">
			            <span></span>
			            </a>
			            <ul class="mnuList"></ul>
			        </div>
			        <!-- // 2차 메뉴 -->
			    </div>
			</div>        
			<!-- // 상단 서브메뉴 -->
            <div class="inner">
            	<!-- 상단 타이틀 -->
                <div class="sub_tit scrollreveal board_title">
                	<h1>${menu.title_sub}</h1>
                </div>
                <!-- //상단 타이틀 -->
</c:if>	
				<t:insertAttribute name="body" />	    
				
<t:insertAttribute name="footer" />

</body>
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>


 
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="shortcut icon" type="image/x-icon" href="http://www.d-eng.or.kr/favicon.ico" />
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=1280">
	<meta property="og:title" content="D-ENG 디지털 엔지니어링 기업지원 플랫폼"/>
	<meta property="og:image" content=""/>
	<meta property="og:description" content="D-ENG 디지털 엔지니어링 기업지원 플랫폼"/>
	<title>D-ENG 디지털 엔지니어링 기업지원 플랫폼</title>
	<script src="/assets/common/js/validation.js"></script>
</head>
<body>
<script>
	var menuTop = "${menu.top}";
<<<<<<< HEAD
=======
	console.log("메뉴명여영여영"+menuTop);
>>>>>>> refs/remotes/origin/master
	var menuSub = "${menu.sub}";
</script>
<t:insertAttribute name="header" />
<c:if test="${!(menu.menu_num eq '08')}">
<!--서브감싸기-->
	<div id="subContainer">
    	<!--서브비주얼 -->
        <div class="sub_visual sub${menu.top} scrollreveal">
        	<div class="sub_comment">
            	<h1>${menu.title}</h1>
                <span>뿌리산업의 스마트화, D-ENG가 함께 합니다.</span>
            </div>
        </div>
        <!--//서브비주얼-->
        
        <div id="sub_container" data-menu="1" data-sub="1">
        	<!-- 상단 서브메뉴 -->
			<div id="subnav" class="scrollreveal">
			    <div class="inner">
			        <!-- 홈 링크 -->
			        <div class="title">
			        <a href="/"><i class="xi-home"></i></a>
			        </div>
			        <!-- // 홈 링크 -->
			        <!-- 1차 메뉴 -->
			        <div class="dropdown depth1">
			            <a href="javascript:;">
			            <span></span>
			            </a>
			            <ul class="mnuList"></ul>
			        </div>
			        <!-- // 1차 메뉴 -->
			        <!-- 2차 메뉴 -->
			        <div class="dropdown depth2">
			            <a href="javascript:;">
			            <span></span>
			            </a>
			            <ul class="mnuList"></ul>
			        </div>
			        <!-- // 2차 메뉴 -->
			    </div>
			</div>        
			<!-- // 상단 서브메뉴 -->
            <div class="inner">
            	<!-- 상단 타이틀 -->
                <div class="sub_tit scrollreveal board_title">
                	<h1>${menu.title_sub}</h1>
                </div>
                <!-- //상단 타이틀 -->
</c:if>	
				<t:insertAttribute name="body" />	    
				
<t:insertAttribute name="footer" />

</body>
>>>>>>> refs/heads/202204
</html>