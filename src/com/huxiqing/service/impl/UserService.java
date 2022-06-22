package com.huxiqing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huxiqing.dao.IUserDao;
import com.huxiqing.entity.Book;
import com.huxiqing.entity.User;
import com.huxiqing.service.IUserService;
@Service
public class UserService implements IUserService{
	@Autowired
	private IUserDao userDao;

	@Override
	public void login(String name, String password) {
		if(name == null || name.isEmpty()) {
			throw new RuntimeException("用户名为空。");
		}
		if(password == null || password.isEmpty()) {
			throw new RuntimeException("密码为空。");
		}
		User user = new User();
		user.setUserName(name);
		user.setPassword(password);
		//先判断用户是否存在
		try {
			User user3 = userDao.findUser(user);
			if(user3 == null) {
				throw new RuntimeException("该用户不存在！");
			}else {
				
				try {
					User user2 = userDao.findInfo(user);
					if(user2 == null) {
						Integer integer1 = user3.getIsLock();
						int cnt = integer1.intValue();
						if(cnt >= 2) {
							throw new RuntimeException("您的账号已被冻结，再输入也没啥用了，想解锁联系管理员吧！");
						}
						else {
							cnt = cnt+1;
							Integer integer2 = new Integer(cnt);
							user3.setIsLock(integer2);
							int cnt1 = 3-cnt;
							//System.out.println(1);
							//System.out.println(user3.getIsLock().intValue());
							String string1 = "密码输入错误，您还有"+cnt1+"机会！";
							//userDao.updateLock(user3);
							throw new RuntimeException(string1);
							//将封禁次数写回去
						}
					}
					else {
						
						System.out.println(user2.getIsLock());
						if(!user2.getIsLock().equals(0)) {
							//将封禁次数清零
							Integer integer = new Integer(0);
							user2.setIsLock(integer);
							userDao.updateLock(user2);
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					throw e;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updatelock(String name, String password) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUserName(name);
		user.setPassword(password);
		User user3 = userDao.findUser(user);
		if(user3!=null) {
			Integer integer1 = user3.getIsLock();
			int cnt = integer1.intValue();
			cnt = cnt+1;
			Integer integer2 = new Integer(cnt);
			user3.setIsLock(integer2);
			userDao.updateLock(user3);
		}
	}

	@Override
	public List<User> findAlluser() {
		List<User> listuser = userDao.findAlluser();
		
		return listuser;
	}

	@Override
	public void updatelock2(int id) {
		// TODO Auto-generated method stub
		userDao.updateLock2(id);
	}
	

	@Override
	public void deleteuser(int id) {
		// TODO Auto-generated method stub
		User user = userDao.findById(id);
		String userName = user.getUserName();

		userDao.deleteByName(userName);		
	}

	@Override
	public User findById(int id) {
		User user = userDao.findById(id);
		if(user == null)
		{
			throw new RuntimeException("查无次id");
		}
		return user;
	}

	@Override
	public void updateById(int id, String name, String password, String email) {
		// TODO Auto-generated method stub
		User user = userDao.findById(id);
		if(user == null) {
			throw new RuntimeException("查无次id");
		}
		user.setUserName(name);
		user.setPassword(password);
		user.setEmail(email);
		userDao.updateUser(user);
	}
	
}
