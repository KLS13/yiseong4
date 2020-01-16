package com.koreait.mvc11.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.mvc11.command.BoardCommand;
import com.koreait.mvc11.command.BoardDeleteCommand;
import com.koreait.mvc11.command.BoardListCommand;
import com.koreait.mvc11.command.BoardModifyCommand;
import com.koreait.mvc11.command.BoardViewCommand;
import com.koreait.mvc11.command.BoardWriteCommand;

@Controller
public class BoardController {

	// Field
	private BoardCommand boardListCommand = null;
	private BoardCommand boardViewCommand = null;
	private BoardCommand boardWriteCommand = null;
	private BoardCommand boardModifyCommand = null;
	private BoardCommand boardDeleteCommand = null;
	
	// Method
	// @Autowired
	// 1. root-context.xml, servlet-context.xml 에 정의된 Bean 을 자동으로 생성해 달라.
	// 2. 매개변수 : BoardListCommand boardListCommand 이 자동으로 생성되는 Bean 이다.
	// 3. 아래 servlet-context.xml 의 Bean 을 이용해서 생성한다.
	//    <beans:bean name="boardListCommand" class="com.koreait.mvc11.command.BoardListCommand"></beans:bean>
	
	@Autowired
	public void xxx(BoardListCommand boardListCommand,
			        BoardViewCommand boardViewCommand,
			        BoardWriteCommand boardWriteCommand,
			        BoardModifyCommand boardModifyCommand,
			        BoardDeleteCommand boardDeleteCommand) {
		this.boardListCommand = boardListCommand;
		this.boardViewCommand = boardViewCommand;
		this.boardWriteCommand = boardWriteCommand;
		this.boardModifyCommand = boardModifyCommand;
		this.boardDeleteCommand = boardDeleteCommand;
	}
	
	@RequestMapping("list")
	public String list(Model model) {
		// DB에서 목록을 가져오고(BoardListCommmand 호출), list.jsp로 이동(return)
		// DI 없이 직접 new 를 사용한 방식
		// boardListCommand = new BoardListCommand();
		boardListCommand.execute(model);
		return "list"; // list.jsp
	}
	
	
	// <a href="view?bIdx=${bDto.bIdx}">
	// view : @RequestMapping("/view")
	// bIdx=${bDto.bIdx} :HttpServletRequest request 
	@RequestMapping("view")
	public String view(HttpServletRequest request, Model model) {
		// request 값을 BoardViewCommand 의 execute 메소드에 전달해야 하는데,
		// execute 메소드는 매개변수가 Model model 밖에 없으므로,
		// request 자체를 model 에 담아 둔다.
		model.addAttribute("request", request);
		// BoardViewCommand 생성 및 execute 호출
		// BoardViewCommand boardViewCommand = new BoardViewCommand();  DI(@Autowired)로 처리되므로 필요 없다.
		boardViewCommand.execute(model);
		// view(.jsp) 리턴
		return "view";
	}
	
	
	
	@RequestMapping("write")
	public String write(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardWriteCommand.execute(model);
		return "redirect:list";
	}
	
	
	
	@RequestMapping("modify")
	public String modify(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardModifyCommand.execute(model);
		return "redirect:view";
	}
	
	
	
	@RequestMapping("delete")
	public String delete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardDeleteCommand.execute(model);
		return "redirect:list";
	}
	
	
	
	@RequestMapping("writePage")
	public String writePage() {
		return "writePage";
	}
	
	
}