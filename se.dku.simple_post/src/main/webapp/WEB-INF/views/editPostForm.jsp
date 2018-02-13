<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- editPostForm.jsp -->
<!DOCTYPE html>
<html>
<!-- head -->
<head>
<!-- css, js파일 연동 -->
<link href="<c:url value="/resources/css/poststyle.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/js/postevent.js" />"></script>

<title>게시물 수정</title>
</head>

<!-- body -->
<body>
	<center>

	<!-- 페이지 머리말 표현하는 header 태그의 시작입니다. -->
	<header>
		<h2>게시물 수정</h2>
	</header>
	
	<!-- 페이지 본문 담기 위한 section 태그의 시작입니다. -->
	<section>
	<form action="editPost" method="post"> <!-- formCheck함수의 리턴값이 true일때만 submit이 동작함 --> <!-- onsubmit="return formCheck();" -->
		<input type="hidden" name="idx" value="${idx}" />
		제목: <input type="text" name="title" value="${title}" /> <br/><br/>
		작성자: <input type="text" name="name" value="${name}" /> <br/><br/>
		내용: <br> <textarea name="content" rows="5" cols="30">${content}</textarea><br/><br/>
		<input type="submit" value="수정 완료" />
	</form>
	</section>

	<!-- 페이지의 꼬리말을 표현하는 footer 태그의 시작입니다. -->
	<footer>
		<h5>Copyright ⓒ  ParkYurim 18-01-10</h5>
	</footer>
	
	</center>
</body>
</html>