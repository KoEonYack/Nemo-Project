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

 <div class="container">
	 <div class="container"  style="display: inline-block;text-align: center;">
	 <h3> 출발하려는 도시를 선택해주세요</h3>
	 <hr>
       <form method="post" action="city">
		<select name="city">
			<option value="11" selected="selected"> 서울특별시 </option>
			<option value="12"> 세종특별시 </option>
			<option value="21"> 부산광역시 </option>
			<option value="22"> 대구광역시 </option>
			<option value="23"> 인천광역시 </option>
			<option value="24"> 광주광역시 </option>
			<option value="25"> 대전광역시 </option>
			<option value="26"> 울산광역시 </option>
			<option value="31"> 경기도 </option>
			<option value="32"> 강원도 </option>
			<option value="33"> 충청북도 </option>
			<option value="34"> 충청남도 </option>
			<option value="35"> 전라북도 </option>
			<option value="36"> 전라남도 </option>
			<option value="37"> 경상북도 </option>
			<option value="38"> 경상남도 </option>
		</select>
		
	    <div class="row">
		    <div class="col-sm-2"></div>
		    <div class="col-sm-8"></div>
		    <div class="col-sm-2"><input type="submit" class="btn btn-primary form-control" value="도시 결정"></div>
	 	</div>
       </form>
		
	</div>
 </div>

</body>
</html>