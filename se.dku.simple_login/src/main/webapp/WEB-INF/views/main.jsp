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
				<h1>Main Page</h1>
			</header>
			
			<!-- 페이지 내 목차(하이퍼링크들의 모임)를 만들기 위한 nav 태그의 시작입니다. -->
			<nav>
				<ul>
					<li><a href="/simple/main"><span>home</span></a></li>
					<li><a href="/simple/memberList"><span>모든 회원 보기</span></a></li>
					<li><a href="/simple/memberUpdateForm"><span>회원 정보 수정</span></a></li>
					<li><a href="/simple/logout"><span>로그아웃</span></a></li>
				</ul>
			</nav>
			
			<!-- 페이지 내용을 담기 위한 section 태그의 시작입니다. -->
			<section>
				${userid}님으로 로그인 하셨습니다.<br> 
				${name}님 환영합니다<br>
				이메일 : ${email}<br> 
			</section>
			
			<!-- 페이지의 꼬리말을 표현하는 footer 태그의 시작입니다. -->
			<footer>
				<h5>Copyright 2017.09.28 AIIA Lab</h5>
			</footer>
		</center>
	</body>
	
</html>
