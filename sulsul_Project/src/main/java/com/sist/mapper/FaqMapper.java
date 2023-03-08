package com.sist.mapper;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.FaqCategoryVO;

public interface FaqMapper {
	@Select("select fcno,cate from sul_faq_category_2_2")
	public FaqCategoryVO FaqCategoryList();
}
