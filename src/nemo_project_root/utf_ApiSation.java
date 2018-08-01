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
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

/**
 * Servlet implementation class utf_ApiSation
 */
//@WebServlet("/utf_ApiSation")
public class utf_ApiSation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public utf_ApiSation() {
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
		
		response.setContentType("text/html; charset=EUC-KR");
		
		String startStation = request.getParameter("startStation"); // 출발하는 역
		String endStation = request.getParameter("endStation"); // 도착하는 역
		String date = request.getParameter("startDay");
		String startCityCode = request.getParameter("startCityCode");
		// 한글 테스트
		
		response.setContentType("text/html; charset=EUC-KR");
		
		System.out.println("한글 startCityCode" + startCityCode);
		
		
		PrintWriter writer = response.getWriter();
		
		HttpSession session = request.getSession();
		// Object obj = session.getAttribute("city");
		String cityCode = (String)session.getAttribute("cityCode");
		String cityCode2 = (String)session.getAttribute("cityCode2");
		
		
		writer.println("<html><head>	"
				+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n" + 
				"	<meta name=\"viewport\" content=\"width-device-width\", initial-scale=\"1\">\r\n" + 
				"	<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css\"> \r\n" + 
				"	<link rel=\"stylesheet\" href=\"css/custom.css\">\r\n" + 
				"	<title> 네모(넷에 모여 KTX 할인받자)</title></head><body>");
		writer.println("출발하는 역: " + startStation + "<br>");
		writer.println("도착하는 역: " + endStation + "<br>");
		writer.println("출발하는 날: " + date + "<br>");
		writer.println("[세션]출발 도시 코드: " + cityCode + "<br>");
		writer.println("[세션]도착 도시 코드: " + cityCode2);
		
		Test t = new Test();
		
		// xml을 출력하기 위한 URL설정
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
		
		// URL을 출력하기 위한 setter
		Parser placeParser = new Parser(); // 새로운 parser
		placeParser.setDepPlaceId(startStation);
		placeParser.setArrPlaceId(endStation);
		placeParser.setDepPlandTime(date);
		
		ArrayList<HashMap<String, Object>> testList = null; // here
		
		try {
			testList = placeParser.placeParser(); // here
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		writer.println("<h4>원하는 KTX 시간을 설정해주세요</h4><hr>");
		writer.println("<form method='post' action='Station'>");
		writer.println("<select name=\"startStation\">");
		for(int i=0; i<testList.size(); i++) {
			HashMap<String, Object> test = testList.get(i); //here
			System.out.println("here : " + test);
			writer.println("<option value=" + test.get("depplandtime") + "|" + test.get("arrplandtime") + "\">" + test.get("depplandtime")+ "출발~"  + test.get("arrplandtime") + "도착" + "</option>");
		} 
		writer.println("</select>");
		
		writer.println("<div class=\"row\">\r\n" + 
				"		    <div class=\"col-sm-2\"></div>\r\n" + 
				"		    <div class=\"col-sm-8\"></div>\r\n" + 
				"		    <div class=\"col-sm-2\"><input type=\"submit\" class=\"btn btn-primary form-control\" value=\"방만들기\"></div>\r\n" + 
				"	 	</div>"
				+ 	"</form>");
		writer.println("</body></html>");
			
		}

}
