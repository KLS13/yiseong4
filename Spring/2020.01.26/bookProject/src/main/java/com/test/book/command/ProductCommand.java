package com.test.book.command;

import java.util.List;

import com.test.book.dto.ProductDto;

public interface ProductCommand {
	
	public void product(ProductDto pd) throws Exception;
	
	public List<ProductDto> productlist() throws Exception;
	
	public ProductDto productDes(int gIdx) throws Exception;
	
	public void ProductModify(ProductDto pd) throws Exception;
	
	public void ProductDelete(int gIdx) throws Exception;
}
