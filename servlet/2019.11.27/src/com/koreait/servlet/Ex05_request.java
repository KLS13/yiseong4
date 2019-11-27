package com.koreait.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex05_request")
public class Ex05_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public Ex05_request() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("request 정보");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		//request 가 가지고 있는 기본 정보 확인하기
		String url = request.getRemoteAddr();
		String host = request.getRemoteHost();
		String user = request.getRemoteUser();
		int port = request.getRemotePort();
		
		out.print("<h1>");
		out.print("요청 주소 = " + url + "<br />");
		out.print("요청 호스트 = " + host + "<br />");
		out.print("요청 사용자 = " + user + "<br />");
		out.print("요청 포트번호 = " + port + "<br />");
		out.print("</h1>");
		out.print("</body>");
		out.print("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
