package com.koreait.model.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.MDao;
import com.koreait.dto.MemberDto;

@WebServlet("/ajaxSearchPw.me")
public class AjaxSearchPw extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxSearchPw() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 전달 받은 파라미터 처리(data: "mId=" + $("#mId").val() + "&mPhone=" + $("#mPhone").val(),)
		request.setCharacterEncoding("utf-8");
		String mId = request.getParameter("mId");
		String mPhone = request.getParameter("mPhone");
		
		// 2. MDao -> mapper 까지 전달할 Map 생성
		Map<String, String> map = new HashMap<String, String>();
		map.put("mId", mId);
		map.put("mPhone", mPhone);
		
		// 3. MDao 생성
		MDao mDao = MDao.getInstance();
		
		// 4. MDao 의 getMemberBymIdmPhone() 메소드 호출
		MemberDto mDto = mDao.getMemberBymIdmPhone(map);
		
		// 5. 결과 result 만들기
		String result = null;
		if ( mDto == null ) {
			result = "NO";
		} else {
			result = "YES";
		}
		
		// 6. result 를 응답(response)
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result); // result 가 $.ajax({,,,success(data)}) 의 data 로 전달
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
