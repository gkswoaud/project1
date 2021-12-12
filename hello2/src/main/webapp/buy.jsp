<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="shopdb.*, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<link href="css/front.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/subpage.css" rel="stylesheet" type="text/css">

<style>

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


<script language=JavaScript >
<!--
function checking() {
	if(document.memberForm.id.value=="") alert("id를 입력하세요")
	else if(document.memberForm.passwd.value=="") alert("비밀번호를 입력하세요")
	else if(document.memberForm.name.value=="") alert("이름을 입력하세요")
	else if(document.memberForm.jnum.value=="") alert("주민번호를 입력하세요")
	else if(document.memberForm.cnum.value=="") alert("전화번호를 입력하세요")
	
	else document.memberForm.submit()
}

function checkID()
{
	var sid = document.memberForm.id.value
	if(sid == "") alert("입력된 아이디가 없습니다.")
	else window.open("checkID.jsp?id="+sid,"","width=400 height=200")
	}
-->
</script>



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
		String user = request.getParameter("user");
		String isbn[] = request.getParameterValues("isbn");
		String quantity[] = request.getParameterValues("quantity");
		String menu = request.getParameter("menu");
	    String id = request.getParameter("id");
		
		
		ControlDAO dao = new ControlDAO();
		int orderNum = dao.getOrderNum();
		Date date = new Date();
		boolean success = false;   
		for(int i=0; i<isbn.length; i++){
			success = dao.insertOrderinfo( orderNum, user, isbn[i], 
					                      date, Integer.parseInt(quantity[i]));
			if(!success) break;
			if(menu != null && menu.equals("fromCart"))
				dao.deleteCart(user, isbn[i]);
		}		  
		
		if(success)	{			
%>			out.println("<script>alert("결제가 성공적으로 처리되었습니다.");</script>");

<% 
			response.sendRedirect("myInfo.jsp?user=" + user);

		} else {	
%>					
			<script>alert("잠시 후에 다시 시도해 주세요.");history.go(-1) ;</script>
<%
		}
%>
</div>

<div id="jb-footer">


<jsp:include page="footer.jsp"/>
</div>

</div>

</body>
</html>