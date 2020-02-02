package com.bcgbcg.br.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bcgbcg.br.command.GoodsCommand;
import com.bcgbcg.br.dto.GoodsDto;
import com.bcgbcg.br.dto.UserDto;
import com.bcgbcg.br.util.UploadFileUtils;

@Controller
public class GoodsController {

	@Autowired
	private GoodsCommand goodsCommand;
	
	@RequestMapping("home")
	public String homePage(Model model) { 
		return "home";
	}
	
	@RequestMapping("goodsPayStateMent")
	public String goodsPayStateMent(Model model) { 
		return "goodsPayStateMent";
	}
	
	@RequestMapping("adminGoodsPage")
	public String pointPage(Model model) { // 전달할 데이터가 있으면 model 을 잡음.
		return "adminGoods";
	}
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="GoodsPostPage" , method = RequestMethod.POST)
	public String postGoods(GoodsDto gdto, MultipartFile file) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file != null) {
			 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);  
			} else {
			 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			}

		gdto.setgImage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		
		goodsCommand.Goods(gdto);
		
		return "redirect:home";
	}
	
	@RequestMapping("goodsBuyCheck")
	public String GoodsBuyCheck(Model model) {
		return "buyFinal";
	}
	
	@RequestMapping("adminGoodsViewPage")
	public String GoodsList(Model model) throws Exception {
		
		List<GoodsDto> list = goodsCommand.Goodslist();  // GoodsVO형태의 List형 변수 list 선언
		goodsCommand.GoodsSoldOut();
		
		model.addAttribute("list", list);  // 변수 list의 값을 list 세션에 부여
		return "adminGoodsView";
	}
	
	@RequestMapping("goodsViewPage")
	public String GoodsUserList(Model model) throws Exception {
		
		List<GoodsDto> list = goodsCommand.Goodslist();  // GoodsVO형태의 List형 변수 list 선언
		goodsCommand.GoodsSoldOut();
		
		model.addAttribute("list", list);  // 변수 list의 값을 list 세션에 부여
		return "goodsView";
	}
	
	@RequestMapping(value="adminGoodsModifyPage" , method = RequestMethod.GET) 	
	public String GoodsDes(@RequestParam("gIdx") int gIdx , Model model) throws Exception {
	
		GoodsDto gdto = goodsCommand.GoodsDes(gIdx);
		model.addAttribute("gdto", gdto);
		
		return "adminGoodsModify";
	}
	
	@RequestMapping(value="adminModifyRegPage", method = RequestMethod.POST)
	public String GoodsModify(GoodsDto gdto) throws Exception {
		goodsCommand.GoodsModify(gdto);
		
		return "redirect:home";
	}
	
	@RequestMapping("adminGoodsDeletePage")
	public String GoodsDelete(@RequestParam("gIdx") int gIdx , Model model) throws Exception {
		
		goodsCommand.GoodsDelete(gIdx);
		
		return "redirect:home";
	}
	
	@RequestMapping("goodsBuyPage")
	public String GoodsBuyDes(@RequestParam("gIdx") int gIdx , Model model) throws Exception {

		GoodsDto gdto = goodsCommand.GoodsBuyMove(gIdx);
		model.addAttribute("gdto", gdto);
		
		return "goodsBuyDes";
	}
	
	@RequestMapping("goodsPayPage")
	public String GoodsPayPage(@RequestParam("gIdx") int gIdx , Model model) throws Exception {

		GoodsDto gdto = goodsCommand.GoodsPayMove(gIdx);
		model.addAttribute("gdto", gdto);
		
		return "goodsPayDes";
	}
	
	@RequestMapping(value="payDecision", method = RequestMethod.POST)
	public String PayDecision(@RequestParam("gIdx") int gIdx,
							  @RequestParam("gPrice") int gPrice,
							  @RequestParam("uIdx") int uIdx,
							  HttpServletRequest request,
							  Model model) throws Exception {
		//유저 세션 초기화 필요
			
		goodsCommand.PayDecision(gIdx); // 재고수량 1개 빠짐.
		goodsCommand.PayDecision_User(gPrice, uIdx); // UserDto 와 dao command 수정
		GoodsDto gdto = goodsCommand.GoodsDes(gIdx); // 
		
		model.addAttribute("gdto", gdto);
		UserDto loginDto = new UserDto();
	
		HttpSession session = request.getSession(); // 현재 세션 정보를 가져옴.
		session.removeAttribute("loginDto");
		loginDto = goodsCommand.loginUpdate(uIdx);
		session.setAttribute("loginDto", loginDto);
		
		return "redirect:goodsPayStateMent";
	}
}