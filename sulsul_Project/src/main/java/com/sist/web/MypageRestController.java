package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.MemberDAO;
@RestController
public class MypageRestController {
	@Autowired
	private MemberDAO dao;
	//4. 컨트롤러 호출
	@GetMapping(value = "mapage/mypage_email_chk_vue.do",produces="text/html;charset=UTF-8")
    public String mypage_email_update(String email)
    {
		String res = "";
		//5.이메일 쿼리 실행
		boolean result =dao.memberEmailCheck(email);	
		//false : 0, true : !0 
		//6. 쿼리 실행된 결과 값으로 조건문으로 return값 셋팅
		if(result == false) {
			res = "EMAILY"; //이메일 사용 가능
		}else {
			res = "EMAILN"; //이미 존재하는 이메일
		}
		//7. 값 return
		return res;
    }
	@GetMapping(value = "mypage/mypage_pwd_update_vue.do",produces ="text/html;charset=UTF-8" )
	public String mypage_pwd_update(String pwd, HttpSession session)
	{
		String res = "";
		String id = (String) session.getAttribute("id");
		System.out.println("11111111111111");
		int result =dao.memberPwdUpdate(pwd, id);
		System.out.println("result : " + result);
		//0 : 변경 안됨, !0 : 변경 완료
		if(result == 0) {
			res = "SUCCESSN"; //비번 변경 실패
		}else {
			res = "SUCCESSY"; //비번 변경 완료
		}
		return res;
	}
	@GetMapping(value = "mapage/mypage_tel_chk_vue.do",produces ="text/html;charset=UTF-8" )
	public String mypage_tel_update(String tel)
	{
		String res = "";
		System.out.println("11111111111111");
		boolean result =dao.memberTelCheck(tel);
		System.out.println("tel:"+tel);
		System.out.println("result : " + result);
		//0 : 변경 안됨, !0 : 변경 완료
		if(result == false) {
			res = "TELY"; //번호 사용 가능
		}else {
			res = "TELN"; //번호 사용 불가능
		}
		return res;
	}
}
	

