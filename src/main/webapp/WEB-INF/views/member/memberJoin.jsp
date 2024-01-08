<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberJoin.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<script>
		'use strict'
		
		joinForm.birth.value = document.getElementById("birthYear") + document.getElementById("birthMonth") + document.getElementById("birthDate")
		joinForm.phone.value = document.getElementById("phoneOne") + document.getElementById("phoneTwo") + document.getElementById("phoneThree")
		
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<h2>회원가입</h2>
	<form method="post">
		<div>
			<label for="mid">아이디</label>
			<input type="text" id="mid" name="mid" placeholder="아이디를 입력하세요" required/>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd" name="pwd" required/>
		</div>
		<div>
			<label for="nickName">닉네임</label>
			<input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력하세요" required/>
		</div>
		<div>
			<label for="name">이름</label>
			<input type="text" id="name" name="name" placeholder="이름을 입력하세요" required/>
		</div>
		<div>
			<label>성별</label>
			<input type="radio" name="gender" id="male" value="남자"/><label for="male">남자</label>
			<input type="radio" name="gender" id="feMale" value="여자"/><label for="feMale">여자</label>
		</div>
		<div>
			<label for="birthYear">생년월일</label>
			<input type="number" id="birthYear"/>/<input type="number" id="birthMonth"/>/<input type="number" id="birthDate"/>
		</div>
		<div>
			<label for="address">주소</label>
			<input type="text" name="address" placeholder="주소를 입력하세요"/>
		</div>
		<div>
			<label for="phoneOne">전화번호</label>
			<input type="number" id="phoneOne" required/>-<input type="number" id="phoneTwo" required/>-<input type="number" id="phoneThree" required/>
		</div>
		<div>
			<label for="email">이메일</label>
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