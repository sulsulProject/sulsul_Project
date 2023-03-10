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
	
	//@Select("select fcno,cate from sul_faq_category_2_2")
	public List<FaqCategoryVO> FaqCategoryList()
	{
		return mapper.FaqCategoryList();
	}
	
	// faq 리스트 출력
	//@Select("select fcno,type,subject,content "
	//			+ "from sul_faq_category_2_2 "
	//			+ "where fcno=#{fcno}")
	public List<FaqVO> FaqListData(int fcno)
	{
		return mapper.FaqListData(fcno);
	}
}
