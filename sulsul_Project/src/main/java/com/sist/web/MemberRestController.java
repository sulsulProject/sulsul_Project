package com.sist.web;

import com.sist.vo.*;
import com.sist.dao.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
class MemberController{
	@Autowired
	private MemberDAO dao;
	
	@GetMapping("member/login.do")
	public String login()
	{
		return "member/login";
	}
	
	@GetMapping("member/logout.do")
	public String member_logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:../main/main.do";
	}
}
@RestController
public class MemberRestController {
	@Autowired
	private MemberDAO dao;
	
	@GetMapping(value="member/login_vue.do",produces="text/html;charset=UTF-8")
	public String member_login(String id, String password, HttpSession session)
	{
		String res="";
		MemberVO vo=dao.memberLogin(id,password);
		res=vo.getMsg();
		if(res.equals("OK")) {
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
		}
		return res;
	}	
}
