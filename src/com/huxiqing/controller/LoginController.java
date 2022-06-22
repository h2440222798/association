package com.huxiqing.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.HttpSessionMutexListener;

import com.huxiqing.service.IRootService;
import com.huxiqing.service.IUserService;
import com.huxiqing.service.impl.RootService;
import com.huxiqing.vo.JsonBean;
import javax.servlet.http.*;
@Controller
@SessionAttributes(value={"name"})
public class LoginController {
	
	@Autowired
	private IUserService userService;
	@Autowired
	private IRootService rootService;
	
	//用户登录
	@RequestMapping(value="/login",method=RequestMethod.POST)
	//注解将返回的对象自动转化为json格式的字符串
	public @ResponseBody JsonBean login(String userName,String passWord,HttpSession session) {
		//System.out.println("处理！");
		
		JsonBean bean = new JsonBean();
		try {
			userService.login(userName, passWord);
			bean.setCode(1);
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
			if(userName != null && !userName.isEmpty() && passWord != null && !passWord.isEmpty()) {
				userService.updatelock(userName, passWord);
			}
			
			bean.setCode(0);
			bean.setMsg(e.getMessage());
		}
		//session.removeAttribute("name");
		//session.invalidate();
		session.setAttribute("name", userName);
		System.out.println(session.getAttribute("name")+"-----------------------------------------------------------------");
		//model.addAttribute("name",userName);
		return bean;
	}
	//管理员登录
	@RequestMapping(value="/rootlogin",method=RequestMethod.POST)
	//注解将返回的对象自动转化为json格式的字符串
	public @ResponseBody JsonBean rootlogin(String rootName,String passWord) {
		//System.out.println("处理！");
		
		JsonBean bean = new JsonBean();
		
		try {
			rootService.login(rootName, passWord);
			bean.setCode(1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			bean.setCode(0);
			bean.setMsg(e.getMessage());
		}
		
		return bean;
	}
}
