package com.sist.mapper;

import org.apache.ibatis.annotations.Select; 
import java.util.*;
import com.sist.vo.*;

public interface FaqMapper {
	// 나라별 센터 소개
	@Select("select nino,nation,title,image, work_state,time "
		  + "from sul_nation_introduce_2_2 order by nino asc")
	public List<NationIntroduceVO> nationListData();
	
	// faq 카테고리 출력
	@Select("select fcno,cate from sul_faq_category_2_2")
	public List<FaqCategoryVO> FaqCategoryList();
	
	// faq 리스트 출력
	@Select("select fcno,type,subject,CONTENT "
			+ "from sul_faq_2_2 "
			+ "where fcno=#{fcno}")
	public List<FaqVO> FaqListData(int fcno);
	
}
