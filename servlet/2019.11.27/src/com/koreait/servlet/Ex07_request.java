package com.koreait.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex07_request")
public class Ex07_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex07_request() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 기본 3종
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("회원 가입 결과");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		
		// Ex07_request.html 에서 전달된 데이터 처리하기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String[] hobbies = request.getParameterValues("hobbies");
		
		out.print("<ul>");
		out.print("<li>아이디: " + id + "</li>");
		out.print("<li>패스워드: " + pw + "</li>");
		out.print("<li>이름: " + name + "</li>");
		out.print("<li>이메일: " + email + "</li>");
		out.print("<li>성별: " + gender + "</li>");
		out.print("<li>취미");
		out.print("<ul>");
		for ( String hobby : hobbies ) {
			out.print("<li>" + hobby + "</li>");
		}
		out.print("</ul>");
		out.print("</li>");
		out.print("</ul>");
		out.print("</body>");
		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}













