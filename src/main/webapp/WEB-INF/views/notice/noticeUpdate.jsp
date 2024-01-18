<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>noticeUpDate.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<h2>공지 수정 게시판</h2>
<form name="noticeUpdate" method="post">
	<p>작성자 : <input type="text" name="nickName" value="${vo.nickName}" /></p>
	<p>이메일 : <input type="text" name="email" value="${vo.email}"/></p>
	<p>제목 : <input type="text" name="title" value="${vo.title}"/></p>
	<p>공지내용 : <input type="text" name="content" value="${vo.content}"/></p>
	<%-- <p>공지내용 : <input type="hidden" name="idx" value="${vo.idx}"/></p> --%>
	<input type="submit" value="글수정하기"/>
</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>