package com.koreait.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.koreait.dao.EmployeeDao;
import com.koreait.dto.EmployeeDto;

public class AllListAction implements Action {

	@Override
	public String process(HttpServletRequest request) {
		
		// DB에서 전체목록을 가져온다. 
		List<EmployeeDto> list = EmployeeDao.getAllEmployees();
		
		// 전체목록을 request/session 에 저장한다.
		request.setAttribute("list", list);
		
		// 전체목록을 출력할 View 를 리턴한다.
		return "allList.jsp";
		
	}

}
