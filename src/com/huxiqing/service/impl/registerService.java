package com.huxiqing.service.impl;

import java.util.Date;

import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huxiqing.dao.IUserDao;
import com.huxiqing.entity.User;
import com.huxiqing.service.IregisterService;
@Service
public class registerService implements IregisterService{
	
	@Autowired
	private IUserDao userDao;
	
	@Override
	public void register(String name, String password,String email) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUserName(name);
		user.setPassword(password);
		user.setEmail(email);
		Integer integer = new Integer(0);
		user.setIsLock(integer);
		Date date = new Date();
		user.setRegDate(date);
//		System.out.println(user.getUserName());
//		System.out.println(user.getPassword());
//		System.out.println(user.getEmail());
//		System.out.println(user.getRegDate());
//		System.out.println(user.getIsLock());
//		System.out.println("---------------------");
		User user1 = userDao.findUser(user);
		if(user1 == null)
		{
			userDao.insertUser(user);
		}
		else
		{
			throw new RuntimeException("该用户已存在！");
		}
		
		
	}

}
