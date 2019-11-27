package com.koreait.servlet;

import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello") // web.xml 에서 <url-patten> 지정한 것과 동일한 효과가 있다.
public class Ex02_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public Ex02_servlet() {
        super(); 
    } 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}
