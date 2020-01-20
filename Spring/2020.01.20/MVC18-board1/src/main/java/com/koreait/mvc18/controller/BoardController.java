package com.koreait.mvc18.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.mvc18.command.BoardCommand;
import com.koreait.mvc18.command.BoardDeleteCommand;
import com.koreait.mvc18.command.BoardListCommand;
import com.koreait.mvc18.command.BoardModifyCommand;
import com.koreait.mvc18.command.BoardViewCommand;
import com.koreait.mvc18.command.BoardWriteCommand;

@Controller
public class BoardController {

	// 필드
	@Autowired
	private SqlSession sqlSession; // DI
	private BoardCommand boardCommand; // new (Spring 버전을 타지 않는다.)

	// 메소드
	@RequestMapping("list")
	public String list(Model model) { // 전달할 데이터가 있으면 model 을 잡음.
 		boardCommand = new BoardListCommand();
 		boardCommand.execute(sqlSession, model);
 		return "list";
	}
	
	@RequestMapping("view")
	public String view(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardCommand = new BoardViewCommand();
		boardCommand.execute(sqlSession, model);
		return "view";
	}
	
	@RequestMapping("modify")
	public String modify(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardCommand = new BoardModifyCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:list";
	}
	
	@RequestMapping("writePage")
	public String writePage() {
		return "writePage";
	}
	
	@RequestMapping("write")
	public String write(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardCommand = new BoardWriteCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:list";
	}
	
	@RequestMapping("delete")
	public String delete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardCommand = new BoardDeleteCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:list";
	}

}
