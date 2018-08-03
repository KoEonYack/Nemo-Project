<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*"%>

<% 
String de=request.getParameter("del");
String db = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC";
String ID = "root";
String Password = "1234";
Class.forName("com.mysql.cj.jdbc.Driver");
PreparedStatement stm=null;
ResultSet rs=null;
int k=Integer.parseInt(de);
try {
	Connection conn = DriverManager.getConnection(db, ID, Password);
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