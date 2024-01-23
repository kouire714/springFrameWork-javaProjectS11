<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<ul class="nav">
	<li class="nav__li">
		<a href="${ctp}">Home</a>
	</li>
	<li class="nav__li">
		<a href="${ctp}/intro/introMain">Intro</a>
	</li>
	<li class="nav__li">
		<c:if test="${sLevel == null}"><a href="${ctp}/member/memberLogin">Login</a></c:if>
		<c:if test="${sLevel != null}"><a href="${ctp}/member/memberLogout">Logout</a></c:if>
	</li>
	<li class="nav__li">
		<c:if test="${sLevel != null}"><a href="${ctp}/room/roomRes">Room</a></c:if>
	</li>
	<li class="nav__li">
		<c:if test="${sLevel != null}"><a href="${ctp}/notice/noticeList">Notice</a></c:if>
	</li>
	<li class="nav__li">
		<c:if test="${sLevel != null}"><a href="${ctp}/review/reviewList">Review</a></c:if>
	</li>
</ul>