package com.korea.mvc17.dao;

import java.util.ArrayList;

import com.koreait.mvc17.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> list();   // list 메소드명
	public BoardDto view(int bIdx);
	public int modify(String bTitle, String bContent, int bIdx);
	public int write(String bWriter, String bTitle, String bContent);
	public int delete(int bIdx);
	
}
