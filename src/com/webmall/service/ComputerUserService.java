package com.webmall.service;

import org.apache.ibatis.annotations.Param;

import com.webmall.pojo.ComputerUser;

public interface ComputerUserService {
//	���û��Ѵ���
	int COMP_NAME_HAS = -1;
	int addNewUser(ComputerUser compUser);
	int selByName(String name);
	ComputerUser selByUserName(String name);
}
