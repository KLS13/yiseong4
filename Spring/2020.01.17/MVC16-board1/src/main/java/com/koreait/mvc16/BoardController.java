package com.koreait.mvc16;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.exceptions.IbatisException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.mvc16.dao.IBoardDao;

@Controller
public class BoardController {

	// 필드 (sqlSession 을 생성해야만 mapper 을 사용할 수있다)
	@Autowired
	private SqlSession sqlSession; // servlet-context.xml 에 가서 sqlSession 이름을 가진 bean 을 만들어라.
	
	@RequestMapping("list")
	public String list(Model model) {
		IBoardDao bDao = sqlSession.getMapper(IBoardDao.class);
		//bDao.listDao(); : mapper에서  id="listDao" 인 태그의 실행 결과
		model.addAttribute("list", bDao.listDao());
		return "list";
	}
	
	@RequestMapping("view")
	public String view(HttpServletRequest request, Model model) {
		IBoardDao bDao = sqlSession.getMapper(IBoardDao.class);
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		model.addAttribute("bDto", bDao.viewDao(bIdx));
		return "view";
	}
	
	@RequestMapping("modify")
	public String modify(@RequestParam("bTitle") String bTitle,
						 @RequestParam("bContent") String bContent,
						 @RequestParam("bIdx") int bIdx) {
		IBoardDao bDao = sqlSession.getMapper(IBoardDao.class);
		bDao.modifyDao(bTitle, bContent, bIdx);
		return "redirect:list"; // 수정되고 가느냐~ : 리다이렉트   /   아니냐 ~
	}
	
	@RequestMapping("write")
	public String write(@RequestParam("bWriter") String bWriter,
						@RequestParam("bTitle") String bTitle,
						@RequestParam("bContent") String bContent) {
		
		IBoardDao bDao = sqlSession.getMapper(IBoardDao.class);
		bDao.writeDao(bWriter, bTitle, bContent);
		return "redirect:list";
	}
	
	@RequestMapping("writePage")
	public String writePage() {
		return "writePage";
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam("bIdx") int bIdx) {
		IBoardDao bDao = sqlSession.getMapper(IBoardDao.class);
		bDao.deleteDao(bIdx);
		return "redirect:list";
	}
				
}
