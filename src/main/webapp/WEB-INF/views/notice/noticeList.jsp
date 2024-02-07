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
			let pageSize = document.getElementById("pageSize").value;
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
<div class="notice">
<h3>공지게시판 목록</h3>
	<div class="notice__btn">
		<div><a href="${ctp}/notice/noticeInput" class="">글쓰기</a></div>
		<div>
		<select name="pageSize" id="pageSize" onclick="pageSizeCheck()">
			<option ${pageVO.pageSize==3 ? "selected" : ""}>3</option>
			<option ${pageVO.pageSize==5 ? "selected" : ""}>5</option>
			<option ${pageVO.pageSize==10 ? "selected" : ""}>10</option>				
			<option ${pageVO.pageSize==15 ? "selected" : ""}>15</option>				
			<option ${pageVO.pageSize==20 ? "selected" : ""}>20</option>				
		</select> 건
		</div>
	</div>
	<div class="notice__table">
		<table>
			<tr>
				<th>/</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
			<c:forEach var="vo" items="${vos}" varStatus="statusNum">
			<tr>
				<td>${curScrStartNo}</td>
				<td><a href="${ctp}/notice/noticeContent?idx=${vo.idx}&pag=${pageVO.pag}&pageSize=${pageVO.pageSize}">${vo.title}</a></td>
				<td>${vo.nickName}</td>
				<td>${vo.WDate}</td>
			</tr>
			<c:set var="curScrStartNum" value="${curScrStartNum - 1}"/>
			</c:forEach>
		</table>
	</div>
	<div class="notice__blockPage">
		<ul class="notice__blockPage__ul">
			<c:if test="${pageVO.pag > 1}"><li class="notice__blockPage__ul__li"><a href="${ctp}/notice/noticeList?pag=1&pageSize=${pageVO.pageSize}">첫페이지</a></li></c:if>
			<c:if test="${pageVO.curBlock > 0}"><li class="notice__blockPage__ul__li"><a href="noticeList?pag=${(pageVO.curBlock-1)*pageVO.blockSize+1}&pageSize=${pageVO.pageSize}">이전블록</a></li></c:if>
			<c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}" varStatus="st">
				<c:if test="${i <= pageVO.totPage && i == pageVO.pag}"><li class="notice__blockPage__ul__li"><a href="noticeList?pag=${i}&pageSize=${pageVO.pageSize}">${i}</a></li></c:if>
				<c:if test="${i <= pageVO.totPage && i != pageVO.pag}"><li class="notice__blockPage__ul__li"><a href="noticeList?pag=${i}&pageSize=${pageVO.pageSize}">${i}</a></li></c:if>
			</c:forEach>
			<c:if test="${pageVO.curBlock < pageVO.lastBlock}"><li class="notice__blockPage__ul__li"><a href="noticeList?pag=${(pageVO.curBlock+1)*pageVO.blockSize+1}&pageSize=${pageVO.pageSize}">다음블록</a></li></c:if>
			<c:if test="${pageVO.pag < pageVO.totPage}"><li class="notice__blockPage__ul__li"><a href="${ctp}/notice/noticeList?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}">마지막페이지</a></li></c:if>
		</ul>
	</div>
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