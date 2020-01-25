package com.test.book.dto;

import java.sql.Date;

public class ProductDto {
	private int gIdx,gQuantity,gPrice;
	private Date gDate;
	private String gName, glmage;
	
	public ProductDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductDto(int gIdx, int gQuantity, int gPrice, Date gDate, String gName, String glmage) {
		super();
		this.gIdx = gIdx;
		this.gQuantity = gQuantity;
		this.gPrice = gPrice;
		this.gDate = gDate;
		this.gName = gName;
		this.glmage = glmage;
	}

	public int getgIdx() {
		return gIdx;
	}

	public void setgIdx(int gIdx) {
		this.gIdx = gIdx;
	}

	public int getgQuantity() {
		return gQuantity;
	}

	public void setgQuantity(int gQuantity) {
		this.gQuantity = gQuantity;
	}

	public int getgPrice() {
		return gPrice;
	}

	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}

	public Date getgDate() {
		return gDate;
	}

	public void setgDate(Date gDate) {
		this.gDate = gDate;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getGlmage() {
		return glmage;
	}

	public void setGlmage(String glmage) {
		this.glmage = glmage;
	}
	
	
}
