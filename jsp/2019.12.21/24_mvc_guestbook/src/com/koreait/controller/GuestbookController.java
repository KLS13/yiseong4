package com.koreait.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.guestbook.model.Action;
import com.koreait.guestbook.model.DeleteAction;
import com.koreait.guestbook.model.DownloadAction;
import com.koreait.guestbook.model.InsertAction;
import com.koreait.guestbook.model.ListAction;
import com.koreait.guestbook.model.PageForDelete;
import com.koreait.guestbook.model.PageForInsert;
import com.koreait.guestbook.model.PageForUpdate;
import com.koreait.guestbook.model.UpdateAction;
import com.koreait.guestbook.model.ViewAction;


// suffix 가 do 인 모든 경로는 이 곳으로 모인다.

@WebServlet("*.do")
public class GuestbookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GuestbookController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request, response 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 요청 확인( /xxxx.do 확인 )
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		// Action 인터페이스 선언
		Action action = null;
		
		// command 에 따른 작업
		switch ( command ) {
		
		// DB 활용
		case "/list.do":
			action = new ListAction();
			break;
		case "/insert.do":
			action = new InsertAction();
			break;
		case "/view.do":
			action = new ViewAction();
			break;
		case "/delete.do":
			action = new DeleteAction();
			break;
		case "/update.do":
			action = new UpdateAction();
			break;

			
		// 단순 이동
		case "/pageForInsert.do":
			action = new PageForInsert();
			break;
		case "/pageForDelete.do":
			action = new PageForDelete();
			break;
		case "/pageForUpdate.do":
			action = new PageForUpdate();
			break;
		case "/download.do":
			action = new DownloadAction();
			break;
		}
		
		// path 확인
		String path = action.command(request, response);

		// path 이동
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}