package com.koreait.mvc20.dto;

import org.springframework.web.multipart.MultipartFile;

public class ImageDto {

	private int fIdx;
	private String fWriter;
	private String filename; // 서버에는 파일이름만 보관한다. 업로드 시간으로 파일 이름을 정했기 때문에 중복 체크도 필요가 없다.
	private String filecomment;
	private String fRegdate;
	private MultipartFile file; // DB에는 없고 ImageDto에만 있다. 실제로 파일을 저장하는 곳은 DB가 아니라 서버 내 공간이기 때문이다.
	
	
	public ImageDto() {
		// TODO Auto-generated constructor stub
	}

	public int getfIdx() {
		return fIdx;
	}
	public void setfIdx(int fIdx) {
		this.fIdx = fIdx;
	}
	public String getfWriter() {
		return fWriter;
	}
	public void setfWriter(String fWriter) {
		this.fWriter = fWriter;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilecomment() {
		return filecomment;
	}
	public void setFilecomment(String filecomment) {
		this.filecomment = filecomment;
	}
	public String getfRegdate() {
		return fRegdate;
	}
	public void setfRegdate(String fRegdate) {
		this.fRegdate = fRegdate;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
