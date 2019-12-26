package com.koreait.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.model.Action;
import com.koreait.model.ChangePwAction;
import com.koreait.model.GoChangePwAction;
import com.koreait.model.GoIndexPage;
import com.koreait.model.GoLoginPage;
import com.koreait.model.GoLogoutPage;
import com.koreait.model.GoSearchIdPage;
import com.koreait.model.GoSearchPwPage;
import com.koreait.model.LoginAction;
import com.koreait.model.LogoutAction;
import com.koreait.model.SearchIdAction;
import com.koreait.model.SearchPwAction;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 요청 확인 (xxxx.do)
		String requestURI = request.getRequestURI();  
		String contextPath = request.getContextPath(); 
		String cmd = requestURI.substring(contextPath.length()); 
		
		Action action = null;
		
		switch( cmd ) {
		// 단순 이동
				case "/index.do":
					action = new GoIndexPage();
					break;
				case "/loginPage.do":
					action = new GoLoginPage();
					break;
				case "/logoutPage.do":
					action = new GoLogoutPage();
					break;
				case "/logout.do":
					action = new LogoutAction();
					break;
				case "/searchIdPage.do":
					action = new GoSearchIdPage();
					break;
				case "/searchPwPage.do":
					action = new GoSearchPwPage();
					break;
				case "/changePwPage.do":
					action = new GoChangePwAction();
					break;
					
				// DB 사용
				case "/login.do":
					action = new LoginAction();
					break;
				case "/searchId.do":
					action = new SearchIdAction();
					break;
				case "/searchPw.do":
					action = new SearchPwAction();
					break;
				case "/changePw.do":
					action = new ChangePwAction();
					break;
			
				}
		
		// path 알아내기
		String path = action.command(request, response);
		// path 이동
		request.getRequestDispatcher(path).forward(request, response);
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
