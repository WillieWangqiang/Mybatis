package com.webmall.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.webmall.pojo.ComputerUser;

@Repository
public interface ComputerUserMapper {
//	ע�����û�
	int addNewUser(@Param("compUser")ComputerUser compUser);
// ��ѯ�û��Ƿ��Ѵ���
	int selByName(@Param("comp_name") String name);
//  �����û�����ѯ�û���Ϣ
	ComputerUser selByUserName(@Param("comp_name") String name);
}
