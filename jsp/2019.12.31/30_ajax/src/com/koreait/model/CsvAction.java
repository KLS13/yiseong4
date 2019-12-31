package com.koreait.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.MemberDao;
import com.koreait.dto.MemberDto;

public class CsvAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// DB에서 List 읽어 들이기 -> CSV형식의 String으로 변환 -> String 리턴
		List<MemberDto> list = MemberDao.getInstance().getMemberList();
		StringBuffer sb = new StringBuffer();
		for ( MemberDto dto : list ) {
			sb.append(dto.getmIdx() + ",");
			sb.append(dto.getmId() + ",");
			sb.append(dto.getmName() + ",");
			sb.append(dto.getmEmail() + ",");
			sb.append(dto.getmPhone() + ",");
			sb.append(dto.getmAddr() + "/");
		}
		String result = sb.toString().substring(0, sb.toString().length() - 1);
		return result;
	}

}
