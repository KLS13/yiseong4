package com.bcgbcg.br.dao;

import com.bcgbcg.br.dto.CommentDto;

public interface CommentDao {
	
	public int commentWrite(int qIdx, String cContent);
	public CommentDto commentView(int qIdx);
}
