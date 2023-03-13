package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
//private int ano,hit,group_id,group_step,group_tab;
//private String subject,content,pwd,ask_state,id,dbday;
//private Date regdate;

public interface AskMapper {
	// 목록 출력
	@Select("select ano,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
		   + "from (select ano,subject,content,regdate "
		   + "from sul_ask_2_2 order by dbday asc "
		   + "where id=#{id}")
	public List<AskVO> askListData(String id);
	
	// 문의 하기
	 @Insert("insert into sul_ask_2_2(ano,subject,content,pwd) values("
		 +"sul_ano_seq.nextval,#{subject},#{content},#{pwd})")
	 public void askInsert(AskVO vo);
	 
	 
	 
}
