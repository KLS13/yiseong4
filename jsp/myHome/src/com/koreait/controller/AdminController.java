package com.koreait.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.common.Action;
import com.koreait.common.ActionForwad;
import com.koreait.model.admin.MemberListAction;
import com.koreait.model.admin.MemberOneAction;

@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 요청 확인 (xxxx.me)
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());

		// Action action 선언 (DB 사용할 때 생성)
		Action action = null;

		// ActionForward forward 선언 (이동경로 + 이동방법을 저장할 객체(forward) 생성)
		ActionForwad forward = null;

		// cmd 에 다른 model 호출
		try {
			switch (cmd) {

			case "/memberPage.ad":
				action = new MemberListAction();
				forward = action.execute(request, response);
				break;
			
			case "/memberUpdate.ad" :
				action = new MemberOneAction();
				forward = action.execute(request, response);
				break;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 요청 실행
		if (forward != null) {
			if (forward.isRedirect()) { // 리다이렉트인가?
				response.sendRedirect(forward.getPath());
			} else {
				request.getRequestDispatcher(forward.getPath()).forward(request, response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
