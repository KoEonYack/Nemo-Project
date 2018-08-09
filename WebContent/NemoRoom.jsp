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
	<title> �׸�(�ݿ� �� KTX ���ι���)</title>
	
	<script type="text/javascript">

	// ���� ������ message(chatting) ID�� �޾ƿ´�. 
	var lastID = 0;
	
	// onclick "send button", store a message into DB
	function submitFunction() {
		
		/* userID�� session���� �����´�.  */
		var userID = null; 
		userID = "<%=(String)session.getAttribute("id")%>"
		
		var userName = null; 
		userName = "<%=(String)session.getAttribute("name")%>"
		
		/* <textarea id="message">�� input���� �����´�.  */
		var message = $('#message').val();
		
 		var articleID = null ;
 		articleID = "<%=(Integer)session.getAttribute("articleID")%>"
 		
		/* ajax�� ���ؼ� ������ ���  */
		$.ajax({
			type : "POST",
			url : "./ChatSubmitServlet",
			
			/* 	data : data sent to server
				[parameter_name] : [actual value]  
				encodeURIComponent( [field_name] ) : Ư������ ó�� */
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
					/* ���� ����  */
					autoClosingAlert('#successMessage', 2000);
				} else if (result == 0) {
					/* � ������ ��� �ִ�. */
					autoClosingAlert('#dangerMessage', 2000);
				} else {
					/* DB ����  */
					autoClosingAlert('#warningMessage', 2000);
				}
			}
		});
		// reset message area with whitespace 
		$('#message').val('');
	}
	
	/* �޼��� ���� ���� �˸�â - ���ٰ� �ڵ����� �ٽ� ������� ���  */
	function autoClosingAlert(selector, delay) {
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() {
			alert.hide()
		}, delay);
	}
	
	/* 	�޼��� ������� �����ϴ� �κ�, ���� �������� �κ�
	   	������ listType�̶�� ���� ������ ������ listType�� �´� ��� �޼����� 
	   	getToday()�� ���� �Լ��� �̿��Ͽ� JSON�� ���� ���·� �����ͼ� client�� �ٽ� �޾Ƽ� 
	   	'data'�� ���� �� JSON ���·� parsing�ؼ� ������ �迭�� ��� ��� ������ ���ʴ�� ��� */
	function chatListFunction(type) {
		
		$.ajax({
			type : "POST",
			url : "./ChatListServlet",
			data : {
				listType : type,
			},
			success : function(data) {
				
				// parsing ������ data�� parsing�ϵ��� data�� ���� ���� �ٷ� ����.
				if (data == "") return;
				
				// JSON ���·� data�� parsing�� �� �ֵ��� 
				var parsed = JSON.parse(data);
				// result : ChatListServlet���� result.append�ؼ� �����Դ� �迭�� ���ҵ� 
				var result = parsed.result;
							
				// ȭ�鿡 ������ ���ҵ��� ����ϴ� �κ� 
				for (var i = 0; i < result.length; i++) {
					addChat(result[i][0].value,
							result[i][1].value,
							result[i][2].value);
				}
				
				// parsed���� last��� ������ �����ͼ� lastID ����
				lastID = Number(parsed.last);
				// console.log(lastID);
			}
		});
	}
	/* �޼����� �ϳ� �ϳ� ����ϴ� �κ� */	
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
		
		/* �޼��� ����Ʈ�� ���ŵɶ� ��ũ���� ���� �ֱ��� �޼����� �����ִ� ���°� �ǵ��� ����  */
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	
	/* 	�޼����� �ǽð����� ��� �������� �Լ�
		1000 : 1�ʸ��� �����´�. 			*/
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
	
	String loginID = (String)session.getAttribute("id"); // ���ǿ��� �α����� ������� id�� ��������
	String loginName= (String)session.getAttribute("name"); // ���ǿ��� �α����� ������� �̸��� ��������
	
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
		
		String sql = "SELECT * FROM Article WHERE articleID=\"" + articleID + "\""; // ���� �Խñ��� ��� ������ �ҷ����� ����
		String userSQL = "SELECT COUNT(*) FROM enterUserToArticle WHERE articleID=\"" + articleID + "\""; // �� �濡 ���� ������ ������ ���� �����	
		String checkInNemoSQL = "SELECT COUNT(*) FROM enterUserToArticle WHERE articleID=" + articleID + " AND "+ "userID=\"" + loginID + "\"";
		String insertNemoSQL = "INSERT INTO enterUserToArticle(articleID, userID) VALUES(?,?)"; // �׸� �����ϰ� ����� ����
		String showUserTable = "SELECT userName FROM enterUserToArticle AS UTA, USER AS US WHERE UTA.userID=US.userID AND UTA.articleID=\"" + articleID + "\"";		
		
		pstmt = conn.prepareStatement(insertNemoSQL); // insert�� ���ؼ� �̸� �غ��� �����̴�. 
		
		rs = stmt.executeQuery(sql);
		rsCount = stmt2.executeQuery(userSQL);
		rsCheckInNemoSQL = stmt3.executeQuery(checkInNemoSQL);
		rsShowUserTable = stmt4.executeQuery(showUserTable);
		
		
		// String checkMasterUserID = rs.getString(9); // �� �κ��� �����ؾ��Ѵ�. rs.next()�� �Ⱦ��� �̰��� ����� �� ���� ���̴�. 
		
		if(rsCount.next()){  // �濡 ���� ���� ���� ���� �κ�
			totalMember = rsCount.getInt(1); 
		}
		if(rsCheckInNemoSQL.next()){  // ������ �濡 �ִ��� Ȯ���ϴ� �κ�
			isInNemo = rsCheckInNemoSQL.getInt(1); 
		}
		/*
		if(rsShowUserTable.next()){
			inUserName = rsShowUserTable.getString(1); 
		}
		*/
		
		if(totalMember==4){ // 4���� ������� �� �ִ� ���
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
        <h3>ä�ù�(<%=totalMember%>/4)</h3>
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
								<h4><i class="fa fa-circle text-green"></i>ä�ù�</h4>
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
										class="form-control" placeholder="�̸�" maxlength="10">
								</div>
							</div> -->
							
							<!-- contents -->
							<div class="row" style="height: 90px">
								<div class="form-group col-xs-10">
									<textarea style="height: 80px;" id="message"
										class="form-control" placeholder="�޽������Է��Ͻÿ�" maxlength="100"></textarea>
								</div>
								
								<!-- send button -->
								<div class="form-group col-xs-2">
								
									<!-- javascript function "submitFunction" is called when click 'send'button -->
									<button type=button " class="btn btn-default pull-right"
										onclick="submitFunction();">����</button>
										
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- bootstrap�� �̿��� �޼��� ���� ����/���� �˸� �޼���  -->
		<div class="alert alert-success" id="successMessage"
			style="display: none;">
			<strong>�޽��� ���ۿ� �����Ͽ����ϴ�.</strong>
		</div>
		<div class="alert alert-danger" id="dangerMessage"
			style="display: none;">
			<strong>�̸��� ������ ��� �Է����ּ���.</strong>
		</div>
		<div class="alert alert-warning" id="warningMessage"
			style="display: none;">
			<strong>�����ͺ��̽� ������ �߻��߽��ϴ�.</strong>
		</div>
	</div>

	<div class="col-sm-3"><h4>����: <%=masterUserName %></h4></div>
    <%
    System.out.println("check point");
    
    while(rsShowUserTable.next()) {
    	String inUserName  = rsShowUserTable.getString(1);
		System.out.println("User Name " + inUserName );
		if(!masterUserName.equals(inUserName)){
    %>
    	<div class="col-sm-3"><h4>������: <%=inUserName %></h4></div>
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

	<!-- �������� �ε��� �Ϸ�Ǿ��� �� ������ �� -->
 	<script type="text/javascript">
		$(document).ready(function() {
/* 			chatListFunction(lastID);
 */			getInfiniteChat();
		});
	</script>
	
</body>
</html>