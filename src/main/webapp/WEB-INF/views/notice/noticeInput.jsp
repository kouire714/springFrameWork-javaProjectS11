<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>noticeInput.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<link rel="stylesheet" type="text/css" href="${ctp}/resources/css/include.css?after"/>
</head>
<body>
<div class="include">
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
</div>
<p><br/></p>
<div class="container">
<h2>공지 작성 페이지</h2>
<form method="post">
	<p>작성자 : ${sNickName}</p>
	<p>이메일 : <input type="text" name="email" /></p>
	<p>제목 : <input type="text" name="title" required/></p>
	<p>글내용 : <input type="text" name="content" required/></p>
	<input type="hidden" name="mid" value="${sMid}" />
	<input type="hidden" name="nickName" value="${sNickName}" />
	<input type="submit" value="글올리기"/>
</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>