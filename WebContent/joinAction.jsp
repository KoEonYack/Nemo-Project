<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="nemo_project_root.*"%>
<%@page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<<<<<<< HEAD
<jsp:useBean id="user" class="nemo_project_root.MemberDto"/>
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="studentNumber" />
<jsp:setProperty name="user" property="phoneNumber" />
=======
<jsp:useBean id="dto" class="nemo_project_root.MemberDto"/>
<jsp:setProperty name="dto" property="*" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
>>>>>>> 03a06b048d9c6975d24414e8dc02ca54cbf2850d
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
<%
	MemberDao dao = MemberDao.getInstance();
	PrintWriter script = response.getWriter();
	
	System.out.println(user.getUserID() + " " + user.getUserPassword() + " " + user.getUserName() + " " + user.getStudentNumber() + " " + user.getPhoneNumber());

	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getStudentNumber() == null || user.getPhoneNumber() == null )
	{
		script.println("<script>");
		script.println("alert('�Է����� ���� ���� �ֽ��ϴ�.');");
		script.println("document.location.href='index.jsp';");
		script.println("</script>");
	}
	int ri = dao.insertMember(user);
	if(ri == MemberDao.MEMBER_JOIN_SUCCESS) {
		
		// ���� �߰� -> �����ؾ��� ... ������ ���ε� �� ���ǿ��ٰ� �־���.... 
		// session.setAttribute("id", user.getId());
		// session.setAttribute("pw", user.getPw());
		// session.setAttribute("name", user.getName());
		
		script.println("<script>");
		script.println("alert('ȸ�������� ���� �մϴ�.');");
		script.println("document.location.href='index.jsp';");
		script.println("</script>");
	} else {
		script.println("<script>");
		script.println("alert('ȸ�����Կ� �����߽��ϴ�.');");
		script.println("document.location.href='index.jsp';");
		script.println("</script>");
	} 
=======
	<%
			MemberDao dao = MemberDao.getInstance();
		
			int ri = dao.insertMember(dto);
			if(ri == MemberDao.MEMBER_JOIN_SUCCESS) {
				
				session.setAttribute("id", dto.getId());
				session.setAttribute("pw", dto.getPw());
				session.setAttribute("name", dto.getName());
				
%>
			<script language="javascript">
				alert("ȸ�������� ���� �մϴ�.");
				document.location.href="index.jsp";
			</script>
<%
			} else {
%>
			<script language="javascript">
				alert("ȸ�����Կ� �����߽��ϴ�.");
				document.location.href="index.jsp";
			</script>
<%
			} 
		
>>>>>>> 03a06b048d9c6975d24414e8dc02ca54cbf2850d
%>
</body>
</html>