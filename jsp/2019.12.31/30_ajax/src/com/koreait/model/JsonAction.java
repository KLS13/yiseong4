package com.koreait.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.MemberDao;
import com.koreait.dto.MemberDto;

public class JsonAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// DB에서 List 읽어 들이기 -> JSON 형식의 String으로 변환 -> String 리턴
		
		List<MemberDto> list = MemberDao.getInstance().getMemberList();

		// sb : [{"idx":1,"id":"id01","pw":"1111","name":"홍길동","email":"id01@home.com","phone":"010-1111-1111","addr":"seoul"},{...}]
		StringBuffer sb = new StringBuffer();
		
		sb.append("[");
		for ( MemberDto dto : list ) {
			sb.append("{");
			sb.append("\"idx\":" + dto.getmIdx() + ",");
			sb.append("\"id\":\"" + dto.getmId() + "\",");
			sb.append("\"pw\":\"" + dto.getmPw() + "\",");
			sb.append("\"name\":\"" + dto.getmName() + "\",");
			sb.append("\"email\":\"" + dto.getmEmail() + "\",");
			sb.append("\"phone\":\"" + dto.getmPhone() + "\",");
			sb.append("\"addr\":\"" + dto.getmAddr() + "\"");
			sb.append("},");
		}
		// 마지막에 포함된 쉼표 제거 : substring(0, sb.toString().length() - 1)
		String result = sb.toString().substring(0, sb.toString().length() - 1) + "]";
		return result;
		
	}

}









