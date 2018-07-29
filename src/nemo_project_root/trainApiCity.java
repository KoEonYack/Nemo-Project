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
		System.out.println("implement doPost");
		
		String city = request.getParameter("city");
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html><head></head><body>");
		writer.println("µµ½Ã1: " + city);
		writer.println("</body></html>");
		
		
		Test t = new Test();
		t.setCityCode(city);
		String xml="";
		try {
			xml = t.restClient();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(xml);
		Parser parser = new Parser();
		parser.setCityCode(city);
		ArrayList<HashMap<String, Object>> testList = null;
		try {
			testList = parser.parserTest();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(int i=0; i<testList.size(); i++) {
			HashMap<String, Object> test = testList.get(i);
			System.out.println("here : " + test);
		}
		
		
	}

}
