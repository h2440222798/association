package com.huxiqing.vo;

import com.huxiqing.entity.Book;
import com.huxiqing.entity.User;

public class Book2Bean {
	private Book book;
	private Integer code;
	private Object msg;
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public Object getMsg() {
		return msg;
	}
	public void setMsg(Object msg) {
		this.msg = msg;
	}
}
