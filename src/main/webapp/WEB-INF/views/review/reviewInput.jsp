<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>reviewInput.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<!-- Make sure the path to CKEditor is correct. -->
	<script src="${ctp}/ckeditor/ckeditor.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
<h2>리뷰 작성 페이지</h2>
<form method="post">
	<p>작성자 : <input type="text" id="nickName" name="nickName" value="${nickName}" required/></p>
	<p>이메일 : <input type="text" id="email" name="email" value="${email}" /></p>
	<p>제목 : <input type="text" id="title" name="title" /></p>
	<p>작성내용 :  <textarea name="editor1" id="editor1" rows="10" cols="80"></textarea></p>
            <script>
                CKEDITOR.replace("editor1", {
    	        	height: 380,
    	        	filebrowserUploadUrl:"${ctp}/imageUpload",		/* 파일(이미지) 업로드시에 매핑경로 */
    	        	uploadUrl : "${ctp}/imageUpload"				/* 여러개의 그림파일을 드래그&드롭해서 올릴 수 있다. */
                });
            </script>
	<input type="submit" value="글올리기" />
</form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>