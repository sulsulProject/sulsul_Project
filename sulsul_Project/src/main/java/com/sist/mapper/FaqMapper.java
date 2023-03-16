package com.sist.mapper;

import org.apache.ibatis.annotations.Select; 
import java.util.*;
import com.sist.vo.*;

public interface FaqMapper {
	// 나라별 센터 소개
	@Select("select nino,nation,title,image, work_state,time "
		  + "from sul_nation_introduce_2_2 order by nino asc")
	public List<NationIntroduceVO> nationListData();
	
	
	// fad 카테고리별
	//FNO  ,TYPE ,SUBJECT ,CONTENT ,HIT ,FCNO     
	// 카테고리별 메소드 (1번)
	@Select("select fno,type,subject, content,hit,fcno,num "
			  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
			  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
			  + "from sul_faq_2_2)) "
			  + "where num between #{start} and #{end}")
   public List<FaqVO> faqList1(Map map);
		
	// faq 총 페이지
	@Select("select ceil(count(*)/10.0) from sul_faq_2_2")
	public int faqTotalPage1();
	
	// 카테고리별 메소드 (2번)
	@Select("select fno,type,subject, content,hit,fcno,num "
			  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
			  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
			  + "from sul_faq_2_2 "
			  + "where fcno=2)) "
			  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList2(Map map);
		
	// faq 총 페이지
	@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=2")
	public int faqTotalPage2();
	
	// 카테고리별 메소드 (3번)
	@Select("select fno,type,subject, content,hit,fcno,num "
				  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
				  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
				  + "from sul_faq_2_2 "
				  + "where fcno=3)) "
				  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList3(Map map);
			
	// faq 총 페이지
	@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=3")
	public int faqTotalPage3();
	
	// 카테고리별 메소드 (4번)
	@Select("select fno,type,subject, content,hit,fcno,num "
					  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
					  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
					  + "from sul_faq_2_2 "
					  + "where fcno=4)) "
					  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList4(Map map);
				
	// faq 총 페이지
	@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=4")
	public int faqTotalPage4();
	
	// 카테고리별 메소드 (5번)
	@Select("select fno,type,subject, content,hit,fcno,num "
					  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
					  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
					  + "from sul_faq_2_2 "
					  + "where fcno=5)) "
					  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList5(Map map);
				
	// faq 총 페이지
	@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=5")
	public int faqTotalPage5();
	
	// 카테고리별 메소드 (6번)
	@Select("select fno,type,subject, content,hit,fcno,num "
					  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
					  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
					  + "from sul_faq_2_2 "
					  + "where fcno=6)) "
					  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList6(Map map);
				
	// faq 총 페이지
	@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=6")
	public int faqTotalPage6();
	
	// 카테고리별 메소드 (7번)
	@Select("select fno,type,subject, content,hit,fcno,num "
					  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
					  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
					  + "from sul_faq_2_2 "
					  + "where fcno=7)) "
					  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList7(Map map);
				
	// faq 총 페이지
	@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=7")
	public int faqTotalPage7();
	
	// 카테고리별 메소드 (9번)
	@Select("select fno,type,subject, content,hit,fcno,num "
						  + "from (select fno,type,subject, content,hit,fcno,rownum as num "
						  + "from (select /*+index_desc(sul_ask_2_2 sf_fno_pk )*/fno,type,subject, content,hit,fcno "
						  + "from sul_faq_2_2 "
						  + "where fcno=8)) "
						  + "where num between #{start} and #{end}")
	public List<FaqVO> faqList8(Map map);
					
	// faq 총 페이지
	@Select("select ceil(count(*)/10.0) from sul_faq_2_2 where fcno=8")
	public int faqTotalPage8();
	
	///////////////////////////////////////////////
	// faq 상세페이지
	@Select("SELECT fno,type,subject, content "
			  + "FROM sul_faq_2_2 "
			  + "WHERE fno = #{fno}")
	public FaqVO faq_Detail(int fno);
	
	
	// faq검색한 경우 전체
	@Select("SELECT fno,type,subject, content "
			+ "from sul_faq_2_2 ")
	public List<FaqVO> faqSearchFindData1();
	
	// faq 카운트값
	@Select("SELECT COUNT(*) "
			  +"FROM sul_faq_2_2 ")
	public int faqFindCount1();
	
	// faq검색한 경우 
	@Select("SELECT fno,type,subject,content "
				+ "from sul_faq_2_2 "
				+ "where subject LIKE '%'||#{subject}||'%' ORDER BY fno ASC ")
	public List<FaqVO> faqSearchFindData2(String  subject);
		
	// faq 카운트값
	@Select("SELECT COUNT(*) "
				  +"FROM sul_faq_2_2 "
				  +"WHERE subject LIKE '%'||#{subject}||'%'")
	public int faqFindCount2(String subject);
	
}
