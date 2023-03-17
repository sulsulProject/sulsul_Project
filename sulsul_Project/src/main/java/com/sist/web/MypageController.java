package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.MemberDAO;

@Controller
public class MypageController {
  @Autowired
   private MemberDAO dao;
  @GetMapping("mypage/mypage_main.do")
  public String mypage_main(Model model)
  {
	  model.addAttribute("mypage_jsp", "../mypage/mypage_home.jsp");
	  return "mypage/mypage_main";
  }
  @GetMapping("mypage/mypage_info_update.do")
  public String mypage_info_update(Model model)
  {
	  model.addAttribute("mypage_jsp", "../mypage/mypage_info_update.jsp");
	  return "mypage/mypage_main";
  }
  @GetMapping("mypage/mypage_pwd_update.do")
  public String mypage_pwd_update(Model model)
  {
	  model.addAttribute("mypage_jsp", "../mypage/mypage_pwd_update.jsp");
	  return "mypage/mypage_main";
  }
  @GetMapping("mypage/mypage_like_list.do")
  public String mypage_like_list(Model model)
  { 
	  model.addAttribute("mypage_jsp", "../mypage/mypage_like_list.jsp");
	  return "mypage/mypage_main";
  }
  @GetMapping("mypage/mypage_order_list.do")
  public String mypage_order_list(Model model)
  {
	  model.addAttribute("mypage_jsp", "../mypage/mypage_order_list.jsp");
	  return "mypage/mypage_main";
  }
}
