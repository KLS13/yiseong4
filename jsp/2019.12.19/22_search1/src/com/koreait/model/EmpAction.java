package com.koreait.model;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.ClientDao;
import com.koreait.dao.EmpDao;
import com.koreait.dto.ClientDto;
import com.koreait.dto.EmpDto;


@WebServlet("/EmpAction")
public class EmpAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EmpAction() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request, response 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 전달된 파라미터  저장
		String empDept = request.getParameter("empDeptNo");
		
		List<EmpDto> list = null;
		

		if ( empDept.equals("all") ) {
			list = EmpDao.getInstance().getAllEmp();
		} else {
			list = EmpDao.getInstance().getEmpByDept(empDept);
		}
		
		request.setAttribute("list", list);

		request.getRequestDispatcher("emp/emp_list.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
