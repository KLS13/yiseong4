package com.koreait.mvc20;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.mvc20.command.ImageCommand;
import com.koreait.mvc20.command.ImageDownloadCommand;
import com.koreait.mvc20.command.ImageListCommand;
import com.koreait.mvc20.command.ImageUploadCommand;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	// Field
	@Autowired
	private SqlSession sqlSession;
	
	private ImageCommand imageCommand;
	

	// Method
	@RequestMapping("imageList")
	public String imageList(Model model) {
		imageCommand = new ImageListCommand();
		imageCommand.execute(sqlSession, model);
		return "imageList";
	}
	
	// 업로드 화면으로 이동
	@RequestMapping("uploadPage")
	public String uploadPage() {
		return "uploadPage";
	}
	
	// 파일 업로드
	@RequestMapping("upload")
	public String upload(MultipartHttpServletRequest request, Model model) {
		// request 에는 업로드할 파일의 정보(fWriter, file(실제파일), filecomment)가 있다.
		// 실제로 파일을 저장할 수 있는 request 는 MultipartHttpServletRequest 타입의 request 이다.
		model.addAttribute("request", request);
		imageCommand = new ImageUploadCommand();
		imageCommand.execute(sqlSession, model);
		return "redirect:imageList"; // DB가 수정된 후에는 redirect 로 이동한다.
	}
	
	// 파일 다운로드
	@RequestMapping("download")
	public String download(HttpServletRequest request, HttpServletResponse response, Model model) {
		// request 에는 <a href="download?filename=${fDto.filename }"> 에서 전달한 filename 파라미터가 담겨 있다.
		// 파일다운로드는 response 가 있어야 가능하다.
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		imageCommand = new ImageDownloadCommand();
		imageCommand.execute(sqlSession, model);
		return "imageList";
	}
	
	
	/********************************* ↓↓↓↓↓↓↓↓↓↓ 사용안함 ↓↓↓↓↓↓↓↓↓↓ *****************************************/
	
	
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
