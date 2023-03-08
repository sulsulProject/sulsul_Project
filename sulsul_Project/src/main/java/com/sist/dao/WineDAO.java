package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class WineDAO {
	@Autowired
	private WineMapper mapper;
	
	public List<WineVO> mainWineListData()
	{
		return mapper.mainWineListData();
	}
	
	public List<WineVO> wineListData(Map map)
	{
		return mapper.wineListData(map);
	}
	public int wineTotalPage()
	{
		return mapper.wineTotalPage();
	}
}
