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
	<title> �׸�(�ݿ� �� KTX ���ι���)</title>
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
    	<li><a href="regSelectCity.jsp">  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>   �׸��ϱ�</a></li>
    	<li><a href="#">�α׾ƿ�</a></li>
     </ul>
    </div>
</nav>

<div class="container">


<%
/*
	���� �� �޾ƿ��� ����
	StartCityName
	EndCityName
	date
	Select �� : startAndEndTime  -> 2���� �Ľ��ϱ�  | �� ����������. 
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
	DB�� �־���Ѵ�.... 
	id
	name
*/
	
	


	
%>



</div>

</body>
</html>