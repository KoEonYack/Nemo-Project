package nemo_project_root;

import java.util.ArrayList;
import java.util.Enumeration;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nemo_project_root.ArticleDto;
import nemo_project_root.ArticleDao;

//@WebServlet("/saveArticle")
public class saveArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public saveArticle() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		
		/*
			세션 값 받아오는 구간
			StartCityName
			EndCityName
			date
			Select 값 : startAndEndTime  -> 2개로 파싱하기  | 로 나누어졌다. 
		*/
		response.setContentType("text/html; charset=EUC-KR");
		
		String StartCityName = (String)session.getAttribute("StartCityName");
		String EndCityName = (String)session.getAttribute("EndCityName");
		String date = (String)session.getAttribute("date");
		String startSationCode = (String)session.getAttribute("startSationCode"); // startStation
		String startStationName = (String)session.getAttribute("startStationName");
		String endSationCode = (String)session.getAttribute("endSationCode");
		String endStationName = (String)session.getAttribute("endStationName");
		String masterUserID = (String)session.getAttribute("id"); // 유저 id 
		String masterUserName = (String)session.getAttribute("name"); // 유저 name
		String startAndEndTime =  request.getParameter("startAndEndTime"); 
		
		response.setContentType("text/html; charset=EUC-KR");
		
		System.out.println("Debug startAndEndTime: " + startAndEndTime);
		System.out.println("Debug date: " + date);
		
		// String [] pTime = startAndEndTime.split("|"); // Parsing [1] Start Day  [2] End Day
		String pTime1 = startAndEndTime.substring(8, 14);
		String pTime2 = startAndEndTime.substring(23, 29);
		String pTime [] = { pTime1, pTime2};
		
		System.out.println("pTime[0]: " + pTime[0] + "pTime[1]: " + pTime[1] );
		
		
		/*
			DB에 넣어야한다.... 
			id
			name
		*/

		ArticleDao dao = ArticleDao.getInstance();
		int res = dao.insertArticle(StartCityName, EndCityName, startStationName, endStationName, pTime[0], pTime[1], date, masterUserID, masterUserName);
		// String sql = "INSERT INTO board1 (startCity, endCity, startStation, endSatation, startTime, endTime, startDay, masterUserID, masterUserName) VALUES(?,?,?,?)"; 
		if(res > 0) {
			script.println("<script>");
			script.println("alert('성공적으로 등록되었습니다.');");
			response.sendRedirect("main.jsp");
			script.println("</script>");
		}else {
			script.println("<script>");
			script.println("alert('등록에 실패하였습니다. 관리자에게 문의하세요');");
			script.println("history.go(-1);");
			script.println("</script>");
		}

		/* 세션 파괴하기 */
		Enumeration enumberation = session.getAttributeNames();
		while(enumberation.hasMoreElements()) {
			String sName = enumberation.nextElement().toString();
			if(sName.equals("StartCityName") || sName.equals("StartCityName") || sName.equals("startStation") 
					|| sName.equals("endStation") || sName.equals("date") ||  sName.equals("startAndEndTime") ) {
				session.removeAttribute(sName);
				System.out.println("Delete 역정보");
			}
		}
	}
}
	
