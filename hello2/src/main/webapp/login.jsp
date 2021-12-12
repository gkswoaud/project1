<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="shopdb.*" %>
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
	request.setCharacterEncoding("UTF-8"); 
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	MemberDAO mdao = new MemberDAO();
	boolean success = mdao.isPasswd(id, passwd);
	if(!success){
		out.println("<script>alert('회원가입이 안되어 있거나 비밀번호가 다릅니다.');history.go(-1);</script>");
	}else{
		MemberEntity member = mdao.getMember(id);
		session.setAttribute("id", member.getId());
		session.setAttribute("name", member.getName());
		session.setAttribute("jnum", member.getJnum());
		session.setAttribute("cnum", member.getCnum());
		session.setAttribute("anum", member.getAnum());
		
		out.println("<script>alert('로그인이 되었습니다.');go();</script>");
	
%>

<script>parent.frames.menu.location.reload();</script>
<%
	}
%>
</body>
</html>
