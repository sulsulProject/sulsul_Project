package com.sist.web;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class MemberController{
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
	
	@GetMapping("member/signup.do")
	public String member_signup() {
		return "member/signup";
	}

	@GetMapping("member/signup_done.do")
	public String signup_done(MemberVO vo) {
		dao.memberInsert(vo);
		return "redirect:../member/login.do";
	}
	// 회원가입 버튼을 누르면 _done.do로 이동하게 vue 사용하고 vo만 넘기기
	// 위의 매핑은 레스트 컨트롤러에서 작성해보기
	
	@GetMapping("member/idfind.do")
	public String member_idFind() {
		return "member/idfind";
	}
	
}