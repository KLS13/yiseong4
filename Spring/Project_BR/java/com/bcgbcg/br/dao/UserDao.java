package com.bcgbcg.br.dao;

import com.bcgbcg.br.dto.UserDto;

public interface UserDao {

	public UserDto loginIdPw(String uId_, String uPassword);
}
