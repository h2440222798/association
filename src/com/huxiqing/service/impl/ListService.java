package com.huxiqing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huxiqing.dao.IBookDao;
import com.huxiqing.dao.IListDao;
import com.huxiqing.entity.BList;
import com.huxiqing.entity.Book;
import com.huxiqing.service.IListService;
@Service
public class ListService implements IListService{
	@Autowired
	private IListDao listDao;
	private IBookDao bookDao;
	@Override
	public List<BList> findListByName(String name) {
		// TODO Auto-generated method stub
		List<BList> bLists = listDao.findAllList(name);

		
		return bLists;
	}
	@Override
	public void addList(BList bList) {
		// TODO Auto-generated method stub
		listDao.AddList(bList);
		return;
	}

}
