package com.koreait.model.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.koreait.dao.MDao;
import com.koreait.dto.Mdto;

/**
 * Servlet implementation class AjaxLeave
 */
@WebServlet("/ajaxLeave.me")
public class AjaxLeave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxLeave() {
       
    	 	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 1. 탈퇴할 회원의 정보는 session 에 저장된 loginDto 를 이용한다.
		HttpSession session = request.getSession();
		Mdto mDto = (Mdto) session.getAttribute("loginDto");
		
		String mId = mDto.getmId();
		
		MDao mDao = MDao.getInstance();
		
		int result = mDao.getDeleteMember(mId);
	
		JSONObject obj = new JSONObject();
		
		// 6. 탈퇴  키값 result에   성공=SUCCESS   실패=FAIL

		if(result > 0) {
			obj.put("result", "SUCCESS");
			session.invalidate();
		}else {
			obj.put("result", "FAIL");
		}
		
	
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(obj); // message 가 $.ajax ({,,, success(data)}) 의 data 로 전달 ~
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
