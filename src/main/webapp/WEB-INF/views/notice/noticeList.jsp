<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>noticeList.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<style>
		button, a {
			display : block;
		}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<h2>공지 게시판 목록</h2>
<button onclick="location.href='${ctp}/notice/noticeInput'">글쓰기</button>
<c:forEach var="vo" items="${vos}">
	<a href="${ctp}/notice/noticeContent?idx=${vo.idx}">${vo.title}</a>
</c:forEach>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>