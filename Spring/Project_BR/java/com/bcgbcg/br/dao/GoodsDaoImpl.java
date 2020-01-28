package com.bcgbcg.br.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bcgbcg.br.dto.GoodsDto;

@Repository
public class GoodsDaoImpl implements GoodsDao {
	
	@Inject
	private SqlSession sql; 
	
	private static String namespace = "com.bcgbcg.br.dao.mapper.goods";

	@Override
	public void Goods(GoodsDto gdto) throws Exception {
		sql.insert(namespace + ".goods", gdto);
		
	}

	@Override
	public List<GoodsDto> Goodslist() throws Exception {
		return sql.selectList(namespace + ".goodslist");
	}

	@Override
	public GoodsDto GoodsDes(int gIdx) throws Exception {
		
		return sql.selectOne(namespace + ".goodsDes", gIdx);
	}

	@Override
	public void GoodsModify(GoodsDto gdto) throws Exception {
		
		sql.update(namespace +  ".goodsModify", gdto);		
	}

	@Override
	public void GoodsDelete(int gIdx) throws Exception {
		sql.delete(namespace + ".goodsDelete", gIdx);
	}

	@Override
	public void GoodsSoldOut() throws Exception {
		sql.update(namespace + ".goodsSoldOut");
		
	}

	@Override
	public GoodsDto GoodsBuyMove(int gIdx) throws Exception {
		return sql.selectOne(namespace + ".goodsBuyMove", gIdx);
		
	}
	
	

}