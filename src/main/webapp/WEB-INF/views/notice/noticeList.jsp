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
		'use strict';
		
		function pageSizeCheck() {
			let pageSize = document.getElementById("name").value;
			location.href = "noticeList?pageSize="+pageSize;
		}
	</script>
</head>
<body>
<div class="include">
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
</div>
<p><br/></p>
<div class="">
	<table class="">
		<tr>
			<td colspan="2"><h3 class="">공지게시판 목록</h3></td>
		</tr>
		<tr>
			<td><a href="${ctp}/notice/noticeInput" class="">글쓰기</a></td>
			<td>
				<select name="pageSize" id="pageSize" onclick="pageSizeCheck()">
					<option ${pageVO.pageSize==3 ? "selected" : ""}>3</option>
					<option ${pageVO.pageSize==5 ? "selected" : ""}>5</option>
					<option ${pageVO.pageSize==10 ? "selected" : ""}>10</option>				
					<option ${pageVO.pageSize==15 ? "selected" : ""}>15</option>				
					<option ${pageVO.pageSize==20 ? "selected" : ""}>20</option>				
				</select> 건
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<th></th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:set var="curScrStartNum" value="${pageVO.curScrStartNum}"/>
		<c:forEach var="vo" items="${vos}" varStatus="statusNum">
		<tr>
			<td>${curScrStartNum}</td>
			<td><a href="${ctp}/notice/noticeContent?idx=${vo.idx}&page=${pageVO.page}&pageSize=${pageVO.pageSize}">${vo.title}</a></td>
			<td>${vo.nickName}</td>
			<td>${vo.wDate}</td>
		</tr>
		<c:set var="curScrStartNum" value="${curScrStartNum - 1}"/>
		</c:forEach>
		<tr>
		</tr>
	</table>
</div>
<br/>
<div>
	<ul>
		<li href="">첫페이지</li>
		<li>이전블록</li>
		<li>
		
		</li>
		<li>다음블록</li>
		<li>마지막페이지</li>
	</ul>
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