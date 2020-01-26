package com.test.book.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.book.dto.ProductDto;

@Repository
public class ProductDaolmpl implements ProductDao {
	
	@Inject
	private SqlSession sql; 
	
	private static String namespace = "com.test.book.dao.mapper.product";

	@Override
	public void product(ProductDto pd) throws Exception {
		sql.insert(namespace + ".product", pd);
		
	}

	@Override
	public List<ProductDto> productlist() throws Exception {
		return sql.selectList(namespace + ".productlist");
	}

}