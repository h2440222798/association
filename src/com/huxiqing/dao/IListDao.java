package com.huxiqing.dao;

import java.util.List;

import com.huxiqing.entity.BList;
import com.huxiqing.entity.Book;

public interface IListDao {
	public List<BList> findAllList(String username);
	public void AddList(BList bList);
}
