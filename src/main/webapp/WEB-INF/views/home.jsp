<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>home.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<link rel="stylesheet" type="text/css" href="${ctp}/resources/css/include.css?after"/>
</head>
<body>
<div class="include">
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
</div>
<p><br></p>
<div style="text-align : center">
<h3>펜션 예약사이트 메인 페이지</h3>
</div>
<p><br></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
