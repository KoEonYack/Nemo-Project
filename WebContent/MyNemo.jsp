
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    	<li><a href="regSelectCity.jsp">  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>네모하기</a></li>
    	<li><a href="logout.jsp">로그아웃</a></li>
    </ul>
    </div>
</nav>
	
<div class="container">
  	 <br>
	 <br>
	 <h2>내가 들어간 네모 보기</h2>
	 <hr>
 <%
 // EUC - KR 문제를 해결하자ㅣ/....
	Statement stmt;
	ResultSet rs;
	try {
		String dbURL = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		stmt = conn.createStatement();

		String loginID = (String)session.getAttribute("id"); // 세션에서 로그인한 사용자의 id를 가져오기
		String loginName= (String)session.getAttribute("name"); // 세션에서 로그인한 사용자의 이름을 가져오기
		
		// String sqlList = "SELECT * FROM enterUserToArticle AS UTA, Article WHERE UTA.userID=" + loginID + "AND UTA.articleID=Article.articleID ORDER BY articleID DESC";
		String sqlList ="SELECT * FROM enterUserToArticle AS UTA, Article AS AT WHERE UTA.userID=" + loginID + " AND UTA.articleID=AT.articleID AND  startDay > CURDATE()+0 ORDER BY AT.startDay DESC";
		// 내가 들어간 네모
		// 아티클 id를 이용해서 join을 떄리자
		System.out.println("loginID: " + loginID);
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
	<!-- 
	<a href="NemoRoom.jsp?articleID=<%=articleID%>"> </a>
	 -->
		<tr> 
			<td><%=articleID %></td>
			<td><%=startCity %></td>
			<td><%=endCity %></td>	
			<td><%=startStation %></td>
			<td><%=endSatation %></td>
			<td><%=startTime %></td>
			<td><%=endTime %></td>
			<td><%=startDay %></td>
			<td><%=masterUserID %></td>
			<td><%=masterUserName %></td>
			<td><button type="button" class="btn btn-success" onclick="location.href='NemoRoom.jsp?articleID=<%=articleID%>'">방문하기</button> </td>
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