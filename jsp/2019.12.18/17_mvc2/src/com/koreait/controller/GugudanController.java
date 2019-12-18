package com.koreait.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.Three;
import com.koreait.model.Two;


@WebServlet("/GugudanController")
public class GugudanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public GugudanController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String cmd = request.getParameter("cmd");
		String path = null;
		
		//cmd에 따른 Model 호출.
		if(cmd.equals("two")) {
			Two two = new Two();
			path = two.command(request);
		}else if(cmd.equals("three")) {
			Three three = new Three();
			path = three.command(request);
		}
		// Model 에서 결정한 path로 이동
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
