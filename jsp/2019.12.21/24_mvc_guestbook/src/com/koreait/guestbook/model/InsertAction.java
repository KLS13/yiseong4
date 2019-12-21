package com.koreait.guestbook.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.GuestbookDao;
import com.koreait.dto.GuestbookDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {

		// 업로드 될 파일의 실제 경로는 request 로도 구할 수 있다.
		String realPath = request.getServletContext().getRealPath("/upload");
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(
					request,
					realPath,
					1024 * 1024 * 10,	// 10MB
					"utf-8",
					new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}

		// dto를 만들어서 dao의 getInsert() 에 전달하기 위함
		GuestbookDto dto = new GuestbookDto();
		dto.setWriter( mr.getParameter("writer") );
		dto.setTitle( mr.getParameter("title") );
		dto.setEmail( mr.getParameter("email") );
		dto.setPw( mr.getParameter("pw") );
		dto.setContent( mr.getParameter("content") );
		
		// 첨부파일 유무에 따라서 filename 값을 결정
		if ( mr.getFile("filename") != null ) {
			dto.setFilename( mr.getFilesystemName("filename") );
		} else {
			dto.setFilename("");
		}
		
		// dto를 getInsert()에 전달하면,
		// getInsert()는 받은 dto를 guestbook.xml에게 전달함
		GuestbookDao dao = GuestbookDao.getInstance();
		int result = dao.getInsert(dto);
		
		// 성공, 실패에 따라 다른 path 사용
		String path = null;
		if (result > 0) {
			path = "/list.do"; // 삽입 성공 -> 전체 보기		
		} else {
			path = "/pageForInsert.do"; // 삽입 실패 -> 다시 삽입 페이지로
		}
		
		return path;
		
	}

}