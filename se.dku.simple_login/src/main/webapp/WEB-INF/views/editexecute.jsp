<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>

<title>게시물 수정</title>
</head>
<body>
<%  
    String sql="",
    	name = request.getParameter("name"), //name 즉, 글 작성자 받아옴
    	title = request.getParameter("title"), //title 즉, 글 제목 받아옴
    	content = request.getParameter("content"); //content 즉, 글 내용 받아옴
    	
    switch(action){
		case "update" :
			sql = String.format("UPDATE testdatatable SET name='%s', title='%s', content='%s' WHERE idx='%s'",name,title,content,idx);
			break;
    }
    
    pstmt = con.prepareStatement(sql);
		if(pstmt.executeUpdate() < 1){ //업데이트 된 갯수가 1보다 작으면 오류
			out.println("<script>alert('오류! : ' + sql);</script>");
		} else { //업데이트 된 갯수가 1보다 크면
			//out.println(sql);
			out.println("<script>alert('수정 완료되었습니다'); location.replace('redirect.jsp');</script>");
			return;
		}
%>



</body>
</html>