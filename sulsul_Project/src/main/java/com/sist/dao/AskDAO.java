package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class AskDAO {
	@Autowired
	private AskMapper mapper;
	// 목록 출력 (로그인안했을경우)
	//@Select("select ano,subject,content,id,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
	//	  + "from (select ano,subject,content,id,regdate "
	//	  + "from sul_ask_2_2 order by ano asc)")
	public List<AskVO> asknotListData()
	{
		return mapper.asknotListData();
	}
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
    
    //목록 리스트 카운트(로그인 안했을 경우)
  	//@Select("select count(*) from sul_ask_2_2")
  	public int asknotTotalData()
  	{
  		return mapper.asknotTotalData();
  	}
    // 문의 내역 카운트
    //@Select("select count(*) from sul_ask_2_2 "
 	//       + "where id=#{id}")
    public int askTotalData(String id)
    {
    	return mapper.askTotalData(id);
    }
    
    // 상세 페이지
 	// @Select("no,subject,content,id,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
 	// 	   + "from sul_ask_2_2 "
 	// 	   + "where ano=#{ano}")
 	public AskVO askDetailData(int ano)
 	{
 		return mapper.askDetailData(ano);
 	}
 	// 비밀번호
  	//@Select("select pwd from sul_ask_2_2 where ano=#{ano}") 
  	//public String askGetPassword(int ano);
  	// 수정하기 
  	//@Update("update sul_ask_2_2 set "
  	//	  + "subject=#{subject},content=#{content} "
  	//   	  + "where ano=#{ano}")
  	//public void askUpdate(AskVO vo);
 	// 수정하기 
 	public String askUpdate(AskVO vo)
 	{
 		String res="no";
 		String db_pwd=mapper.askGetPassword(vo.getAno());
 		if(db_pwd.equals(vo.getPwd()))
 		{
 			mapper.askUpdate(vo);
 			res="yes";
 		}
 		return res;
 	}
 	
 	// 삭제하기
 	//@Delete("delete from sul_ask_2_2 "
 	//	  + "where ano=#{ano}")
 	//public void askDelete(int ano);
 	public String askDelete(int ano,String pwd)
 	{
 		String res="no";
 		String db_pwd=mapper.askGetPassword(ano);
 		
 		if(db_pwd.equals(pwd))
 		{
 			mapper.askDelete(ano);
 			res="yes";
 		}
 		System.out.println("dao res"+res);
 		return res;
 	}
}