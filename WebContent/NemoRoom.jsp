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
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<title> 네모(넷에 모여 KTX 할인받자)</title>
	
	<script type="text/javascript">

	// 가장 마지막 message(chatting) ID를 받아온다. 
	var lastID = 0;
	
	// onclick "send button", store a message into DB
	function submitFunction() {
		
		/* userID의 session값을 가져온다.  */
		var userID = null; 
		userID = "<%=(String)session.getAttribute("id")%>"
		
		var userName = null; 
		userName = "<%=(String)session.getAttribute("name")%>"
		
		/* <textarea id="message">의 input값을 가져온다.  */
		var message = $('#message').val();
		
 		var articleID = null ;
 		articleID = "<%=(Integer)session.getAttribute("articleID")%>"
 		
		/* ajax를 통해서 서버와 통신  */
		$.ajax({
			type : "POST",
			url : "./ChatSubmitServlet",
			
			/* 	data : data sent to server
				[parameter_name] : [actual value]  
				encodeURIComponent( [field_name] ) : 특수문자 처리 */
			data : {
				articleID : encodeURIComponent(articleID),
				userID : encodeURIComponent(userID),
				userName : encodeURIComponent(userName),
				message : encodeURIComponent(message)
			},
			
			/* callback function at request success   */
			success : function(result) {
				console.log("result : " + result)
				if (result == 1){
					/* 전송 성공  */
					autoClosingAlert('#successMessage', 2000);
				} else if (result == 0) {
					/* 어떤 내용이 비어 있다. */
					autoClosingAlert('#dangerMessage', 2000);
				} else {
					/* DB 오류  */
					autoClosingAlert('#warningMessage', 2000);
				}
			}
		});
		// reset message area with whitespace 
		$('#message').val('');
	}
	
	/* 메세지 전송 성공 알림창 - 떴다가 자동으로 다시 사라지는 기능  */
	function autoClosingAlert(selector, delay) {
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() {
			alert.hide()
		}, delay);
	}
	
	/* 	메세지 출력형태 구성하는 부분, 실제 보여지는 부분
	   	실제로 listType이라는 것을 서버로 보내서 listType에 맞는 모든 메세지를 
	   	getToday()와 같은 함수를 이용하여 JSON과 같은 형태로 가져와서 client가 다시 받아서 
	   	'data'에 담은 후 JSON 형태로 parsing해서 각각의 배열에 담긴 모든 값들을 차례대로 출력 */
	function chatListFunction(type) {
		
		$.ajax({
			type : "POST",
			url : "./ChatListServlet",
			data : {
				listType : type,
			},
			success : function(data) {
				
				// parsing 가능한 data만 parsing하도록 data가 없는 경우는 바로 종료.
				if (data == "") return;
				
				// JSON 형태로 data를 parsing할 수 있도록 
				var parsed = JSON.parse(data);
				// result : ChatListServlet에서 result.append해서 가져왔던 배열의 원소들 
				var result = parsed.result;
							
				// 화면에 각각의 원소들을 출력하는 부분 
				for (var i = 0; i < result.length; i++) {
					addChat(result[i][0].value,
							result[i][1].value,
							result[i][2].value);
				}
				
				// parsed에서 last라는 변수를 가져와서 lastID 갱신
				lastID = Number(parsed.last);
				// console.log(lastID);
			}
		});
	}
	/* 메세지를 하나 하나 출력하는 부분 */	
	function addChat(userID, message, chatTime) {
		
		$('#chatList').append(
					'<div class="row">'
						+ '<div class = "col-lg-12">'
						+ '<div class = "media">'
						+ '<a class="pull-left" href="#">'
						+ '<img class="media-object img-circle" src="images/go.png" alt="">'
						+ '</a>' + '<div class="media-body">'
						+ '<h4 class="media-heading">' + userID
						+ '<span class="small pull-right">' + chatTime
						+ '</span>' + '</h4>' + '<p>' + message
						+ '</p>' + '</div>' + '</div>' + '</div>'
						+ '</div>' + '<hr>');
		
		/* 메세지 리스트가 갱신될때 스크롤이 제일 최근의 메세지를 보여주는 상태가 되도록 설정  */
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	
	/* 	메세지를 실시간으로 계속 가져오는 함수
		1000 : 1초마다 가져온다. 			*/
	function getInfiniteChat() {
		setInterval(function() {
			chatListFunction(lastID);
		}, 1000);
	} 


</script>
	
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
 	Statement stmt4;
 	
	ResultSet rs;
	ResultSet rsCount;
	ResultSet rsCheckInNemoSQL;
	ResultSet rsShowUserTable;
	
	PreparedStatement pstmt;
	
	String id = "";
	String pass = "";
	// String inUserName = "";
	
	int totalMember = 0;
	int isInNemo = 0; 
	int articleID = Integer.parseInt(request.getParameter("articleID"));

	// session.setAttribute( String_name, Object value )
	// so article ID woul be save in Integer type
	session.setAttribute("articleID", articleID);

	PrintWriter script = response.getWriter();
	
	String loginID = (String)session.getAttribute("id"); // 세션에서 로그인한 사용자의 id를 가져오기
	String loginName= (String)session.getAttribute("name"); // 세션에서 로그인한 사용자의 이름을 가져오기
	
	try {
		String dbURL = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC&useSSL=false&autoReconnect=true " ;
		String dbID = "root";
		String dbPassword = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		
		stmt = conn.createStatement();
		stmt2 = conn.createStatement();
		stmt3 = conn.createStatement();
		stmt4 = conn.createStatement();
		
		String sql = "SELECT * FROM Article WHERE articleID=\"" + articleID + "\""; // 현재 게시글의 모든 정보를 불러오는 쿼리
		String userSQL = "SELECT COUNT(*) FROM enterUserToArticle WHERE articleID=\"" + articleID + "\""; // 본 방에 들어온 유저의 개숫를 세는 쿼라ㅣ	
		String checkInNemoSQL = "SELECT COUNT(*) FROM enterUserToArticle WHERE articleID=" + articleID + " AND "+ "userID=\"" + loginID + "\"";
		String insertNemoSQL = "INSERT INTO enterUserToArticle(articleID, userID) VALUES(?,?)"; // 네모에 가입하게 만드는 구문
		String showUserTable = "SELECT userName FROM enterUserToArticle AS UTA, USER AS US WHERE UTA.userID=US.userID AND UTA.articleID=\"" + articleID + "\"";		
		
		pstmt = conn.prepareStatement(insertNemoSQL); // insert를 위해서 미리 준비한 구문이다. 
		
		rs = stmt.executeQuery(sql);
		rsCount = stmt2.executeQuery(userSQL);
		rsCheckInNemoSQL = stmt3.executeQuery(checkInNemoSQL);
		rsShowUserTable = stmt4.executeQuery(showUserTable);
		
		
		// String checkMasterUserID = rs.getString(9); // 이 부분을 수정해야한다. rs.next()를 안쓰고 이것을 사용할 수 없을 것이다. 
		
		if(rsCount.next()){  // 방에 들어온 유저 수를 새는 부분
			totalMember = rsCount.getInt(1); 
		}
		if(rsCheckInNemoSQL.next()){  // 유저가 방에 있는지 확인하는 부분
			isInNemo = rsCheckInNemoSQL.getInt(1); 
		}
		/*
		if(rsShowUserTable.next()){
			inUserName = rsShowUserTable.getString(1); 
		}
		*/
		
		if(totalMember==4){ // 4명의 사람들이 다 있는 경우
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
        <h3>채팅방(<%=totalMember%>/4)</h3>
        </div>
        <div class="col-sm-3"></div>
    </div>
</div>
	

	
		<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>채팅방</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						
						<!-- display message -->
						<div id="chat" class="panel-collapse collapse in">
							<div id="chatList" class="portlet-body chat-widget"
								style="overflow-y: auto; width: auto; height: 600px;">
							</div>
						</div>
						
						<!-- message sending part -->
						<div class="portlet-footer">
						
							<!-- name -->
<!-- 							<div class="row">
								<div class="form-group col-xs-4">
									<input style="height: 40px;" type="text" id="userID"
										class="form-control" placeholder="이름" maxlength="10">
								</div>
							</div> -->
							
							<!-- contents -->
							<div class="row" style="height: 90px">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px;" id="message"
										class="form-control" placeholder="메시지를입력하시오" maxlength="100"></textarea>
								</div>
								
								<!-- send button -->
								<div class="form-group col-xs-2">
								
									<!-- javascript function "submitFunction" is called when click 'send'button -->
									<button type=button " class="btn btn-default pull-right"
										onclick="submitFunction();">전송</button>
										
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- bootstrap을 이용한 메세지 전송 성공/실패 알림 메세지  -->
		<div class="alert alert-success" id="successMessage"
			style="display: none;">
			<strong>메시지 전송에 성공하였습니다.</strong>
		</div>
		<div class="alert alert-danger" id="dangerMessage"
			style="display: none;">
			<strong>이름과 내용을 모두 입력해주세요.</strong>
		</div>
		<div class="alert alert-warning" id="warningMessage"
			style="display: none;">
			<strong>데이터베이스 오류가 발생했습니다.</strong>
		</div>
	</div>

	<div class="col-sm-3"><h4>방장: <%=masterUserName %></h4></div>
    <%
    System.out.println("check point");
    
    while(rsShowUserTable.next()) {
    	String inUserName  = rsShowUserTable.getString(1);
		System.out.println("User Name " + inUserName );
		if(!masterUserName.equals(inUserName)){
    %>
    	<div class="col-sm-3"><h4>참가자: <%=inUserName %></h4></div>
    <%
    	}  
	}
    %>
       

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

	<!-- 페이지가 로딩이 완료되었을 때 수행할 것 -->
 	<script type="text/javascript">
		$(document).ready(function() {
/* 			chatListFunction(lastID);
 */			getInfiniteChat();
		});
	</script>
	
</body>
</html>