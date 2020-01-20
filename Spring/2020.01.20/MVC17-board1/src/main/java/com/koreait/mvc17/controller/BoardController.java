package com.koreait.mvc17.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.mvc17.command.BoardCommand;
import com.koreait.mvc17.command.BoardDeleteCommand;
import com.koreait.mvc17.command.BoardListCommand;
import com.koreait.mvc17.command.BoardModifyCommand;
import com.koreait.mvc17.command.BoardViewCommand;
import com.koreait.mvc17.command.BoardWriteCommand;

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
	
	//redirect 는 새로운 request/response 를 가지고 이동한다.
	//redirect 로 이동하는 경우
	// model.addAttribute() - (request를 이용하는 model)를 이용해 jsp에 값을 전달하려고 하면
	// 보낼때는 (주소창에서 확인 )하지만, 실제로는 새로운 request를 이용하므로 전달의미없어짐.
	
	//redirect 로 이동하는 경우
	//jsp 에 값을 전달할때는 RedirectAttributes 클래스를 이용한다.
	//내부적으로 session 을 이용하기 때문에 값의 전달이 가능하다.
	// post 방식으로 동작--> 주소창에 전달되는 데이터가 나타나지 않는다.
	
	@RequestMapping("modify")
	public String modify(RedirectAttributes redirectAttributes, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("redirectAttributes", redirectAttributes);
		boardCommand = new BoardModifyCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:list";
	}
	
	@RequestMapping("writePage")
	public String writePage() {
		return "writePage";
	}
	
	@RequestMapping("write")
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
