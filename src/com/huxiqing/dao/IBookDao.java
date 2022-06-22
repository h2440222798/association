package com.huxiqing.dao;

import java.util.List;

import com.huxiqing.entity.Book;

public interface IBookDao {
	public Book findInfo(Book book);
	public List<Book> findAll();
	public void deleteBookById(int id);
	public Book findById(int id);
	public void updateBook(Book book);
	public void insertOne(Book book);
	public Book findByName(String bookName);
}
