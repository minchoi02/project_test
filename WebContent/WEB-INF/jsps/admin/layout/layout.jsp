<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<title>${menu.title}정보드림 관리자</title>
	
	<link type="text/css" rel='stylesheet' href="/assets/admin/css/admin.css" />
	<link type="text/css" rel="stylesheet" href="/assets/admin/js/jquery/jquery-ui-1.10.2.custom/css/ui-lightness/jquery-ui-1.10.2.custom.min.css" />	
	<link type="text/css" rel='stylesheet' href="/assets/admin/js/jquery/fancybox2.0/jquery.fancybox.css?v=2.1.4"  media="screen"/>
	<link rel="stylesheet" type="text/css" href="/assets/admin/js/jquery/fancybox2.0/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<link rel="stylesheet" type="text/css" href="/assets/admin/js/jquery/fancybox2.0/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	
	<script type="text/javascript" src="/assets/admin/js/jquery/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/assets/admin/js/jquery/jquery-ui-1.10.2.custom/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="/assets/common/js/jquery/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript" src="/assets/admin/js/jquery/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="/assets/admin/js/jquery/fancybox2.0/jquery.mousewheel-3.0.6.pack.js"></script>
	<script type="text/javascript" src="/assets/admin/js/jquery/fancybox2.0/jquery.fancybox.js?v=2.1.4"></script>
	<script type="text/javascript" src="/assets/admin/js/setting.js"></script>
	<script type="text/javascript" src="/assets/admin/js/progressbar.js"></script>
	<script type="text/javascript" src="/assets/admin/js/validation.js"></script>
	<script type="text/javascript" src="/assets/admin/js/common.js"></script>
	<!-- <script type="text/javascript" src="/assets/user/js/jquery-progresspiesvg.js"></script> -->
<!-- 	<script type="text/javascript" src="js/min/jquery-progresspiesvg-controlIcons-min.js"></script> -->
	<style type="text/css">
	#fog{
		display:none;
		position:fixed;
		width:100%;
		height:100%;
		background:black;
		opacity:0.5;
		z-index:9998;
	}
	#loading_ajax{
		display:none;
		position:fixed;left:50%;top:50%;
		margin:-50px 0 0 -50px;
		z-index:9999;
	}
 	.pr.around {
	    width: 70px;
	    height: 70px;
	    position: relative;
	    display: inline-block;
	    margin: 1em;
	}
	.pr.around span {
	    color: yellow;
	}
	.pr.around span.outer {
	    position: absolute;
	    left: 0;
	    top: 0;
	    width: 70px;
	    text-align: center;
	    font-size: 10px;
	    padding: 15px 0;
	}
	.pr.around span.value {
	    font-size: 25px;
	} 
	</style>
</head>
<body>
<div id="fog"></div>
<div id="wrap">
	<div class="lnb">
		<ul>
			<li><a href="#none" onclick="logout();return false;" >로그아웃</a></li>
			<li><a href="/main.do" target="_blank">사용자페이지 바로가기</li>
		</ul>
	</div>
	<div class="heaerArea">
		<div id="headerWr">
			<t:insertAttribute name="header" />
		</div>
	</div>	
	<div id="container">
		<!-- 왼쪽메뉴 -->
		<div id="leftM">
			<t:insertAttribute name="letfmenu" />
		</div>
		<!-- 왼쪽메뉴 //-->
		<!-- contents -->
		<div id="contents">
			<t:insertAttribute name="body" />
		</div>
		<!-- //contents -->
	</div>	
	<footer id="footerWrap">
		<t:insertAttribute name="footer" />
	</footer>		
</div>
</body>
=======
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<title>${menu.title}정보드림 관리자</title>
	
	<link type="text/css" rel='stylesheet' href="/assets/admin/css/admin.css" />
	<link type="text/css" rel="stylesheet" href="/assets/admin/js/jquery/jquery-ui-1.10.2.custom/css/ui-lightness/jquery-ui-1.10.2.custom.min.css" />	
	<link type="text/css" rel='stylesheet' href="/assets/admin/js/jquery/fancybox2.0/jquery.fancybox.css?v=2.1.4"  media="screen"/>
	<link rel="stylesheet" type="text/css" href="/assets/admin/js/jquery/fancybox2.0/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<link rel="stylesheet" type="text/css" href="/assets/admin/js/jquery/fancybox2.0/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	
	<script type="text/javascript" src="/assets/admin/js/jquery/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="/assets/admin/js/jquery/jquery-ui-1.10.2.custom/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="/assets/common/js/jquery/jquery.ui.datepicker-ko.js"></script>
	<script type="text/javascript" src="/assets/admin/js/jquery/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="/assets/admin/js/jquery/fancybox2.0/jquery.mousewheel-3.0.6.pack.js"></script>
	<script type="text/javascript" src="/assets/admin/js/jquery/fancybox2.0/jquery.fancybox.js?v=2.1.4"></script>
	<script type="text/javascript" src="/assets/admin/js/setting.js"></script>
	<script type="text/javascript" src="/assets/admin/js/progressbar.js"></script>
	<script type="text/javascript" src="/assets/admin/js/validation.js"></script>
	<script type="text/javascript" src="/assets/admin/js/common.js"></script>
	<!-- <script type="text/javascript" src="/assets/user/js/jquery-progresspiesvg.js"></script> -->
<!-- 	<script type="text/javascript" src="js/min/jquery-progresspiesvg-controlIcons-min.js"></script> -->
	<style type="text/css">
	#fog{
		display:none;
		position:fixed;
		width:100%;
		height:100%;
		background:black;
		opacity:0.5;
		z-index:9998;
	}
	#loading_ajax{
		display:none;
		position:fixed;left:50%;top:50%;
		margin:-50px 0 0 -50px;
		z-index:9999;
	}
 	.pr.around {
	    width: 70px;
	    height: 70px;
	    position: relative;
	    display: inline-block;
	    margin: 1em;
	}
	.pr.around span {
	    color: yellow;
	}
	.pr.around span.outer {
	    position: absolute;
	    left: 0;
	    top: 0;
	    width: 70px;
	    text-align: center;
	    font-size: 10px;
	    padding: 15px 0;
	}
	.pr.around span.value {
	    font-size: 25px;
	} 
	</style>
</head>
<body>
<div id="fog"></div>
<div id="wrap">
	<div class="lnb">
		<ul>
			<li><a href="#none" onclick="logout();return false;" >로그아웃</a></li>
			<li><a href="/main.do" target="_blank">사용자페이지 바로가기</li>
		</ul>
	</div>
	<div class="heaerArea">
		<div id="headerWr">
			<t:insertAttribute name="header" />
		</div>
	</div>	
	<div id="container">
		<!-- 왼쪽메뉴 -->
		<div id="leftM">
			<t:insertAttribute name="letfmenu" />
		</div>
		<!-- 왼쪽메뉴 //-->
		<!-- contents -->
		<div id="contents">
			<t:insertAttribute name="body" />
		</div>
		<!-- //contents -->
	</div>	
	<footer id="footerWrap">
		<t:insertAttribute name="footer" />
	</footer>		
</div>
</body>
>>>>>>> refs/heads/202204
</html>