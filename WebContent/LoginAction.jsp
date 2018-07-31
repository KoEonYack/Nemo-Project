<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin Page</title>
</head>
<body>
	<%
	//Admin_Check check = new Admin_Check();
	int result;
	//check.login(user.getUserID(),user.getUserPassword());
	result=1;
	
	
	
	if(result==1){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("location.href='admin_main.jsp'");
		script.println("</script>");
	}
	else{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 혹은 비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	//데이터 베이스 틀릴때 reutrn -2 는 고려 x
	%>
</body>
</html>