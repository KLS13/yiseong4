package com.koreait.guestbook.model;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
    	
    	String path = request.getParameter("path");			// 폴더명(upload)
    	String filename = request.getParameter("filename");	// 파일명
    	
    	// 다운로드 받을 파일의 실제 경로 구하기
    	String realPath = request.getServletContext().getRealPath("/" + path);
    	
    	// 다운로드 받을 수 있는 문서 타입으로 설정하기
    	response.setContentType("application/x-msdownload");
    	
    	// 파일 클래스(파일 스트림)를 통해 다운로드 할 파일 연결하기
    	File file = new File(realPath + "/" + filename);
    	
    	// 클라이언트의 헤더 정보에 첨부파일 있음을 처리
    	try {
			response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename, "utf-8"));
			response.setHeader("Content-Length", file.length() + "");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
    	
    	// 실제 다운로드하기
    	FileInputStream fis = null;
    	BufferedInputStream bis = null;	// 서버에 저장된 파일을 읽어 들이는 버퍼스트림
    	BufferedOutputStream bos = null;	// 클라이언트에 파일을 작성할 버퍼스트림
    	
    	try {
    		fis = new FileInputStream(file);
    		bis = new BufferedInputStream(fis);
    		bos = new BufferedOutputStream(response.getOutputStream());
    		
    		// 전체 다운로드 받기
    		byte[] buffer = new byte[(int)file.length()];	// 파일의 크기와 같은 buffer 를 준비
    		bis.read(buffer, 0, buffer.length);
    		bos.write(buffer);
    		bos.flush();
    	} catch (Exception e) {
    		e.printStackTrace();
    	} finally {
    		try {
    			if ( bos != null ) { bos.close(); }
    			if ( bis != null ) { bis.close(); }
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    	}
		
		return "guestbook/view.jsp";
		
	}

}
