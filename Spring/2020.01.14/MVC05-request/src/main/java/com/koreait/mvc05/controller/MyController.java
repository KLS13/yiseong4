package com.koreait.mvc05.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.mvc05.dto.BoardDto;
import com.koreait.mvc05.dto.MemberDto;

@Controller // 나는 컨트롤러야.
public class MyController {

	@RequestMapping("/board/v01")
	public String goView01(HttpServletRequest request, Model model) {
		
		// 1. request : 값을 받아오는 용도
		// 2. model : view(jsp)에 값을 전달하는 용도
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		
		return "/board/view01";
		
	}
	
	
	
	@RequestMapping("/board/v02")
	public String goView02(HttpServletRequest request, Model model) {
		
		// JSP 스타일
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		// new 를 이용해 빈을 만들어서 model 에 추가	
		BoardDto bDto = new BoardDto(title, writer, content);
		model.addAttribute("bDto", bDto);
		
		return "/board/view02";
		
	}
	
	
	
	// 스프링의 request 처리 방식
	// @RequestParam("title") : title 파라미터가 전달된다. ( request.getParameter("title") )
	// @RequestParam("title") String title : 전달된 title 파라미터를 String title 에 저장한다.
	
	@RequestMapping("/board/v03")
	public String goView03( @RequestParam("title") String title,
							@RequestParam("writer") String writer,
							@RequestParam("content") String content, Model model) {
		model.addAttribute("title", title);
		model.addAttribute("writer", writer);
		model.addAttribute("content", content);
		
		return "/board/view03";
		
	}
	
	
	// JSP 방식
	@RequestMapping("/member/v04")
	public String goView04(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		model.addAttribute("name", name);
		model.addAttribute("email", email);
		return "/member/view04";
	}
	
	
	// 스프링 방식
	@RequestMapping("/member/v05")
	public String goView05(@RequestParam("id") String id,
						   @RequestParam("pw") String pw,
						   @RequestParam("name") String name,
						   @RequestParam("email") String email, Model model) {
		MemberDto mDto = new MemberDto(id, pw, name, email);
		model.addAttribute("mDto", mDto);
		return "/member/view05";
	}
	
	
	// 스프링 방식
	@RequestMapping("/member/v06")
	public String goView06(MemberDto mDto) {
		//model.addAttribute("mDto", mDto);
		return "/member/view06";
	}
	
	
	
}