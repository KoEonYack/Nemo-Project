<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width-device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.min.css"> 
	<link rel="stylesheet" href="css/custom.css">
	<title> 네모(넷에 모여 KTX 할인받자)</title>
</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <div id="block1" > </div>
      <a href="main.jsp"><img src="data/gray_logo.jpg" height="25" width="auto"/> </a>
      <div id="block1" > </div>
    </div>
    <ul class="nav navbar-nav navbar-right">
    	<li><a href="regSelectCity.jsp">  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>   네모하기</a></li>
    	<li><a href="#">로그아웃</a></li>
     </ul>
    </div>
</nav>

<div class="container">


<%
/*
	세션 값 받아오는 구간
	StartCityName
	EndCityName
	date
	Select 값 : startAndEndTime  -> 2개로 파싱하기  | 로 나누어졌다. 
*/

	String StartCityName = (String)session.getAttribute("StartCityName");
	String EndCityName = (String)session.getAttribute("EndCityName");
	String date = (String)session.getAttribute("date"); 
	String startAndEndTime = (String)session.getAttribute("startAndEndTime");
	String startStation = (String)session.getAttribute("startStation");
	String endStation = (String)session.getAttribute("endStation");
	String masterUserID = (String)session.getAttribute("masterUserID");
	String masterUserName = (String)session.getAttribute("masterUserName");
	
	String [] pDate = date.split(","); // Parsing [1] Start Day  [2] End Day

/*
	DB에 넣어야한다.... 
	id
	name
*/
	
	


	
%>



</div>

</body>
</html>