<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>Admin Main Page</title>
</head>

<body>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"	
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="admin_main.jsp">Welcome to Admin Main</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="admin_user.jsp">User Management</a></li>
				<li><a href="admin_article.jsp">Article Management</a></li>
			</ul> 
		</div>
	</nav>
	<style type="text/css">
		.jumbotron{
			background-image: url('data/main1.jpg');
			background-size: cover;
			text-shadow: black 0.1em 0.1em 0.1em;
			color: white;
		}
		#button{
		background: #75BC00;
		padding: 7px 30px 7px 30px;
		fontsize: 15px;
		font-weight:bold;
		text-align:center;
		bolder:solid 1px #99E000;
		background: -moz-linear-gradient(0%, 100%, 90deg, #75BC00, #ffffff);
		background: -webkit-gradient(linear, 0%, 0%, 0%, 100%, from(#fffff),to(#75BC00))
		
		}
	</style>
	
	
	
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">Welcome to Admin Main Page</h1>
			<p class="text-center">If there are some managing issues</p>
	<p></p>
			<p class="text-left">
				<a class="btn-primary btn=lg" id="button" href="admin_article.jsp" role="button">Article Management</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="btn-primary btn=lg" id="button" href="admin_user.jsp" role="button">User Management</a>
			</p>
			
		</div>
	
	</div>
			<br><br>
			<br><br>
			<br><br>

	
	
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>