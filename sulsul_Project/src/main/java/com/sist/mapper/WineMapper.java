package com.sist.mapper;

import org.apache.ibatis.annotations.Select;
import com.sist.vo.*;
import java.util.*;
public interface WineMapper {

	@Select("SELECT ino,poster,name,price FROM sul_item_2_2 "
			+ "ORDER BY ino ASC")
	public List<WineVO> wineListData();
}
