
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


 <%@ page import="java.sql.*" %>
 
 
<%
	Object obj_id = session.getAttribute("id");
Object obj_name = session.getAttribute("name");
Object obj_jnum = session.getAttribute("jnum");
Object obj_cnum = session.getAttribute("cnum");
Object obj_anum = session.getAttribute("anum");

String id = (String)obj_id;



if(id!=null){
%>
<%=id %> 님의 회원 정보입니다.<br/><br/><br/>

<%

	String sql;
	Connection con = null;
	PreparedStatement pstmt = null;
	String driverName = "com.mysql.cj.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/shopdb";
	
		sql = "select id,name,jnum,cnum,anum from member where id=?"; 


		try{
			Class.forName(driverName);
			con = DriverManager.getConnection(dbURL,"root","1234");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			ResultSet result = pstmt.executeQuery();
			
			%>


			<table width=100% border=2>
			<tr>			
			<td align=center><b> 아이디 </b></td>
			<td align=center><b> 이름 </b></td>
			<td align=center><b> 주민등록번호 </b></td>
			<td align=center><b> 전화번호 </b></td>
	 	   <td align=center><b> 주소 </b></td>
	    </tr>
	    
	    <%while(result.next()) { %>
			<tr>
			<td align=center><%=result.getString(1) %> </td>
			<td align=center><%=result.getString(2) %> </td>
			<td align=center><%=result.getString(3) %> </td>
			<td align=center><%=result.getString(4) %> </td>
			<td align=center><%=result.getString(5) %> </td>
			
			</tr>
			
			
		<%} result.close(); }
		
		catch(Exception e){
			out.println("에러가 발생했습니다.");
			out.println(e.toString());
			e.printStackTrace();
		}
		
		finally{
			if(pstmt != null) pstmt.close();
			if(con!=null) con.close();
		
		}
		%>
		</table>
		

		<%} else
			
			out.println("<script>alert('로그인 후 이용해주세요.');history.go(-1); </script>");
			%>
	
	
</div>
<br><br><br>


<div id="jb-footer">

<jsp:include page="footer.jsp"/>
</div>

</div>

</body>
</html>


