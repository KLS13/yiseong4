package com.test.db.dto;

public class MemberDto {
	private String mName, mPhone, mAddr, mJob;
	private int mIdx;
	
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDto(String mName, String mPhone, String mAddr, String mJob, int mIdx) {
		super();
		this.mName = mName;
		this.mPhone = mPhone;
		this.mAddr = mAddr;
		this.mJob = mJob;
		this.mIdx = mIdx;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmAddr() {
		return mAddr;
	}

	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}

	public String getmJob() {
		return mJob;
	}

	public void setmJob(String mJob) {
		this.mJob = mJob;
	}

	public int getmIdx() {
		return mIdx;
	}

	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	
	
	
}