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
		return dao.productlist();
	}

	@Override
	public ProductDto productDes(int gIdx) throws Exception {
	
		return dao.productDes(gIdx);
	}

	@Override
	public void ProductModify(ProductDto pd) throws Exception {
		dao.ProductModify(pd);
	}

	@Override
	public void ProductDelete(int gIdx) throws Exception {
		dao.ProductDelete(gIdx);
	}
}