package com.webmall.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.webmall.pojo.ComputerUser;
import com.webmall.service.impl.ComputerUserServiceImpl;

public class Test {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("application.xml");
		ComputerUserServiceImpl computerUserServiceImpl = ac.getBean("computerUserServiceImpl",ComputerUserServiceImpl.class);
		ComputerUser compUser = new ComputerUser();
		compUser.setComp_name("测试用户");
		compUser.setComp_nicke_name("测试用户昵称");
		compUser.setComp_passwrod("csyh123");
		compUser.setComp_email("csyhyx@163.com");
		int resutler = computerUserServiceImpl.addNewUser(compUser);
		if(resutler > 0) {
			System.out.println("测试注册成功！");
		}
	}
}
