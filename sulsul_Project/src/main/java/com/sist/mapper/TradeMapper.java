package com.sist.mapper;

<<<<<<< HEAD
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
=======
import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface TradeMapper {
	
	// 중고거래 리스트
	@Select("SELECT tdno, title, image, loc, price, seller, hit, num "
		  + "FROM (SELECT tdno, title, image, loc, price, seller, hit, rownum as num "
		  + "FROM (SELECT /*+INDEX_DESC(sul_tradedata_2_2 std_tdno_pk)*/tdno, title, image, loc, price, seller, hit "
		  + "FROM sul_tradedata_2_2 WHERE type=11 OR type=12 OR type=13 OR type=14)) "
		  + "WHERE num BETWEEN #{start} AND #{end}")
	public List<TradeVO> tradeListData(Map map);
	
	// 중고거래 리스트 총 페이지
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_tradedata_2_2 WHERE type=11 OR type=12 OR type=13 OR type=14")
	public int tradeListTotalPage();
	
	// 중고거래 조회수
	@Update("UPDATE sul_tradedata_2_2 "
		  + "SET "
		  + "hit = hit+1 "
		  + "WHERE tdno=#{tdno}")
	public void tradeHitIncrement(int fno);
	
	// 중고거래 상세페이지
	@Select("SELECT * FROM sul_tradedata_2_2 WHERE tdno = #{tdno}")
	public TradeVO tradeDetailData(int tdno);
	
	
>>>>>>> upstream/develop
}
