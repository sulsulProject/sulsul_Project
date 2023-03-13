package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.TradeVO;

public interface TradeMapper {
	//1.목록
	   @Select("SELECT tbno, name, subject, content, price, loc, TO_CHAR(regdate,'YYYY-MM-DD') as dbday, hit, fileimage, filecount, id, num "
	   		+ "FROM (SELECT tbno, name, subject, content, price, loc, regdate, hit, fileimage, filecount, id, rownum as num "
	   		+ "FROM (SELECT /*+ INDEX_DESC(sul_tradeBoard_2_2 st_tbno_pk)*/tbno, name, subject, content, price, loc, regdate, hit, fileimage, filecount, id "
	   		+ "FROM sul_tradeBoard_2_2)) "
	   		+ "WHERE num BETWEEN #{start} AND #{end}")
	   public List<TradeVO> databoardListData(Map map);

	   @Select("SELECT CEIL(COUNT(*)/10.0) FROM spring_databoard")
	   public int databoardTotalPage();
}
