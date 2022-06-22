package com.huxiqing.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huxiqing.entity.BList;
import com.huxiqing.entity.Book;
import com.huxiqing.entity.Page;
import com.huxiqing.entity.User;
import com.huxiqing.service.IBookService;
import com.huxiqing.service.IListService;
import com.huxiqing.service.impl.BookService;
import com.huxiqing.vo.Book2Bean;
import com.huxiqing.vo.BookBean;
import com.huxiqing.vo.JsonBean;
import com.huxiqing.vo.UserBean;


@Controller
public class BookController {
	@Autowired
	private IBookService bookService;
	@Autowired
	private IListService listService;
	@RequestMapping(value="/ListServelet",method=RequestMethod.POST)
	public @ResponseBody BookBean allbook(Integer Num) {
//		System.out.println(Num+"-------------------------------------------------------------------------------");
		 int num = Num.intValue();
		BookBean bookBean = new BookBean();
		List<Book> bookds = bookService.findAllBook();
		Page page = new Page();
		int sz = bookds.size();
		page.setTotalSize(sz);
		
		int x;
		if(sz % 4 == 0)	{
			x = sz/4;
		}
		else{
		  x = sz/4+1;	
		}
		page.setTotalPage(x);
		List<Book> bookds1 = new ArrayList<Book>();
		for(int i = (num-1)*4 ; i <(num-1)*4+4;i++)
		{
			if(i<sz) {
				bookds1.add(bookds.get(i));
			}
		}
		bookBean.setBooks(bookds1);
		bookBean.setPage(page);
		return bookBean;
	}
	@RequestMapping(value="/shoplist",method=RequestMethod.POST)
	public @ResponseBody List<Book> shoplist(HttpSession session) {
		List<Book> books = new ArrayList<Book>();
		Set<Integer> sb = (Set<Integer>) session.getAttribute("shopcar");
		for(Integer i: sb) {
			int a = i.intValue();
			Book book = bookService.findById(a);
			books.add(book);
		}
		return books;
	}
	
	@RequestMapping(value="/booklistadd",method=RequestMethod.POST)
	public @ResponseBody void addshoplist(String BookNum,HttpSession session) {
		//List<Book> books = new ArrayList<Book>();
		Date date = new Date();
		String name = (String) session.getAttribute("name");
		String num[] = BookNum.split(",");
		Integer numi[] = new Integer[BookNum.length()+10];
		int cnt = 0;
		for(String i:num) {
			cnt = cnt+1;
			Integer ii = Integer.valueOf(i);
			numi[cnt] = ii;
		}
		
		List<BList> bLists = new ArrayList<BList>();
		
		Set<Integer> sb = (Set<Integer>) session.getAttribute("shopcar");
		cnt = 0;
		for(Integer i: sb) {
			cnt=cnt+1;
			int a = i.intValue();
			Book book = bookService.findById(a);
			BList bList = new BList();
			bList.setUsername(name);
			bList.setBookname(book.getBookName());
			bList.setBooknum(numi[cnt]);
			bList.setBookprice(book.getPrice());
			bList.setTime(date);
			bList.setStat("已付款");
			bLists.add(bList);
			//books.add(book);
		}
		for(BList b:bLists) {
			listService.addList(b);
			//System.out.println("----获取到订单啦！"+b.getBookname()+"---------------"+b.getBookprice()+"----------------------"+b.getUsername()+"----------------"+b.getBooknum());
		}
		
		return ;
	}
	
	
	@RequestMapping(value="/booklist",method=RequestMethod.POST)
	public @ResponseBody List<Book> allbook() {
		List<Book> books = bookService.findAllBook();
		return books;
	}
	@RequestMapping(value="/bookfindByName",method=RequestMethod.POST)
	public @ResponseBody Book2Bean findbookByName(String bookName) {
		Book2Bean book2Bean = new Book2Bean();
		try {
			Book book = bookService.findByName(bookName);
			book2Bean.setBook(book);
			book2Bean.setCode(1);
		} catch (Exception e) {
			// TODO: handle exception
			book2Bean.setCode(0);
			book2Bean.setMsg(e);
			
		}
		return book2Bean;
	}
	
	@RequestMapping(value="/bookdelete",method=RequestMethod.POST)
	public @ResponseBody JsonBean deletebook(int userid) {
		//System.out.println(userid+"-----------------------------------------------");
		bookService.deletebook(userid);
		
		JsonBean bean = new JsonBean();
		bean.setCode(1);
		return bean;
		
	}
	@RequestMapping(value="/getbook",method=RequestMethod.POST)
	public @ResponseBody JsonBean getbook(String Box, HttpSession session) {
		//System.out.println(userid+"-----------------------------------------------");
		//bookService.deletebook();
		//System.out.println(Box);
		String aa[] = Box.split(",");
		int bb[] = new int[aa.length];
		
		for(int i = 0 ; i <aa.length;i++) {
			//System.out.println(aa[i]);
			bb[i] = Integer.parseInt(aa[i]);
		}
		Set<Integer> sb = (Set<Integer>) session.getAttribute("shopcar");
		Set<Integer> S = new HashSet<Integer>();
		if(sb==null) {
			
			for(int i = 0; i < bb.length;i++) {
				//System.out.println(bb[i]);
				S.add(bb[i]);
			}
		}
		else
		{
			for(int i = 0; i < bb.length;i++) {
				//System.out.println(bb[i]);
				S.add(bb[i]);
			}
			for(Integer j: sb) {
				S.add(j);
			}
		}
		
		session.setAttribute("shopcar",S);

		JsonBean bean = new JsonBean();
		bean.setCode(1);
		return bean;
		
	}
	@RequestMapping(value="/bookchange",method=RequestMethod.POST)
	public @ResponseBody Book2Bean changebook(int userid) {
		Book2Bean book2Bean = new Book2Bean();
		try {
			Book book = bookService.findById(userid);
			book2Bean.setBook(book);
			book2Bean.setCode(1);
		} catch (Exception e) {
			// TODO: handle exception
			book2Bean.setCode(0);
			book2Bean.setMsg(e);
			
		}
		return book2Bean;
	}
	@RequestMapping(value="/bookformchange",method=RequestMethod.POST)
	public @ResponseBody JsonBean changebookform(int bookId,String bookName,double bookprice,int booknum) {
		JsonBean bean = new JsonBean();
		try {
			bookService.updateById(bookId,bookName,bookprice,booknum);
			bean.setCode(1);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			bean.setCode(0);
			bean.setMsg(e);
		}
		return bean;
	}
	@RequestMapping(value="/bookformadd",method=RequestMethod.POST)
	public @ResponseBody JsonBean addbookform(String bookName,double bookprice,String bookurl,int booknum) {
		JsonBean bean = new JsonBean();
		try {
			//bookService.updateById(bookId,bookName,bookprice,booknum);
			bookService.insertOne(bookName,bookprice,bookurl,booknum);
			bean.setCode(1);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			bean.setCode(0);
			bean.setMsg(e);
		}
		return bean;
	}
}
