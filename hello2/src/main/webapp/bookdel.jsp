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
form div.dynamiclabel{ 
  display: block;
  margin: 30px;
  font: 16px;
  position: relative;
}


form div.dynamiclabel input[type="text"], form div.dynamiclabel textarea{
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
</style>
	
 
</head>
<script language=JavaScript >

function renew(){
	window.location.reload();
}
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


<h3>도서 삭제</h3><br><hr>
	<form method="post" action="bookdel1.jsp">
	<br>
		삭제할 도서의 ISBN번호를 입력해주세요  :
 <div class="dynamiclabel">
  

    <div class="dynamiclabel">
    <input id="isbn" placeholder="ISBN" type="text" name=isbn>
   
  </div>
  
<br/><br/>
	<div class="dynamiclabel" align="center">
  <input type=submit value="삭제">
</div>
</div>
</form>


</div>

<div id="jb-footer">


<jsp:include page="footer.jsp"/>
</div>

</div>

</body>
</html>