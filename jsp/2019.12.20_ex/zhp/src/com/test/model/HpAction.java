package com.test.model;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.dao.homepageDao;
import com.test.dto.homepageDto;

@WebServlet("/HpAction")
public class HpAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HpAction() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request, response 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 전달된 파라미터  저장
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		homepageDto dto = new homepageDto();
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		
		List<homepageDto> list = homepageDao.getInstance().getLogin(dto);
		request.setAttribute("list", list);

		int result = homepageDao.getInstance().getJoin(dto);
		
		if(result > 0) {
			request.getRequestDispatcher("join/joinResult.jsp").forward(request, response);
		} 
		request.getRequestDispatcher("login/loginResult.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
