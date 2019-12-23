package com.koreait.bbs.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.BDao;
import com.koreait.dto.BDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertBBSAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		String realPath = request.getServletContext().getRealPath("/upload");
		
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(
				request,
				realPath,
				1024 * 1024 * 10,
				"utf-8",
				new DefaultFileRenamePolicy()
				);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		// BDto 만들기
		BDto bdto = new BDto();
		bdto.setWriter( mr.getParameter("writer") );
		bdto.setTitle( mr.getParameter("title") );
		bdto.setContent( mr.getParameter("content") );
		bdto.setPw( mr.getParameter("pw") );
		
		if ( mr.getFile("filename") == null ) {
			bdto.setFilename( "" );
		} else {
			bdto.setFilename( mr.getFilesystemName("filename") );
		}
		
		bdto.setIp( request.getRemoteAddr() );
		
		// BDao의 getInsert() 호출
		BDao bdao = BDao.getInstance();
		int result = bdao.getInsert(bdto);
		
		// 성공, 실패에 따른 path 결정을 위해 result를 insert_result.jsp 에 전달한다.
		request.setAttribute("result", result);
		
		return "bbs/insert_result.jsp";
		
	}

}