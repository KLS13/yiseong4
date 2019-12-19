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

/**
 * Servlet implementation class HpAction2
 */
@WebServlet("/HpAction2")
public class HpAction2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HpAction2() {
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
		
		// 전달된 파라미터  저장
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		homepageDto dto = new homepageDto();
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		

		int result = homepageDao.getInstance().getJoin(dto);
		
		request.setAttribute("dto", dto);
		
		if(result > 0) {
			request.getRequestDispatcher("join/joinResult.jsp").forward(request, response);
		} 
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
