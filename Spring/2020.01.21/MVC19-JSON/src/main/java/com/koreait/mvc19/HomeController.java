package com.koreait.mvc19;

import java.text.DateFormat;

import java.util.Date;
import java.util.Locale;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value="jsonGet", produces="application/json")
	@ResponseBody   // 리턴을 response 에 담아서 보냄 !
	public String jsonGet() {
		JSONObject obj = new JSONObject(); // json 객체 생성 ( simple-json이 지원 )
		
		//json 객체는 map 처럼 사용한다
		obj.put("name", "jessica");
		obj.put("age", 20);
		
		//json 객체 리턴은 String 으로 처리한다.
		return obj.toJSONString();  // 뷰?  뷰가 아니고 ajax 호출 영역으로 보내고자 한다.
		// 리턴값을 호출영역으로 응답(response) 하려면 @ResponseBody 에너테이션 추가.
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	
}
