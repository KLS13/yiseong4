package com.koreait.bbs.model;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.BDao;
import com.koreait.dto.BDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateBBSAction implements Action {

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
		
		BDto bdto = new BDto();
		bdto.setWriter( mr.getParameter("writer") );
		bdto.setTitle( mr.getParameter("title") );
		bdto.setContent( mr.getParameter("content") );
		bdto.setPw( mr.getParameter("pw") );
		bdto.setB_idx( Integer.parseInt(mr.getParameter("b_idx")) );	// 수정할 때 사용할 조건
		bdto.setIp( request.getRemoteAddr() );
		
		// 기존 첨부(oldfile)도 있고, 새 첨부(filename)도 있어서 기존 첨부를 삭제하는 상황
		String oldfile = mr.getParameter("oldfile");
		File newfile = mr.getFile("filename");
		if ( oldfile != null && newfile != null ) {
			// oldfile 삭제 작업
			File f = new File(realPath + "/" + oldfile);
			f.delete();
		}
		
		BDao bdao = BDao.getInstance();
		int result = 0;
		
		// 수정할 filename 저장
		if ( newfile == null ) {
			// setFilename() 을 호출할 필요가 없다.
			// 1. 새 첨부가 없는 업데이트
			result = bdao.getUpdateWithoutFile(bdto);
		} else {
			bdto.setFilename( mr.getFilesystemName("filename") );
			// 2. 새 첨부가 있는 업데이트
			result = bdao.getUpdateWithFile(bdto);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("b_idx", bdto.getB_idx()); // view.jsp 로 이동할 때 필요한 파라미터
		
		return "bbs/update_result.jsp";

	}

}