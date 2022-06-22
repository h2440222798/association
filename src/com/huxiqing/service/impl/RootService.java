package com.huxiqing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huxiqing.dao.IRootDao;
import com.huxiqing.entity.Root;
import com.huxiqing.service.IRootService;
@Service
public class RootService implements IRootService{
	@Autowired
	private IRootDao rootdao;
	@Override
	public void login(String name, String password) {
		// TODO Auto-generated method stub
		if(name == null || name.isEmpty()) {
			throw new RuntimeException("�û���Ϊ�ա�");
		}
		if(password == null || password.isEmpty()) {
			throw new RuntimeException("����Ϊ�ա�");
		}
		System.out.println(name);
		System.out.println(password);
		Root root1 = new Root();
		root1.setRootName(name);
		root1.setPassword(password);
		Root root = rootdao.findRoot(root1);
		if(root==null) {
			throw new RuntimeException("�˺Ż����벻��");
		}else {
			
		}
	}

}
