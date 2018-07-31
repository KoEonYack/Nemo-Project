<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% if(session.getAttribute("ValidMem") != null) { %>
	<jsp:forward page="main.jsp"></jsp:forward>
<% } %>
<!DOCTYPE html">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width-device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.min.css"> 
	<title> 네모(넷에 모여 KTX 할인받자)</title>
</head>

<body>

 <div class="container">
	 <br>
	 <div class="container"  style="display: inline-block;text-align: center;">
	 <img src="data/main1.jpg" class="img-responsive center-block" alt="반응형 이미지">
 	
    <div class="row">
   	<h1> 로그인</h1>
	<hr>
       <div class="col-sm-4"></div>
       <div class="col-sm-4">
       
       <form method="post" action="loginOK.jsp">
		<div class="form-group">
		<input type="text" class="form-control" placeholder="아이디" name="useID" maxlength="30" value="<% if(session.getAttribute("id") != null) out.println(session.getAttribute("id")); %>">  
		</div> 
		<div class="form-group">
		<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="30">  
		</div>
		
		</div>
		<div class="col-sm-2"> </div>
       
		
    </div>
    
    <div class="row">
    <div class="col-sm-4"></div>
    <div class="col-sm-4">
    
    <input type="submit" class="btn btn-primary form-control" value="로그인"/>
    </form>
    
    <br><br>
    <a href="register.jsp">아직 회원이 아니라고요? 지금 네모에 가입하세요!</a>
    </div>
    <div class="col-sm-4"></div>
    </div>
    <br>
	</div>
 </div>
<br><br>
</body>
</html>



