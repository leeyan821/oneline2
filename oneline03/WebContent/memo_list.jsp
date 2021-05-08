<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "say17405*";
	Connection con = null;
	String sql = "select * from oneline";
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	con = DriverManager.getConnection(url, user, passwd);
	
	pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(); //select
	
	while(rs.next()) { 
		int no = rs.getInt(1);
		String memo = rs.getString(2);
		String wdate = rs.getString(3);
		
		out.println(no + ": " + memo + " :(" + wdate + ")");
		%>
		<a href ="memo_delete.jsp?no=<%=no%>"><input type="button" value="삭제"></input></a>
		<br>
<%	}
	rs.close();
	pstmt.close();
	con.close(); 
	out.println("DB조회 성공"); 
%>
<form method="post" action="memo_form.html">
	<input type="submit" value="작성"></input> 
</form>
</body>
</html>