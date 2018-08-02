<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html">
<html>
<head>
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
 	Statement stmt2;
 	Statement stmt3;
 	
	ResultSet rs;
	ResultSet rsCount;
	ResultSet rsCheckInNemoSQL;
	PreparedStatement pstmt;
	
	String id = "";
	String pass = "";
	int totalMember = 0;
	int isInNemo = 0; 
	int articleID = Integer.parseInt(request.getParameter("articleID"));
	PrintWriter script = response.getWriter();
	
	String loginID = (String)session.getAttribute("id"); // ���ǿ��� �α����� ������� id�� ��������
	String loginName= (String)session.getAttribute("name"); // ���ǿ��� �α����� ������� �̸��� ��������
	
	try {
		String dbURL = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		stmt = conn.createStatement();
		stmt2 = conn.createStatement();
		stmt3 = conn.createStatement();
		String sql = "SELECT * FROM Article WHERE articleID=" + articleID; // ���� �Խñ��� ��� ������ �ҷ����� ����
		String userSQL = "SELECT COUNT(*) FROM enterUserToArticle WHERE articleID=" + articleID; // �� �濡 ���� ������ ������ ���� �����	
		String checkInNemoSQL = "SELECT COUNT(*) FROM enterUserToArticle WHERE articleID=" + articleID + " AND "+ "userID=" + loginID;
		String insertNemoSQL = "INSERT INTO enterUserToArticle(articleID, userID) VALUES(?,?)"; // �׸� �����ϰ� ����� ����
		
		pstmt = conn.prepareStatement(insertNemoSQL); // insert�� ���ؼ� �̸� �غ��� �����̴�. 
		
		rs = stmt.executeQuery(sql);
		rsCount = stmt2.executeQuery(userSQL);
		rsCheckInNemoSQL = stmt3.executeQuery(checkInNemoSQL);
		
		// String checkMasterUserID = rs.getString(9); // �� �κ��� �����ؾ��Ѵ�. rs.next()�� �Ⱦ��� �̰��� ����� �� ���� ���̴�. 
		
		if(rsCount.next()){  // �濡 ���� ���� ���� ���� �κ�
			totalMember = rsCount.getInt(1); 
		}
		if(rsCheckInNemoSQL.next()){  // ������ �濡 �ִ��� Ȯ���ϴ� �κ�
			isInNemo = rsCheckInNemoSQL.getInt(1); 
		}
		
		if(totalMember==3){ // 4���� ������� �� �ִ� ���
			script.println("<script>");
			script.println("alert('���� ����á���ϴ�.');");
			script.println("history.back()");
			script.println("</script>");
		}else{ // �׸�ȿ� ������ �ϱ� ���� �̹� �濡 �ִ��� üũ�Ѵ�.
			if(isInNemo >= 1)
			{// �� ����� �濡 ���� �ɹ��ΰ�? 
				System.out.println("Show nemo room"); // �ƹ� �ϵ� ���ϰ� ����� ������ �ֿܼ� ����Ѵ�. 
			}
			else{ // (�����͵� �ƴϰ� �濡 ���� �ɹ��� �ƴ϶��)�׸� ���� ����
				pstmt.setInt(1, articleID); // articleID
				pstmt.setString(2, loginID); // userID
				pstmt.execute();
			}
		}
		
		if(rs.next()){ // �׸� ������ ǥ���ϴ� ����
			articleID = rs.getInt(1);
			String startCity = rs.getString(2);
			String endCity = rs.getString(3);
			String startStation  = rs.getString(4);
			String endSatation  = rs.getString(5);
			String startTime   = rs.getString(6);
			String endTime   = rs.getString(7);
			String startDay   = rs.getString(8);
			String masterUserID   = rs.getString(9);
			String masterUserName   = rs.getString(10);
			
			// ����� �ű�
			if( masterUserID.equals(loginID) ){ // �� ����� master�ΰ�? [�۾��� �� ������ NULL�̿��� �ּ�ó���ϴ°� ����]
				script.println("<script>");
				script.println("alert('�ȳ��ϼ��� �����');");
				// script.println("history.back()");
				script.println("</script>");
			}
%>

<br>
<h3 style="text-align: center;"><%=startCity %>(<%=startStation %>�� <%=startTime %>��) ��� ~ <%=endCity %>(<%=endSatation %>�� <%=endTime %>��)����</h3>
<hr>

<div class="container"  style="display: inline-block; text-align: center; display: inline-block;">
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
        <h3>ä�ù�</h3>
        </div>
        <div class="col-sm-3"></div>
    </div>
</div>
	

<div class="container" style="display: inline-block; text-align: center; display: inline-block;">
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6" style="background:whitesmoke; overflow:scroll; height: 50%; width: 100%;  margin:0 auto; display: inline-block; vertical-align:middle" >
        </div>
        <div class="col-sm-3"></div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-sm-10">
            <form method="post" action="#">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="�������� �޽����� �Է����ּ���!" name="useID" maxlength="30"">  
				</div>
		        </div>
		        <div class="col-sm-2"><input type="submit" class="btn btn-primary form-control" value="������"/> </div>
        	</form>
        </div>
    </div>
    
    
    <div class="row">
       <div class="col-sm-3"><h4>Master:<%=masterUserName %> </h4></div>
       <div class="col-sm-3"><h4>User1: </h4></div>
       <div class="col-sm-3"><h4>User2: </h4></div>
       <div class="col-sm-3"><h4>User3: </h4></div>
    </div>
</div>

<% 
	}
	rs.close();
	stmt.close();
	pstmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
	

</body>
</html>