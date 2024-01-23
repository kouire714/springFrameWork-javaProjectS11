<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>noticeList.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<link rel="stylesheet" type="text/css" href="${ctp}/resources/css/include.css?after"/>
	<link rel="stylesheet" type="text/css" href="${ctp}/resources/css/notice.css?after"/>
	<script>
	/* 스크립트 정보 */
	</script>
</head>
<body>
<div class="include">
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
</div>
<p><br/></p>
<div class="container">
	<table class="table table-borderless m-0 p-0">
	<tr>
		<td colspan="2"><h3 class="text-center">공지게시판 목록</h3></td>
	</tr>
	<tr>
		<td><a href="${ctp}/notice/noticeInput" class="btn btn-success btn-sm">글쓰기</a></td>
		<td>
		
		</td>
	</tr>
	</table>
</div>

<%-- 
<button onclick="location.href='${ctp}/notice/noticeInput'">글쓰기</button>
<c:forEach var="vo" items="${vos}">
	<a href="${ctp}/notice/noticeContent?idx=${vo.idx}">${vo.title}</a>
</c:forEach>
 --%>
 
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>