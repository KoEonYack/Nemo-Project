package nemo_project_root;

import java.sql.*;

import java.util.ArrayList;
import java.util.Enumeration;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ArticleDao {
	
	public static final int ARTICLE_UPLOAD_SUCCESS = 1;

	private Connection conn;
	
	private static ArticleDao instance = new ArticleDao();
	
	private ArticleDao() {
	}
	
	public static ArticleDao getInstance(){
		return instance;
	}
	
	public int insertArticle(String startCity, String endCity, String startStation, String endSatation, String startTime, String endTime, String startDay, String masterUserID, String masterUserName) 
	{
		int res=0; // 0은 실패를 의미한다.
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO Article (startCity, endCity, startStation, endSatation, startTime, endTime, startDay, masterUserID, masterUserName) values (?,?,?,?,?,?,?,?,?)";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, startCity); 
			pstmt.setString(2, endCity); 
			pstmt.setString(3, startStation); 
			pstmt.setString(4, endSatation);
			pstmt.setString(5, startTime); // 출발 시간
			pstmt.setString(6, endTime); // 도착 시간
			pstmt.setString(7, startDay); // 출발 날짜
			pstmt.setString(8, masterUserID);
			pstmt.setString(9, masterUserName);
			pstmt.executeUpdate();
			res = pstmt.executeUpdate();
			System.out.println("=RES 값, 0은 실패를 의미한다.=" + res);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return res;
	}
	
	private Connection getConnection() {

		try {
			String dbURL = "jdbc:mysql://localhost:3306/NEMO?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("성공적으로 DB에 연결되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
}
