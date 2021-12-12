<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%

Object obj_id = session.getAttribute("id");
Object obj_name = session.getAttribute("name");
Object obj_jnum = session.getAttribute("jnum");
Object obj_cnum = session.getAttribute("cnum");
Object obj_anum = session.getAttribute("anum");

String name = (String)obj_name;
String id = (String)obj_id;

		    String IMGPATH = "img/book/";
			String isbn = request.getParameter("isbn");
		
			ControlDAO dao = new ControlDAO();	
			BookEntity book = dao.getBook(isbn);
	%>
<div id=bookInfo1>
	<div id=bookImg>
	<br><br>
		<img src=<%=IMGPATH + book.getImg() %> width=150 height=200>
	</div>
	<div id=bookInformation>
		<br><br>
		<table id=bookHeader>		
		<tr><td class=header>ISBN</td><td width=300><%=book.getIsbn() %></td></tr>
			<tr><td class=header>제목</td><td width=300><%=book.getTitle() %></td></tr>
			<tr><td class=header>저자</td><td><%=book.getAuthor() %></td></tr>
			<tr><td class=header>출판사</td><td><%=book.getPublisher() %></td></tr>
			<tr><td class=header>가격</td><td><%=book.getPrice() + " 원"%></td></tr>			
			<tr><td class=header>설명</td><td><%=book.getDescription() %></td></tr> 						
		</table>
		<br>
		<ul>
			<li><a href="payment.jsp?isbn=<%=book.getIsbn()%>&quantity=1&id=<%= id%>">구매</a>
			<li><a href="addCart.jsp?isbn=<%=book.getIsbn()%>&quantity=1&user=<%= name%>">장바구니</a>
		</ul>
		<br><br>
	</div>

</div>

<div id="jb-footer">

<jsp:include page="footer.jsp"/>
</div>

</div>

</body>
</html>