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

<head>
<meta charset="UTF-8">
<title>책등록</title>
<style>
	.book {
		width: 150;
		text-align : left;

	}
</style>
</head>
<body>
<div align=center>
<h3>도서등록</h3><br><hr>
<%
	ControlDAO  dao = new ControlDAO();
	ArrayList<CategoryEntity> categoryList = dao.getBoardList();
%>

<form method="post" action="bookRegistration.jsp"  enctype="multipart/form-data">
	<br>
	<table>
		<tr> 
			<td class=book> ISBN </td>
			<td align=left><input type="text" name="isbn"></td>
		</tr>
		<tr> 
			<td class=book> 제목 </td>
			<td align=left><input type="text" name="title" maxlength=50 size=70></td>
		</tr>
		<tr> 
			<td class=book> 저자 </td>
			<td align=left><input type="text" name="author" maxlength=30 size=30></td>
		</tr>
		<tr> 
			<td class=book> 출판사 </td>
			<td align=left><input type="text" name="publisher" maxlength=40 size=40></td>
		</tr>
		<tr> 
			<td class=book> 가격 </td>
			<td align=left><input type="text" name="price" ></td>
		</tr>	
		<tr> 
			<td class=book> 카테고리 </td>
			<td align=left><select name="category">
<%
				for(CategoryEntity entity : categoryList){
					String categ = entity.getCateg();
					out.println("<option value=" + categ + ">" + categ + "</option>" );
				}
%>					
			</select></td>
		</tr>	
		<tr> 
			<td class=book> 재고 </td>
			<td align=left><input type="text" name="remaining" ></td>
		</tr>
		
		<tr> 
			<td class=book> 이미지 파일 </td>
			<td align=left><input type="file" name="img" size=50 ></td>
		</tr>	
		<tr> 
			<td class=book> 설명 </td>
			<td align=left><textarea rows=10 cols=50 name="description" ></textarea></td>
			
		</tr>
						
		<tr>
			<td colspan=2 align=center>
				<br>
				<input id="button2" type="submit" value="등록">
				<input id="button2" type="reset" value="취소">
			</td>
		
		</tr>
	</table>

</form>
<br><br>
</div>
</div>

<div id="jb-footer">
<jsp:include page="footer.jsp"/>
</div>

</div>

</body>
</html>