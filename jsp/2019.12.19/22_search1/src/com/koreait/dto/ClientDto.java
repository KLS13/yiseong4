package com.koreait.dto;

public class ClientDto {
	private int cId,cEmpId;
	private String cName,cAddr,cSSn;
	
	public ClientDto() { }

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getcEmpId() {
		return cEmpId;
	}

	public void setcEmpId(int cEmpId) {
		this.cEmpId = cEmpId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcAddr() {
		return cAddr;
	}

	public void setcAddr(String cAddr) {
		this.cAddr = cAddr;
	}

	public String getcSSn() {
		return cSSn;
	}

	public void setcSSn(String cSSn) {
		this.cSSn = cSSn;
	}
	
	
}
