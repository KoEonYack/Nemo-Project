<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    	<li><a href="logout.jsp">로그아웃</a></li>
    </ul>
    </div>
</nav>
	
 
 
<div class="container">
 
 <%
	Statement stmt;
	ResultSet rs;
	try {
		String dbURL = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		stmt = conn.createStatement();
		String sqlList = "SELECT * FROM Article WHERE startCity='서울특별시' ORDER BY articleID DESC";
		String sqlCount = "SELECT COUNT(*) FROM board";
		rs = stmt.executeQuery(sqlList);
		
%>
	<table class="table table-striped">
	  <tr height="5"><td width="5"></td></tr>
	 <!--  <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">  -->
	 <thead>
	 	<tr>
		   <th>ID</th>
		   <th>출발 도시</th>
		   <th>도착 도시</th>
		   <th>출발 역</th>
		   <th>도착 역</th>
		   <th>출발 시간</th>
		   <th>도착 시간</th>
		   <th>출발 날짜</th>
		   <th>방장 PK</th>
		   <th>방장 이름</th>
		   <th>참가 하기</th>
	   </tr>
	 </thead>
	   
	<%
			while(rs.next()) {
				int articleID = rs.getInt(1);
				String startCity = rs.getString(2);
				String endCity = rs.getString(3);
				String startStation  = rs.getString(4);
				String endSatation  = rs.getString(5);
				String startTime   = rs.getString(6);
				String endTime   = rs.getString(7);
				String startDay   = rs.getString(8);
				String masterUserID   = rs.getString(9);
				String masterUserName   = rs.getString(10);
			
	%>
	<tbody>
		<tr>
			<td><a href="NemoRoom.jsp?articleID=<%=articleID%>"><%=articleID %></a></td>
			<td><%=startCity %></td>
			<td><%=endCity %></td>
			<td><%=startStation %></td>
			<td><%=endSatation %></td>
			<td><%=startTime %></td>
			<td><%=endTime %></td>
			<td><%=startDay %></td>
			<td><%=masterUserID %></td>
			<td><%=masterUserName %></td>
			<td><button type="button" class="btn btn-success">참가하기</button> </td>
		</tr>
  </tbody>
	<% 
		}
		rs.close();
		stmt.close();
		conn.close();
	} catch(SQLException e) {
		out.println( e.toString() );
	}
	%>
	
	 </table>
 </div>
</body> 
</html>