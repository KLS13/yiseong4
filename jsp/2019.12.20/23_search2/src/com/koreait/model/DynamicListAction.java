package com.koreait.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.koreait.dao.EmployeeDao;
import com.koreait.dto.EmployeeDto;

public class DynamicListAction implements Action {

	@Override
	public String process(HttpServletRequest request) {
		
		String path = null;
		String key = request.getParameter("key");
		String value = request.getParameter("value");
		
		if ( value == null || value.isEmpty() ) {
			path = "input_dynamic.jsp";
		} else {
			Map<String, String> map = new HashMap<String, String>();
			map.put("key", key);
			map.put("value", value);
			List<EmployeeDto> list = EmployeeDao.getEmployeeByDynamic(map);
			request.setAttribute("list", list);
			request.setAttribute("key", key);
			path = "dynamicList.jsp";
		}
		
		return path;
		
	}

}