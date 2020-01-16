package com.koreait.mvc12.dto;

import java.sql.Timestamp;

public class BoardDto {

	// Field
	private int bIdx;
	private String bWriter;
	private String bTitle;
	private String bContent;
	private Timestamp bDate;
	
	// Constructor
	public BoardDto() {
		// TODO Auto-generated constructor stub
	}
	public BoardDto(int bIdx, String bWriter, String bTitle, String bContent, Timestamp bDate) {
		super();
		this.bIdx = bIdx;
		this.bWriter = bWriter;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
	}
	
	// Method
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Timestamp getbDate() {
		return bDate;
	}
	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}
		
}
