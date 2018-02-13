<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- HTML 5 -->
<!DOCTYPE html>

<html>
	<!-- Head -->
	<head>
		<!-- 인코딩 설정-->
		<meta charset="utf-8">
	
		<title>Main Page</title>	
	</head>
	
	<!-- Body -->
	<body>
		<center>
			<!-- 페이지의 머리말을 표현하는 header 태크의 시작입니다. -->
			<header>
        		<h1>Member List Page</h1>
        	</header>
        	
 			<!-- 페이지 내용을 담기 위한 section 태그의 시작입니다. -->
			<section>
				<table border="1"> 
					<thead> 
						<tr> 
							<th>멤버 번호</th> 
							<th>멤버 이름</th> 
							<th>이메일</th>
						</tr> 
					</thead> 
					<tbody> 
						<c:forEach var="mlist" items="${memberList}"> 
							<tr> 
								<td>${mlist.userid}</td> 
								<td>${mlist.name}</td>
								<td>${mlist.email}</td>
							</tr> 
						</c:forEach>
					</tbody> 
				</table>
			</section>
			
			<!-- 페이지의 꼬리말을 표현하는 footer 태그의 시작입니다. -->
			<footer>
				<h5>Copyright 2017.09.28 AIIA Lab</h5>
			</footer>
		</center>
	</body>
</html>
