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
        		<h1>회원정보 수정 페이지</h1>
        	</header>
 
 			<!-- 페이지 내용을 담기 위한 section 태그의 시작입니다. -->
			<section>
				<!-- form 태그: 바인딩(View와 Controller의 Data간 연결) 경로를 지정 -->
	 			<!-- 회원 정보 수정 처리를 해달라는 요청  -->
		        <form action="memberUpdate">
		        	<!-- 수정이 불가능하도록 readonly 속성 추가 -->
		        	아이디 <input type="text" name="userid" value="${userid}" readonly="readonly" /><span/><br/>
		        	비밀번호 <input type="password" name="pwd" value="${pwd}" readonly="readonly" /><span/><br/>
		        	이름 <input type="text" name="name" value="${name}" /><span/><br/>
		        	이메일 <input type="text" name="email"  value="${email}"><span/><br/>
		        	
		        	<input type="submit" value="수정하기"><input type="reset" value="다시작성">
		        </form>
		        <form action="memberDelete">
		        	<input type="submit" value="탈퇴하기">
		        </form>
		    </section>
			
			<!-- 페이지의 꼬리말을 표현하는 footer 태그의 시작입니다. -->
			<footer>
				<h3>Copyright 2017.09.28 AIIA Lab</h3>
			</footer>
		</center>
	</body>
	
</html>
