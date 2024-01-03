<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<div class="container">
  <h2>Nav</h2>
  <p>Basic horizontal menu:</p>
  <ul class="nav">
    <li class="nav-item">
      <a class="nav-link" href="${ctp}/">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${ctp}/member/memberLogin">Login</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${ctp}/review/reviewList">Review</a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="#">Disabled</a>
    </li>
  </ul>
</div>