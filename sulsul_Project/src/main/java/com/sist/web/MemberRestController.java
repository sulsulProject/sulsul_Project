package com.sist.web;

import com.sist.vo.*;
import com.sist.dao.*;
import com.sist.mapper.*;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
			session.setAttribute("password", vo.getPassword());
            session.setAttribute("admin", vo.getAdmin());
		  
		}
		return result;
	}	
	//(마이페이지) 회원정보
		@GetMapping(value = "member/member_info_vue.do",produces = "text/plain;charset=UTF-8")
		public String member_info(HttpSession session)
		{
			String id=(String)session.getAttribute("id");
			MemberVO vo=dao.member_info(id);
			JSONObject obj=new JSONObject();
			obj.put("email", vo.getEmail());
			obj.put("addr1", vo.getAddr1());
			obj.put("addr2", vo.getAddr2());
			obj.put("Bday", vo.getBday());
			obj.put("tel", vo.getTel());
			obj.put("postcode", vo.getPostcode());
			
			return obj.toJSONString();
		}
   
   @GetMapping("member/idcheck_vue.do")
   public String member_idCheck(String id)
   {
	   boolean flag = dao.memberIdCheck(id);
	   System.out.println("id flag = "+flag);
	   String res="";
	   if(flag) res="yes";
	   return res;
   }
   
   @GetMapping("member/emailcheck_vue.do")
   public String member_emailCheck(String email)
   {
	   boolean flag = dao.memberEmailCheck(email);
	   System.out.println("email flag = "+flag);
	   String res="";
	   if(flag) res="yes";
	   return res;
   }
   
   @GetMapping("member/idfind_tel_vue.do")
   public String member_idFindTel(String name, String tel)
   {
	   System.out.println("name"+name);
	   System.out.println("tel"+tel);
	   String msg=dao.memberIdTelFindOpen(name, tel);
	   System.out.println(msg);
	   return msg;
   }
   
   @GetMapping("member/idfind_email_vue.do")
   public String member_idFindEmail(String name, String email)
   {
	   String msg=dao.memberIdEmailFindOpen(name, email);
	   return msg;
   }
   
   
   
}
  
								
	