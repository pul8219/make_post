<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- viewPost.jsp -->
<!DOCTYPE html>
<html>
<!-- head -->
<head>
<!-- css, js파일 연동 -->
<link href="<c:url value="/resources/css/poststyle.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/js/postevent.js" />"></script>

<title>게시물 조회</title>
</head>

<!-- body -->
<body>
	<center>
	
	<!-- 페이지 머리말 표현하는 header 태그의 시작입니다. -->
	<header>
	<h2>게시글 조회</h2>
	</header>
	
	<!-- 페이지 본문 담기 위한 section 태그의 시작입니다. -->
	<section>
		<table>
			<tr>
				<th>글 번호</th>
				<td>${idx}</td>
				<th>작성자</th>
				<td>${name}</td>
				<th>날짜</th>
				<td>${date}</td>
				<th>조회수</th>
				<td>${hit}</td>
			</tr>
			<tr>
				<th colspan="2">제목</th>
				<td colspan="6">${title}</td>
			</tr>
			<tr>
				<th colspan="2">내용</th>
				<td colspan="6">${content}</td>
			</tr>
		</table>
		<br />
		<input type="button" value="게시물 수정" onclick="location.href='editPostForm?idx=${idx}'">
		<input type="button" value="게시물 삭제" onclick="location.href='deletePost?idx=${idx}'">
		<input type="button" value="목록으로" onclick="location.href='index'">
	</section>
	
	<!-- 페이지의 꼬리말을 표현하는 footer 태그의 시작입니다. -->
	<footer>
		<h5>Copyright ⓒ  ParkYurim 18-01-10</h5>
	</footer>
	
</center>
</body>
</html>