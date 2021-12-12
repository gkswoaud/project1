
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> ID 중복 체크  </title>
</head>
<script language=JavaScript >
<!--

function cl()
{
	window.close()
	}
-->
</script>
<body>

<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<% 
   String id = request.getParameter("id");
	
%>



<%

	Connection con = null;
	PreparedStatement pstmt = null;
	String driverName = "com.mysql.cj.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/shopdb";
	
	String sql = "select * from member where id=?";
	try
	{
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL,"root","1234");
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id);
		ResultSet result = pstmt.executeQuery();
		
	
		
		
		if(result.next() || (id==null))
		{
			%>
			
			<br/><br/><br/><br/>
			<center> 입력하신 [ <%=id %> ] 아이디는 현재 사용중입니다. <br> 다른 아이디를 입력해주세요. <br></br></center>
<%
		}
		else
		{
	
	%>
	<br/><br/><br/><br/>
		<center> [ <%= id %> ] 아이디는 사용하실 수 있습니다.<br></br></center>
	<%
		}
	
	

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
	
	
	
<form>
<center>
<input type=button value="확인" onClick="cl()">
</center>
</form>


</body>
</html>
</body>
</html>