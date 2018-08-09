// DAO : Database Access Object

package nemo_project_root;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList; 

public class Dao {

	private Connection conn;
 
	public Dao() throws SQLException {
		try {
			String dbURL = "jdbc:mysql://localhost:3308/NEMO?serverTimezone=UTC&useSSL=false&autoReconnect=true " ;
			String dbID = "root";
			String dbPassword = "1234";
			
			// Driver 따로 추가해주어야 함 
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e) { 
			// 오류가 발생했을 때 오류를 출력할 수 있게 한다. 
			e.printStackTrace();
		}
 
	}
	
	
	// input method 정상적인 값은 1 , 아니면 -1
	// 사용자가 메세지를 입력하기 위한 함수 
	public int submit( Integer articleID, String userID, String userName, String message) {	
		
		System.out.println("Dao.submit()");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// now()를 통해 현재 시간을 삽입
		String SQL = "INSERT INTO chatRoom ( articleID, userID, userName, message, chatTime ) VALUES ( ?, ?, ?, ?, now())";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, articleID);
			pstmt.setString(2, userID);
			// 3 : sender, third "?" value of the query
			pstmt.setString(3, userName);
			// 4: contents of message, forth "?" value of the query
			pstmt.setString(4, message);
			
			int suc = pstmt.executeUpdate();
			System.out.println("success :"+ suc);
			
			return suc ;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	// 특정한 ID보다 큰 ID 추출 
 	public ArrayList<Chat> getChatListByRecent( int messageID ) {
 		
 		ArrayList<Chat> chatList = null;
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		 		
 		String SQL = "SELECT * FROM chatRoom WHERE messageID > ? ORDER BY chatTime";
 		try {
 			pstmt = conn.prepareStatement(SQL);
 			pstmt.setInt(1, messageID);
 			rs = pstmt.executeQuery();
 			chatList = new ArrayList<Chat>();
 			while (rs.next()) {
 				Chat chat = new Chat();
 				chat.setMessageID(rs.getInt("messageID"));
 				chat.setArticleID(rs.getInt("articleID"));
 				chat.setUserID(rs.getString("userID"));
 				chat.setUserName(rs.getString("userName"));
 				chat.setMessage(rs.getString("message")
 									.replaceAll(" ", "&nbsp;")
 									.replaceAll("<", "&lt")
 									.replaceAll(">", "&gt;")
 									.replaceAll("\n", ""));
 				
 				int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
 				String timeType = "AM";
 				
 				if(Integer.parseInt(rs.getString("chatTime").substring(11, 13)) >= 12) {
 					timeType = "PM";
 					chatTime -= 12;
 				}
 				chat.setChatTime(rs.getString("chatTime").substring(0, 11)+" "+ timeType + " " + chatTime + ":" 
 								+ rs.getString("chatTime").substring(14,16)+" ");
 				chatList.add(chat);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			try {
 				if (rs != null)
 					rs.close();
 				if (pstmt != null)
 					pstmt.close();
 			} catch (Exception e) {
 				e.printStackTrace();
 			}
 		}
 		return chatList;
 	}
 	


}
