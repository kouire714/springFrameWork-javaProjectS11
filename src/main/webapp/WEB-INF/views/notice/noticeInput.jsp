<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<h2>공지 작성 페이지</h2>
<form method="post">
	<p>작성자 : <input type="text" id="nickName" name="nickName" value="${vo.nickName}"  required/></p>
	<p>이메일 : <input type="text" id="email" name="email" value="${vo.email}"/></p>
	<p>제목 : <input type="text" id="title" name="title" value="${vo.title}" required/></p>
	<p>글내용 : <input type="text" id="content" name="content" value="${vo.content}" required/></p>
	<input type="submit" value="글올리기"/>
</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>