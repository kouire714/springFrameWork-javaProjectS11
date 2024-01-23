<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberLogin.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<link rel="stylesheet" type="text/css" href="${ctp}/resources/css/include.css?after"/>
	<link rel="stylesheet" type="text/css" href="${ctp}/resources/css/member.css?after"/>
</head>
<body>
<div class="include">
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
</div>
<p><br/></p>
<div class="memberLogin">
	<h3>로그인</h3>
	<form method="post">
		<p>아이디</p>
		<input type="text" id="mid" name="mid" placeholder="아이디를 입력하세요" autofocus required />
		<p>비밀번호</p>
		<input type="password" id="pwd" name="pwd" required />
		<br/>
		<input type="submit" value="로그인" />
		<input type="button" value="회원가입" onclick="location.href='memberJoin';" />
	</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>