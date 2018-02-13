<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>게시물 삭제</title>
</head>
<body>
<%
	/* DB 연결 */
	String idx = request.getParameter("idx"); //idx 즉, 글 번호 받아옴
    String
		driver = "org.mariadb.jdbc.Driver",
    		url    = "jdbc:mariadb://220.149.235.54/healthcare?useUnicode=true&characterEncoding=utf8",
    		uId    = "guest",
    		uPwd   = "1234";
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs = null;
    Class.forName(driver);
    con = DriverManager.getConnection(url, uId, uPwd);
    
    String sql="";
    sql = String.format("DELETE FROM testdatatable WHERE idx='%s'", idx);
    pstmt = con.prepareStatement(sql);
    if(pstmt.executeUpdate() < 1){ //업데이트 된 갯수가 1보다 작으면 오류
    	out.println("<script>alert('오류입니다'); location.replace('');</script>");
    }
    else{ //업데이트 된 갯수가 1보다 크면 정상작동
    	out.println("<script>alert('삭제가 완료되었습니다'); location.replace('redirect.jsp');</script>");
    	return;
    }
    
%>
</body>
</html>