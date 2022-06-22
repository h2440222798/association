package com.huxiqing.vo;

import java.util.List;

import com.huxiqing.entity.BList;
import com.huxiqing.entity.Book;
import com.huxiqing.entity.Page;

public class ListBean {
	private Page page;
	private List<BList> lists;
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	private List<Book> books;
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public List<BList> getLists() {
		return lists;
	}
	public void setLists(List<BList> lists) {
		this.lists = lists;
	}

}
