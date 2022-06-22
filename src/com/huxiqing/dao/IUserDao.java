package com.huxiqing.dao;

import java.util.List;

import com.huxiqing.entity.User;

public interface IUserDao {
	public User findInfo(User user);
	public User findUser(User user);
	public User findById(int id);
	public void updateLock(User user);
	public void updateLock2(int id);
	public void insertUser(User user);

	public List<User> findAlluser();
	
	public void deleteByName(String userName);
	
	public void updateUser(User user);
}
