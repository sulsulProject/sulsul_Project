package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import com.sist.vo.*;
import java.util.*;
public interface WineMapper {

	@Select("SELECT ino,poster,name,price FROM sul_item_2_2")
	public List<WineVO> mainWineListData();
	
	@Select("SELECT ino,poster,name,price,icno,num "
			+ "FROM (SELECT ino,poster,name,price,icno,rownum as num "
			+ "FROM (SELECT /*+ INDEX_DESC(sul_item_2_2 si_ino_pk)*/ino,poster,name,price,icno "
			+ "FROM sul_item_2_2)) "
			+ "WHERE icno=1 "
			+ "AND num BETWEEN #{start} AND #{end}")
	public List<WineVO> wineListData(Map map);
	
	  @Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=1")
	  public int wineTotalPage();
}
