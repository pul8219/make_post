<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- writepostForm.jsp -->
<!DOCTYPE html>
<html>
<!-- head -->
<head>
<!-- css, js파일 연동 -->
<link href="<c:url value="/resources/css/poststyle.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/js/postevent.js" />"></script>

<title>게시물 작성</title>
</head>

<!-- body -->
<body>
	<center>

	<!-- 페이지 머리말 표현하는 header 태그의 시작입니다. -->
	<header>
	</header>

	<!-- 페이지 본문 담기 위한 section 태그의 시작입니다. -->
	<section>
	<!-- form 태그: 바인딩(View와 Controller의 Data간 연결) 경로를 지정 -->
	<form action="writePost"> <!-- formCheck함수의 리턴값이 true일때만 submit이 동작함 --> <!--  onsubmit="return formCheck();" -->
		<h2>게시물 작성</h2>
		<div>
			제목: <input type="text" name="title" placeholder="제목을 입력해주세요." /><br/><br/>
			작성자: <input type="text" name="name" placeholder="작성자를 입력해주세요." /><br/><br/>
			내용: <br/><textarea name="content" rows="5" cols="30" placeholder="내용을 입력해주세요."></textarea><br/><br/>
			<input type="submit" value="등록" /><input type="reset" value="다시작성" />
		</div>
	</form>
	</section>
	
	<!-- 페이지의 꼬리말을 표현하는 footer 태그의 시작입니다. -->
	<footer>
		<h5>Copyright ⓒ  ParkYurim 18-01-10</h5>
	</footer>
	
	</center>
</body>
</html>