package com.huxiqing.entity;

import java.util.Date;

public class BList {
	private Integer id;
	private String username;
	private String bookname;
	private double bookprice;
	private Integer booknum;
	private Date time;
	private String stat;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public double getBookprice() {
		return bookprice;
	}
	public void setBookprice(double bookprice) {
		this.bookprice = bookprice;
	}
	public Integer getBooknum() {
		return booknum;
	}
	public void setBooknum(Integer booknum) {
		this.booknum = booknum;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	
}
