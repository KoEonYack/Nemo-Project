<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <!-- Brand and toggle get grouped for better mobile display -->
    
  
    <div class="navbar-header">
      <div id="block1" > </div>
      <a href="main.jsp"><img src="data/gray_logo.jpg" height="25" width="auto"/> </a>
      <div id="block1" > </div>
    </div>
    <ul class="nav navbar-nav navbar-right">
    	<li><a href="collect.jsp">  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>   네모하기</a></li>
    	<li><a href="#">로그아웃</a></li>
     </ul>
    </div>
</nav>



	<br><br>
 	<div class="container">
 	<div class='row'>
 	<div class='col-sm-6'>
	 <br>
	 <h3 style="text-align: center:"> 네모 추가하기 </h3> <hr> 
	 
	 	<div class="container"  style="display: inline-block; text-align: center;">
			<form method="post" action="joinAction.jsp">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="30">  
				</div> 
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="30">  
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호 확인" name="userPassword1" maxlength="30">  
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="학번" name="studentNumber" maxlength="30">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="핸드폰번호" name="phoneNumber" maxlength="30">  
				</div>
				
		
		    <div class="row">
			    <div class="col-sm-2"></div>
			    <div class="col-sm-8"></div>
			    <div class="col-sm-2"><input type="submit" class="btn btn-primary form-control" value="회원가입"></div>
		 	</div>
			
			</form>
		</div>
		<a class="btn btn-danger" href="main.jsp" role="button">메인으로 돌아가기</a>
	</div>
</div>
</div>


</body>
</html>