package com.project.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	@RequestMapping(value = "/loginform.it", method = { RequestMethod.GET, RequestMethod.POST })	
	public String loginform() {
		
		return "loginform";
	}

	
	@RequestMapping(value = "/loginfail.it", method = RequestMethod.GET)
	public String loginfail() {

		
		return "loginfail"; 
	}

	
	@RequestMapping(value = "/logoutform.it", method = RequestMethod.GET)
	public String logoutform() {

		
		return "logoutform"; 
	}

	@RequestMapping(value = "/loginsuccess.it", method = RequestMethod.GET)
	public String loginresult() {

		return "loginsuccess";
	}
}

