package com.koreait.mvc05.dto;

public class BoardDto {

	// Field
	private String title;
	private String writer;
	private String content;
	
	// Constructor
	public BoardDto() {
		// TODO Auto-generated constructor stub
	}
	public BoardDto(String title, String writer, String content) {
		super();
		this.title = title;
		this.writer = writer;
		this.content = content;
	}
	
	// Method
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
