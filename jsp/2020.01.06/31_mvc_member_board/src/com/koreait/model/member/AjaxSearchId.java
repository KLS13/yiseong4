package com.koreait.model.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.MDao;
import com.koreait.dto.MemberDto;

@WebServlet("/ajaxSearchId.me")
public class AjaxSearchId extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxSearchId() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 전달 받은 파라미터 처리( data: "mEmail=" + $("mEmail").val(), )
		request.setCharacterEncoding("utf-8");
		String mEmail = request.getParameter("mEmail");
		
		// 2. MDao 생성
		MDao mDao = MDao.getInstance();
		
		// 3. MDao 의 getMemberBymEmail() 메소드 호출
		MemberDto mDto = mDao.getMemberBymEmail(mEmail);
		
		//4. 결과
		String result = null;
		if(mDto == null) {
			result = "NO";
		}else {
			result = mDto.getmId();
		}
		
		// 5. result 를 응답
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(result); // result 가 $.ajax ({,,, success(data)}) 의 data 로 전달 ~
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
