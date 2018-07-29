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
 * Servlet implementation class trainApiCity
 */
// @WebServlet("/city")
public class trainApiCity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trainApiCity() {
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
		System.out.println("Success implement doPost - start and arrive location");
		
		String city = request.getParameter("city"); // �����ϴ� ����
		String city2 = request.getParameter("city2"); // �����ϴ� ����
		
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html><head></head><body>");
		writer.println("����1: " + city);
		writer.println("����2: " + city2);
		
		Test t = new Test();
		Test t2 = new Test();
		t.setCityCode(city);
		t2.setCityCode(city2);
		
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
		
		parser.setCityCode(city);
		parser2.setCityCode(city2);
		
		ArrayList<HashMap<String, Object>> testList = null;
		ArrayList<HashMap<String, Object>> testList2 = null;
		
		try {
			testList = parser.parserTest();
			testList2 = parser2.parserTest();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		// ���, ������, ���� ��¥�� �����ϴ� HTML�κ�
		writer.println("<h4>����Ϸ��� ���� �������ּ���</h4><hr>");
		writer.println("<form method='post' action='Station'>");
		writer.println("<select name=\"startStation\">");
		for(int i=0; i<testList.size(); i++) {
			HashMap<String, Object> test = testList.get(i);
			System.out.println("here : " + test);
			writer.println("<option value=" + "\""+ test.get("nodeid") + "\">"  + test.get("nodename") + "</option>");
		}
		writer.println("</select>");
		
		writer.println("<h4>�����Ϸ��� ���� �������ּ���</h4><hr>");
		writer.println("<select name=\"endStation\">");
		for(int j=0; j<testList2.size();j++ ) {
			HashMap<String, Object> test2 = testList2.get(j);
			System.out.println("here2 : " + test2);
			writer.println("<option value=" + "\"test2.get('nodeid')\">"  + test2.get("nodename") + "</option>");
			// writer.println("start2 " + test2.get("nodename") + " " + test2.get("nodeid")  + "<br>");
		}
		writer.println("</select>");
		
		writer.println(
			"<div class=\"form-group\">\r\n" + 
			"<input type=\"text\" class=\"form-control\" placeholder=\"��� ��¥�� �Է����ּ���(ex. 20180701)\" name=\"startDay\" maxlength=\"8\">  \r\n" + 
			"</div> ");
		
		writer.println("<br>");
		
		writer.println("	    <div class=\"row\">\r\n" + 
				"		    <div class=\"col-sm-2\"></div>\r\n" + 
				"		    <div class=\"col-sm-8\"></div>\r\n" + 
				"		    <div class=\"col-sm-2\"><input type=\"submit\" class=\"btn btn-primary form-control\" value=\"�� ����\"></div>\r\n" + 
				"	 	</div>"
				+ 	"</form>");
		
		writer.println("</body></html>");
	}

}
