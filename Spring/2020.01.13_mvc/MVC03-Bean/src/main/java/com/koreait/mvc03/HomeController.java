package com.koreait.mvc03;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller  //컨트롤러
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// @RequestMappgin : url-mapping
	// 메소드를 대상으로  애너테이션을 붙인다.
	// value = "/" : 컨텍스트 패스를 위미한다. (http://localhost:9090/mvc03/ 이와 같은 주소가 입력되면 return "home";  :  home.jsp 로 이동.
	// method : get / post 방식
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
  //(http://localhost:9090/mvc03/a/b/c/d/e 가 입력될시
	@RequestMapping(value="/a/b/c/d/e")
	public String goView01() {
		
		// 리턴타입 : 뷰를 리턴하기 때문에 언제나 String 을 사용
		// 메소드이름 : goView01 은 의미없다
		// 리턴 : "view0"
		return "/view01";
	}
	
	@RequestMapping(value="admin/view02")   // =  @RequestMapping(value="/admin/view02")
	// Model 클래스
	// request 의 attribute 역할을 수행하는 클래스
	// addAttribute(속성명, 값) 방식으로 attribute 를 저장한다.
	// Controller 가 jsp 에서 파라미터를 전달하려면
	// 무조건 model를 사용한다. ( 스프링 2.0 이전 : 모델앤뷰 )
	// Model model 은 매개변수로 선언한다.
	
	public String goView02(Model model) {
		
		// model을 이용하여 view02.jsp 에 파라미터 전달.  ( request 를 이용 )
		model.addAttribute("id", "admin");
		model.addAttribute("pw","1234");
		
		return "admin/view02";
	}
	
	@RequestMapping("bean_view03")
	public String goView03() {
		
		return "bean_view03";
	}
	
}
