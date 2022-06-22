package com.huxiqing.service;

import java.util.List;

import com.huxiqing.entity.Book;
import com.huxiqing.entity.User;

public interface IUserService {
	public void login(String name,String password);
	public void updatelock(String name,String password);
	public List<User> findAlluser();
	public void updatelock2(int id);
	public void deleteuser(int id);
	public User findById(int id);
	public void updateById(int id,String name,String password,String email);
}
