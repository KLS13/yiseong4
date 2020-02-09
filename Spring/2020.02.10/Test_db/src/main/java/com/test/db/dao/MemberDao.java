package com.test.db.dao;

import java.util.ArrayList;

import com.test.db.dto.MemberDto;

public interface MemberDao {

	public ArrayList<MemberDto> memberList();
	public void memberJoin(String mName, String mPhone, String mAddr, String mJob);
	public MemberDto view(int mIdx);
	public void remove(int mIdx);
}
