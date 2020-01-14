package com.koreait.mvc07;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.mvc07.dto.StudentDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	
	@RequestMapping("/index")
	public String goIndex() {
		return "/index";
	}
	
	
	
	@RequestMapping("/v01")
	public String goResult1(StudentDto sDto, Model model) {
		model.addAttribute("sDto", sDto);
		return "/result";
	}
	
	
	
	@RequestMapping("/v02")
	// @ModelAttribute("s") StudentDto sDto : sDto 를 model 에 담을 때 s 라는 이름으로 담아줘.
	public String goResult2(@ModelAttribute("s") StudentDto sDto) {
		return "/result";
	}
	
	
	

}
