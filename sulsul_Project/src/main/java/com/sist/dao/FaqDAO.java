package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;

import com.sist.vo.*;

import lombok.Getter;
import lombok.Setter;

import com.sist.mapper.*;

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
