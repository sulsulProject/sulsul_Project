package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import com.sist.vo.*;
@Repository
public class MemberDAO {
	@Autowired
	private MemberMapper mapper;
	
	public void memberInsert(MemberVO vo){
		mapper.memberInsert(vo);
	}
	
	public boolean memberIdCheck(String id){
		boolean flag = false;
		int result = mapper.memberIdCheck(id);
		System.out.println(result);
		if(result==0) flag=true;
		return flag;
	}
	
	public boolean memberEmailCheck(String email){
		boolean flag = false;
		int result = mapper.memberEmailCheck(email);
		if(result==0) flag=true;
		return flag;
	}
	
	public MemberVO memberLogin(String id, String password) {
		MemberVO vo = new MemberVO();
		int count = mapper.memberIdCheck(id);
		if(count==0) vo.setMsg("NOID");
		else {
			MemberVO dbvo = mapper.memberPasswordCheck(id);
			if(dbvo.getPassword().equals(password)) {
				vo.setMsg("OK");
				vo.setId(dbvo.getId());
				vo.setName(dbvo.getName());
				vo.setEmail(dbvo.getEmail());
				vo.setAddr1(dbvo.getAddr1());
				vo.setAddr2(dbvo.getAddr2());
				vo.setPassword(dbvo.getPassword());
				vo.setAdmin(dbvo.getAdmin());
				vo.setTel(dbvo.getTel());
				vo.setPostcode(dbvo.getPostcode());
				
			}
			else {
				vo.setMsg("WRONGPASSWORD");
			}
		}
		return vo;
	}
	public MemberVO member_info(String id)
	{
		return mapper.member_info(id);
	}
	
	//(마이페이지)비밀번호 변경 
	 public void memberPwdUpdate(String password, String id)
	 {
		 mapper.memberPwdUpdate(password, id);
	 }
	 //(마이페이지) 전화번호 확인 , 변경
	    public boolean memberTelCheck(String tel)
	    {
	    	boolean flag = true;
			int result = mapper.memberTelCheck(tel);
			if(result==0) flag=false;
			return flag;
	    }
	    
	    public int memberTelUpdate(@Param("tel") String password, @Param("id") String id)
	    {
	    	return mapper.memberTelUpdate(password, id);
	    }
	 // (마이페이지) 회원정보 수정 업데이트
	    public void memberInfoUpdateVue(MemberVO vo)
	    {
    	  mapper.memberInfoUpdateVue(vo);
       }
	    public String memberpwdchk(String id)
	    {
	    	return mapper.memberpwdchk(id);
	    }
	  //(어드민페이지) 멤버 정보 
	    public List<MemberVO> admin_member_info(Map map)
	    {
	    	return mapper.admin_member_info(map);
	    }
	    //(어드민페이지) 멤버 정보 리스트 토탈
	    public int adminMemberTotalPage()
	    {
	    	return mapper.adminMemberTotalPage();
	    }
	    //(어드민페이지) 회원 강퇴
	    public void adminMemberDelete(String id)
	    {
	    	 mapper.adminMemberDelete(id);
	    }
	    
	
	// 아이디 찾기(전화번호)
    public String memberIdTelFindOpen(String name,String tel) {
    	String msg="";
    	int count = mapper.memberIdTelFind(name, tel);
    	if(count==0){
    		msg="NO";
    	}
    	else {
    		msg=mapper.memberIdTelFindOpen(name, tel);
    	}
        return msg;
    }
    
    // 아이디 찾기(이메일)
    public String memberIdEmailFindOpen(String name,String email) {
    	String msg="";
    	int count = mapper.memberIdEmailFind(name, email);
    	if(count==0) {
    		msg="NO";
    	}
    	else {
    		msg=mapper.memberIdEmailFindOpen(name, email);
    	}
    	return msg;
    }
}