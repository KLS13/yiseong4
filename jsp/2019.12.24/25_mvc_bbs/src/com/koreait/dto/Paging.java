package com.koreait.dto;

public class Paging {
	// Field
	private int totalRecord = 0;	// 전체 게시물의 개수
	private int recordPerPage = 3;	// 한 페이지에 표시할 게시물의 개수
	private int totalPage = 0;		// 전체 페이지의 개수
	private int nowPage = 1;		// 현재 페이지 번호
	private int begin = 0;			// 현재 페이지에 표시할 시작 게시물의 번호
	private int end = 0;			// 현재 페이지에 표시할 종료 게시물의 번호
	
	private int pagePerBlock = 3;	// 한 블록에 포함되는 페이지 수 ( 1블록 : 1  2  3 , 2블록 : 4  5  6 )
	private int beginPageOfBlock = 0;		// 블록의 시작 페이지
	private int endPageOfBlock = 0;		// 블록의 종료 페이지
	
	public int getBeginPageOfBlock() {
		return beginPageOfBlock;
	}
	public void setBeginPageOfBlock(int beginPageOfBlock) {
		this.beginPageOfBlock = beginPageOfBlock;
	}
	public int getEndPageOfBlock() {
		return endPageOfBlock;
	}
	public void setEndPageOfBlock(int endPageOfBlock) {
		this.endPageOfBlock = endPageOfBlock;
	}
	// Method
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getRecordPerPage() {
		return recordPerPage;
	}
	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	// 전체 페이지 저장하는 setTotalPage
	public void setTotalPage() {
		this.totalPage = this.totalRecord / this.recordPerPage;
		if ( this.totalRecord % this.recordPerPage != 0 ) {
			this.totalPage++;
		}
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	
}