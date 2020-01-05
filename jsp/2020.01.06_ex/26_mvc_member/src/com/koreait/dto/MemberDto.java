package com.koreait.dto;

import java.sql.Date;

public class MemberDto {
	private int mIdx, mPoint;
	private String mId, mPw, mName, mEmail, mPhone; 
	private Date mReg_date;
	
	public MemberDto() { }
	
	public int getmPoint() {
		return mPoint;
	}

	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}

	public int getmIdx() {
		return mIdx;
	}

	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public Date getmReg_date() {
		return mReg_date;
	}

	public void setmReg_date(Date mReg_date) {
		this.mReg_date = mReg_date;
	}
	
	
}
