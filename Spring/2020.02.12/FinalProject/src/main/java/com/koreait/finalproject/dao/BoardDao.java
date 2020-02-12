package com.koreait.finalproject.dao;

import java.util.ArrayList;

import com.koreait.finalproject.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list();
	public BoardDto view(int bIdx);
	public int modify(String bTitle, String bContent, int bIdx);
	public int write(String bWriter, String bTitle, String bContent);
	public int delete(int bIdx);
	
}
