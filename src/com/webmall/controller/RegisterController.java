package com.webmall.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webmall.pojo.ComputerUser;
import com.webmall.service.impl.ComputerUserServiceImpl;

@Controller
public class RegisterController {
	@RequestMapping("reg")
	public String regNewUser(ComputerUser compUser) {
		String toUrl;
		int resutle = 0 ;
		int selNumber =0 ;
		String name=compUser.getComp_name();
		ApplicationContext ac = new ClassPathXmlApplicationContext("application.xml");
		ComputerUserServiceImpl cusi = ac.getBean("computerUserServiceImpl",ComputerUserServiceImpl.class);
		if(name!=null) {
			selNumber = cusi.selByName(compUser.getComp_name());
			if(selNumber==0 ) {
				resutle = cusi.addNewUser(compUser);
			}else {
				resutle = cusi.COMP_NAME_HAS;
			}
		}
		if( resutle > 0) {
			toUrl = "redirect:/comp_home.jsp";
		}else {
			if(resutle == cusi.COMP_NAME_HAS) {
				toUrl = "error";
			}else {
				toUrl = "comp_register";
			}
		}
		return toUrl;
	}
	
	@RequestMapping("toReg")
	public String toRegister () {
		return "comp_register";
	}
}
