package com.koreait.dto;

import java.sql.Date;

public class MemberDto {

	private Date mRegDate;
	private String mId, mPw, mName, mEmail, mPhone, mAddress;

	public MemberDto() {
		// TODO Auto-generated constructor stub
	}

	public Date getmRegDate() {
		return mRegDate;
	}
	public void setmRegDate(Date mRegDate) {
		this.mRegDate = mRegDate;
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
	public String getmAddress() {
		return mAddress;
	}
	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}
	
}