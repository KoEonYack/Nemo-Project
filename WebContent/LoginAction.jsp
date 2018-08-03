<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.io.PrintWriter" %>
<%@ page import="nemo_project_root.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin's Page</title>
</head>
<body>
	<%
	Admin_DAO dao=Admin_DAO.getInstance();
	String id=request.getParameter("root_name");
	String pw=request.getParameter("root_password");
	
	int result=dao.login(id,pw);    
	//int result=1;//<- db연동되는지 확인  미리 루트 계정 넣어놓고 시작.>
	if(result==1){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.
		println("location.href='admin_main.jsp'");
		script.println("</script>");
	}
	else{
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('Incorrect ID or PW.')");
		script.println("history.back()");
		script.println("</script>");
	}
	//데이터 베이스 틀릴때 reutrn -2 는 고려 x
	%>
</body>
</html>