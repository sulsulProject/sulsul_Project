package com.sist.dao;

import org.apache.ibatis.annotations.Insert;
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
	
	public boolean memberIdCheck(String userId){
		boolean flag = true;
		int result = mapper.memberIdCheck(userId);
		if(result==0) flag=false;
		return flag;
	}
	
	public boolean memberEmailCheck(String email) {
		boolean flag = true;
		int result = mapper.memberEmailCheck(email);
		if(result==0) flag=false;
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
			}
			else {
				vo.setMsg("WRONGPASSWORD");
			}
		}
		return vo;
	}
	
	
	
	/*
	// 아이디 찾기 => 전화번호로 찾기
	// 아이디 찾기(전화번호) => 존재 유무 확인
    @Select("SELECT COUNT(*) FROM sul_member_2_2 WHERE name=#{name} AND tel=#{tel}")
    public int memberIdTelFind(String name, String tel);
    
    // 아이디 찾기(전화번호) => 아이디 공개
    @Select("SELECT RPAD(SUBSTR(id,1,3),LENGTH(id),'*') "
    		+ "FROM sul_member_2_2 "
    		+ "WHERE name=#{name} AND tel=#{tel}")
    public String memberIdTel_ID(String name, String tel);
	 * 
    public String memberIdtelfind(String name,String tel) {
        String msg="";
        try {
           conn = dbConn.createConnection();
           String sql = "select count(*) from HC_MEMBER_2 where name =? and tel=?";
           ps = conn.prepareStatement(sql);
           ps.setString(1, name);
           ps.setString(2, tel);
           ResultSet rs = ps.executeQuery();
           rs.next();
           int count = rs.getInt(1);
           rs.close();

           if(count == 0) {
        	   msg="NO";
           }else {
              sql = "SELECT RPAD(substr(mid,1,3),LENGTH(mid), '*') from HC_MEMBER_2 "
                  + "WHERE name =? and tel=?";
              ps = conn.prepareStatement(sql);
              ps.setString(1, name);
              ps.setString(2, tel);
              rs=ps.executeQuery();
              rs.next();
              msg = rs.getString(1);
              rs.close();
           }
        } catch (Exception e)
        {
           e.printStackTrace();
        }finally {
           dbConn.closeConnection(ps, conn);
        }
        return msg;
     }

    // 아이디 찾기 -> 이메일로 찾기
    // 아이디 찾기(이메일) => 존재 유무 확인
    @Select("SELECT COUNT(*) FROM sul_member_2_2 WHERE name=#{name} AND email=#{email}")
    public int memberIdEmailFind(String name, String email);
    
    // 아이디 찾기(전화번호) => 아이디 공개
    @Select("SELECT RPAD(SUBSTR(id,1,3),LENGTH(id),'*') "
    		+ "FROM sul_member_2_2 "
    		+ "WHERE name=#{name} AND email=#{email}")
    public String memberIdEmail_ID(String name, String email);
    public String memberIdemailfind(String name,String email) {
        String msg="";
        try {
            conn = dbConn.createConnection();
            String sql = "select count(*) from HC_MEMBER_2 where name =? and email=?";
           ps = conn.prepareStatement(sql);
           ps.setString(1, name);
           ps.setString(2, email);
           ResultSet rs = ps.executeQuery();
           rs.next();
           int count = rs.getInt(1);
           rs.close();

           if(count == 0) {
        	   msg="NO";
           }else {
              sql = "SELECT RPAD(substr(mid,1,3),LENGTH(mid), '*') from HC_MEMBER_2 "
                    +"where name =? and email=?";
              ps = conn.prepareStatement(sql);
              ps.setString(1, name);
              ps.setString(2, email);
              rs=ps.executeQuery();
              rs.next();
              msg = rs.getString(1);
              rs.close();
           }
        }
        catch (Exception e)
        {
           e.printStackTrace();
        }
        finally
        {
           dbConn.closeConnection(ps, conn);
        }
        return msg;
     }
	*/
}