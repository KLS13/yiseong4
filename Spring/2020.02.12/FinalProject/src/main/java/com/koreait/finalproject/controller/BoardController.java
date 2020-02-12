package com.koreait.finalproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.finalproject.command.BoardCommand;
import com.koreait.finalproject.command.BoardDeleteCommand;
import com.koreait.finalproject.command.BoardListCommand;
import com.koreait.finalproject.command.BoardModifyCommand;
import com.koreait.finalproject.command.BoardViewCommand;
import com.koreait.finalproject.command.BoardWriteCommand;

@Controller
public class BoardController {
	
	// Field
	@Autowired
	private SqlSession sqlSession;
	private BoardCommand boardCommand;
	
	// Method
	
	@RequestMapping("writePage")
	public String writePage() {
		
		return "board/writePage";
	}
	
	@RequestMapping("list")
	public String list(Model model) {
		
		boardCommand = new BoardListCommand();
		boardCommand.execute(sqlSession, model);
		
		return "board/list";
	}

	@RequestMapping("view")
	public String view(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardCommand = new BoardViewCommand();
		boardCommand.execute(sqlSession, model);
		
		return "board/view";
	}
	
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modify(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		boardCommand = new BoardModifyCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:list";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		boardCommand = new BoardWriteCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:list";
	}
	
	@RequestMapping("delete")
	public String delete(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		boardCommand = new BoardDeleteCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:list";
	}

}
