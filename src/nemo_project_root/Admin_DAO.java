package nemo_project_root;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class Admin_DAO {
	private Connection conn;
	private static Admin_DAO instance =new Admin_DAO();
	
	private Admin_DAO() {
	}
	public static Admin_DAO getInstance() {
		return instance;
	}
	public int login(String id, String pw) {
		int ri = 0;
		String p;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet s = null;
		String query = "SELECT password FROM ADMIN WHERE adminID = ?";
		try {
			
			connection= getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			s = pstmt.executeQuery();
			if(s.next()) {
				p = s.getString("password");
				if(p.equals(pw)) {
					ri = 1;			
				} else {
					ri = 0;		//wrong password
				}
			} else {
				ri = -1;	//not valid	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				s.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	private Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC&useSSL=false&autoReconnect=true " ;
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
