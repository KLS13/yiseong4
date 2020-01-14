package com.koreait.mvc09;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {

	@RequestMapping("/input")
	public String goIndex() {
		return "/input";
	}
	
	@RequestMapping("/calc")
	public String goCalc( Calculator calculator ) {
		calculator.setResult();
		if ( calculator.getView().equals("output") ) {
			return "/output";
		} else {
			return "redirect:/input";
		}
	}
	
}