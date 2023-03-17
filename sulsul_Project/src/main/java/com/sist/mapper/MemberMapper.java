package com.sist.mapper;

import org.apache.ibatis.annotations.*;
import com.sist.vo.*;
public interface MemberMapper {
	
	// 회원가입
    @Insert("INSERT INTO sul_member_2_2 "
    		+ "VALUES(#{id},#{password},#{name},#{sex},#{email},#{tel},#{bday},#{postcode},#{addr1},#{addr2},'n')")
    public void memberInsert(MemberVO vo);
	
    // 아이디 중복 체크
    @Select("SELECT COUNT(*) FROM sul_member_2_2 WHERE id=#{id}")
    public int memberIdCheck(String id);
    
	// 이메일 중복 체크
	@Select("SELECT COUNT(*) FROM sul_member_2_2 WHERE email=#{email}")
	public int memberEmailCheck(String email);
	
    // 로그인 체크
    @Select("SELECT id,password,name,email,tel,postcode,addr1,addr2,admin "
    		+ "FROM sul_member_2_2 WHERE id=#{id}")
    public MemberVO memberPasswordCheck(String id);
	
    // 아이디 찾기(전화번호) => 존재 유무 확인
    @Select("SELECT COUNT(*) FROM sul_member_2_2 WHERE name=#{name} AND tel=#{tel}")
    public int memberIdTelFind(@Param("name")String name, @Param("tel") String tel);
    
    // 아이디 찾기(전화번호) => 아이디 공개
    @Select("SELECT RPAD(SUBSTR(id,1,3),LENGTH(id),'*') "
    		+ "FROM sul_member_2_2 "
    		+ "WHERE name=#{name} AND tel=#{tel}")
    public String memberIdTelFindOpen(@Param("name")String name, @Param("tel")String tel);
    
    // 아이디 찾기(이메일) => 존재 유무 확인
    @Select("SELECT COUNT(*) FROM sul_member_2_2 WHERE name=#{name} AND email=#{email}")
    public int memberIdEmailFind(@Param("name")String name, @Param("email") String email);
    
    // 아이디 찾기(이메일) => 아이디 공개
    @Select("SELECT RPAD(SUBSTR(id,1,3),LENGTH(id),'*') "
    		+ "FROM sul_member_2_2 "
    		+ "WHERE name=#{name} AND email=#{email}")
    public String memberIdEmailFindOpen(@Param("name")String name, @Param("email")String email);
    
 // (마이페이지) 비밀번호 변경
    @Update("UPDATE sul_member_2_2 SET password=#{password}"
    		+ "WHERE id=#{id}")
    public int memberPwdUpdate(@Param("password") String password, @Param("id") String id);
    
    //(마이페이지) 전화번호 중복 확인, 변경
    @Select("SELECT COUNT(*) FROM sul_member_2_2 WHERE tel=#{tel}")
    public int memberTelCheck(String tel);
    //(마이페이지) 전화번호 변경
    @Update("UPDATE sul_member_2_2 SET tel=#{tel}"
          + "WHERE id=#{id}")
    public int memberTelUpdate(@Param("tel") String password, @Param("id") String id);
    //(마이페이지) 
    @Select("SELECT * FROM sul_member_2_2 WHERE id=#{id}")
    public MemberVO member_info(String id);
    
}

 