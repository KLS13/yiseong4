package com.koreait.mvc15.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.mvc15.util.Constant;
import com.koreait.mvc15.command.BoardCommand;
import com.koreait.mvc15.command.BoardDeleteCommand;
import com.koreait.mvc15.command.BoardListCommand;
import com.koreait.mvc15.command.BoardModifyCommand;
import com.koreait.mvc15.command.BoardViewCommand;
import com.koreait.mvc15.command.BoardWriteCommand;
import com.koreait.mvc15.config.AnnoConfig;

@Controller
public class BoardController {

	// Field
	private AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AnnoConfig.class);
	private JdbcTemplate template = null;
	
	// Method
	@Autowired
	public void xx(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template; // Constant.template 은 어디서든 사용이 가능하다.
	}
	
	
	@RequestMapping("list")
	public String list(Model model) {
		// AnnoConfig.java 를 이용해서 BoardListCommand 생성하기
		BoardCommand boardListCommand = ctx.getBean("bList", BoardListCommand.class);
		boardListCommand.execute(model);
		return "list"; // list.jsp
	}
	
	
	@RequestMapping("view")
	public String view(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		BoardCommand boardViewCommand = ctx.getBean("view", BoardViewCommand.class);
		boardViewCommand.execute(model);
		return "view";
	}
	
	
	
	@RequestMapping("write")
	public String write(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		BoardCommand boardWriteCommand = ctx.getBean("write", BoardWriteCommand.class);
		boardWriteCommand.execute(model);
		return "redirect:list";
	}
	
	
	
	@RequestMapping("modify")
	public String modify(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		BoardCommand boardModifyCommand = ctx.getBean("modify", BoardModifyCommand.class);
		boardModifyCommand.execute(model);
		return "redirect:view";
	}
	
	
	
	@RequestMapping("delete")
	public String delete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		BoardCommand boardDeleteCommand = ctx.getBean("delete", BoardDeleteCommand.class);
		boardDeleteCommand.execute(model);
		return "redirect:list";
	}
	
	
	
	@RequestMapping("writePage")
	public String writePage() {
		return "writePage";
	}
	
	
}