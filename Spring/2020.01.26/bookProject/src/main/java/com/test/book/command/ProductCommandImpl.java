package com.test.book.command;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.book.dao.ProductDao;
import com.test.book.dto.ProductDto;

@Service
public class ProductCommandImpl implements ProductCommand {

	@Inject
	private ProductDao dao;
	
	@Override
	public void product(ProductDto pd) throws Exception {
		dao.product(pd);

	}

	@Override
	public List<ProductDto> productlist() throws Exception {
		// TODO Auto-generated method stub
		return dao.productlist();
	}

}