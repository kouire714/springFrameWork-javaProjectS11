<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberJoin.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<link rel="stylesheet" type="text/css" href="${ctp}/resources/css/include.css?after"/>
	<link rel="stylesheet" type="text/css" href="${ctp}/resources/css/member.css?after"/>
	<script>
		'use strict'
		
		joinForm.birth.value = document.getElementById("birthYear") + document.getElementById("birthMonth") + document.getElementById("birthDate")
		joinForm.phone.value = document.getElementById("phoneOne") + document.getElementById("phoneTwo") + document.getElementById("phoneThree")
		
	</script>
</head>
<body>
<div class="include">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
</div>
<p><br/></p>
<div class="memberJoin">
<h3>회원가입</h3>
	<form method="post" name="joinForm">
		<div>
			<p><label for="mid">아이디</label></p>
			<input type="text" id="mid" name="mid" placeholder="아이디를 입력하세요" required/>
		</div>
		<div>
			<p><label for="pwd">비밀번호</label></p>
			<input type="password" id="pwd" name="pwd" required/>
		</div>
		<div>
			<p><label for="nickName">닉네임</label></p>
			<input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력하세요" required/>
		</div>
		<div>
			<p><label for="name">이름</label></p>
			<input type="text" id="name" name="name" placeholder="이름을 입력하세요" required/>
		</div>
		<div class="joinForm__gender">
			<p><label>성별</label></p>
			<input type="radio" name="gender" id="male" value="남자"/><label for="male">남자</label>
			<input type="radio" name="gender" id="feMale" value="여자"/><label for="feMale">여자</label>
		</div>
		<div>
			<p><label for="birthYear">생년월일</label></p>
			<input type="number" id="birthYear"/>/<input type="number" id="birthMonth"/>/<input type="number" id="birthDate"/>
		</div>
		<div>
			<p><label for="address">주소</label></p>
			<input type="text" name="address" placeholder="주소를 입력하세요"/>
		</div>
		<div>
			<p><label for="phoneOne">전화번호</label></p>
			<input type="number" id="phoneOne" required/>-<input type="number" id="phoneTwo" required/>-<input type="number" id="phoneThree" required/>
		</div>
		<div>
			<p><label for="email">이메일</label><p>
			<input type="text" id="email" name="email" placeholder="이메일을 입력하세요" required/>
		</div>
		<div>
			<input type="hidden" name="birth"/>
			<input type="hidden" name="phone"/>
		</div>
		<div>
			<input type="submit" value="회원가입"/>
		</div>
	</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>