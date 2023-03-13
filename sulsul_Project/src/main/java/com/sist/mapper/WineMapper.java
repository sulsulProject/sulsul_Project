package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
<<<<<<< HEAD

import com.sist.vo.WineVO;
=======
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
import java.util.*;
>>>>>>> upstream/develop
public interface WineMapper {
	//메인페이지 와인 슬라이드(선우)
	@Select("select name,poster,price "
		  + "from (SELECT name,poster,price,icno "
		  + "from sul_item_2_2 order by hit desc) "
		  + "where icno=1 and rownum <=12")
	public List<WineVO> mainWineListData();
<<<<<<< HEAD

	@Select("SELECT ino,poster,name,price,icno,num "
			+ "FROM (SELECT ino,poster,name,price,icno,rownum as num "
			+ "FROM (SELECT /*+ INDEX_DESC(sul_item_2_2 si_ino_pk)*/ino,poster,name,price,icno "
			+ "FROM sul_item_2_2)) "
			+ "WHERE icno=1 "
			+ "AND num BETWEEN #{start} AND #{end}")
	public List<WineVO> wineListData(Map map);

	  @Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=1")
	  public int wineTotalPage();
=======
	//메인페이지 위스키 슬라이드(선우)
	@Select("select name,poster,price "
			  + "from (SELECT name,poster,price,icno "
			  + "from sul_item_2_2 order by hit desc) "
			  + "where icno=2 and rownum <=12")
		public List<WineVO> mainWhiskeyListData();
	//메인페이지 꼬냑 슬라이드(선우)
	@Select("select name,poster,price "
			  + "from (SELECT name,poster,price,icno "
			  + "from sul_item_2_2 order by hit desc) "
			  + "where icno=3 and rownum <=12")
		public List<WineVO> mainCognacListData();
	//와인 상세페이지(선우)
	@Select("SELECT ino,poster,name,name_sub,price,first_price,discount,nation,alcohol,capacity,vintage,place,winery,icno,hit "
			+ "FROM sul_item_2_2 "
			+ "WHERE ino=#{ino}")
	public WineVO wineDetailData(int ino);
	
	//와인 상세페이지(상세정보 표) 선우
	@Select("SELECT ino,nation,alcohol,capacity,vintage,place,winery "
			+ "FROM sul_item_2_2 "
			+ "WHERE ino=#{ino}")
	public List<WineVO> wineDetailListData(int ino);
	
	//와인 상세페이지 연관상품 (선우)
	@Select("SELECT ino, poster,name,price FROM sul_item_2_2")
	public List<WineVO> wineRelatedProductsListData();
	
	   //와인 리스트
	   @Select("SELECT ino,poster,name,price,num "
	         +"FROM (SELECT ino,poster,name,price,rownum as num "
	         +"FROM (SELECT /*+ INDEX_ASC(sul_item_2_2 si_ino_pk)*/ino,poster,name,price "
	         +"FROM sul_item_2_2 where icno=1)) "
	         +"where num BETWEEN #{start} AND #{end}")
	   public List<WineVO> wineListData(Map map);
	   // 와인 총페이지
	     @Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=1")
	     public int wineTotalPage();
	     
	   // 위스키 리스트
	   @Select("SELECT ino,poster,name,price,num "
	         +"FROM (SELECT ino,poster,name,price,rownum as num "
	         +"FROM (SELECT /*+ INDEX_ASC(sul_item_2_2 si_ino_pk)*/ino,poster,name,price "
	         +"FROM sul_item_2_2 where icno=2)) "
	         +"where num BETWEEN #{start} AND #{end}")
	   public List<WineVO> whiskeyListData(Map map);
	   // 위스키 총페이지
	    @Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=2")
	    public int whiskeyTotalPage();
	    
	   // 꼬냑 리스트
	   @Select("SELECT ino,poster,name,price,num "
	            +"FROM (SELECT ino,poster,name,price,rownum as num "
	            +"FROM (SELECT /*+ INDEX_ASC(sul_item_2_2 si_ino_pk)*/ino,poster,name,price "
	            +"FROM sul_item_2_2 where icno=3)) "
	            +"where num BETWEEN #{start} AND #{end}")
	   public List<WineVO> cognacListData(Map map);
	   // 꼬냑 총페이지
	    @Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=3")
	   public int cognacTotalPage();
	    
		// 술 조회수 증가
		@Update("UPDATE sul_item_2_2 SET "
				+"hit=hit+1 "
				+"WHERE ino=#{ino}")
		public void sulHitIncrement(int ino);
		
		// 와인 검색
				@Select("SELECT ino,name,poster,price,num "
						+"FROM (SELECT ino,name,poster,price,rownum as num "
						+"FROM (SELECT ino,name,poster,price "
						+"FROM sul_item_2_2 "
						+"WHERE icno=1 and name LIKE '%'||#{name}||'%' ORDER BY ino ASC)) "
						+"WHERE num BETWEEN #{start} AND #{end}")
				public List<WineVO> wineFindData(Map map);
			// 와인 검색창 총페이지
				@Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=1 and name like '%'||#{name}||'%'")
				public int wineFindPage(String name);
			
			// 위스키 검색
				@Select("SELECT ino,name,poster,price,num "
						+"FROM (SELECT ino,name,poster,price,rownum as num "
						+"FROM (SELECT ino,name,poster,price "
						+"FROM sul_item_2_2 "
						+"WHERE icno=2 and name LIKE '%'||#{name}||'%' ORDER BY ino ASC)) "
						+"WHERE num BETWEEN #{start} AND #{end}")
				public List<WineVO> whiskeyFindData(Map map);
			// 위스키 검색창 총페이지
				@Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=2 and name like '%'||#{name}||'%'")
				public int whiskeyFindPage(String name);
			// 꼬냑 검색
				@Select("SELECT ino,name,poster,price,num "
						+"FROM (SELECT ino,name,poster,price,rownum as num "
						+"FROM (SELECT ino,name,poster,price "
						+"FROM sul_item_2_2 "
						+"WHERE icno=3 and name LIKE '%'||#{name}||'%' ORDER BY ino ASC)) "
						+"WHERE num BETWEEN #{start} AND #{end}")
				public List<WineVO> cognacFindData(Map map);
			// 꼬냑 검색창 총페이지
				@Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=3 and name like '%'||#{name}||'%'")
				public int cognacFindPage(String name);
				@Select("SELECT COUNT(*) FROM sul_item_2_2 where icno=1")
				public int wineCount();

>>>>>>> upstream/develop
}
