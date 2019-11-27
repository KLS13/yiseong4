package com.koreait.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex04_servlet
 */
@WebServlet("/Ex04_servlet")
public class Ex04_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex04_servlet() {
    	
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		//웹 브라우저에 출력하는 메소드는 print() 메소드이다.
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("나의 첫 서블릿 페이지");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>나의 첫 서블릿 본문 내용 </h1>");
		Calendar cal = Calendar.getInstance();
		out.print(cal.get(Calendar.YEAR) + "년");
		out.print(cal.get(Calendar.MONTH) + "월");
		out.print(cal.get(Calendar.DATE) + "일");
		
		/* ----- 현재 날짜 -----  
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		// ----- 현재 날짜 ----- //
				
		out.print("<h1>");
		out.print(year + "년 " + month + "월 " + day + "일");
		out.print("</h1>");
		 								*/
		out.print("</body>");
		out.print("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
