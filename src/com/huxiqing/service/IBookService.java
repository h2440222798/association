package com.huxiqing.service;

import java.util.List;

import com.huxiqing.entity.Book;

public interface IBookService {
	public List<Book> findAllBook();
	public void deletebook(int id);
	public Book findById(int id);
	public void updateById(int id,String name,double price,int num);
	public void insertOne(String bookName, double bookprice, String bookurl, int booknum);
	public Book findByName(String bookName);
}
