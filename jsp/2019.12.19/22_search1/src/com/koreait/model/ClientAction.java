package com.koreait.model;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.ClientDao;
import com.koreait.dto.ClientDto;

@WebServlet("/ClientAction")
public class ClientAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ClientAction() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request, response 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 전달된 파라미터 region 저장
		String region = request.getParameter("region");
		// 전달된 파라미터 name 저장
		String name = request.getParameter("name");
		
		// region 이 없는 경우 처리
		if ( region == null || region.isEmpty() ) {
			region = "all";
		}
		// 검색 결과 저장은 List 에 한다.
		List<ClientDto> list = null;
		
		// region 이 "all" 인 경우, 그 이외의 경우 사용할 SQL문이 다르기 때문에(WHERE 문 여부)
		// ClientDao 에서 호출해야 할 메소드가 다르다.
		if ( region.equals("all") ) {
			// dao 의 생성은 ClientDao.getInstance()
			// dao 를 생성해야 getAllClient() 메소드를 호출할 수 있다.
			list = ClientDao.getInstance().getAllClient();
		} else {
			list = ClientDao.getInstance().getClientByRegion(region);
		}
		
		if(name.equals("all")) {
			list = ClientDao.getInstance().getAllClient();
		}else {
			list = ClientDao.getInstance().getClientByName(name);
		}
		
		// 결과를 가지고 있는 list 처리 (request 또는 session 에 속성으로 저장하기)
		request.setAttribute("list", list);
		
		// 결과를 보여 줄 JSP 화면으로 이동
		// DB 수정이 없는 단순 검색이므로 포워딩
		request.getRequestDispatcher("client/client_list.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}










