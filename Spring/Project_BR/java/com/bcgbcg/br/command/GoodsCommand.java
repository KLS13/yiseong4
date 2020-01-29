package com.bcgbcg.br.command;

import java.util.List;

import com.bcgbcg.br.dto.GoodsDto;

public interface GoodsCommand {
	
	public void Goods(GoodsDto gdto) throws Exception;	
	public List<GoodsDto> Goodslist() throws Exception;	
	public GoodsDto GoodsDes(int gIdx) throws Exception;	
	public void GoodsModify(GoodsDto pd) throws Exception;	
	public void GoodsDelete(int gIdx) throws Exception;	
	public void GoodsSoldOut() throws Exception;	
	public GoodsDto GoodsBuyMove(int gIdx) throws Exception;
	public GoodsDto GoodsPayMove(int gIdx) throws Exception;
	
	
}