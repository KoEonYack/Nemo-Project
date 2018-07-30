package nemo_project_root;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

/**
 * Servlet implementation class ApiStation
 */
// @WebServlet(name = "apiStation", urlPatterns = { "/Station" })
public class ApiStation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApiStation() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet(request, response);
		System.out.println("[Second Step]do Post implemented at ApiStation class");
		
		String startStation = request.getParameter("startStation"); // 시작하는 도시
		String endStation = request.getParameter("endStation"); // 도착하는 도시
		String date = request.getParameter("startDay");
		
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html><head></head><body>");
		writer.println("시작역: " + startStation);
		writer.println("도착역: " + endStation);
		writer.println("도착일: " + date);
		
		Test t = new Test();
		
		// xml을 출력기 위해서 url 값 변경
		t.setDepPlaceId(startStation);
		t.setArrPlaceId(endStation);
		t.setDepPlandTime(date);
		
		String xml="";
		try {
			xml = t.restClientCity();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("======[xml test]=====");
		System.out.println(xml);
		
		// 데이터를 파싱하기 위해서  url 값 변경한다. 
		Parser placeParser = new Parser(); // Parser의 새로운 버전 
		placeParser.setDepPlaceId(startStation);
		placeParser.setArrPlaceId(endStation);
		placeParser.setDepPlandTime(date);
		
		ArrayList<HashMap<String, Object>> testList = null; // here
		
		try {
			testList = placeParser.placeParser(); // here
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		// 출발, 도착역, 도착 날짜를 선택하는 HTML부분
		writer.println("<h4>출발하려는 역을 선택해주세요</h4><hr>");
		writer.println("<form method='post' action='Station'>");
		writer.println("<select name=\"startStation\">");
		for(int i=0; i<testList.size(); i++) {
			HashMap<String, Object> test = testList.get(i); //here
			System.out.println("here : " + test);
			writer.println("<option value=" + test.get("depplandtime") + "|" + test.get("arrplandtime") + "\">" + test.get("depplandtime")+ "출발~"  + test.get("arrplandtime") + "도착" + "</option>");
		} // 여러개의 값을 보내려고 하면 파싱해서 보내면 된다.
		writer.println("</select>");
		
		writer.println("	    <div class=\"row\">\r\n" + 
				"		    <div class=\"col-sm-2\"></div>\r\n" + 
				"		    <div class=\"col-sm-8\"></div>\r\n" + 
				"		    <div class=\"col-sm-2\"><input type=\"submit\" class=\"btn btn-primary form-control\" value=\"역 결정\"></div>\r\n" + 
				"	 	</div>"
				+ 	"</form>");
		writer.println("</body></html>");
	}
		
}
