package com.koreait.dto;

import java.sql.Date;

public class BoardDto {

	private int bIdx, bHit, bRef, bStep, bDepth, dDelete;
	private Date bPostDate;
	private String mId, bTitle, bContent, bPw, bIp;

	public BoardDto() {

	}
	
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public int getbRef() {
		return bRef;
	}
	public void setbRef(int bRef) {
		this.bRef = bRef;
	}
	public int getbStep() {
		return bStep;
	}
	public void setbStep(int bStep) {
		this.bStep = bStep;
	}
	public int getbDepth() {
		return bDepth;
	}
	public void setbDepth(int bDepth) {
		this.bDepth = bDepth;
	}
	public int getdDelete() {
		return dDelete;
	}
	public void setdDelete(int dDelete) {
		this.dDelete = dDelete;
	}
	public Date getbPostDate() {
		return bPostDate;
	}
	public void setbPostDate(Date bPostDate) {
		this.bPostDate = bPostDate;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
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
	public String getbPw() {
		return bPw;
	}
	public void setbPw(String bPw) {
		this.bPw = bPw;
	}
	public String getbIp() {
		return bIp;
	}
	public void setbIp(String bIp) {
		this.bIp = bIp;
	}

}