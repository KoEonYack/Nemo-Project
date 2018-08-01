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
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		
		
		String startStation = request.getParameter("startStation"); // 출발하는 역
		String endStation = request.getParameter("endStation"); // 도착하는 역
		String date = request.getParameter("startDay");

		response.setContentType("text/html; charset=EUC-KR");
		
		
        int idx = startStation.indexOf(","); 
        String startSationCode = startStation.substring(0, idx);
        String startStationName = startStation.substring(idx+1);
		
        idx = endStation.indexOf(","); 
        String endSationCode = endStation.substring(0, idx);
        String endStationName = endStation.substring(idx+1);
		
		
		PrintWriter writer = response.getWriter();
		
		// 세션 세팅
		HttpSession session = request.getSession();
		String cityCode = (String)session.getAttribute("StartCityName");
		String cityCode2 = (String)session.getAttribute("EndCityName");
		
		writer.println("<html><head></head><body>");
		writer.println("출발하는 역 코드: " + startSationCode + "<br>");
		writer.println("출발하는 역 이름: " + startStationName + "<br>");
		writer.println("도착하는 역 코드: " + endSationCode + "<br>");
		writer.println("도착하는 역 이름: " + endStationName + "<br>");
		writer.println("출발하는 날: " + date + "<br>");
		writer.println("[세션]출발 도시 코드: " + cityCode + "<br>");
		writer.println("[세션]도착 도시 코드: " + cityCode2);
		
		
		// 세션 - 시작역 
		session.setAttribute("startSationCode", startSationCode);
		session.setAttribute("startStationName", startStationName);
		session.setAttribute("endSationCode", endSationCode);
		session.setAttribute("endStationName", endStationName);
		session.setAttribute("date", date);
		System.out.println(startSationCode + " " + endSationCode + " " + date);
		
		Test t = new Test();
		
		// xml을 출력하기 위한 URL설정
		t.setDepPlaceId(startSationCode);
		t.setArrPlaceId(endSationCode);
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
		placeParser.setDepPlaceId(startSationCode);
		placeParser.setArrPlaceId(endSationCode);
		placeParser.setDepPlandTime(date);
		
		ArrayList<HashMap<String, Object>> testList = null; // here
		
		try {
			testList = placeParser.placeParser(); // here
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		writer.println("<h4>원하는 KTX 시간을 설정해주세요</h4><hr>");
		writer.println("<form method='post' action='saveArticle'>");
		writer.println("<select name=\"startAndEndTime\">");
		for(int i=0; i<testList.size(); i++) {
			HashMap<String, Object> test = testList.get(i); //here
			System.out.println("here : " + test.get("depplandtime") + "arrive: " + test.get("arrplandtime"));
			String sender = test.get("depplandtime") + "|" + test.get("arrplandtime");
			System.out.println("ApiSation>sender 값, 파싱을 위해서 합친 문자열" + sender);
			// writer.println("<option value=" + test.get("depplandtime") + "|" + test.get("arrplandtime") + "\">" + test.get("depplandtime")+ "출발~"  + test.get("arrplandtime") + "도착" + "</option>");
			writer.println("<option value=" + sender + "\">" + test.get("depplandtime")+ "출발~"  + test.get("arrplandtime") + "도착" + "</option>");
		}
		
		writer.println("</select>");
		
		writer.println("	    <div class=\"row\">\r\n" + 
				"		    <div class=\"col-sm-2\"></div>\r\n" + 
				"		    <div class=\"col-sm-8\"></div>\r\n" + 
				"		    <div class=\"col-sm-2\"><input type=\"submit\" class=\"btn btn-primary form-control\" value=\"방만들기\"></div>\r\n" + 
				"	 	</div>"
				+ 	"</form>");
		writer.println("</body></html>");

	}
		
}
