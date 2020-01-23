package com.koreait.mvc20.dao;

import java.util.ArrayList;

import com.koreait.mvc20.dto.ImageDto;

public interface ImageDao {
	
	public ArrayList<ImageDto> imageList();
	public int imageInsert(String fWriter, String filecomment, String filename);
	
}
