<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>noticeContent.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<h2>공지 게시판</h2>
<button onclick="location.href='${ctp}/notice/noticeUpdate?idx=${vo.idx}'">글수정</button>
<button onclick="location.href='${ctp}/notice/noticeDelete?idx=${vo.idx}'">글삭제</button>
<p>작성자 : ${vo.nickName}</p>
<p>이메일 : ${vo.email}</p>
<p>제목 : ${vo.title}</p>
<p>공지내용 : ${vo.content}</p>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>