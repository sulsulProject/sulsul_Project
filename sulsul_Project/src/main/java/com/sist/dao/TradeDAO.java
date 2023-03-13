package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.TradeMapper;
import com.sist.vo.TradeVO;

@Repository
public class TradeDAO {
	@Autowired
	private TradeMapper mapper;
	/*
	@Select("SELECT tdno, title, image, loc, price, seller, num "
		  + "FROM (SELECT tdno, title, image, loc, price, seller, rownum as num "
		  + "FROM (SELECT tdno, title, image, loc, price, seller "
		  + "FROM sul_tradedata_2_2)) "
		  + "WHERE num BETWEEN #{start} AND #{end}") */
	public List<TradeVO> tradeListData(Map map) {
		return mapper.tradeListData(map);
	}
	/*
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_tradedata_2_2") */
	public int tradeListTotalPage() {
		return mapper.tradeListTotalPage();
	}
	
	// 중고거래 조회수
	/*
	@Update("UPDATE sul_tradedata_2_2 "
		  + "SET "
		  + "hit = hit+1 "
		  + "WHERE tdno=#{tdno}") 
	public void tradeHitIncrement(int fno);
	
	// 중고거래 상세페이지
	@Select("SELECT * FROM sul_tradedata_2_2 WEHRE tdno = #{tdno}") */
	public TradeVO tradeDetailData(int tdno) {
		mapper.tradeHitIncrement(tdno);
		return mapper.tradeDetailData(tdno);
	}
}
