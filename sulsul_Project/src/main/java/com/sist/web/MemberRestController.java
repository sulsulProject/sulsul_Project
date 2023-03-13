package com.sist.web;

import com.sist.vo.*;
import com.sist.dao.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberRestController {
	@Autowired
	private MemberDAO dao;
	
	@GetMapping(value="member/login_vue.do",produces="text/html;charset=UTF-8")
	public String member_login(String id, String password, HttpSession session)
	{
		String result="";
		MemberVO vo=dao.memberLogin(id,password);
		result=vo.getMsg();
		if(result.equals("OK")) {
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("tel", vo.getTel());
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("postcode", vo.getPostcode());
			session.setAttribute("addr1", vo.getAddr1());
			session.setAttribute("addr2", vo.getAddr2());
			session.setAttribute("admin", vo.getAdmin());
		}
		return result;
	}	
}
