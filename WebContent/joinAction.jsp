<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="nemo_project_root.*"%>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="user" class="nemo_project_root.MemberDto"/>
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="studentNumber" />
<jsp:setProperty name="user" property="phoneNumber" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	MemberDao dao = MemberDao.getInstance();
	PrintWriter script = response.getWriter();
	
	System.out.println(user.getUserID() + " " + user.getUserPassword() + " " + user.getUserName() + " " + user.getStudentNumber() + " " + user.getPhoneNumber());

	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getStudentNumber() == null || user.getPhoneNumber() == null )
	{
		script.println("<script>");
		script.println("alert('입력하지 않은 값이 있습니다.');");
		script.println("document.location.href='index.jsp';");
		script.println("</script>");
	}
	int ri = dao.insertMember(user);
	if(ri == MemberDao.MEMBER_JOIN_SUCCESS) {
		
		// 세션 추가 -> 삭제해야함 ... 가입일 뿐인데 왜 세션에다가 넣었지.... 
		// session.setAttribute("id", user.getId());
		// session.setAttribute("pw", user.getPw());
		// session.setAttribute("name", user.getName());
		
		script.println("<script>");
		script.println("alert('회원가입을 축하 합니다.');");
		script.println("document.location.href='index.jsp';");
		script.println("</script>");
	} else {
		script.println("<script>");
		script.println("alert('회원가입에 실패했습니다.');");
		script.println("document.location.href='index.jsp';");
		script.println("</script>");
	} 
%>
</body>
</html>