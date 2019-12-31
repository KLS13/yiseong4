package com.koreait.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.MemberDao;
import com.koreait.dto.MemberDto;

public class XmlTagAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//DB에서 List 읽어 들이기 --> XML (태그) 형식의 String 으로 변환 --> String
		
		List<MemberDto> list = MemberDao.getInstance().getMemberList();
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<members>");
		for(MemberDto dto : list) {
			sb.append("<member>");
			sb.append("<idx>" + dto.getmIdx() + "</idx>");
			sb.append("<id>" + dto.getmId()+ "</id>");
			sb.append("<pw>" + dto.getmPw()+ "</pw>");
			sb.append("<name>" + dto.getmName()+ "</name>");
			sb.append("<email>" + dto.getmEmail()+ "</email>");
			sb.append("<phone>" + dto.getmPhone()+ "</phone>");
			sb.append("<address>" + dto.getmAddr()+ "</address>");
			sb.append("</member>");
		}
		sb.append("</members>");
		return sb.toString();
	}

}
