package com.sist.mapper;

import org.apache.ibatis.annotations.*;
import com.sist.vo.*;
public interface MemberMapper {
	
	// 회원가입
    @Insert("INSERT INTO sul_member_2_2 "
    		+ "VALUES(#{id},#{password},#{name},#{sex},#{email},#{tel},#{bday},#{postcode},#{addr1},#{addr2},'N')")
    public void memberInsert(MemberVO vo);
	
    // 아이디 중복 체크
    @Select("SELECT COUNT(*) FROM sul_member_2_2 WHERE id=#{id}")
    public int memberIdCheck(String userId);
    
	// 이메일 중복 체크
    @Select("SELECT COUNT(*) FROM sul_member_2_2 WHERE email=#{email}")
    public int memberEmailCheck(String email);
    
    // 로그인 체크
    @Select("SELECT id,password,name,email,tel,postcode,addr1,addr2,admin "
    		+ "FROM sul_member_2_2 WHERE id=#{id}")
    public MemberVO memberPasswordCheck(String id);
	
    // 아이디 찾기(전화번호) => 존재 유무 확인
    @Select("SELECT COUNT(*) FROM sul_member_2_2 WHERE name=#{name} AND tel=#{tel}")
    public int memberIdTelFind(String name, String tel);
    
    // 아이디 찾기(전화번호) => 아이디 공개
    @Select("SELECT RPAD(SUBSTR(id,1,3),LENGTH(id),'*') "
    		+ "FROM sul_member_2_2 "
    		+ "WHERE name=#{name} AND tel=#{tel}")
    public String memberIdTel_ID(String name, String tel);
    
    // 아이디 찾기(이메일) => 존재 유무 확인
    @Select("SELECT COUNT(*) FROM sul_member_2_2 WHERE name=#{name} AND email=#{email}")
    public int memberIdEmailFind(String name, String email);
    
    // 아이디 찾기(전화번호) => 아이디 공개
    @Select("SELECT RPAD(SUBSTR(id,1,3),LENGTH(id),'*') "
    		+ "FROM sul_member_2_2 "
    		+ "WHERE name=#{name} AND email=#{email}")
    public String memberIdEmail_ID(String name, String email);
}
