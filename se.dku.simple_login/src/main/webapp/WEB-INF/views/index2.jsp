<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트 화면</title>
</head>
<body>
<%
	/* DB 연결 */
    String
		driver = "org.mariadb.jdbc.Driver",
    	url    = "jdbc:mariadb://220.149.235.54/healthcare?useUnicode=true&characterEncoding=utf8",
    	uId    = "guest",
    	uPwd   = "1234";
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
    Class.forName(driver);
    con = DriverManager.getConnection(url, uId, uPwd);
    
%>

<h2>게시물 리스트</h2>
<table border="1">
	<thead><tr><th>글 번호</th><th>제목</th><th>작성자</th><th>내용</th><th>날짜</th><th>조회수</th></tr></thead>
	
<%
	pstmt = con.prepareStatement("SELECT * FROM testdatatable order by idx desc"); //idx 역순으로 데이터 가져오기
	rs = pstmt.executeQuery();
	String data = "";
	while(rs.next()){
		data += String.format(
					"<tr><td>%s</td><td><a href='viewpost.jsp?idx=%s'>%s</a></td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
					rs.getString("idx"),
					rs.getString("idx"),
					rs.getString("title"),
					rs.getString("name"),
					rs.getString("content"),
					rs.getString("date"),
					rs.getString("hit")
				);
	}
	out.println(data);
%>
</table>
<br>

<form>
<input type="button" value="게시물 작성" onclick="location.href='writepost.jsp'">
</form>
<br>

</body>
</html>