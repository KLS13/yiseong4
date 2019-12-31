package com.koreait.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.MemberDao;
import com.koreait.dto.MemberDto;

public class XmlPropertyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// DB에서 List 읽어 들이기 -> XML (속성)형식의 String으로 변환 -> String 리턴
		
		List<MemberDto> list = MemberDao.getInstance().getMemberList();
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<members>");
		// <member idx="" id="" pw="" ... />
		for ( MemberDto dto : list ) {
			sb.append("<member");
			sb.append(" idx=\"" + dto.getmIdx() + "\"");
			sb.append(" id=\"" + dto.getmId() + "\"");
			sb.append(" pw=\"" + dto.getmPw() + "\"");
			sb.append(" name=\"" + dto.getmName() + "\"");
			sb.append(" email=\"" + dto.getmEmail() + "\"");
			sb.append(" phone=\"" + dto.getmPhone() + "\"");
			sb.append(" address=\"" + dto.getmAddr() + "\"");
			sb.append(" />");
		}
		sb.append("</members>");
		return sb.toString();

	}

}
