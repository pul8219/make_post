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
	
		<title>Join Page</title>	
	</head>
	
	<!-- Body -->
	<body>
	    <center>
	    	<!-- 페이지의 머리말을 표현하는 header 태크의 시작입니다. -->
			<header>
	        	<h1>Join Page</h1>
	        </header>
	 
	 		<section>
	 			<!-- form 태그: 바인딩(View와 Controller의 Data간 연결) 경로를 지정 -->
	 			<!-- 회원 가입 처리를 해달라는 요청  -->
		        <form action="join">
		            <table>
		                <tr>
		                    <td>아이디</td>
		                    <td><input type="text" name="userid" ></td>
		                </tr>
		                <tr>
		                    <td>비밀번호</td>
		                    <td><input type="password" name="pwd"></td>
		                </tr>
		                <tr>
		                    <td>비밀번호 확인</td>
		                    <td><input type="password" name="pwd_CHECK" ></td>
		                </tr>
		                <tr>
		                    <td>이름</td>
		                    <td><input type="text" name="name" ></td>
		                </tr>
		                <tr>
		                    <td>이메일</td>
		                    <td><input type="text" name="email" ></td>
		                </tr>
		                
		                <tr>
		                    <td colspan="2" align="center"><input type="submit" value="가입하기"><input type="reset" value="다시작성"></td>
		                </tr>
		            </table>
		        </form>
	        </section>
	        
	        <!-- 페이지의 꼬리말을 표현하는 footer 태그의 시작입니다. -->
			<footer>
				<h5>Copyright 2017.09.28 AIIA Lab</h5>
			</footer>
	    </center>
	</body>
</html>
