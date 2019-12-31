package com.koreait.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.koreait.model.Action;
import com.koreait.model.CsvAction;
import com.koreait.model.JsonAction;
import com.koreait.model.WeatherAction;
import com.koreait.model.XmlPropertyAction;
import com.koreait.model.XmlTagAction;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request, response 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 추가부분
		PrintWriter out = response.getWriter();
		String result = null;
		
		// 요청 확인 (xxxx.do)
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		// Action action 선언
		Action action = null;
		
		// cmd 에 다른 model 호출
		switch ( cmd ) {
		
		case "/csv.do":
			action = new CsvAction();
			break;
		case "/xmlTag.do" :
			action = new XmlTagAction();
			break;
		case "/xmlProperty.do" :
			action = new XmlPropertyAction();
			break;
		case "/json.do" :
			action = new JsonAction();
			break;
		case "/weatherProperty.do" :
			action = new WeatherAction();
			break;
		}
		
		// 추가된 부분
		result = action.execute(request, response);
		out.println(result); // out(response) -> 요청이 들어온 곳으로 result를 보낸다.
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
