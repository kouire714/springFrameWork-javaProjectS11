<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<div class="container">
  <ul class="nav">
    <li class="nav-item">
		<a class="nav-link" href="${ctp}">Home</a>
    </li>
    <li class="nav-item">
		<a class="nav-link" href="${ctp}/intro/introMain">Intro</a>
    </li>
    <li class="nav-item">
		<c:if test="${sLevel == null}"><a class="nav-link" href="${ctp}/member/memberLogin">Login</a></c:if>
		<c:if test="${sLevel != null}"><a class="nav-link" href="${ctp}/member/memberLogout">Logout</a></c:if>
    </li>
    <li class="nav-item">
    	<c:if test="${sLevel != null}"><a class="nav-link" href="${ctp}/room/roomMain">Room</a></c:if>
    </li>
    <li class="nav-item">
    	<c:if test="${sLevel != null}"><a class="nav-link" href="${ctp}/notice/noticeList">Notice</a></c:if>
    </li>
    <li class="nav-item">
    	<c:if test="${sLevel != null}"><a class="nav-link" href="${ctp}/review/reviewList">Review</a></c:if>
    </li>
  </ul>
</div>