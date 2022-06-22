package com.huxiqing.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huxiqing.entity.Page;
import com.huxiqing.vo.JsonBean;

@Controller
public class LoginoutController {
	@RequestMapping(value="/loginout",method=RequestMethod.POST)
	public @ResponseBody JsonBean loginout(HttpSession session) {
		session.removeAttribute("name");
		JsonBean bean = new JsonBean();
		System.out.println(session.getAttribute("name"));
		bean.setCode(1);
		return bean;
	}
	
	@RequestMapping(value="/pagec",method=RequestMethod.POST)
	public @ResponseBody Page pagec() {
		Page page = new Page();
		page.setTotalPage(9);
		page.setTotalSize(300);
		return page;
	}
}
