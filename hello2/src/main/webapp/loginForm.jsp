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
<h3>로그인</h3><br><hr>
<form method=post action=login.jsp>
  <div class="dynamiclabel"align="center">
    <input id="name" placeholder="아이디" type="text" name=id>

  </div>

  <div class="dynamiclabel"align="center">
    <input id="email" placeholder="비밀번호" type="password" name=passwd>

  </div>
<br/>
	<div class="dynamiclabel" align="center">
  <input type=submit value="로그인" >
</div>
  
</form>
 <br/><br/> 
   <br/><br/> 

</div>

<div id="jb-footer">

<jsp:include page="footer.jsp"/>
</div>

</div>


</body>
</html>