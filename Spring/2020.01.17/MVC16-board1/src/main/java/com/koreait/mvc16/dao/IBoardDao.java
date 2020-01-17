package com.koreait.mvc16.dao;

import java.util.ArrayList;

import com.koreait.mvc16.dto.BoardDto;

public interface IBoardDao {

	//list
	public ArrayList<BoardDto> listDao();
	
	//view
	public BoardDto viewDao(int bIdx);  // viewDao 메소드명 mapper
	
	//modify
	public void modifyDao(String bTitle, String bContent, int bIdx);
	//매개변수로 전달한 3개의 값이 mapper에서는 #{param1}, #{param2}, #{param3}이 된다.
	
	//write
	public void writeDao(String bWriter, String bTitle, String bContent);
	
	//delete
	public void deleteDao(int bIdx);
}
