package com.koreait.mvc20.command;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.mvc20.dao.ImageDao;

public class ImageUploadCommand implements ImageCommand {

	@Autowired
	ServletContext application;
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		// 업로드 할 파일의 정보는 request 에 저장되어 있다.
		// model 에서 request 를 추출한다.
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request"); // 주의. MultipartHttpServletRequest (O), HttpServletRequest (X)
		
		// request 에 저장된 모든 파라미터를 저장한다.
		MultipartFile file = request.getFile("file"); // 첨부파일은 MultipartFile 타입이다.
		String fWriter = request.getParameter("fWriter"); // 업로더
		String filecomment = request.getParameter("filecomment"); // 파일설명
		
		// 업로드 할 파일의 이름(originFilename)과 확장자(extentionName)를 알아낸다.
		String originFilename = file.getOriginalFilename();
		String extentionName = originFilename.substring(originFilename.lastIndexOf(".") + 1, originFilename.length());
		
		String saveFilename = null;
		try {
			// 저장할 파일의 이름을 새로 만든다.
			// 저장할 파일의 이름은 시스템의 현재 시간(밀리초 단위)으로 한다.
			// 서버에 저장될 파일명 : 원래파일명_현재시간.확장자
			saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) + "_" + System.currentTimeMillis() + "." + extentionName;
			
			// 업로드 할 파일이 저장될 경로를 알아낸다.
			String realPath = application.getRealPath("/resources/upload");
			// application 안 쓰고 이렇게 해도 됩니다.
			// String realPath = request.getSession().getServletContext().getRealPath("/resources/upload");
			
			//  /resources/images  경로가 존재하지 않으면 필요한 폴더를 모두 만들어 준다.
			File directory = new File(realPath); // File 을 사용했지만 경로만 이용하는 경우에는 파일이 아니라 폴더의 개념이다.
			if ( !directory.exists() ) {
				directory.mkdirs(); // 서브디렉토리가 없으면 모두 만든다. (mkdir 이 아니라 mkdirs)
			}
			
			File saveFile = new File(realPath, saveFilename);
			file.transferTo(saveFile);
			
			// 업로드 된 파일의 정보를 DB에 저장한다.
			ImageDao iDao = sqlSession.getMapper(ImageDao.class);
			iDao.imageInsert(fWriter, filecomment, saveFilename);
			
		} catch (Exception e) {

		}
		
	}
	
}
