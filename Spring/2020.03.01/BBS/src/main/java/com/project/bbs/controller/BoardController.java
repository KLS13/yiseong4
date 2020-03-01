package com.project.bbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.bbs.domain.BoardVo;
import com.project.bbs.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	BoardService service;

 @RequestMapping(value = "/list", method = RequestMethod.GET)
 public void getList(Model model) throws Exception {
	  
	  List<BoardVo> list = null;
	  list = service.list();
	  model.addAttribute("list", list);
	 }
	}