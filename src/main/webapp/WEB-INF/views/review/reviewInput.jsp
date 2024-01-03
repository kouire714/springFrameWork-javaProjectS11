<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>reviewInput.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<h2>리뷰 작성 페이지</h2>
<form method="post">
	<p>작성자<input type="text" id="nickName" name="nickName" value="${nickName}" required/></p>
	<p>이메일<input type="text" id="email" name="email" value="${email}" /></p>
	<p>제목<input type="text" id="title" name="title" /></p>
	<p>작성내용<input type="text" id="content" name="content" /></p>
	<input type="submit" value="글올리기" />
</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>