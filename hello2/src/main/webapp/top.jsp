<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="css/front.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">

</head>



<body>

<div id="main_top">

<a href="index.jsp">
<img src="img/logo.PNG" width=250 height=50>
</a>

<form method="post" action="searchbook.jsp">

<div id="search">
 <select id="type" name="type" >
<option SELECTED value="title">제목</option>
<option value="name">저자</option>
<option value="public">출판사</option>
</select>
<input id="input" type="text" name="bname"  >
<input id="button"type="submit" value="검색">
</div>

</form>
</div>
<br/><br/>

<nav id="nav">
		<ul>
			<li><a href="domestic.jsp">국내도서</a></li>
			<li><a href="foreign.jsp">외국도서</a></li>
			<li><a href="ebook.jsp">eBook</a></li>
			<li><a href="best.jsp">베스트</a></li>
		</ul>
		</nav>

<br/><br/>



</body>
</html>