package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
//private int ano,hit,group_id,group_step,group_tab;
//private String subject,content,pwd,ask_state,id,dbday;
//private Date regdate;

public interface AskMapper {
	// 목록 출력 (로그인안했을경우)
	@Select("select ano,subject,content,id,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
				   + "from (select ano,subject,content,id,regdate "
				   + "from sul_ask_2_2 order by ano asc)")
	public List<AskVO> asknotListData();
	// 목록 출력
	@Select("select ano,subject,content,id,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
			   + "from (select ano,subject,content,id,regdate "
			   + "from sul_ask_2_2 order by ano asc) "
			   + "where id=#{id}")
	public List<AskVO> askListData(String id);
	
	// 문의 하기
	@Insert("insert into sul_ask_2_2(ano,subject,content,pwd,id,regdate) values("
		   +"sul_ano_seq.nextval,#{subject, jdbcType=VARCHAR},#{content, jdbcType=VARCHAR},#{pwd, jdbcType=VARCHAR},#{id, jdbcType=VARCHAR},sysdate)")
	public void askInsert(AskVO vo);
	
	//목록 리스트 카운트(로그인 안했을 경우)
	@Select("select count(*) from sul_ask_2_2")
	public int asknotTotalData();
	//목록 리스트 카운트
	@Select("select count(*) from sul_ask_2_2 "
		  + "where id=#{id}")
	public int askTotalData(String id);
		 
	// 상세 페이지
	@Select("select ano,subject,content,id,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
		  + "from sul_ask_2_2 "
		  + "where ano=#{ano}")
	public AskVO askDetailData(int ano); 
	 
	// 비밀번호
	@Select("select pwd from sul_ask_2_2 where ano=#{ano}") 
	public String askGetPassword(int ano);
	 
	// 수정하기 
	@Update("update sul_ask_2_2 set "
		  + "subject=#{subject},content=#{content} "
	   	  + "where ano=#{ano}")
	public void askUpdate(AskVO vo);
	
	// 삭제하기
	@Delete("delete from sul_ask_2_2 "
		  + "where ano=#{ano}")
	public void askDelete(int ano);
}