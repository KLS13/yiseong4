package com.koreait.mvc18.dao;

import java.util.ArrayList;

import com.koreait.mvc18.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list();   // list 메소드명
	public BoardDto view(int bIdx);
	public void modify(String bName, String bTel, String bAddr, String bEmail, String bNote, int bIdx);
	public int write(String bName, String bTel, String bAddr, String bEmail, String bNote);
	public void delete(int bIdx);
	public ArrayList<BoardDto> dynamicQueryList(String query, String content);
}
