package com.bcgbcg.br.command;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bcgbcg.br.dao.GoodsDao;
import com.bcgbcg.br.dto.GoodsDto;

@Service
public class GoodsCommandImpl implements GoodsCommand {
	
	@Inject
	private GoodsDao dao;
	
	@Override
	public void Goods(GoodsDto gdto) throws Exception {
		dao.Goods(gdto);
	}
	@Override
	public List<GoodsDto> Goodslist() throws Exception {
		return dao.Goodslist();
	}
	@Override
	public GoodsDto GoodsDes(int gIdx) throws Exception {
	
		return dao.GoodsDes(gIdx);
	}
	@Override
	public void GoodsModify(GoodsDto gdto) throws Exception {
		dao.GoodsModify(gdto);
	}
	@Override
	public void GoodsDelete(int gIdx) throws Exception {
		dao.GoodsDelete(gIdx);
	}
	@Override
	public void GoodsSoldOut() throws Exception {
		dao.GoodsSoldOut();
		
	}
	@Override
	public GoodsDto GoodsBuyMove(int gIdx) throws Exception {
		return dao.GoodsBuyMove(gIdx);
		
	}
	@Override
	public GoodsDto GoodsPayMove(int gIdx) throws Exception {
		return dao.GoodsBuyMove(gIdx);
	}
}