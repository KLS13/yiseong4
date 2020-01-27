package com.test.book.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.test.book.command.ProductCommand;
import com.test.book.dto.ProductDto;
import com.test.book.util.UploadFileUtils;

@Controller
public class productController {
	
	@Autowired
	private ProductCommand productCommand;
	
	@Inject
	ProductCommand productcommand;
	
	@RequestMapping("home")
	public String homePage(Model model) { 
		return "home";
	}
	
	@RequestMapping("pointPage")
	public String pointPage(Model model) { // 전달할 데이터가 있으면 model 을 잡음.
		return "point";
	}
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="productPage" , method = RequestMethod.POST)
	public String postGoods(ProductDto pd, MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);  
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		pd.setgImage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		
		productCommand.product(pd);
		
		return "redirect:home";
	}
	
	
	@RequestMapping("userPointPage")
	public String ProductList(Model model) throws Exception {
		
		List<ProductDto> list = productCommand.productlist();  // GoodsVO형태의 List형 변수 list 선언
		
		model.addAttribute("list", list);  // 변수 list의 값을 list 세션에 부여
		return "pointview";
	}
	
	@RequestMapping(value="ProductDes" , method = RequestMethod.GET) 	
	public String ProductDes(@RequestParam("gIdx") int gIdx , Model model) throws Exception {
	
		ProductDto pdto = productCommand.productDes(gIdx);
		model.addAttribute("pdto", pdto);
		
		return "productModify";
	}
	
	@RequestMapping(value="productModify", method = RequestMethod.POST)
	public String ProductModify(ProductDto pd) throws Exception {
		productCommand.ProductModify(pd);
		
		return "redirect:home";
	}
	
	@RequestMapping("ProductDelete")
	public String ProductDelete(@RequestParam("gIdx") int gIdx , Model model) throws Exception {
		
		productCommand.ProductDelete(gIdx);
		
		return "redirect:home";
	}
}	

