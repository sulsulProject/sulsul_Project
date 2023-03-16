package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;

import lombok.Getter;
import lombok.Setter;

import com.sist.mapper.*;

@Repository
public class FaqDAO {
	@Autowired
	private FaqMapper mapper;
	
	// 나라별 센터 소개
	//@Select("select nino,nation,title,image, work_state,time "
	//		  + "from sul_nation_introduce_2_2 order by nino asc")
	public List<NationIntroduceVO> nationListData()
	{
		return mapper.nationListData();
	}
	
	// fad 카테고리별
	
	//@Select("select fno,type,subject, content,hit,fcno,num "
	//		  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
	//		  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
	//		  + "from sul_faq_2_2) "
	//		  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList1(Map map)
	{
		return mapper.faqList1(map);
	}
		
	// faq 총 페이지
	//@Select("select ceil(count(*)/10.0) from sul_faq_2_2")
	public int faqTotalPage1()
	{
		return mapper.faqTotalPage1();
	}
	
	// 카테고리별 메소드 (2번)
	//@Select("select fno,type,subject, content,hit,fcno,num "
	//		  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
	//		  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
	//		  + "from sul_faq_2_2 "
	//		  + "where fcno=2) "
	//		  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList2(Map map)
	{
		return mapper.faqList2(map);
	}
		
	// faq 총 페이지
	//@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=2")
	public int faqTotalPage2()
	{
		return mapper.faqTotalPage2();
	}
	
	// 카테고리별 메소드 (3번)
	//@Select("select fno,type,subject, content,hit,fcno,num "
	//			  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
	//			  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
	//			  + "from sul_faq_2_2 "
	//			  + "where fcno=3) "
	//			  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList3(Map map)
	{
		return mapper.faqList3(map);
	}
			
	// faq 총 페이지
	//@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=3")
	public int faqTotalPage3()
	{
		return mapper.faqTotalPage3();
	}
	
	// 카테고리별 메소드 (4번)
	//@Select("select fno,type,subject, content,hit,fcno,num "
	//				  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
	//				  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
	//				  + "from sul_faq_2_2 "
	//				  + "where fcno=4) "
	//				  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList4(Map map)
	{
		return mapper.faqList4(map);
	}
				
	// faq 총 페이지
	//@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=4")
	public int faqTotalPage4()
	{
		return mapper.faqTotalPage4();
	}
	
	// 카테고리별 메소드 (5번)
	//@Select("select fno,type,subject, content,hit,fcno,num "
	//				  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
	//				  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
	//				  + "from sul_faq_2_2 "
	//				  + "where fcno=5) "
	//				  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList5(Map map)
	{
		return mapper.faqList5(map);
	}
				
	// faq 총 페이지
	//@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=5")
	public int faqTotalPage5()
	{
		return mapper.faqTotalPage5();
	}
	
	// 카테고리별 메소드 (6번)
	//@Select("select fno,type,subject, content,hit,fcno,num "
	//				  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
	//				  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
	//				  + "from sul_faq_2_2 "
	//				  + "where fcno=6) "
	//				  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList6(Map map)
	{
		return mapper.faqList6(map);
	}
				
	// faq 총 페이지
	//@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=6")
	public int faqTotalPage6()
	{
		return mapper.faqTotalPage6();
	}
	
	// 카테고리별 메소드 (7번)
	//@Select("select fno,type,subject, content,hit,fcno,num "
	//				  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
	//				  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
	//				  + "from sul_faq_2_2 "
	//				  + "where fcno=7) "
	//				  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList7(Map map)
	{
		return mapper.faqList7(map);
	}
				
	// faq 총 페이지
	//@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=7")
	public int faqTotalPage7()
	{
		return mapper.faqTotalPage7();
	}
		
	// 카테고리별 메소드 (9번)
	//@Select("select fno,type,subject, content,hit,fcno,num "
	//						  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
	//						  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
	//						  + "from sul_faq_2_2 "
	//						  + "where fcno=8)) "
	//						  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList8(Map map)
	{
		return mapper.faqList8(map);
	}
						
	// faq 총 페이지
	//@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=8")
	public int faqTotalPage8()
	{
		return mapper.faqTotalPage8();
	}
	
	// faq 상세페이지
	//@Select("SELECT fno,type,subject, content "
	//			  + "FROM sul_faq_2_2 "
	//			  + "WHERE fno = #{fno}")
	public FaqVO faq_Detail(int fno)
	{
		return mapper.faq_Detail(fno);
	}
	// faq검색한 경우 전체
	//	@Select("SELECT fno,type,subject, content "
	//			+ "from sul_faq_2_2 ")
	public List<FaqVO> faqSearchFindData1()
	{
		return mapper.faqSearchFindData1();
	}
		
	// faq 카운트값
	//@Select("SELECT COUNT(*) "
	//			  +"FROM sul_faq_2_2 ")
	public int faqFindCount1()
	{
		return mapper.faqFindCount1();
	}
	// faq검색 
	//@Select("SELECT fno,type,subject, content "
	//			+ "from (select fno,type,subject, content,hit,fcno,rownum as num "
	//			+ "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
	//			+ "from sul_faq_2_2 "
	//			+ "where subject LIKE '%'||#{subject}||'%' ORDER BY fno ASC)) "
	//			+ "where num between #{start} and #{end}")
	public List<FaqVO> faqSearchFindData2(String subject)
	{
		return mapper.faqSearchFindData2(subject);
	}
		
	// faq 총페이지
	// faq 카운트값
	//	@Select("SELECT COUNT(*) "
	//			  +"FROM sul_faq_2_2 "
	//			  +"WHERE subject LIKE '%'||#{subject}||'%'")
	public int askFindCount2(String subject)
	{
		return mapper.faqFindCount2(subject);
	}
	
}
