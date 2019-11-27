package com.koreait.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex09_request")
public class Ex09_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex09_request() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 기본 3종
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// request 처리 (요청 처리)
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		String operator = request.getParameter("operator");
		String result = "";
		switch (operator) {
		case "+" : result = num1 + " + " + num2 + " = " + (num1 + num2);
					break;
		case "-" : result = num1 + " - " + num2 + " = " + (num1 - num2);
					break;
		case "×" : result = num1 + " x " + num2 + " = " + (num1 * num2);
					break;
		case "÷" : result = num1 + " / " + num2 + " = " + (num1 / num2);
		}
		
		// response 처리 (응답 처리)
		out.print("<html>");
		out.print("<head>");
		out.print("<title>");
		out.print("계산기 결과");
		out.print("</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>" + result + "</h1>");
		out.print("</body>");
		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
