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
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("num");

	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "say17405*";
	Connection con = null;
	String sql = "delete from oneline where no = ?";
	PreparedStatement pstmt = null;
		
	Class.forName("com.mysql.cj.jdbc.Driver");
		
	con = DriverManager.getConnection(url, user, passwd);
			
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, num);
	pstmt.executeUpdate();
		
	pstmt.close();
	con.close();
	System.out.println("DB삭제 성공");
%>	
</body>
</html>