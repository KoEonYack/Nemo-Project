<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*"%>
<%@page import="nemo_project_root.*"%>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String dbURL = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC&useSSL=false&autoReconnect=true " ;
	String dbID = "root";
	String dbPassword = "1234";
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Statement stm=null;
	ResultSet rs=null;
	try {
		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		stm=conn.createStatement();
		String query ="SELECT userName, studentNumber, userId, userPassword, phoneNumber FROM user";
		rs=stm.executeQuery(query);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>User Management</title>
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
	
	
<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<span class ="glyphicon glyphicon-tags"></span>
						&nbsp;&nbsp; 관리자 모드
					</h3>
				</div>
			<div class="panel-body">
				<div class="media">
					<div class=media-left>
						<a href="#">
							<img class="media-object" src="./data/gray_logo.jpg" alt="관리자">
						</a>
					</div>
					<div class="media-body">
						<h4 class ="media-heading">홍신 교수님 공프기 팀</h4>
							21600767 한현수<br>
							21600574 이재익<br>
							21200602 임혜린<br>
							21300035 고언약<br> 
					</div>
				</div>
			</div>
			
			<table class="table">
				<thead>
					<tr>
						<th>Delete</th>
						<th>이름</th>
						<th>학번</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>전화번호</th>
					</tr>
				</thead>

				<tbody>
					<%
					while(rs.next()){
					%>
					<tr>
						<td><a href ="delete_user.jsp? del= <%=rs.getString(3)%>">Delete</a>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(5)%></td>
					</tr>
					<%} %>
				</tbody>

			</table>
			<%
			rs.close();
			stm.close();
			conn.close();
			}catch (Exception e){
				out.println("err"+e.toString());
			}
			%>
		</div>
	</div>
</div>
</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>