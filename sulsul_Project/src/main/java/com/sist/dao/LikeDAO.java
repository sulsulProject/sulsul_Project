package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.LikeMapper;
import com.sist.vo.WineVO;

@Repository
public class LikeDAO {
	@Autowired
private LikeMapper mapper;
	
	public List<WineVO> mypageLikeData(Map map)
	{
		return mapper.mypageLikeData(map);
	}
	 public int likeTotalPage(String id)
	 {
		 return mapper.likeTotalPage(id);
	 }
	 public void likeListDelete(int lno)
	 {
		 mapper.likeListDelete(lno);
	 }
}
