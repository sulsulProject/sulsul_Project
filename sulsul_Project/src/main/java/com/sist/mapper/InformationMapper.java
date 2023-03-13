package com.sist.mapper;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

/*	IUNO    NOT NULL NUMBER
SUBJECT NOT NULL VARCHAR2(1000)
IMAGE            VARCHAR2(600)
REGDATE          DATE
HIT              NUMBER
*/
import com.sist.vo.InformationUseVO;

public interface InformationMapper {
	@Select("select iuno,subject,image,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,num "
		  + "from (select iuno,subject,image,regdate,hit,rownum as num "
		  + "from (select /*+index_desc(sul_information_use_2_2 siu_iuno_pk)*/iuno,subject,image,regdate,hit "
		  + "from sul_information_use_2_2)) "
		  + "where num between #{start} and #{end}")
	public List<InformationUseVO> informationListData(Map map);

	@Select("select ceil(count(*)/10.0) from sul_information_use_2_2")
	public int informationTotalPage();
}
