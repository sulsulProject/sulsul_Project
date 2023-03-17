package com.sist.web;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
import com.sist.vo.NoticeVO;
@RestController
public class MypageRestController {
	@Autowired
	private MemberDAO dao;
	//이메일 확인
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
	//비밀번호 확인 체크
	@GetMapping(value = "mypage/mypage_pwd_chk_update_vue.do",produces ="text/html;charset=UTF-8" )
	public String mypage_pwd_chk_update(String pwd, HttpSession session)
	{
		String res = "no";
		String id = (String) session.getAttribute("id");
		String db_pwd=dao.memberpwdchk(id);
		if(db_pwd.equals(pwd))
        {
			res="yes";
        }
        
	     return res;
	}
	//비밀번호 수정 
	@GetMapping(value = "mypage/mypage_pwd_update_vue.do",produces ="text/html;charset=UTF-8" )
	public String mypage_pwd_update(String pwd, HttpSession session)
	{
		String id = (String) session.getAttribute("id");
		dao.memberPwdUpdate(pwd, id);
		return "";
	}
	//전화번호 확인
	@GetMapping(value = "mapage/mypage_tel_chk_vue.do",produces ="text/html;charset=UTF-8" )
	public String mypage_tel_update(String tel)
	{
		String res = "";
		boolean result =dao.memberTelCheck(tel);
		//0 : 변경 안됨, !0 : 변경 가능
		if(result == false) {
			res = "TELY"; //번호 사용 가능
		}else {
			res = "TELN"; //번호 사용 불가능
		}
		return res;
	}
	//회원정보 수정 업데이트
	@GetMapping(value ="mypage/mypage_info_update_vue.do",produces ="text/html;charset=UTF-8")
	public String mypage_info_update_vue(MemberVO vo,HttpSession session)
	{
		          String res="no";
		          String id = (String) session.getAttribute("id");
		          String db_pwd=dao.memberpwdchk(id);
		          if(db_pwd.equals(vo.getPassword()))
		          {
		        	   vo.setId(id);
		        	   dao.memberInfoUpdateVue(vo);
		        	   res="yes";
		          }
		          
		 	return res;
	}
}
	

