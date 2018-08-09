package nemo_project_root;


import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChatSubmitServlet")
public class ChatSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 무조건 post방식으로 보낼거다 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("chat submit servlet doPost()");
   
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		// DB로 들어갈 부분
		// URLDecoder : 보낼때 UTF-8으로 encoding해서 보냈기 때문에 여기서는 반대로 UTF-8으 decoding 해분다.
		// request.getParameter : 항상 String return 
		String articleID = URLDecoder.decode(request.getParameter("articleID"), "UTF-8");
		String userID = URLDecoder.decode(request.getParameter("userID"), "UTF-8");
		String userName = URLDecoder.decode(request.getParameter("userName"), "UTF-8");
		String message = URLDecoder.decode(request.getParameter("message"), "UTF-8");
		
		//userID와 message 중 하나라도 비어있으면 정상적으로 작동할 수 없기때문에 비어있는지 검사 
		if ( articleID == null || articleID.equals("") 
				|| userID == null || userID.equals("")
				|| userName == null || userName.equals("") 
				|| message == null || message.equals("")) {
			response.getWriter().write("0");
		} else { 
			
			// Dao()를 통해서 DB아 연동
			// + "" : 공백 문자열을 더해줌으로서 무조건 문자열로 출력하도록 
			System.out.println( articleID + " " + userID + " " + userName + " " + message );
			response.getWriter().write(new Dao().submit( Integer.parseInt(articleID), userID, userName, message) + "");
		}  

	}

}
