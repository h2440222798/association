package com.huxiqing.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huxiqing.entity.BList;
import com.huxiqing.entity.Book;
import com.huxiqing.entity.Page;
import com.huxiqing.service.IBookService;
import com.huxiqing.service.IListService;
import com.huxiqing.vo.BookBean;
import com.huxiqing.vo.ListBean;

@Controller
public class ListController {
	@Autowired
	private IListService listService;
	@Autowired
	private IBookService bookService;
	@RequestMapping(value="/orderlist",method=RequestMethod.POST)
	public @ResponseBody ListBean alllist(Integer Num,HttpSession session) {
		
//		System.out.println(Num+"-------------------------------------------------------------------------------");
		 int num = Num.intValue();
		String name = (String) session.getAttribute("name");
		ListBean listBean = new ListBean();
		List<BList> bLists = listService.findListByName(name);
		Page page = new Page();
		int sz = bLists.size();
		page.setTotalSize(sz);
		
		int x;
		if(sz % 4 == 0)	{
			x = sz/4;
		}
		else{
		  x = sz/4+1;	
		}
		page.setTotalPage(x);
		List<BList> bookds1 = new ArrayList<BList>();
		List<Book> books1 = new ArrayList<Book>();
		for(int i = (num-1)*4 ; i <(num-1)*4+4;i++)
		{
			if(i<sz) {
				String li = bLists.get(i).getBookname();
				Book book = bookService.findByName(li);
				books1.add(book);
				bookds1.add(bLists.get(i));
				
			}
		}
		
		listBean.setLists(bookds1);
		listBean.setBooks(books1);
		listBean.setPage(page);
		return listBean;
	}
	
}
