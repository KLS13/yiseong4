package com.test.db.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.db.command.MemberCommand;
import com.test.db.command.MemberDeleteCommand;
import com.test.db.command.MemberJoinCommand;
import com.test.db.command.MemberListCommand;
import com.test.db.command.MemberViewCommand;

@Controller
public class MemberController {

	@Autowired
	private SqlSession sqlSession; 
	private MemberCommand memberCommand;
	
	@RequestMapping("memberList")
	public String memberList(HttpServletRequest request, Model model) {
		
		memberCommand = new MemberListCommand();
		memberCommand.execute(sqlSession, model);
		
		return "listPage";
	}
	
	@RequestMapping("writePage")
	public String writePage() {
		return "writePage";
	}
	
	@RequestMapping("write")
	public String write(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		memberCommand = new MemberJoinCommand();
		memberCommand.execute(sqlSession, model);
		
			return "redirect:memberList";
		
	}
	
	@RequestMapping("viewPage")
	public String viewPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memberCommand = new MemberViewCommand();
		memberCommand.execute(sqlSession, model);
		
			return "viewPage";
	}
	
	@RequestMapping("remove")
	public String remove(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memberCommand = new MemberDeleteCommand();
		memberCommand.execute(sqlSession, model);
			return "redirect:memberList";
	}
}
