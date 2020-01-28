package com.bcgbcg.br.dto;

import java.sql.Date;

public class GoodsDto {

	private int gIdx,gQuantity,gPrice, gState;
	private Date gDate;
	private String gName, gImage, gDetail;
	
	
	public GoodsDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodsDto(int gIdx, int gQuantity, int gPrice, int gState, Date gDate, String gName, String gImage,
			String gDetail) {
		super();
		this.gIdx = gIdx;
		this.gQuantity = gQuantity;
		this.gPrice = gPrice;
		this.gState = gState;
		this.gDate = gDate;
		this.gName = gName;
		this.gImage = gImage;
		this.gDetail = gDetail;
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

	public int getgState() {
		return gState;
	}

	public void setgState(int gState) {
		this.gState = gState;
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

	public String getgImage() {
		return gImage;
	}

	public void setgImage(String gImage) {
		this.gImage = gImage;
	}

	public String getgDetail() {
		return gDetail;
	}

	public void setgDetail(String gDetail) {
		this.gDetail = gDetail;
	}
}