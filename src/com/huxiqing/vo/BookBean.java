package com.huxiqing.vo;

import java.util.List;

import com.huxiqing.entity.Book;
import com.huxiqing.entity.Page;

public class BookBean {
	private Page page;
	private List<Book> books;
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	
}
