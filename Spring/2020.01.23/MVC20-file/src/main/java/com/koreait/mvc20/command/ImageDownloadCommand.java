package com.koreait.mvc20.command;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;

public class ImageDownloadCommand implements ImageCommand {

	@Autowired
	ServletContext application;
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		// model 에 저장해 놓은 속성(request, response)을 꺼낸다.
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		// 다운로드 파일이 저장된 경로를 알아낸다.
		// workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MVC20-file\resources\ upload 경로에 저장된다.
		// String realPath = application.getRealPath("/resources/upload");
		// application 안 쓰고 이렇게 해도 됩니다.
		String realPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		
		// 다운로드 받을 파일명을 알아낸다.
		String filename = request.getParameter("filename");

		// 경로/파일명  으로 다운로드 받을 파일을 연결한다.
		File file = new File(realPath + "/" + filename);
		
		// 속도 향상을 위해 Buffer 사용하는 스트림을 이용한다.
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		// bis, bos 는 예외처리가 필요하다.
		try {
			// response 를 다운로드가 가능한 형태로 만들기
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename, "utf-8"));
			response.setHeader("Content-Length", file.length() + "");
			response.setHeader("Content-Transfer-Encoding", "binary");
			
			// 서버에 저장된 파일을 input 으로 사용한다.
			// response 를 output 으로 사용한다.
			// -> 서버에 저장된 파일을 읽어서 response(응답, 즉 결과)로 보내겠다는 의미이다.
			bis = new BufferedInputStream(new FileInputStream(file));
			bos = new BufferedOutputStream(response.getOutputStream());
			
			// 파일 복사 진행 (bis 의 내용을 모두 bos 로 보냄)
			FileCopyUtils.copy(bis, bos);
			bos.flush();
			
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				if ( bos != null ) { bos.close(); }
				if ( bis != null ) { bis.close(); }
			} catch(Exception e) { }
		} // end try
		
	}

}
