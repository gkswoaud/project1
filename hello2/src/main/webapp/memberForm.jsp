
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
}</style>
	


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

<h3>회원가입</h3><br><hr>

   <form name="memberForm" method=post action=addMember.jsp>
   
   
  <div class="dynamiclabel" >
    <input id="ID" placeholder="아이디" type="text" name=id>

     <input type="button" value="중복체크" onClick="checkID()">
  </div>

  <div class="dynamiclabel" >
    <input id="email" placeholder="비밀번호" type="password" name=passwd>

  </div>


<div class="dynamiclabel1" >
    <input id="name" placeholder="이름" type="text" name=name>

  </div>

<div class="dynamiclabel1" >
    <input id="jnum" placeholder="주민등록번호" type="text" name=jnum>

  </div>
 
  <div class="dynamiclabel1" >
    <input id="cnum" placeholder="전화번호" type="text" name=cnum>

  </div>
  
  <div class="dynamiclabel1" >
    <input id="anum" placeholder="주소" type="text" name=anum>

  </div>
  
	<div class="dynamiclabel" >
 	<input type=submit value="회원 가입" onClick="checking()">

</div>
  </form> 
</div>

<div id="jb-footer">


<jsp:include page="footer.jsp"/>
</div>

</div>


</body>
</html>