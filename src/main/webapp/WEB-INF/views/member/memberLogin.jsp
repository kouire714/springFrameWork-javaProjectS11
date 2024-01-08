<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberLogin.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<style>
	</style>
	<script>
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<h2>회원 로그인</h2>
	<form method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" id="mid" name="mid" placeholder="아이디를 입력하세요" autofocus required /></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pwd" name="pwd" required /></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인" /></td>
				<td><input type="button" value="회원가입" onclick="location.href='memberJoin';" /></td>
			</tr>
		</table>
	</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>