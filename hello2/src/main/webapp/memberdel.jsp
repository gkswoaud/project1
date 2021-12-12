<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script language=JavaScript >

function go(){
	window.location.href="memberde1.jsp";}
</script>



<body>



<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("UTF-8"); %>


<% 
   String id = request.getParameter("id");	
	%>


<%
	String sql;
	Connection con = null;
	PreparedStatement pstmt = null;
	String driverName = "com.mysql.cj.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/shopdb";
	
		sql = "delete from member where id=?"; 
	
	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL,"root","1234");
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id);
		int row = pstmt.executeUpdate();
	
		%>
		 
		<%
		out.println("<script>alert('회원 탈퇴가 정상적으로 처리되었습니다.');go(); </script>");

		
		%>

	<input type=button value="처음으로" target="main" onClick="location.href='main.html'">

	 	
	
<%

	}
	
	
	catch(Exception e) {
	out.println("에러가 발생했습니다.");
	out.println(e.toString());
	e.printStackTrace();
	}
	
	
	finally {
	if(pstmt != null) pstmt.close();
	if(con!=null) con.close();
	}
	%>


</body>
</html>