<%@ page language="java" contentType="text/html" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<!-- meta charset="EUC-KR" -->
	<meta name="viewport" content="width-device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.min.css"> 
	<title> �׸�(�ݿ� �� KTX ���ι���)</title>
</head>

<body>
 
	 <div class="container"  style="display: inline-block;text-align: center;"><br>
	 <h4> ����Ϸ��� ���ø� �������ּ���</h4>
	 
       <form method="post" action="city">
		<select name="city">
			<option value="11,����Ư����" selected="selected"> ����Ư���� </option>
			<option value="12,����Ư����"> ����Ư���� </option>
			<option value="21,�λ걤����"> �λ걤���� </option>
			<option value="22,�뱸������"> �뱸������ </option>
			<option value="23,��õ������"> ��õ������ </option>
			<option value="24,���ֱ�����"> ���ֱ����� </option>
			<option value="25,����������"> ���������� </option>
			<option value="26,��걤����"> ��걤���� </option>
			<option value="31,��⵵"> ��⵵ </option>
			<option value="32,������"> ������ </option>
			<option value="33,��û�ϵ�"> ��û�ϵ� </option>
			<option value="34,��û����"> ��û���� </option>
			<option value="35,����ϵ�"> ����ϵ� </option>
			<option value="36,���󳲵�"> ���󳲵� </option>
			<option value="37,���ϵ�"> ���ϵ� </option>
			<option value="38,��󳲵�"> ��󳲵� </option>
		</select>
	 
	 <hr>
	 <h4> �����Ϸ��� ���ø� �������ּ���</h4>
	 <br>
		<select name="city2">
			<option value="11,����Ư����"> ����Ư���� </option>
			<option value="12,����Ư����"> ����Ư���� </option>
			<option value="21,�λ걤����"> �λ걤���� </option>
			<option value="22,�뱸������"> �뱸������ </option>
			<option value="23,��õ������"> ��õ������ </option>
			<option value="24,���ֱ�����"> ���ֱ����� </option>
			<option value="25,����������"> ���������� </option>
			<option value="26,��걤����"> ��걤���� </option>
			<option value="31,��⵵" selected="selected"> ��⵵ </option>
			<option value="32,������"> ������ </option>
			<option value="33,��û�ϵ�"> ��û�ϵ� </option>
			<option value="34,��û����"> ��û���� </option>
			<option value="35,����ϵ�"> ����ϵ� </option>
			<option value="36,���󳲵�"> ���󳲵� </option>
			<option value="37,���ϵ�"> ���ϵ� </option>
			<option value="38,��󳲵�"> ��󳲵� </option>
		</select>
		
	    <div class="row">
		    <div class="col-sm-2"></div>
		    <div class="col-sm-8"></div>
		    <div class="col-sm-2"><input type="submit" class="btn btn-primary form-control" value="���� ����"></div>
	 	</div>
       </form>
		
	</div>

</body>
</html>