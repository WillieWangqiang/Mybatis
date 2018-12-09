package com.webmall.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webmall.pojo.ComputerUser;
import com.webmall.service.ComputerUserService;

@Controller
public class LoggerController {
	@Resource
	private ComputerUserService computerUserServiceImpl;
//	��ת��¼ҳ��
	@RequestMapping("toLog")
	public String toLog() {
		return "comp_log";
	}
//	�˳��˻�
	@RequestMapping("outLog")
	public String outLogUser(HttpServletRequest req) {
		HttpSession session= req.getSession();
		if(session!=null) {
			//�˳��˻�
			session.setAttribute("username", null);
		}
		return "comp_log";
	}
//	��¼ҳ����֤
	@RequestMapping("log")
	public String logUser(ComputerUser compUser,String comp_identify_code,HttpServletRequest req) {
		String toUrl = "";
		ComputerUser compUserReal = null;
		if(compUser.getComp_name() != null) {
			if(compUser.getComp_passwrod()!=null) {
				compUserReal = computerUserServiceImpl.selByUserName(compUser.getComp_name());
				System.out.println(compUserReal);
			}
		}
		if(compUserReal!=null) {
			if(compUserReal.getComp_passwrod().equals(compUser.getComp_passwrod())) {
				HttpSession session = req.getSession();
				session.setAttribute("username", compUserReal.getComp_nicke_name());
				toUrl = "redirect:home";
			}else {
				toUrl="comp_log";
			}
		}
		return toUrl;
	}
//	������֤��
	@RequestMapping("toIdentify")
	@ResponseBody
	public void createIdentify(HttpServletResponse res) {
//		����ͼƬ����
		BufferedImage image = new BufferedImage(200,100,BufferedImage.TYPE_INT_RGB);
//		����һ������
		Graphics2D gra = image.createGraphics();
//		��������Ϊ��ɫ
		gra.setColor(Color.WHITE);
//		�����������԰�ɫΪ����
		gra.fillRect(0,0,200,100);
//		��ȡ52����Сд��ĸ�Լ�0-9���ּ���
		List<String> codeList = new ArrayList<String>();
		for(int i=0;i<62;i++) {
			if(i<26) {
				codeList.add(String.valueOf((char)(65+i)));
			}else if(25<i && i<52){
				codeList.add(String.valueOf((char)(71+i)));
			}else {
				codeList.add(String.valueOf(i-52));
			}
		}

//		���û������壬��С
		gra.setFont(new Font("����",Font.BOLD,50));
//		����������ɫ����
		Color[] colorList = new Color[] {Color.BLACK,Color.RED,Color.GREEN,Color.BLUE,Color.PINK,Color.YELLOW};
//		��ȡ��λ�����֤��
		for(int i=0;i < 4;i++) {
			int indexCode = (int) (Math.random()*codeList.size());
			int indexColor = (int) (Math.random()*colorList.length);
			String str = codeList.get(indexCode);
//			�����ַ�������ɫ
			gra.setColor(colorList[indexColor]);
			gra.drawString(str, i*45, 70);
		}
	//	System.out.println(codeList);
		try {
			ServletOutputStream outputStream  = res.getOutputStream();
			ImageIO.write(image, "jpg", outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
