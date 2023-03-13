package com.sist.dao;
import org.springframework.beans.factory.annotation.Autowired;

import com.sist.mapper.FaqMapper;
import com.sist.vo.FaqCategoryVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FaqDAO {
	@Autowired
	private FaqMapper mapper;

	//@Select("select fcno,cate from sul_faq_category_2_2")
	public FaqCategoryVO FaqCategoryList()
	{
		return mapper.FaqCategoryList();
	}
}
