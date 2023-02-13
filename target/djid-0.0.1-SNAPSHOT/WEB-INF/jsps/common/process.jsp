<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="/assets/user/js/jquery-1.9.1.js"></script>
<script>
<c:if test="${msg!='' && ! empty msg}">
	alert('${msg}');
</c:if>
location.href="${url}";
</script>
${msg}<br/>
돌아 가실려면 <a href="${url}">여기</a>를 클릭하세요.