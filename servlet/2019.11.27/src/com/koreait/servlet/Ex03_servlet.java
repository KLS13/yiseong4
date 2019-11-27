package com.koreait.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex03_servlet")
public class Ex03_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Ex03_servlet() {
        super();
  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//실제 작업 코드가 작성되는 곳
		// 아래 3종 작업은 기본작업으로 이해함.
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
		out.print("</body>");
		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
