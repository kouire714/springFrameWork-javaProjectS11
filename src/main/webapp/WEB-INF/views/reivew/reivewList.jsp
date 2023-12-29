<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>reivewList.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<script>
		'use strict'
		
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<h2>리뷰 게시판 목록</h2>
<script>
	for(int i=0; i<${vos.length}; i++) {
		document.write("<p>'${vos.vo.getTitle)}'</p>")
	}
	
	
</script>
<div></div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>