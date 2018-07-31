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
 * Servlet implementation class uft_trainApiCity
 */
@WebServlet("/uft_trainApiCity")
public class uft_trainApiCity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uft_trainApiCity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet(request, response);
		System.out.println("Success implement doPost - start and arrive location");
		request.setCharacterEncoding("EUC-KR");
		
		// 변경 전
		//String city = request.getParameter("city"); // 출발하는 도시 코드
		//String city2 = request.getParameter("city2"); // 도착하는 도시 코드
		
		// 변경 후
		String cityName = request.getParameter("city");
		String cityName2 = request.getParameter("city2");
		String [] city = cityName.split(",");
		String [] city2 = cityName2.split(",");
		
		response.setContentType("text/html; charset=EUC-KR");
		
		//response.setCharacterEncoding("UTF-8"); 
		// response.setContentType("text/html; charset=UTF-8");
		// response.setContentType("text/html; charset=EUC-KR");
		// PrintWriter writer = response.getWriter();
		
		PrintWriter writer = response.getWriter();
		writer.println("<!DOCTYPE html>"
				+ "<html><head>"
				+ "</head><body>");			

		// 변경 전
		// writer.println("출발하는 도시 코드: " + city);
		// writer.println("도착하는 도시 코드: " + city2);
		
		// 변경 후
		System.out.println("그냥 한글을 쳐보자");
		System.out.println("cityName" + cityName);
		System.out.println(city[0] + " " + city[1]);
		writer.println("출발하는 도시 코드: " + city[0]);
		writer.println("도착하는 도시 코드: " + city2[0]);
		
		HttpSession session = request.getSession();
		session.setAttribute("cityCode", city[0]);
		session.setAttribute("cityCode2", city2[0]);
		
		Test t = new Test();
		Test t2 = new Test();
		
		// 변경 전
		// t.setCityCode(city);
		// t2.setCityCode(city2);
		
		// 변경 후
		t.setCityCode(city[0]);
		t2.setCityCode(city2[0]);
		
		String xml="";
		String xml2="";
		try {
			xml = t.restClient();
			xml2 = t2.restClient();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("======[xml test]=====");
		System.out.println(xml);
		System.out.println("======[xml2 test]=====");
		System.out.println(xml2);
		
		Parser parser = new Parser();
		Parser parser2 = new Parser();
		
		// 변경 전
		// parser.setCityCode(city);
		// parser2.setCityCode(city2);

		// 변경 후
		parser.setCityCode(city[0]);
		parser2.setCityCode(city2[0]);
		
		ArrayList<HashMap<String, Object>> testList = null;
		ArrayList<HashMap<String, Object>> testList2 = null;
		
		try {
			testList = parser.parserTest();
			testList2 = parser2.parserTest();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		// 
		writer.println("<h4>출발하려는 도시를 선택해주세요</h4><hr>");
		writer.println("<form method='post' action='Station'>");
		writer.println("<select name=\"startStation\">");
		for(int i=0; i<testList.size(); i++) {
			HashMap<String, Object> test = testList.get(i);
			System.out.println("here : " + test);
			writer.println("<option value=" + "\""+ test.get("nodeid") + "\">"  + test.get("nodename") + "</option>");
		}
		writer.println("</select>");
		
		writer.println("<h4>도착하려는 도시를 선택해주세요</h4><hr>");
		writer.println("<select name=\"endStation\">");
		for(int j=0; j<testList2.size();j++ ) {
			HashMap<String, Object> test2 = testList2.get(j);
			System.out.println("here2 : " + test2);
			writer.println("<option value=" + "\""+ test2.get("nodeid") + "\">"  + test2.get("nodename") + "</option>");
			// writer.println("start2 " + test2.get("nodename") + " " + test2.get("nodeid")  + "<br>");
		}
		writer.println("</select>");
		
		writer.println(
			"<div class=\"form-group\">\r\n" + 
			"<input type=\"text\" class=\"form-control\" placeholder=\"출발 날짜를 입력해주세요(ex 20180701)\" name=\"startDay\" maxlength=\"8\">  \r\n" + 
			"</div> ");
		
		//세션으로 갈아탐
		writer.println("<input type=\"hidden\" name=\"startCityCode\" value=\" " + "한글보냄" +">");
		//writer.println("<input type=\"hidden\" name=\"endCityCode\" value=\" " + city2 +">");
		
		writer.println("<br>");
		
		writer.println("	    <div class=\"row\">\r\n" + 
				"		    <div class=\"col-sm-2\"></div>\r\n" + 
				"		    <div class=\"col-sm-8\"></div>\r\n" + 
				"		    <div class=\"col-sm-2\"><input type=\"submit\" class=\"btn btn-primary form-control\" value=\"도시 결정\"></div>\r\n" + 
				"	 	</div>"
				+ 	"</form>");
		
		writer.println("</body></html>");
		
		
		
	}

}
