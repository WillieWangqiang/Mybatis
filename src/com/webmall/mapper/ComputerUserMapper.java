package com.webmall.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.webmall.pojo.ComputerUser;

@Repository
public interface ComputerUserMapper {
//	注册新用户
	int addNewUser(@Param("compUser")ComputerUser compUser);
// 查询用户是否已存在
	int selByName(@Param("comp_name") String name);
//  根据用户名查询用户信息
	ComputerUser selByUserName(@Param("comp_name") String name);
}
