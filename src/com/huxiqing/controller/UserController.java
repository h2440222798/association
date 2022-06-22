package com.huxiqing.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huxiqing.entity.Book;
import com.huxiqing.entity.Page;
import com.huxiqing.entity.User;
import com.huxiqing.service.IBookService;
import com.huxiqing.service.IUserService;
import com.huxiqing.service.impl.BookService;
import com.huxiqing.vo.BookBean;
import com.huxiqing.vo.JsonBean;
import com.huxiqing.vo.UserBean;


@Controller
public class UserController {
	@Autowired
	private IUserService userService;
	
	@RequestMapping(value="/userlist",method=RequestMethod.POST)
	public @ResponseBody List<User> allbook() {
		List<User> users = userService.findAlluser();
		return users;
	}
	
	@RequestMapping(value="/lockdelete",method=RequestMethod.POST)
	public @ResponseBody JsonBean deletelock(int userid) {
		
		userService.updatelock2(userid);
		
		JsonBean bean = new JsonBean();
		bean.setCode(1);
		return bean;
		
	}
	
	@RequestMapping(value="/userdelete",method=RequestMethod.POST)
	public @ResponseBody JsonBean deleteuser(int userid) {
		System.out.println(userid+"-----------------------------------------------");
		userService.deleteuser(userid);
		
		JsonBean bean = new JsonBean();
		bean.setCode(1);
		return bean;
		
	}
	@RequestMapping(value="/userchange",method=RequestMethod.POST)
	public @ResponseBody UserBean changeuser(int userid) {
		UserBean userBean = new UserBean();
		try {
			User user = userService.findById(userid);
			userBean.setUser(user);
			userBean.setCode(1);
		} catch (Exception e) {
			// TODO: handle exception
			userBean.setCode(0);
			userBean.setMsg(e);
			
		}
		return userBean;
		
	}
	@RequestMapping(value="/rootchange",method=RequestMethod.POST)
	public @ResponseBody JsonBean changeroot(int userId,String userName,String passWord,String email) {
		JsonBean bean = new JsonBean();
		try {
			userService.updateById(userId, userName, passWord, email);
			bean.setCode(1);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			bean.setCode(0);
			bean.setMsg(e);
		}
		return bean;
	}
	
}
