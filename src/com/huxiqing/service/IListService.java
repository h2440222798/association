package com.huxiqing.service;

import java.util.List;

import com.huxiqing.entity.BList;

public interface IListService {
	public List<BList> findListByName(String name);
	public void addList(BList bList);
}
