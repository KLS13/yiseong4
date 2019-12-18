package com.koreait.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.Action;
import com.koreait.model.FruitAction;
import com.koreait.model.VegetableAction;


@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		// cmd 파라미터 확인
		String cmd = request.getParameter("cmd");
		String path = null;
		
		//Action 인터페이스 선언
		Action action = null; // model에 있는 Action 인터페이스  
		switch(cmd) {
		
		case "1" :
			action = new FruitAction();
				break;
		case "2" :
			action = new VegetableAction();
				break;
		}
		
		path = action.command(request);
		// path 이동
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
