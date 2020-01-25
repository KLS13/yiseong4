package com.test.book.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.test.book.command.ProductCommand;
import com.test.book.dao.ProductDao;
import com.test.book.dto.ProductDto;
import com.test.book.util.UploadFileUtils;

@Controller
public class productController {
	
	@Autowired
	private SqlSession sqlSession; // DI
	private ProductCommand productCommand;
	private ProductDao dao = null;
	
	@RequestMapping("pointPage")
	public String pointPage(Model model) { // 전달할 데이터가 있으면 model 을 잡음.
		return "point";
	}
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="pointPage" , method = RequestMethod.POST)
	public String postGoods(ProductDto pd, MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		pd.setGlmage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		
		dao.product(pd);
		
		return "redirect:point";
	}
}