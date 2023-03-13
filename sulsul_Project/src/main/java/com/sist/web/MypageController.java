package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@Controller
public class MypageController {
  @Autowired
   private MemberDAO dao;
  @GetMapping("mypage/mypage_main.do")
  public String mypage_main(HttpSession session)
  {
	  return "mypage/mypage_main";
  }
}
