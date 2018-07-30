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
		
		String startStation = request.getParameter("startStation"); // �����ϴ� ����
		String endStation = request.getParameter("endStation"); // �����ϴ� ����
		String date = request.getParameter("startDay");
		
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html><head></head><body>");
		writer.println("���ۿ�: " + startStation);
		writer.println("������: " + endStation);
		writer.println("������: " + date);
		
		Test t = new Test();
		
		// xml�� ��±� ���ؼ� url �� ����
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
		
		// �����͸� �Ľ��ϱ� ���ؼ�  url �� �����Ѵ�. 
		Parser placeParser = new Parser(); // Parser�� ���ο� ���� 
		placeParser.setDepPlaceId(startStation);
		placeParser.setArrPlaceId(endStation);
		placeParser.setDepPlandTime(date);
		
		ArrayList<HashMap<String, Object>> testList = null; // here
		
		try {
			testList = placeParser.placeParser(); // here
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		// ���, ������, ���� ��¥�� �����ϴ� HTML�κ�
		writer.println("<h4>����Ϸ��� ���� �������ּ���</h4><hr>");
		writer.println("<form method='post' action='Station'>");
		writer.println("<select name=\"startStation\">");
		for(int i=0; i<testList.size(); i++) {
			HashMap<String, Object> test = testList.get(i); //here
			System.out.println("here : " + test);
			writer.println("<option value=" + test.get("depplandtime") + "|" + test.get("arrplandtime") + "\">" + test.get("depplandtime")+ "���~"  + test.get("arrplandtime") + "����" + "</option>");
		} // �������� ���� �������� �ϸ� �Ľ��ؼ� ������ �ȴ�.
		writer.println("</select>");
		
		writer.println("	    <div class=\"row\">\r\n" + 
				"		    <div class=\"col-sm-2\"></div>\r\n" + 
				"		    <div class=\"col-sm-8\"></div>\r\n" + 
				"		    <div class=\"col-sm-2\"><input type=\"submit\" class=\"btn btn-primary form-control\" value=\"�� ����\"></div>\r\n" + 
				"	 	</div>"
				+ 	"</form>");
		writer.println("</body></html>");
	}
		
}
