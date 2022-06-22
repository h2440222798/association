package com.huxiqing.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huxiqing.service.IUserService;
import com.huxiqing.service.IregisterService;
import com.huxiqing.vo.JsonBean;

@Controller
@SessionAttributes(value={"name"})
public class RegisterController {
	
	@Autowired
	private IregisterService iregisterService;
	
	//注解将返回的对象自动转化为json格式的字符串
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public @ResponseBody JsonBean register(String userName,String passWord,String email,HttpSession session) {
//		System.out.println(userName);
//		System.out.println(passWord);
//		System.out.println(email);
//		System.out.println(session.getAttribute("name"));
		JsonBean bean = new JsonBean();
		session.removeAttribute("name");
		try {
			iregisterService.register(userName, passWord, email);
			bean.setCode(1);
			session.setAttribute("name", userName);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			bean.setCode(0);
			bean.setMsg(e.getMessage());
		}
		
		
		return bean;
	}
}
