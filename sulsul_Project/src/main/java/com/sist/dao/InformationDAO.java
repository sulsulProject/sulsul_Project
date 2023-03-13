package com.sist.dao;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.InformationMapper;
import com.sist.vo.InformationUseVO;

@Repository
public class InformationDAO {
	@Autowired
	private InformationMapper mapper;

	//@Select("select iuno,subject,image,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,num "
	//  + "from (select iuno,subject,image,regdate,hit,rownum as num "
	//  + "from (select /*+index_desc(sul_information_use_2_2 siu_iuno_pk)*/iuno,subject,image,regdate,hit"
	//  + "from sul_information_use_2_2)) "
	//  + "where num between #{start} and #{end}")
	public List<InformationUseVO> informationListData(Map map)
	{
		return mapper.informationListData(map);/////
	}

	//@Select("select ceil(count(*)/10.0) from sul_information_use_2_2")
	public int informationTotalPage()
	{
		return mapper.informationTotalPage();
	}
}
