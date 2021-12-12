<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<script language=JavaScript >

function go(){
	window.location.href="index.jsp";}
</script>



<body>
<%
	session.invalidate();
out.println("<script>alert('로그아웃되었습니다.');go(); </script>");



%>

		<script>
		parent.frames.menu.location.reload();
		//location.href="main.html";
	</script>

</body>
</html>

