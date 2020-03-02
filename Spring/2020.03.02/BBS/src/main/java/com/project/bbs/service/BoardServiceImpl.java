package com.project.bbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.bbs.dao.BoardDAO;
import com.project.bbs.domain.BoardVo;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public List<BoardVo> list() throws Exception {

		return dao.list();
	}

	@Override
	public void write(BoardVo vo) throws Exception {

		dao.write(vo);

	}

	@Override
	public BoardVo view(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(bno);
	}

	@Override
	public void modify(BoardVo vo) throws Exception {
		 dao.modify(vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		 return dao.count();
	}

	
	@Override
	public List<BoardVo> listPage(int displayPost, int postNum) throws Exception {
		
		 return dao.listPage(displayPost, postNum);
	}

	@Override
	public void viewCnt(int bno) throws Exception {

		dao.viewCnt(bno);
		
	}

}
