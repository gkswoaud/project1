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

		
</head>

<script language=JavaScript >

function go(){
	window.location.href="loginForm.jsp";}
</script>

<body>


<div id="jb-container">
<div id="jb-header">
<jsp:include page="header.jsp"/>


</div>
<div id="jb-top">
<jsp:include page="top.jsp"/>
</div>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="member" class="shopdb.MemberEntity" scope="page" />
<jsp:setProperty name="member" property="*" />

<%	
	MemberDAO mdao = new MemberDAO();
	boolean success = mdao.insertDB(member);
	if(!success)
		out.println("<script>alert('회원가입에 실패하였습니다. 다시 시도해주세요.'); history.go(-1);</script>");
	else{
		out.println("<script>alert('회원가입이 정상적으로 처리되었습니다.');go();</script>");
	
	}
%>

</div>

<div id="jb-footer">

<jsp:include page="footer.jsp"/>
</div>

</div>

</body>
</html>