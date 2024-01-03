<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>reivewList.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<style>
		button {
			display: block;
		}
	</style>
	<script>
		'use strict'
		
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<h2>리뷰 게시판 목록</h2>
<button onclick="location.href='reviewInput'">글쓰기</button>
<c:forEach var="vo" items="${vos}">
		<a href="reviewContent?idx=${vo.idx}">${vo.title}</a><br/>
</c:forEach> 
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>