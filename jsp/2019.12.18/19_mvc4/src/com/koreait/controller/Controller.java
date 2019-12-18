package com.koreait.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.Action;
import com.koreait.model.EnglishAction;
import com.koreait.model.HangleAction;
import com.sun.xml.internal.ws.wsdl.ActionBasedOperationSignature;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//요청확인
		String requestURI = request.getRequestURI();  // 전체경로    /19_mvc4/xxxxx.do 
		String contextPath = request.getContextPath(); // 컨텍스트 /19_mvc4
		String command = requestURI.substring(contextPath.length());  // 요청확인  /xxxx.do
		Action action = null;
		
		switch(command) {
		case "/hangle.do" :
			action = new HangleAction();
				break;
		
		case "/english.do" :
			action = new EnglishAction();
				break;
		}
		String path = action.command(request);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
