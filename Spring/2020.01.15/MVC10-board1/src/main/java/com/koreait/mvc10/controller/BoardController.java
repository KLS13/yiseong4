package com.koreait.mvc10.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.mvc10.command.BoardCommand;
import com.koreait.mvc10.command.BoardDeleteCommand;
import com.koreait.mvc10.command.BoardListCommand;
import com.koreait.mvc10.command.BoardModifyCommand;
import com.koreait.mvc10.command.BoardViewCommand;
import com.koreait.mvc10.command.BoardWriteCommand;

@Controller
public class BoardController {

	private BoardCommand command = null;

	//메소드
	@RequestMapping("/list")
	public String list(Model model) {
		command = new BoardListCommand();  // DI을 사용안한 방식
		command.execute(model);

		return "/list";
	}
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) { // list.jsp 중 <a href="view?bIdx=${bDto.bIdx}> 처리하려면 파라미터를 받는 request 를 선언해야한다.
		model.addAttribute("request", request);
		command = new BoardViewCommand();
		command.execute(model);
		return "/view";
	}
	
	@RequestMapping("/modify")
	public String modify(HttpServletRequest request, Model model) { // view.jsp에서 submit 되는 데이터를 저장하기 위해 request 가 필요.
		model.addAttribute("request", request);
		command = new BoardModifyCommand();
		command.execute(model);
		
		return "redirect:/view"; // DB가 수정된 뒤에 VIEW 이동이므로 리다이렉트 
		
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) { // view.jsp에서 submit 되는 데이터를 저장하기 위해 request 가 필요.
		model.addAttribute("request", request);
		command = new BoardDeleteCommand();
		command.execute(model);
		
		return "redirect:/list"; // DB가 수정된 뒤에 VIEW 이동이므로 리다이렉트 
		
	}
	
	@RequestMapping("/writePage")
	public String writePage() {
		return "/writePage";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new BoardWriteCommand();
		command.execute(model);
		
		return "redirect:/list";
	}
}
