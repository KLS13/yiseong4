package com.koreait.mvc04;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/member") // 이 컨트롤러에 있는 건 모두 "/member" 를 포함하는 RequestMapping 값을 가질거다. 앞으로는 적지 마라.
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
	
	
	
	// 이 컨트롤러를 통해서 이동하고자 하는 경로가 모두 /member 을 포함한다고 가정하면,
	// 컨트롤러에 @RequestMapping("/member") 로 설정할 수 있다.
	// 그러면, 메소드들의 @RequestMapping 에서 "/member" 부분을 모두 제거할 수 있다.
	
	
	
	// @RequestMapping("/view01") // 앞의 /(슬래시)는 있어도 되고, 없어도 된다.
	@RequestMapping("view01")
	public String goView01() {
		// return "/member/view01"; // 앞의 /(슬래시)는 있어도 되고 없어도 된다.
		return "member/view01"; // /WEB-INF/views/ member/view01 .jsp
		                        //          prefix               suffix  (servlet-context.xml 에 설정이 되어 있다.)
	}
	
	

	@RequestMapping("/v02") // v02 라는 매핑값은 예상과는 다른 파일에 연결되기 때문에 보안에 도움이 된다.
	public String goView02() {
		return "/member/view02";
	}
	
	
	
	@RequestMapping("/v03")
	public String goView03(Model model) { // Model : org.springframework.ui
		// Model
		// 1. 스프링 객체이다.
		// 2. JSP 에게 값을 전달하는 용도로 사용된다.
		// 3. 암호화되어 처리된다.
		// 4. request 를 사용할수도 있지만 반드시 model 을 사용하자.
		// 5. Model 은 매개변수로 선언한다.
		model.addAttribute("name", "alice");
		model.addAttribute("age", 20);
		return "/member/view03";
	}
	
	
	
	// 스프링 2 이하에서 사용하던 코드 (현재 많이 만들어져 있는 코드)
	// 앞으로 만들 때 사용하라는 의미는 아닙니다.
	@RequestMapping("/v04")
	public ModelAndView goView04() {
		// ModelAndView
		// 1. Model과 view(이동할 jsp)를 모두 저장하는 객체이다.
		// 2. Model에 속성 추가 : addObject
		// 3. view 추가 : setViewName
		// 4. 앞으로는 사용을 자제하자.
		ModelAndView mav = new ModelAndView();
		mav.addObject("name", "james");
		mav.addObject("age", 21);
		mav.setViewName("/member/view04");
		return mav;
	}
	
}
