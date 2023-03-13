package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.WineDAO;

@Controller
public class WineController {
	@Autowired
	private WineDAO dao;


	@GetMapping("wine/list.do")
	public String wine_list()
	{
		return "wine/list";
	}
}
