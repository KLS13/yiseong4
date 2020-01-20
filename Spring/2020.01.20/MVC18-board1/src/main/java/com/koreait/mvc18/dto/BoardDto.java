package com.koreait.mvc18.dto;

public class BoardDto {

	private String bName, bTel, bAddr, bEmail, bNote;
	private int bIdx;
	
	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDto(String bName, String bTel, String bAddr, String bEmail, String bNote, int bIdx) {
		super();
		this.bName = bName;
		this.bTel = bTel;
		this.bAddr = bAddr;
		this.bEmail = bEmail;
		this.bNote = bNote;
		this.bIdx = bIdx;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbTel() {
		return bTel;
	}

	public void setbTel(String bTel) {
		this.bTel = bTel;
	}

	public String getbAddr() {
		return bAddr;
	}

	public void setbAddr(String bAddr) {
		this.bAddr = bAddr;
	}

	public String getbEmail() {
		return bEmail;
	}

	public void setbEmail(String bEmail) {
		this.bEmail = bEmail;
	}

	public String getbNote() {
		return bNote;
	}

	public void setbNote(String bNote) {
		this.bNote = bNote;
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	
	
}
