package com.koreait.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex13_servlet")
public class Ex13_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Ex13_servlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("날짜를 출력");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1> 날짜를 출력 ! </h1>");
		Calendar cal = Calendar.getInstance();
		out.print(cal.get(Calendar.YEAR) + "년");
		out.print((cal.get(Calendar.MONTH)+1) + "월");
		out.print(cal.get(Calendar.DATE) + "일");
		out.print("</body>");
		out.print("</html>");
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
