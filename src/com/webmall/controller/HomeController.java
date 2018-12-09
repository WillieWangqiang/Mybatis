package com.webmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	private String url;
	@RequestMapping("home")
	public String toHome(HttpServletRequest req) {
		System.out.println(req.getSession().getAttribute("username"));
		url = "forward:comp_home.jsp";
		return url;
	}
}
