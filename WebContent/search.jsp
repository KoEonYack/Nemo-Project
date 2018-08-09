<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@page import="java.io.PrintWriter"%>
<%@ page import = "java.net.URLEncoder" %>

<!DOCTYPE html">
<html>
<head>
	<%! 
	int index = 0;
   	
	%>
	<meta http-equiv="Content-Type" content="text/html; charset="EUC-KR">
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
    	<li><a href="logout.jsp">�α׾ƿ�</a></li>
    </ul>
    </div>
</nav>
	
<div class="container">
 
 <%
	Statement stmt;
 	ResultSet rs;
	//PreparedStatement pstmt;
	
	request.setCharacterEncoding("EUC-KR");
	response.setContentType("text/html; charset=EUC-KR");
	
	String startCity = request.getParameter("startCity");
	
	response.setContentType("text/html; charset=EUC-KR");
	PrintWriter script = response.getWriter();
	
	
	if(startCity!=null){
	Cookie cookie = new Cookie("startCity" + index, URLEncoder.encode(startCity,"EUC-KR"));
	cookie.setMaxAge(60*30); 
	response.addCookie(cookie);
	System.out.println(cookie);
	index++; 
	}
	
	
	
	try {
		String dbURL = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC&useSSL=false&autoReconnect=true " ;
		String dbID = "root";
		String dbPassword = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		stmt = conn.createStatement();
		String sql =  "SELECT * FROM Article WHERE startCity=" + "\'" + startCity + "\'";// ��� ���� �˻� ���� 
		System.out.println(sql);
		System.out.println("success");
		rs = stmt.executeQuery(sql);
		System.out.println("success");
		System.out.println(startCity);
		System.out.println(rs);
		
		%>
		
		<table class="table table-striped">
	  <tr height="5"><td width="5"></td></tr>
	 <!--  <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">  -->
	 <thead>
	 	<tr>
		   <th>ID</th>
		   <th>��� ����</th>
		   <th>���� ����</th>
		   <th>��� ��</th>
		   <th>���� ��</th>
		   <th>��� �ð�</th>
		   <th>���� �ð�</th>
		   <th>��� ��¥</th>
		   <th>���� PK</th>
		   <th>���� �̸�</th>
		   <th>���� �ϱ�</th>
	   </tr>
	 </thead>
	   
	<%
			while(rs.next()) {
				int articleID = rs.getInt(1);
				startCity = rs.getString(2);
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
		<tr> <a href="NemoRoom.jsp?articleID=<%=articleID%>"> </a>
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
			<td><button type="button" class="btn btn-success" onclick="location.href='NemoRoom.jsp?articleID=<%=articleID%>'">�����ϱ�</button> </td>
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