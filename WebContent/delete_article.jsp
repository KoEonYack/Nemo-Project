<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*"%>

<% 
String de=request.getParameter("del");
String db = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC";
String ID = "root";
String Password = "1234";
Class.forName("com.mysql.cj.jdbc.Driver");
Statement stm=null;
ResultSet rs=null;
try {
	Connection conn = DriverManager.getConnection(db, ID, Password);
	stm=conn.createStatement();
	String query ="DELETE FROM Article where masterUserID=" +request.getParameter("del");
	rs=stm.executeQuery(query);
	
	stm.close();
	conn.close();
	response.sendRedirect("admin_article.jsp");
}catch(Exception e){
	out.print(e);
}
%>