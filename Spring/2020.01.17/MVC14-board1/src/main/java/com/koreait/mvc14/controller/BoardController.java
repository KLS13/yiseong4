package com.koreait.mvc14.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.mvc14.command.BoardCommand;
import com.koreait.mvc14.command.BoardDeleteCommand;
import com.koreait.mvc14.command.BoardListCommand;
import com.koreait.mvc14.command.BoardModifyCommand;
import com.koreait.mvc14.command.BoardViewCommand;
import com.koreait.mvc14.command.BoardWriteCommand;
import com.koreait.mvc14.util.Constant;

@Controller
public class BoardController {

	// Field
	private BoardCommand boardListCommand = null;
	private BoardCommand boardViewCommand = null;
	private BoardCommand boardWriteCommand = null;
	private BoardCommand boardModifyCommand = null;
	private BoardCommand boardDeleteCommand = null;
	private JdbcTemplate template = null;
	
	// Method
	@Autowired
	public void xx(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template; // Constant.template 은 어디서든 사용이 가능하다.
	}
	@Autowired
	public void xxx(BoardListCommand boardListCommand,
			        BoardViewCommand boardViewCommand,
			        BoardWriteCommand boardWriteCommand,
			        BoardModifyCommand boardModifyCommand,
			        BoardDeleteCommand boardDeleteCommand
			        ) {
		this.boardListCommand = boardListCommand;
		this.boardViewCommand = boardViewCommand;
		this.boardWriteCommand = boardWriteCommand;
		this.boardModifyCommand = boardModifyCommand;
		this.boardDeleteCommand = boardDeleteCommand;
	}

	
	
	
	@RequestMapping("/list")
	public String list(Model model) {
		// command = new BoardListCommand(); // DI을 사용안한 방식
		boardListCommand.execute(model);
		return "/list";
	}
	
	
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) { // list.jsp 중 <a href="view?bIdx=${bDto.bIdx}> 처리하려면 파라미터를 받는 request 를 선언해야한다.
		model.addAttribute("request", request);
		// command = new BoardViewCommand();
		boardViewCommand.execute(model);
		return "/view";
	}
	
	
	
	@RequestMapping("/modify")
	public String modify(HttpServletRequest request, Model model) { // view.jsp 에서 submit 되는 데이터를 저장하기 위해 request 가 필요하다.)
		model.addAttribute("request", request);
		// command = new BoardModifyCommand();
		boardModifyCommand.execute(model);
		return "redirect:/view";
	}
	
	
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		// command = new BoardDeleteCommand();
		boardDeleteCommand.execute(model);
		return "redirect:/list";
	}
	
	
	
	@RequestMapping("/writePage")
	public String writePage() {
		return "/writePage";
	}
	
	
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		// command = new BoardWriteCommand();
		boardWriteCommand.execute(model);
		return "redirect:/list";
	}
	
	
	
}
