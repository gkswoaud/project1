<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	Object obj_id = session.getAttribute("id");
Object obj_name = session.getAttribute("name");
Object obj_jnum = session.getAttribute("jnum");
Object obj_cnum = session.getAttribute("cnum");
Object obj_anum = session.getAttribute("anum");

String id = (String)obj_id;
String name = (String)obj_name;

if(obj_id == null){


%>


<header id="main_header">

	
	<nav id="topMenu">
		<ul>
			<li><a href="loginForm.jsp">로그인</a>
			<li><a href="memberForm.jsp">회원가입</a>
			<li><a href="MyInfor.jsp">마이페이지</a>
			<li><a href="myCart.jsp">장바구니</a>

		</ul>
	</nav>
	
</header>


<% }else if(obj_id.equals("admin")) {%>


<header id="main_header">

	
	<nav id="topMenu">
		<ul>
		<li><a>관리자 계정입니다.</a> </li>
			<li><a href="logout.jsp">로그아웃</a>
			<li><a href="book.jsp">도서 등록</a>
			<li><a href="bookdel.jsp">도서 삭제</a>
			<li><a href="memberview.jsp">회원보기</a>
			<li><a href="memberde1.jsp">회원탈퇴</a>

		</ul>
		
		
		
	</nav>
	
</header>

<% } else { %>


<header id="main_header">

	
	<nav id="topMenu">
		<ul>
		<li><a> <%=id %> 님 환영합니다. </a></li>
			<li><a href="logout.jsp">로그아웃</a>
			<li><a href="MyInfor.jsp">마이페이지</a>
			<li><a href="myCart.jsp?user=<%=name%>">장바구니</a>
			<li><a href="myInfo.jsp?user=<%=id%>">주문내역</a>
			
		
		</ul>
		
		
		
	</nav>
	
</header>

<%} %>

</body>
</html>