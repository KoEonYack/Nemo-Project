<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import= "java.io.PrintWriter" %>
<!DOCTYPE html">
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
    	<li><a href="sessionget.jsp">session get</a></li>
    </ul>
    </div>
</nav>
	
<div class="container">
 <%
 	PrintWriter script=response.getWriter();
	String userID = null;
	
	Statement [] stmt = new Statement[17];
	ResultSet [] rs = new ResultSet[17];
	int [] total = new int [17];
	
	
	String loginID = (String)session.getAttribute("id"); // 세션에서 로그인한 사용자의 id를 가져오기
	String loginName= (String)session.getAttribute("name"); // 세션에서 로그인한 사용자의 이름을 가져오기
	System.out.println("Sessioncheck : " +  loginID + " : " +  loginName); // FOR DEBUGG CHECK LOGIN 
	
	if( loginID == null){
		script.println("<script>");
		script.println("alert('로그인해주세요!')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
	}
	
	
	
	try {
		String dbURL = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		
		for(int i=0; i<17;i++){
			stmt[i] = conn.createStatement();
		}

		String c01 = "SELECT COUNT(*) FROM Article WHERE startCity='서울특별시' AND startDay > CURDATE()+0";
		String c02 = "SELECT COUNT(*) FROM Article WHERE startCity='세종특별시' AND startDay > CURDATE()+0"; 
		String c03 = "SELECT COUNT(*) FROM Article WHERE startCity='부산광역시' AND startDay > CURDATE()+0"; 
		String c04 = "SELECT COUNT(*) FROM Article WHERE startCity='대구광역시' AND startDay > CURDATE()+0";
		String c05 = "SELECT COUNT(*) FROM Article WHERE startCity='인천광역시' AND startDay > CURDATE()+0";
		String c06 = "SELECT COUNT(*) FROM Article WHERE startCity='광주광역시' AND startDay > CURDATE()+0"; 
		String c07 = "SELECT COUNT(*) FROM Article WHERE startCity='대전광역시' AND startDay > CURDATE()+0";
		String c08 = "SELECT COUNT(*) FROM Article WHERE startCity='울산광역시' AND startDay > CURDATE()+0";
		String c09 = "SELECT COUNT(*) FROM Article WHERE startCity='경기도' AND startDay > CURDATE()+0";
		String c10 = "SELECT COUNT(*) FROM Article WHERE startCity='강원도' AND startDay > CURDATE()+0";
		String c11 = "SELECT COUNT(*) FROM Article WHERE startCity='충청북도' AND startDay > CURDATE()+0";
		String c12 = "SELECT COUNT(*) FROM Article WHERE startCity='충청남도' AND startDay > CURDATE()+0";
		String c13 = "SELECT COUNT(*) FROM Article WHERE startCity='전라북도' AND startDay > CURDATE()+0";
		String c14 = "SELECT COUNT(*) FROM Article WHERE startCity='전라남도' AND startDay > CURDATE()+0";
		String c15 = "SELECT COUNT(*) FROM Article WHERE startCity='경상북도' AND startDay > CURDATE()+0";
		String c16 = "SELECT COUNT(*) FROM Article WHERE startCity='경상남도' AND startDay > CURDATE()+0";
		String c17 = "SELECT COUNT(*) FROM enterUserToArticle AS UTA, Article AS AT WHERE UTA.userID=" + loginID + " AND UTA.articleID=AT.articleID  AND startDay > CURDATE()+0";
		
		rs[0] = stmt[0].executeQuery(c01);
		rs[1] = stmt[1].executeQuery(c02);
		rs[2] = stmt[2].executeQuery(c03);
		rs[3] = stmt[3].executeQuery(c04);
		rs[4] = stmt[4].executeQuery(c05);
		rs[5] = stmt[5].executeQuery(c06);
		rs[6] = stmt[6].executeQuery(c07);
		rs[7] = stmt[7].executeQuery(c08);
		rs[8] = stmt[8].executeQuery(c09);
		rs[9] = stmt[9].executeQuery(c10);
		rs[10] = stmt[10].executeQuery(c11);
		rs[11] = stmt[11].executeQuery(c12);
		rs[12] = stmt[12].executeQuery(c13);
		rs[13] = stmt[13].executeQuery(c14);
		rs[14] = stmt[14].executeQuery(c15);
		rs[15] = stmt[15].executeQuery(c16);
		rs[16] = stmt[16].executeQuery(c17);
		
		for(int i=0; i<17 ;i++){
			if(rs[i].next()){
				total[i] = rs[i].getInt(1);
			}else{
				System.out.println("Something wrong!");
			}
		}
%>


<br><br>
	  <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-3"> <h3> 출발 도시를 누르세요</h3><hr></div>
        <div class="col-sm-3">
        	
        	<nav class="navbar  navbar-expand-sm  bg-dark  navbar-dark">
 	  		 <form class="form-inline" action="#">
 	  			 <input class="form-control" type="text" placeholder="Search">  
  	 			 <button class="btn btn-success" type="submit">찾기</button>  
 			 </form> 
     		 </nav>
        </div>
      	<div class="col-sm-3"></div> 
     </div> 
   
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
   	      <a href="01seoul.jsp"> <button type="button" class="btn btn-default"><p>#01서울</p> <br> <p> <%=total[0] %> </p></button> </a>&nbsp;&nbsp;  
          <a href="02city.jsp"> <button type="button" class="btn btn-default"><p>#02세종</p> <br> <p> <%=total[1] %> </p></button> </a>&nbsp;&nbsp;  
          <a href="03city.jsp"> <button type="button" class="btn btn-default"><p>#03부산</p> <br> <p> <%=total[2] %> </p></button> </a>
        </div>
        <div class="col-sm-3"></div>
    </div>
    
    <br>
    
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
   	      <a href="04city.jsp"> <button type="button" class="btn btn-default"><p>#04대구</p> <br> <p> <%=total[3] %> </p></button> </a>&nbsp;&nbsp;  
          <a href="05city.jsp"> <button type="button" class="btn btn-default"><p>#05인천</p> <br> <p> <%=total[4] %> </p></button> </a>&nbsp;&nbsp;  
		  <a href="06city.jsp"> <button type="button" class="btn btn-default"><p>#06광주</p> <br> <p> <%=total[5] %> </p></button> </a>
        </div>
        <div class="col-sm-3"></div>
    </div>
    
    <br>
    
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
   	      <a href="07city.jsp"> <button type="button" class="btn btn-default"><p>#07대전</p> <br> <p> <%=total[6] %> </p></button> </a>&nbsp;&nbsp;  
          <a href="08city.jsp"> <button type="button" class="btn btn-default"><p>#08울산</p> <br> <p> <%=total[7] %> </p></button> </a>&nbsp;&nbsp;  
		  <a href="09city.jsp"> <button type="button" class="btn btn-default"><p>#09경기</p> <br> <p> <%=total[8] %> </p></button> </a>
        </div>
        <div class="col-sm-3"></div>
    </div>
    
    <br>
    
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
   	      <a href="10city.jsp"> <button type="button" class="btn btn-default"><p>#10강원</p> <br> <p> <%=total[9] %> </p></button> </a>&nbsp;&nbsp;  
          <a href="11city.jsp"> <button type="button" class="btn btn-default"><p>#11충북</p> <br> <p> <%=total[10] %> </p></button> </a>&nbsp;&nbsp;  
		  <a href="12city.jsp"> <button type="button" class="btn btn-default"><p>#12충남</p> <br> <p> <%=total[11] %> </p></button> </a>
        </div>
        <div class="col-sm-3"></div>
    </div>
    
    <br>
    
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
   	      <a href="13city.jsp"> <button type="button" class="btn btn-default"><p>#13전북</p> <br> <p> <%=total[12] %> </p></button> </a>&nbsp;&nbsp;  
          <a href="14city.jsp"> <button type="button" class="btn btn-default"><p>#14전남</p> <br> <p> <%=total[13] %> </p></button> </a>&nbsp;&nbsp;  
		  <a href="15city.jsp"> <button type="button" class="btn btn-default"><p>#15경북</p> <br> <p> <%=total[14] %> </p></button> </a>
        </div>
        <div class="col-sm-3"></div>
    </div>
    
        <br>
    
    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
   	      <a href="16city.jsp"> <button type="button" class="btn btn-default"><p>#16경남</p> <br> <p> <%=total[15] %> </p></button> </a>&nbsp;&nbsp; 
   	       <a href="MyNemo.jsp"> <button type="button" class="btn btn-default" ><p>#내가 가입한 <br>네모 보기 <br><%=total[16] %></p></button> </a>&nbsp;&nbsp; 
        </div>
        <div class="col-sm-3"></div>
    </div>
    
    <br>
   
    </div>
	<% 
		for(int j=0; j<16; j++){
			rs[j].close();
			stmt[j].close();
		}
		conn.close();
	} catch(SQLException e) {
		out.println( e.toString() );
	}
	%>

</body>
</html>