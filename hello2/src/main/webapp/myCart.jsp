
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="shopdb.*, java.util.ArrayList" %>
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
			font-size: 12px;
			margin: 0;
			padding: 0;
			border-collapse: collapse;
			text-align: center;

			border:0;


		}
		

		td {
			margin: 0;
			padding: 5px;
			border:0px;
			border-bottom: 1px solid lightgray;
		}
		
		
		th {
			font-weight: normal;
			text-transform: uppercase;
		}
		
		thead tr th {
			background-color: lightgray;
			padding:  20px 10px;
			color: #fff;
			font-weight: bold;
			border-right: 2px solid #333;
			text-transform: uppercase;
			text-align:center;
		}
		
		tfoot tr th, tfoot tr td {
			background-color: transparent;

			color: #ccc;
			border-top: 1px solid #ccc;
		}
		
		tbody tr th {
			padding: 5px;
			border-bottom: 1px dotted #fafafa;
		}
		
		th { 
			background-color: lightgray;
			
		}
		tr.odd {
			background-color: #EDF7DC;
		}
		
		tr:hover {
		}
		
		tr:hover td, tr:hover td a, tr:hover th a {
			color: gray;
		}
		
		td:hover {
		}

		tr:hover th a:hover {
			background-color: #F7FBEF;
			border-bottom: 2px solid #86C200;
		}
		
		table a {
			color: #608117;
			background-image: none;
			text-decoration: none;
			border-bottom: 1px dotted #8A8F95;
			padding: 2px;
			padding-right: 12px; background: transparent url(http://www.alvit.de/vf/csstablegallery/link.gif) no-repeat 100% 50%;
		}

		table a:hover {
			color: #BBC4CD;
			background-image: none;
			text-decoration: none;
			border-bottom: 3px solid #333;
			padding: 2px;
			padding-right: 12px; color: #A2A2A2; background: transparent url(http://www.alvit.de/vf/csstablegallery/link.gif) no-repeat 100% 50%;
		}
		
		table a:visited {
			text-decoration: none;
			border-bottom: 1px dotted #333;
			text-decoration: none;
			padding-right: 12px; color: #A2A2A2; background: transparent url(http://www.alvit.de/vf/csstablegallery/visitedLink.gif) no-repeat 100% 50%;
		}
		
		table a:visited:hover {
			background-image: none;
			text-decoration: none;
			border-bottom: 3px solid #333;
			padding: 2px;
			padding-right: 12px; color: #A2A2A2; background: transparent url(http://www.alvit.de/vf/csstablegallery/visitedLink.gif) no-repeat 100% 50%;
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


<script language=JavaScript >
<!--
function checking() {
	if(document.memberForm.id.value=="") alert("id??? ???????????????")
	else if(document.memberForm.passwd.value=="") alert("??????????????? ???????????????")
	else if(document.memberForm.name.value=="") alert("????????? ???????????????")
	else if(document.memberForm.jnum.value=="") alert("??????????????? ???????????????")
	else if(document.memberForm.cnum.value=="") alert("??????????????? ???????????????")
	
	else document.memberForm.submit()
}

function checkID()
{
	var sid = document.memberForm.id.value
	if(sid == "") alert("????????? ???????????? ????????????.")
	else window.open("checkID.jsp?id="+sid,"","width=400 height=200")
	}
-->

function go(){
	window.location.href="index.jsp";}
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
		  
		Object obj_id = session.getAttribute("id");
		Object obj_name = session.getAttribute("name");
		
		
		String id = (String)obj_id;
		String name = (String)obj_name;
		
		if(id==null){
			out.println("<script>alert('????????? ??? ??????????????????.');history.go(-1); </script>");
		
		
		

		

		}else{
			String user = request.getParameter("user");
			
			ControlDAO dao = new ControlDAO();	
			
			ArrayList<BookCartEntity> list = dao.getCart(user);    
			
			
			%>
			<div align=center>
			<h3>????????????</h3><br><hr>
			<br/><br/>
			<form method=post action="payment.jsp?id=<%=id%>">
				<input type=hidden name=user value=<%=user %>>
				<input type=hidden name=menu value=fromCart>
			<%
				for(BookCartEntity entity : list){ %>
					<input type=hidden name=isbn value=<%=entity.getIsbn()%>>
					<input type=hidden name=quantity value=<%=entity.getQuantity()%>>
					<% 
				}
%>

		
				<table >
					<tr>
				    	<th width=100>ISBN</th>  
						<th width=100>??????</th>   
						<th width=100>??????</th>
						<th width=300>??????</th>
						<th width=100>??????</th>
					</tr>
			<%
					for(BookCartEntity entity : list){
			%>
					<tr>		
					<td align=center><%=entity.getIsbn() %></td>
						<td align=center><%=entity.getTitle() %></td>
						<td align=center><%=entity.getPrice() %></td>
						<td align=center><%=entity.getQuantity() %></td>
						<td align=right><%=entity.getSum() %>??? </td>	
					
					</tr>
					 

					
			<%

					}
		
			
			

%>


	</table>

    
    <br>
     <div class="dynamiclabel">
   	<div class="dynamiclabel" align="center">
	<input type=submit value="??????">
		
	</div>
	</div>
</form>


<!--   <form method=post action="deleteCart.jsp">
<div class="dynamiclabel">
   	<div class="dynamiclabel" align="center">
	<input type=submit value="??????">
	</div>
	</div>
</form>  -->
</div>




<%} %>
<br><br>
</div>




<div id="jb-footer">

<jsp:include page="footer.jsp"/>
</div>

</div>




</body>
</html>
