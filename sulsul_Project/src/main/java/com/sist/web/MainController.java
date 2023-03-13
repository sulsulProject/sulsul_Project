package com.sist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.WineDAO;
import com.sist.vo.WineVO;




@Controller
public class MainController {
	@Autowired
	private WineDAO dao;

	@GetMapping("main/main.do")
	public String main_page(Model model)
	{
		List<WineVO> list=dao.mainWineListData();
		model.addAttribute("list",list);
		return "main";
	}
}
