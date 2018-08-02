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
	
	String loginID = (String)session.getAttribute("id"); // 세션에서 로그인한 사용자의 id를 가져오기
	String loginName= (String)session.getAttribute("name"); // 세션에서 로그인한 사용자의 이름을 가져오기
	
	try {
		String dbURL = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		stmt = conn.createStatement();
		stmt2 = conn.createStatement();
		stmt3 = conn.createStatement();
		String sql = "SELECT * FROM Article WHERE articleID=" + articleID; // 현재 게시글의 모든 정보를 불러오는 쿼리
		String userSQL = "SELECT COUNT(*) FROM enterUserToArticle WHERE articleID=" + articleID; // 본 방에 들어온 유저의 개숫를 세는 쿼라ㅣ	
		String checkInNemoSQL = "SELECT COUNT(*) FROM enterUserToArticle WHERE articleID=" + articleID + " AND "+ "userID=" + loginID;
		String insertNemoSQL = "INSERT INTO enterUserToArticle(articleID, userID) VALUES(?,?)"; // 네모에 가입하게 만드는 구문
		
		pstmt = conn.prepareStatement(insertNemoSQL); // insert를 위해서 미리 준비한 구문이다. 
		
		rs = stmt.executeQuery(sql);
		rsCount = stmt2.executeQuery(userSQL);
		rsCheckInNemoSQL = stmt3.executeQuery(checkInNemoSQL);
		
		// String checkMasterUserID = rs.getString(9); // 이 부분을 수정해야한다. rs.next()를 안쓰고 이것을 사용할 수 없을 것이다. 
		
		if(rsCount.next()){  // 방에 들어온 유저 수를 새는 부분
			totalMember = rsCount.getInt(1); 
		}
		if(rsCheckInNemoSQL.next()){  // 유저가 방에 있는지 확인하는 부분
			isInNemo = rsCheckInNemoSQL.getInt(1); 
		}
		
		if(totalMember==3){ // 4명의 사람들이 다 있는 경우
			script.println("<script>");
			script.println("alert('방이 가득찼습니다.');");
			script.println("history.back()");
			script.println("</script>");
		}else{ // 네모안에 들어오게 하기 전에 이미 방에 있는지 체크한다.
			if(isInNemo >= 1)
			{// 이 사람은 방에 속한 맴버인가? 
				System.out.println("Show nemo room"); // 아무 일도 안하고 디버깅 용으로 콘솔에 출력한다. 
			}
			else{ // (마스터도 아니고 방에 속한 맴버도 아니라면)네모에 집어 넣자
				pstmt.setInt(1, articleID); // articleID
				pstmt.setString(2, loginID); // userID
				pstmt.execute();
			}
		}
		
		if(rs.next()){ // 네모 정보를 표시하는 구문
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
			
			// 여기로 옮김
			if( masterUserID.equals(loginID) ){ // 이 사람은 master인가? [작업할 때 어저피 NULL이여서 주석처리하는게 좋음]
				script.println("<script>");
				script.println("alert('안녕하세요 방장님');");
				// script.println("history.back()");
				script.println("</script>");
			}
%>

<br>
<h3 style="text-align: center;"><%=startCity %>(<%=startStation %>역 <%=startTime %>시) 출발 ~ <%=endCity %>(<%=endSatation %>역 <%=endTime %>시)도착</h3>
<hr>

<div class="container"  style="display: inline-block; text-align: center; display: inline-block;">
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
        <h3>채팅방</h3>
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
					<input type="text" class="form-control" placeholder="보내려는 메시지를 입력해주세요!" name="useID" maxlength="30"">  
				</div>
		        </div>
		        <div class="col-sm-2"><input type="submit" class="btn btn-primary form-control" value="보내기"/> </div>
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