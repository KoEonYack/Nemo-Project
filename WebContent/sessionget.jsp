<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>session get</title>
</head>
<body>

	<%
		Object obj1 = session.getAttribute("id");
		String id = (String)obj1;
		out.println(id +"<br />");
		
		Object obj2 = session.getAttribute("name");
		String name = (String)obj2;
		out.println(name +"<br />");
		
		Object obj3 = session.getAttribute("pw");
		String pw = (String)obj3;
		out.println(pw +"<br />");
		
		out.println("************************ <br />");
		
		String sName;
		String sValue;
		Enumeration enumeration = session.getAttributeNames();
		while(enumeration.hasMoreElements()){
			sName = enumeration.nextElement().toString();
			sValue = session.getAttribute(sName).toString();
			out.println(sName + ": " + sValue + "<br />");
		}
		
		out.println("************************ <br />");
		
		String sessionID = session.getId();
		out.println("sessionID : " + sessionID + "<br />");
		int sessionInter =  session.getMaxInactiveInterval();
		out.println("sessionInter : " + sessionInter + "<br />");
		
		out.println("************************ <br />");
		
		
		if(request.isRequestedSessionIdValid()) {
			out.println("session valid");
		} else {
			out.println("session invalid");
		}
	%>

</body>