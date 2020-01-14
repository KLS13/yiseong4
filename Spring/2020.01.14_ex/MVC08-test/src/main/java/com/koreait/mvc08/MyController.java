package com.koreait.mvc08;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {

	@RequestMapping("/input")
	public String goInput() {
		return "/input";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request, Model model) {
		int n1 = Integer.parseInt(request.getParameter("n1"));
		int n2 = Integer.parseInt(request.getParameter("n2"));
		model.addAttribute("n1", n1);
		model.addAttribute("n2", n2);
		return "/add";
	}
	
	@RequestMapping("/sub")
	public String sub(HttpServletRequest request, Model model) {
		int n1 = Integer.parseInt(request.getParameter("n1"));
		int n2 = Integer.parseInt(request.getParameter("n2"));
		model.addAttribute("n1", n1);
		model.addAttribute("n2", n2);
		return "/sub";
	}
	
	@RequestMapping("/mul")
	public String mul(@RequestParam("n1") int n1, @RequestParam("n2") int n2, Model model) {
		model.addAttribute("n1", n1);
		model.addAttribute("n2", n2);
		return "/mul";
	}
	
	@RequestMapping("/div")
	public String div(@RequestParam("n1") int n1, @RequestParam("n2") int n2, Model model) {
		model.addAttribute("n1", n1);
		model.addAttribute("n2", n2);
		return "/div";
	}
	
}
