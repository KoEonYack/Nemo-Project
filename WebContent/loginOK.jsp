<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="nemo_project_root.MemberDto"%>
<%@page import="nemo_project_root.MemberDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	
	String id = request.getParameter("useID");
	String pw = request.getParameter("userPassword");
	
	System.out.println(id + " " + pw );
	
	PrintWriter script = response.getWriter();
	
	MemberDao dao = MemberDao.getInstance();
	int checkNum = dao.userCheck(id, pw);
	if(checkNum == -1) {
	script.println("<script>");
	script.println("alert('���̵� �������� �ʽ��ϴ�.');");
	script.println("history.go(-1);");
	script.println("</script>");
	} else if(checkNum == 0) {
		script.println("<script>");
		script.println("alert('��й�ȣ�� Ʋ���ϴ�.');");
		script.println("history.go(-1);");
		script.println("</script>");
	} else if(checkNum == 1) {
		MemberDto dto = dao.getMember(id);
		if(dto == null) {
			script.println("<script>");
			script.println("alert('�������� �ʴ� ȸ�� �Դϴ�.');");
			script.println("history.go(-1);");
			script.println("</script>");
		} else {
			String name = dto.getUserName();
			
			// ���ǿ� �� ����
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("pw", pw);
			response.sendRedirect("main.jsp");
		}
	}
%>
</body>
</html>