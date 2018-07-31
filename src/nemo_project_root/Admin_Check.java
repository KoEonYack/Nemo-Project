import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;




public class Admin_Check {
	private Connection conn;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public int login(String id, String password) {
		String sql= "SELECT password FROM USER WHERE id = ?";
		try {
			pstat=conn.prepareStatement(sql);
			pstat.setString(1, id);
			rs=pstat.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals("root")) {
					return 1;
				}
				else {
					return 0;
				}
			}
			return -1;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
}
