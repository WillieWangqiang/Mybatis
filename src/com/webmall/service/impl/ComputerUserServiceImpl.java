package com.webmall.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webmall.mapper.ComputerUserMapper;
import com.webmall.pojo.ComputerUser;
import com.webmall.service.ComputerUserService;

@Service
public class ComputerUserServiceImpl implements ComputerUserService {
	@Resource
	private ComputerUserMapper computerUserMapper;

	@Override
	public int addNewUser(ComputerUser compUser) {
		int resutler = computerUserMapper.addNewUser(compUser);
		return resutler;
	}


	@Override
	public int selByName(String name) {
		int selNumber = computerUserMapper.selByName(name);
		return selNumber;
	}


	@Override
	public ComputerUser selByUserName(String name) {
		ComputerUser compUser = computerUserMapper.selByUserName(name);
		return compUser;
	}

}
