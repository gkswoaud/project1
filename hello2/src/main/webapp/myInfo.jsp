
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
		
		
table {
	font:normal 76%/150% "Lucida Grande", "Lucida Sans Unicode", Verdana, Arial, Helvetica, sans-serif;
	border-collapse:separate;
	border-spacing:0;
	margin:0 0 1em;
	color:#000;
	}
table a {
	color:#523A0B;
	text-decoration:none;
	border-bottom:1px dotted;
	}
table a:visited {
	color:#444;
	font-weight:normal;
	}
table a:visited:after {
	content:"\00A0\221A";
	}
table a:hover {
	border-bottom-style:solid;
	}
thead th,
thead td,
tfoot th,
tfoot td {
	border:1px solid #523A0B;
	border-width:1px 0;
	background:#EBE5D9;
	}
th {
	font-weight:bold;
	line-height:normal;
	padding:0.25em 0.5em;
	text-align:left;
	}
tbody th,
td {
	padding:0.25em 0.5em;
	text-align:left;
	vertical-align:top;
	}
tbody th {
	font-weight:normal;
	white-space:nowrap;
	}
tbody th a:link,
tbody th a:visited {
	font-weight:bold;
	}
tbody td,
tbody th {
	border:1px solid #fff;
	border-width:1px 0;
	}
tbody tr.odd th,
tbody tr.odd td {
	border-color:#EBE5D9;
	background:#F7F4EE;
	}
tbody tr:hover td,
tbody tr:hover th {
	background:#ffffee;
	border-color:#523A0B;
	}
caption {
	font-family:Georgia,Times,serif;
	font-weight:normal;
	font-size:1.4em;
	text-align:left;
	margin:0;
	padding:0.5em 0.25em;
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
		
		ControlDAO dao = new ControlDAO();	  
			     
		ArrayList<OrderBookEntity> list = dao.getOrderList(user);    
%>
<div align=center>
	<h3>최근 주문내역</h3><br><hr>
	<table border=1>
	<br><br>
		<tr>
			<th>주문일자</th>   
			<th>주문번호</th>
			<th>주문내역</th>
			<td>가격</td>
		</tr>
<%
		for(OrderBookEntity entity : list){
%>
		<tr>
			<td width=100 align=center><%=entity.getBuydate() %></td>
			<td width=100 align=center><%=entity.getNum() %></td>
			<td width=300><%=entity.getTitle() %>
<%
	if(entity.getCnt()>1)
		out.println(" 외 " + (entity.getCnt() -1) + " 종");



%>			</td>
			<td width=100 align=right><%=entity.getTotal() %> 원 </td>	
		</tr>
<%
		}
%>
	</table>
</div>

</div>
<br><br><br>

<div id="jb-footer">


<jsp:include page="footer.jsp"/>
</div>

</div>



</body>
</html>

