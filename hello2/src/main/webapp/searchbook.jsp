<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.ArrayList, shopdb.*, java.text.SimpleDateFormat" %>
    <%@ page import="shopdb.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>


<link href="css/front.css" rel="stylesheet" type="text/css">
<link href="css/subpage.css" rel="stylesheet" type="text/css">

</head>

<body>


<div id="jb-container">
<div id="jb-header">
<jsp:include page="header.jsp"/>


</div>
<div id="jb-top">
<jsp:include page="top.jsp"/>
</div>




<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<% 
   String type = request.getParameter("type");
   String bname = request.getParameter("bname");
	
%>



<%
String IMGPATH = "img/book/";
	String sql;
	Connection con = null;
	PreparedStatement pstmt = null;
	String driverName = "com.mysql.cj.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/shopdb";
	

	if(type.equals("title"))
	{
		sql = "select * from book where title =?"; 
	}
	else if(type.equals("name"))
	{
		sql = "select * from book where author=?";
	}
	else
		sql = "select * from book where publisher=?";
	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL,"root","1234");
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,bname);
		ResultSet result = pstmt.executeQuery();
		
		%>
		
		
		<center>
	 <table width=700  cellpadding=3 cellspacing=3 >
    
    <tr align="center">
       <td width=430 bgcolor=lightgray><font color=black>ISBN</font></td>
       <td width=430 bgcolor=lightgray><font color=black>book</font></td>
	   <td width=430 bgcolor=lightgray><font color=black>제목</font></td>
 	   <td width=430 bgcolor=lightgray><font color=black>저자</font></td>
   	 <td width=430 bgcolor=lightgray><font color=black>출판사</font></td>
     <td width=430 bgcolor=lightgray><font color=black>가격</font></td>
  
     
    </tr>
    
	
	<%
	while(result.next()) {
	
	%>
	
	<tr>

	 <td align=center> <a href="bookInfo.jsp?isbn=<%=result.getString("isbn")%>"><%=result.getString("isbn") %>
<td align=center> <a href="bookInfo.jsp?isbn=<%=result.getString("isbn")%>"><img src=<%=IMGPATH + result.getString("img") %> height=150 >
	</td>
	 <td align=center> <%=result.getString("title") %></a></td>

	 <td align=center> <%=result.getString("author") %></a></td>
 <td align=center> <%=result.getString("publisher") %></a></td>
  <td align=center> <%=result.getString("price") + " 원"%></a></td>
</a>
	</tr>
	<%
	}
	result.close();
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
	
	
	

	</table>
</div>
<br><br><br>



<div id="jb-footer">


<jsp:include page="footer.jsp"/>
</div>

</div>



</body>
</html>
