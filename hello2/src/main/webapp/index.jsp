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

<div id="jb-container">
<div id="jb-header">
<jsp:include page="header.jsp"/>

</div>
<div id="jb-top">
<jsp:include page="top.jsp"/>
</div>

<div id="jb-content">

<h3>오늘의 책</h3><br><br><br>
<table>
<tr>
<td>
<div class="imagepluscontainer" style="width:170px; height:300px; left:35px">
<a href="bookInfo.jsp?isbn=1">
<img src="img/book1.JPG" width=150 height=200/>
</a>
<br><br>
	<ul id="items">
		<li class="a">세상에서 제일 친절한 엑셀</li>
		<li class="b">박재영 저 | 한빛미디어</li>
		<li class="c">16200 원</li>
	</ul>
</div>
</td>

<td>
<div class="imagepluscontainer" style="width:170px; height:300px; left:35px">
<a href="bookInfo.jsp?isbn=2">
<img src="img/book2.JPG" width=150 height=200/>
</a>
<br><br>
	<ul id="items">
		<li class="a">엑셀&amp;파워포인트&amp;워드+한글 무작정 따라하기</li>
		<li class="b">박미정,박은진 공저 | 길벗</li>
		<li class="c">18900 원</li>
	</ul>
</div>
</td>

<td>
<div class="imagepluscontainer" style="width:170px; height:300px; left:35px">
<a href="bookInfo.jsp?isbn=3">
<img src="img/book3.JPG" width=150 height=200/>
</a>
<br><br>
	<ul id="items">
		<li class="a">실무 프로젝트로 배우는 데이터 분석 with R</li>
		<li class="b">박기군 저 | 위키북스</li>
		<li class="c">25200 원</li>
	</ul>
</div>
</td>

<td>
<div class="imagepluscontainer" style="width:170px; height:300px; left:35px">
<a href="bookInfo.jsp?isbn=4">
<img src="img/book4.JPG" width=150 height=200/>
</a>
<br><br>
	<ul id="items">
		<li class="a">스프링 부트 실전 활용 마스터</li>
		<li class="b">그렉 턴키스트 저 | 책만</li>
		<li class="c">25200 원</li>
	</ul>
</div>
</td>
</tr>
</table>
<br><br><br>
<table>
<tr>
<td>
<div class="imagepluscontainer" style="width:170px; height:300px; left:35px">
<a href="bookInfo.jsp?isbn=5">
<img src="img/book5.JPG" width=150 height=200/>
</a>
<br><br>
	<ul id="items">
		<li class="a">오늘부터 자바스크립트</li>
		<li class="b">곽문기,하호진 저 | 다락원</li>
		<li class="c">20700 원</li>
	</ul>
</div>
</td>

<td>
<div class="imagepluscontainer" style="width:170px; height:300px; left:35px">
<a href="bookInfo.jsp?isbn=6">
<img src="img/book6.JPG" width=150 height=200/>
</a>
<br><br>
	<ul id="items">
		<li class="a">회사에서 바로 통하는 실무 엑셀&amp;수식</li>
		<li class="b">김경자,송선영 저 | 한빛미디어</li>
		<li class="c">21600 원</li>
	</ul>
</div>
</td>

<td>
<div class="imagepluscontainer" style="width:170px; height:300px; left:35px">
<a href="bookInfo.jsp?isbn=7">
<img src="img/book7.JPG" width=150 height=200/>
</a>
<br><br>
	<ul id="items">
		<li class="a">쉬운 딥러닝</li>
		<li class="b">반병현 저 | 생능출판사</li>
		<li class="c">18000 원</li>
	</ul>
</div>
</td>


<td>
<div class="imagepluscontainer" style="width:170px; height:300px; left:35px">
<a href="bookInfo.jsp?isbn=8">
<img src="img/book8.JPG" width=150 height=200/>
</a>
<br><br>
	<ul id="items">
		<li class="a">데이터 분석가의 숫자유감</li>
		<li class="b">권정민/주형 저 | 골든래빗</li>
		<li class="c">14400 원</li>
	</ul>
</div>
</td>
</tr>
</table>


</div>
<br><br><br>

<div id="jb-footer">


<jsp:include page="footer.jsp"/>
</div>

</div>

</body>
</html>
