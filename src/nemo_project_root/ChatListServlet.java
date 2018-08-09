package nemo_project_root;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChatListServlet")
public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		// 어떠한 list인지 type을 client가 보낸 것을 받을 수 있도록
		// getParameter : Always returns String
		String listType = request.getParameter("listType");
		
		// listType=null 이거나 비어있다면, 공백을 출력하도록
		if(listType == null || listType.equals("")) response.getWriter().write("");
		else {
			try { 
				// listType이 숫자가 아닌 경우 오류 발생 
				Integer.parseInt(listType);
				response.getWriter().write( getID(Integer.parseInt(listType)) );
			} catch (Exception e) {
				// 숫자가 아닌경우 - 오류 - 공백 출력
				response.getWriter().write("");
			}
		}
	}

	
	public String getID( int messageID ) throws SQLException {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		Dao dao = new Dao();
		ArrayList<Chat> chatList = dao.getChatListByRecent(messageID);
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getUserID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getMessage() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if(i != chatList.size() -1) result.append(",");
		}
		result.append("], \"last\":\"" +  chatList.get(chatList.size() - 1).getMessageID().toString() + "\"}");
		return result.toString();
	}

}
