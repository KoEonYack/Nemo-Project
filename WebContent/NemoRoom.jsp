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
	
	<h3>(여기에 출발/도착 하는 도시 이름이 들어갑니다.)</h3>
	<hr>
	<h3>(여기에 출발역/도착역/출발시간/도착시간/ 이 들어갑니다.)</h3>

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
            <form method="post" action="loginOK.jsp">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="보내려는 메시지를 입력해주세요!" name="useID" maxlength="30"">  
				</div>
		        </div>
		        <div class="col-sm-2"><input type="submit" class="btn btn-primary form-control" value="보내기"/> </div>
        	</form>
        </div>
    </div>
    
    <h3>(여기에 방에 들어온 사람들의 이름이 들어갑니다. 총 몇 명의 사람이 있는지 표현됩니다. )</h3>
</div>


	

</body>
</html>