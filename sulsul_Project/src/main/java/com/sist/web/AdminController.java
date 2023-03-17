package com.sist.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class AdminController {
	  @GetMapping("adminpage/admin_main.do")
	  public String admin_main(Model model,HttpSession session)
	  {
		  model.addAttribute("admin_jsp", "../adminpage/admin_home.jsp");
		  return "adminpage/admin_main";
	  }
	  @GetMapping("adminpage/admin_member_list.do")
	  public String admin_member_list(Model model,HttpSession session)
	  {
		  model.addAttribute("admin_jsp", "../adminpage/admin_member_list.jsp");
		  return "adminpage/admin_main";
	  }
	  @GetMapping("adminpage/order_list.do")
	  public String admin_order_list(Model model,String id)
	  {
		  model.addAttribute("admin_jsp", "../adminpage/order_list.jsp");
		  return "adminpage/admin_main";
	  }
}
