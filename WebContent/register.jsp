<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width-device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.min.css"> 
	<title> 네모(넷에 모여 KTX 할인받자)</title>
</head>

<body>
	
	<br><br>
 	<div class="container">
 	<div class='row'>
 	<div class='col-sm-6'>
	 <br>
	 <h3 style="text-align: center:"> 회원가입 </h3> <hr> 
	 
	 	<div class="container"  style="display: inline-block; text-align: center;">
			<form method="post" action="joinAction.jsp">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="30">  
				</div> 
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="30">  
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
					<input type="text" class="form-control" placeholder="핸드폰번호 - 없이 입력해주세요" name="phoneNumber" maxlength="11">  
				</div>
				
		
		    <div class="row">
			    <div class="col-sm-2"></div>
			    <div class="col-sm-8"></div>
			    <div class="col-sm-2"><input type="submit" class="btn btn-primary form-control" value="회원가입"></div>
		 	</div>
			
			</form>
		</div>
		<a class="btn btn-danger" href="index.jsp" role="button">뒤로 돌아가기</a>
	</div>
</div>
</div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>