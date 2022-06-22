package com.huxiqing.service.impl;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huxiqing.dao.IBookDao;
import com.huxiqing.entity.Book;
import com.huxiqing.entity.User;
import com.huxiqing.service.IBookService;
@Service
public class BookService implements IBookService{

	@Autowired
	private IBookDao iBookDao;

	@Override
	public List<Book> findAllBook() {
		// TODO Auto-generated method stub
		List<Book> listbook = iBookDao.findAll();

		return listbook;
	}

	@Override
	public void deletebook(int id) {
		// TODO Auto-generated method stub
		iBookDao.deleteBookById(id);
	}

	@Override
	public Book findById(int id) {
		// TODO Auto-generated method stub
		Book book = iBookDao.findById(id);
		
		if(book == null)
		{
			throw new RuntimeException("查无次id");
		}
		return book;
	}

	@Override
	public void updateById(int id, String name, double price, int num) {
		// TODO Auto-generated method stub
		Book book = iBookDao.findById(id);
		
		if(book == null) {
			throw new RuntimeException("查无次id");
		}
	    book.setBookName(name);
	    book.setPrice(price);
	    book.setNum(num);
	  
	    iBookDao.updateBook(book);
	    //userDao.updateUser(user);
	}

	@Override
	public void insertOne(String bookName, double bookprice, String bookurl, int booknum) {
		// TODO Auto-generated method stub
		Book book = new Book();
		book.setBookName(bookName);
		book.setPrice(bookprice);
		book.setUrl(bookurl);
		book.setNum(booknum);
		  System.out.println(book.getBookName()+"------------------------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		    System.out.println(book.getPrice());
		    System.out.println(book.getUrl());
		    System.out.println(book.getNum());
		iBookDao.insertOne(book);
	}

	@Override
	public Book findByName(String bookName) {
		// TODO Auto-generated method stub
		Book book = iBookDao.findByName(bookName);
		
		if(book == null)
		{
			throw new RuntimeException("查无次用户");
		}
		return book;
	}
	
}
