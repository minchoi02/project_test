<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>글 내용</title>
<script>

</script>
<style>
html, body {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}
#wrapper {
    width: 100%;
    height: 100%;
    overflow: auto;
}
</style>
</head>
<body>
<div id="wrapper">
${content}
</div>
</body>
</html>