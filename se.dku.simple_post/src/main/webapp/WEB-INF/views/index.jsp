<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- index.jsp -->
<!DOCTYPE html>
<html>
<!-- head -->
<head>
<!-- css, js파일 연동 -->
<link href="<c:url value="/resources/css/poststyle.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/js/postevent.js" />"></script>

<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>

<!-- body -->
<body>
	<center>
	<!-- 페이지 머리말 표현하는 header 태그의 시작입니다. -->
	<header>
		<h2>게시물 리스트</h2>
	</header>
	
	<!-- 페이지 본문 담기 위한 section 태그의 시작입니다. -->
	<section>
	<table>
		<thead>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<!-- 반복문 -->
			<c:forEach var="plist" items="${postList}">
			<tr>
				<td>${plist.idx}</td>
				<td><a href="viewPost?idx=${plist.idx}">${plist.title}</a></td>
				<td>${plist.name}</td>
				<td>${plist.date}</td>
				<td>${plist.hit}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table><br/>

	<input type="button" value="게시물 작성" onclick="location.href='writePostForm'"><br/>
	</section>
	
	<!-- 페이지의 꼬리말을 표현하는 footer 태그의 시작입니다. -->
	<footer>
		<h5>Copyright ⓒ  ParkYurim 18-01-10</h5>
	</footer>
	
	</center>
</body>
</html>