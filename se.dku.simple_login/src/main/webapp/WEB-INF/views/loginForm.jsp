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
				<h1>Login Page</h1>
			</header>
			
			<!-- 페이지 내용을 담기 위한 section 태그의 시작입니다. -->
			<section>
				<!-- form 태그: 바인딩(View와 Controller의 Data간 연결) 경로를 지정 -->
	 			<!-- 로그인 처리를 해달라는 요청  -->
		        <form action="login">
		            <table>
		                <tr>
		                    <td width="150px" align="center">아이디 :</td>
		                    <td width="150px" align="center">
		                        <input type="text" name="id">
		                    </td>
		                </tr>
		                <tr>
		                    <td width="150px" align="center">비밀번호 :</td>
		                    <td width="150px" align="center">
		                        <input type="password" name="pwd">
		                    </td>
		                </tr>
		                <tr>
		                    <td colspan="2" align="center">
		                        <input type="submit" value="로그인">
		                        <!-- 회원가입 버튼 클릭시 "joinForm" 링크로 이동 -->
		                        <input type="button" value="회원가입" onclick="location.href='joinForm'">
		                    </td>
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
