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
    
    pstmt = con.prepareStatement("SELECT * FROM testdatatable WHERE idx=" + idx);
	rs = pstmt.executeQuery();
    
    while(rs.next()){
%>


<h2>게시물 수정</h2>
<form action="./editexecute.jsp?idx=<%=rs.getString("idx")%>" method="post" onsubmit="return formCheck();"> <!-- formCheck함수의 리턴값이 true일때만 submit이 동작함 -->
	<fieldset><legend>게시물 수정</legend>
		<input type="hidden" name="action" value="update" />
		제목: <input type="text" name="title" value="<%=rs.getString("title")%>" /><br><br>
		작성자: <input type="text" name="name" value="<%=rs.getString("name")%>" /><br><br>
		내용: <br> <textarea name="content" rows="5" cols="30"><%=rs.getString("content")%></textarea><br><br>
		<input type="submit" value="수정 완료" />
	</fieldset>
</form>

<script>
	//게시물 수정 화면에서 input태그 안에 입력되는 내용이 없을경우 경고창을 띄우는 함수
	function formCheck(){
		var length = document.forms[0].length-1; //submit을 제외한 모든 input태그의 갯수를 가져옴
		for(var i=1; i<length; i++){ //i=1인 이유는 type이 hidden인 첫 번째 input태그는 검사안하기 위해서
			if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
				alert(document.forms[0][i].name + "을/를 입력하세요.");
				document.forms[0][i].focus(); //null인 태그에 포커스를 줌
				return false;
			} //end if
		} //end for
	} //end function
</script>

<%
   }
%>
</body>
</html>