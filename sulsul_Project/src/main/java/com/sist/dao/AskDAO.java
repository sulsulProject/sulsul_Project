package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class AskDAO {
	@Autowired
	private AskMapper mapper;
	
	// 목록 출력
	//@Select("select ano,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
	//		   + "from (select ano,subject,content,regdate "
	//		   + "from sul_ask_2_2 order by dbday asc "
	//		   + "where id=#{id}")
	public List<AskVO> askListData(String id)
	{
		return mapper.askListData(id);
	}
		
	// 문의 하기
	//@Insert("insert into sul_ask_2_2(ano,subject,content,pwd) values("
	//		 +"sul_ano_seq.nextval,#{subject},#{content},#{pwd})")
    public void askInsert(AskVO vo)
    {
    	 mapper.askInsert(vo);
    }
}
