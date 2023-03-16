package com.sist.web;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.BoardDAO;
import com.sist.dao.LetterDAO;
import com.sist.dao.WineDAO;
import com.sist.mapper.WineMapper;
import com.sist.vo.EventBoardVO;
import com.sist.vo.WineVO;




@Controller
public class MainController {
	@Autowired
	private WineDAO dao;
	@Autowired
	private LetterDAO dao2;
	
	@GetMapping("main/main.do")
	public String main_page(HttpServletRequest request, Model model)
	{
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id"); 
		
		if(id == null) {
			id = "hong";
		}
		int count = dao2.recv_letter_count(id);
		model.addAttribute("count", count);
		
		List<WineVO> list=dao.mainWineListData();
		List<WineVO> wlist=dao.mainWhiskeyListData();
		List<WineVO> clist=dao.mainCognacListData();
		
		model.addAttribute("list",list);
		model.addAttribute("wlist",wlist);
		model.addAttribute("clist",clist);
		return "main";
	}
}
