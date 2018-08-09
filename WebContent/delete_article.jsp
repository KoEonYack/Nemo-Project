<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*"%>

<% 
String de=request.getParameter("del");
String dbURL = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC&useSSL=false&autoReconnect=true " ;
String dbID = "root";
String dbPassword = "1234";
Class.forName("com.mysql.cj.jdbc.Driver");
PreparedStatement stm=null;
ResultSet rs=null;
int k=Integer.parseInt(de);
try {
	Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	String query ="DELETE FROM Article where ArticleID=" +k;
	stm=conn.prepareStatement(query);

	stm.executeUpdate();
	
	stm.close();
	conn.close();
}catch(Exception e){
	out.print(e);
}

response.sendRedirect("admin_article.jsp");
%>