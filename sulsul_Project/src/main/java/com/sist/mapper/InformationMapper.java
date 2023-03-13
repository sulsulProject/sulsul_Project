package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
/*	IUNO    NOT NULL NUMBER         
SUBJECT NOT NULL VARCHAR2(1000) 
IMAGE            VARCHAR2(600)  
REGDATE          DATE           
HIT              NUMBER       
*/

public interface InformationMapper {
	@Select("select iuno,subject,image,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,num "
		  + "from (select iuno,subject,image,regdate,hit,rownum as num "
		  + "from (select /*+index_asc(sul_information_use_2_2 siu_iuno_pk)*/iuno,subject,image,regdate,hit "
		  + "from sul_information_use_2_2)) "
		  + "where num between #{start} and #{end}")
	public List<InformationUseVO> informationListData(Map map);
	
	@Select("select ceil(count(*)/10.0) from sul_information_use_2_2")
	public int informationTotalPage();
	
	// 이용안내 게시물 클릭시 조회수 증가
	@Update("update sul_information_use_2_2 set "
		  + "hit=hit+1 "
		  + "where iuno =#{iuno}")
	public void informationHitIncrement(int iuno);
	
	// 이용안내 상세페이지
	@Select("select * from sul_information_use_2_2 "
		  + "where iuno=#{iuno}")
	public InformationUseVO informationDetailData(int iuno);
}



























