package com.bcgbcg.br.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.bcgbcg.br.dao.UserDao;
import com.bcgbcg.br.dto.UserDto;

public class LoginIdPwCommand implements LoginCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		UserDao udao = sqlSession.getMapper(UserDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String uId_ = request.getParameter("uId_");
		String uPassword = request.getParameter("uPassword");
		
		UserDto loginDto = udao.loginIdPw(uId_, uPassword);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginDto", loginDto);
	}

}