package com.koreait.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex08_request")
public class Ex08_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex08_request() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 기본 3종
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// request 처리 (요청 처리)
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		double average = (kor + eng + mat) / 3.0;
		String grade;
		if ( average >= 90  ) {
			grade = "A학점";
		} else if ( average >= 80 ) {
			grade = "B학점";
		} else if ( average >= 70 ) {
			grade = "C학점";
		} else if ( average >= 60 ) {
			grade = "D학점";
		} else {
			grade = "F학점";
		}
		
		// response 처리 (응답 처리)
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("성적관리 프로그램");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>성적발표</h1>");
		out.print("<ul>");
		out.print("<li>성명 = " + name + "</li>");
		out.print("<li>국어 = " + kor + "</li>");
		out.print("<li>영어 = " + eng + "</li>");
		out.print("<li>수학 = " + mat + "</li>");
		out.print("<li>평균 = " + average + "</li>");
		out.print("<li>학점 = " + grade + "</li>");
		out.print("</ul>");
		out.print("</body>");
		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
