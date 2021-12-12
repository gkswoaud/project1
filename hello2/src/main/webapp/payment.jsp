
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="shopdb.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<link href="css/front.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/subpage.css" rel="stylesheet" type="text/css">

<style>


table {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	border-left: 1px solid #ccc;
	border-top: 1px solid #ccc; 
	color: #333;
}

table caption {
	font-size: 1.1em;
	font-weight: bold;
	letter-spacing: -1px;
	margin-bottom: 10px;
	padding: 5px;
	background: #efefef;
	border: 1px solid #ccc;
	color: #666;
}

table a {
	text-decoration: none;
	border-bottom: 1px dotted #f60;
	color: #f60;
	font-weight: bold;
}

table a:hover {
	text-decoration: none;
	color: #fff;
	background: #f60;
}

table tr th a {
	color: #369;
	border-bottom: 1px dotted #369;
}

table tr th a:hover {
	color: #fff;
	background: #369;
}

table thead tr th {
	text-transform: uppercase;
	background: #e2e2e2;
}

table tfoot tr th, table tfoot tr td {
	text-transform: uppercase;
	color: #000;
	font-weight: bold;
}

table tfoot tr th {
	width: 20%;
}

table tfoot tr td {
	width: 80%;
}

table td, table th {
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 5px;
	line-height: 1.8em;
	font-size: 0.8em;
	vertical-align: top;
	width: 20%;
}

table tr.odd th, table tr.odd td {
	background: #efefef;
}



form div.dynamiclabel{ 
  display: block;
  margin: 30px;
  font: 16px;
  position: relative;
}


form div.dynamiclabel1{ 
  display: block;
  margin: 30px;
  font: 16px;
  position: relative;
}


form div.dynamiclabel input[type="text"], form div.dynamiclabel textarea{
  width: 220px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}

form div.dynamiclabel1 input[type="text"], form div.dynamiclabel textarea{
  width: 320px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}

form div.dynamiclabel input[type="password"], form div.dynamiclabel textarea{
  width: 320px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}

form div.dynamiclabel input[type="button"], form div.dynamiclabel textarea{
  width: 100px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}


form div.dynamiclabel input[type="submit"], form div.dynamiclabel textarea{
  width: 320px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}
form div.dynamiclabel input[type="reset"], form div.dynamiclabel textarea{
  width: 320px;
  padding: 10px;
  border: 1px solid #c3c3c3;
  border-radius: 7px;
}

form div.dynamiclabel textarea{
  height: 200px;
}





form div.dynamiclabel1 textarea{
  height: 200px;
}


}
		
		</style>
	


</head>




<body>


<div id="jb-container">
<div id="jb-header">
<jsp:include page="header.jsp"/>





</div>
<div id="jb-top">
<jsp:include page="top.jsp"/>
</div>





<div id="jb-content">

<%
	Object obj_id = session.getAttribute("id");
Object obj_name = session.getAttribute("name");
Object obj_jnum = session.getAttribute("jnum");
Object obj_cnum = session.getAttribute("cnum");
Object obj_anum = session.getAttribute("anum");

String id = (String)obj_id;
String name1 = (String)obj_name;
String anum = (String)obj_anum;


if(id!=null){

   String user = request.getParameter("id");
	String menu = request.getParameter("menu");
	String isbn[] = request.getParameterValues("isbn");
   String quantity[] = request.getParameterValues("quantity");


   ControlDAO dao = new ControlDAO();         
   MemberEntity member = dao.getMember(user);

%>
<div align=center>
<h3>구매 책 정보</h3><br><hr>
   <table border=1>
   <br><br>
      <tr>
         <th>제목</th>
         <th>수량</th>
         <th>가격</th>
      </tr>
<%
   for(int i=0; i<isbn.length; i++ ){
      BookEntity book = dao.getBook(isbn[i]);
      int sum = book.getPrice()*Integer.parseInt(quantity[i]);
%>
      <tr>
         <td width=300><%=book.getTitle() %></td>
         <td width=100 align=center><%=quantity[i] %></td>
         <td width=100 align=center><%=sum %></td>
      </tr>
<%
   }
%>
   </table>
   <br><br>
<h3>구매자 정보</h3><br><hr>
   <table border=1>
   <br><br>
      <tr>
         <th>고객명</th>
         <th>주소</th>      
      </tr>   
      <tr>
         <td width=100 align=center><%=name1 %></td>
         <td width=400 align=center><%=anum %></td>
      </tr>
   
   </table>   
   <br><br>
   
   <form method="post" action="buy.jsp?id=<%=id%>">
      <input type=hidden name=user value=<%=member.getId() %>>
      <input type=hidden name=menu value=<%=menu %>>
<%
   for(int i=0; i<isbn.length; i++ ){
%>
      <input type=hidden name=isbn value=<%=isbn[i] %>>
      <input type=hidden name=quantity value=<%=quantity[i] %> >
<%
   }
%>      
      <input id="button" type="submit" value="구매">
   </form>
</div>

</div>


<%} else out.println("<script>alert('로그인 후 이용해주세요.');history.go(-1); </script>");
 %>
<br><br><br>
 

<div id="jb-footer">



<jsp:include page="footer.jsp"/>
</div>

</div>


</body>
</html>

