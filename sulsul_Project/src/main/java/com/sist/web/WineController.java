package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.WineDAO;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.*;
@Controller
public class WineController {
	@Autowired
	private WineDAO dao;
	
	
	@GetMapping("wine/list.do")
	public String wine_list()
	{
		return "wine/list";
	}
		//와인 상세페이지(선우)
	   @GetMapping("wine/detail.do")
	   public String wine_detail(int ino,Model model)
	   {
		   List<WineVO> list=dao.wineDetailListData(ino);
		   List<WineVO> alist=dao.wineRelatedProductsListData();
		   model.addAttribute("ino", ino);
		   model.addAttribute("list",list);
		   model.addAttribute("alist",alist);
		   return "wine/detail";
	   }
	   
	   @GetMapping("wine/recent.do")
	   public String wine_recent()
	   {
		   return "wine/recent";
	   }
	   // 와인 쿠키
	   @GetMapping("wine/before_detail.do")
	   public String wine_before_detail(int ino, HttpServletResponse response,RedirectAttributes ra)
	   {
	      Cookie cookie=new Cookie("sul_wine"+ino, String.valueOf(ino));
	      cookie.setPath("/");
	      cookie.setMaxAge(60*60*24);
	      response.addCookie(cookie);
	      ra.addAttribute("ino", ino);
	      return "redirect:../wine/detail.do";
	   }
	   
	// 민우 - 위스키 리스트 -
	   @GetMapping("wine/whiskey_list.do")
	   public String whiskey_list()
	   {
	      return "wine/whiskey_list";
	   }
	   // 민우 - 꼬냑 리스트 -
	   @GetMapping("wine/cognac_list.do")
	   public String cognac_list()
	   {
	      return "wine/cognac_list";
	   }
	   @GetMapping("wine/cart.do")
	   public String cart_list()
	   {
		   return "wine/cart";
	   }
	// 와인 검색
		@GetMapping("wine/wine_find.do")
		public String wine_find()
		{
			return "wine/wine_find";
		}

}
