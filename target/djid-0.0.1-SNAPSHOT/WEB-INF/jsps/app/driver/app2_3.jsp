<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
	<title>정보드림 장애인 교통정보 운전자용 앱</title>
	<link rel="stylesheet" type="text/css" href="/assets/app/driver/css/common.css">
</head>
</head>
<body>
	<div class="appWrapper">
		<header>
			<div class="header">
				<h1>정보드림<br>장애인 교통정보</h1>
				<p class="busNumbs">1호차 - 74도 1266</p>
			</div>
			<button type="button" class="btnLogout">로그아웃</button>
		</header>

		<section>
			<h2 class="hidden">운행정보 및 운영회차 선택</h2>

			<div class="formRow">
				<label for="BusService">버스운행</label>
				<span>
					<select id="BusService">
						<option value="">운행종료</option>
						<option value="" selected="selected">운행중</option>
						<option value="">정비중</option>
					</select>
				</span>
			</div>

			<div class="formRow">
				<p class="boxTitle">
					<strong class="lableText">회차선택</strong>
					<span>운행하실 회차를 선택해주세요.</span>
				</p>
				<div class="btnList">
					<button type="button" class="btn active">1회차</button>
					<button type="button" disabled="disabled" class="btn">2회차</button>
					<button type="button" disabled="disabled" class="btn">3회차</button>
					<button type="button" disabled="disabled" class="btn">4회차</button>
				</div>
			</div>
		</section>

		<footer><p>Copyright(c) 2018 대전장애인단체총연합회 All Rights reserved.</p></footer>
	</div>

</body>
</html>