package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
import java.util.*;
public interface WineMapper {
   //메인페이지 와인 슬라이드(선우)
   @Select("select name,poster,TO_CHAR(price , '999,999,999,999,999') as price "
        + "from (SELECT name,poster,price,icno "
        + "from sul_item_2_2 order by hit desc) "
        + "where icno=1 and rownum <=12")
   public List<WineVO> mainWineListData();
   
   //메인페이지 위스키 슬라이드(선우)
   @Select("select name,poster,TO_CHAR(price , '999,999,999,999,999') as price "
           + "from (SELECT name,poster,price,icno "
           + "from sul_item_2_2 order by hit desc) "
           + "where icno=2 and rownum <=12")
      public List<WineVO> mainWhiskeyListData();
   
   //메인페이지 꼬냑 슬라이드(선우)
   @Select("select name,poster,TO_CHAR(price , '999,999,999,999,999') as price "
           + "from (SELECT name,poster,price,icno "
           + "from sul_item_2_2 order by hit desc) "
           + "where icno=3 and rownum <=12")
      public List<WineVO> mainCognacListData();
   
   //와인 상세페이지(선우)
   @Select("SELECT ino,poster,name,name_sub,TO_CHAR(price , '999,999,999,999,999') as price,first_price,discount,nation,alcohol,capacity,vintage,place,winery,icno,hit,account "
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
    @Select("SELECT ino,poster,name,name_sub,TO_CHAR(price , '999,999,999') as price,first_price,discount,nation,alcohol,capacity,vintage,place,winery,icno,hit,num "
            +"FROM (SELECT ino,poster,name,name_sub,price,first_price,discount,nation,alcohol,capacity,vintage,place,winery,icno,hit,rownum as num "
            +"FROM (SELECT /*+ INDEX_ASC(sul_item_2_2 si_ino_pk)*/ino,poster,name,name_sub,price,first_price,discount,nation,alcohol,capacity,vintage,place,winery,icno,hit "
            +"FROM sul_item_2_2 where icno=1)) "
            +"where num BETWEEN #{start} AND #{end}")
    public List<WineVO> wineListData(Map map);
    
    // 와인 총페이지
    @Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=1")
    public int wineTotalPage();
        
    // 위스키 리스트
    @Select("SELECT ino,poster,name,TO_CHAR(price , '999,999,999,999,999') as price,nation,capacity,vintage,num "
            +"FROM (SELECT ino,poster,name,price,nation,capacity,vintage,rownum as num "
            +"FROM (SELECT /*+ INDEX_ASC(sul_item_2_2 si_ino_pk)*/ino,poster,name,price,nation,capacity,vintage "
            +"FROM sul_item_2_2 where icno=2)) "
            +"where num BETWEEN #{start} AND #{end}")
    public List<WineVO> whiskeyListData(Map map);
    
    // 위스키 총페이지
    @Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=2")
    public int whiskeyTotalPage();
       
    // 꼬냑 리스트
    @Select("SELECT ino,poster,name,TO_CHAR(price , '999,999,999,999,999') as price,nation,capacity,vintage,num "
               +"FROM (SELECT ino,poster,name,price,nation,capacity,vintage,rownum as num "
               +"FROM (SELECT /*+ INDEX_ASC(sul_item_2_2 si_ino_pk)*/ino,poster,name,price,nation,capacity,vintage "
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
            
    // 와인 전체 갯수
    @Select("SELECT COUNT(*) FROM sul_item_2_2 where icno=1")
    public int wineCount();
      
    // 민우 : 와인 옵션 검색 - 인기순(조회수)
    @Select("SELECT ino,poster,name,TO_CHAR(price , '999,999,999,999,999') as price,nation,capacity,vintage,num "
                     +"FROM (SELECT ino,poster,name,price,nation,capacity,vintage,rownum as num "
                     +"FROM (SELECT /*+ INDEX_ASC(sul_item_2_2 si_ino_pk)*/ino,poster,name,price,nation,capacity,vintage "
                     +"FROM sul_item_2_2 where icno=1 order by hit desc)) "
                     +"where num BETWEEN #{start} AND #{end}")
    public List<WineVO> WineHitSort(Map map);
    
    // 와인 인기순 총페이지 --> 잠깐 어차피 이거 와인 리스트 페이지랑
    @Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=1 order by hit desc")
    public int wineHitTotalPage();
            
    // 민우 : 와인 옵션 검색 - 가격높은순()
    @Select("SELECT ino,poster,name,TO_CHAR(price , '999,999,999,999,999')as price,nation,capacity,vintage,num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage,rownum as num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage "
                  + "FROM sul_item_2_2 where icno=1 order by price desc)) "
                  + "where num BETWEEN #{start} AND #{end}")
    public List<WineVO> WineHighPriceSort(Map map);
    
    // 와인 가격높은순 총페이지 --> 똑같아서 의미없는거잖아
    @Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=1 order by price desc")
    public int wineHighPricePage();
    
    // 민우 : 와인 옵션 검색 - 가격낮은순()
    @Select("SELECT ino,poster,name,TO_CHAR(price , '999,999,999,999,999')as price,nation,capacity,vintage,num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage,rownum as num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage "
                  + "FROM sul_item_2_2 where icno=1 order by price asc)) "
                  + "where num BETWEEN #{start} AND #{end}")
    public List<WineVO> WineLowPriceSort(Map map);
    
    // 와인 가격낮은순 총페이지 --> 그냥 총페이지는 리스트껄로 통일해서 가는거겟지?
    @Select("SELECT CEIL(COUNT(*)/5.0) FROM sul_item_2_2 WHERE icno=1 order by price ASC")
    public int wineLowPricePage();
    
    // 민우 : 위스키 옵션 검색 - 인기순(조회수)
    @Select("SELECT ino,poster,name,TO_CHAR(price , '999,999,999,999,999') as price,nation,capacity,vintage,num "
                     +"FROM (SELECT ino,poster,name,price,nation,capacity,vintage,rownum as num "
                     +"FROM (SELECT /*+ INDEX_ASC(sul_item_2_2 si_ino_pk)*/ino,poster,name,price,nation,capacity,vintage "
                     +"FROM sul_item_2_2 where icno=2 order by hit desc)) "
                     +"where num BETWEEN #{start} AND #{end}")
    public List<WineVO> whiskeyHitSort(Map map);
    
    // 민우 : 위스키 옵션 검색 - 가격높은순()
    @Select("SELECT ino,poster,name,TO_CHAR(price , '999,999,999,999,999')as price,nation,capacity,vintage,num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage,rownum as num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage "
                  + "FROM sul_item_2_2 where icno=2 order by price desc)) "
                  + "where num BETWEEN #{start} AND #{end}")
    public List<WineVO> whiskeyHighPriceSort(Map map);
    
    // 민우 : 위스키 옵션 검색 - 가격낮은순()
    @Select("SELECT ino,poster,name,TO_CHAR(price , '999,999,999,999,999')as price,nation,capacity,vintage,num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage,rownum as num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage "
                  + "FROM sul_item_2_2 where icno=2 order by price asc)) "
                  + "where num BETWEEN #{start} AND #{end}")
    public List<WineVO> whiskeyLowPriceSort(Map map);
    
    // 민우 : 꼬냑 옵션 검색 - 인기순(조회수)
    @Select("SELECT ino,poster,name,TO_CHAR(price , '999,999,999,999,999') as price,nation,capacity,vintage,num "
                     +"FROM (SELECT ino,poster,name,price,nation,capacity,vintage,rownum as num "
                     +"FROM (SELECT /*+ INDEX_ASC(sul_item_2_2 si_ino_pk)*/ino,poster,name,price,nation,capacity,vintage "
                     +"FROM sul_item_2_2 where icno=3 order by hit desc)) "
                     +"where num BETWEEN #{start} AND #{end}")
    public List<WineVO> cognacHitSort(Map map);
    // 민우 : 꼬냑 옵션 검색 - 가격높은순()
    @Select("SELECT ino,poster,name,TO_CHAR(price , '999,999,999,999,999')as price,nation,capacity,vintage,num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage,rownum as num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage "
                  + "FROM sul_item_2_2 where icno=3 order by price desc)) "
                  + "where num BETWEEN #{start} AND #{end}")
    public List<WineVO> cognacHighPriceSort(Map map);
    // 민우 : 꼬냑 옵션 검색 - 가격낮은순()
    @Select("SELECT ino,poster,name,TO_CHAR(price , '999,999,999,999,999')as price,nation,capacity,vintage,num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage,rownum as num "
                  + "FROM (SELECT ino,poster,name,price,nation,capacity,vintage "
                  + "FROM sul_item_2_2 where icno=3 order by price asc)) "
                  + "where num BETWEEN #{start} AND #{end}")
    public List<WineVO> cognacLowPriceSort(Map map);
            
    @Results({
               @Result(property = "wvo.name", column = "name"),
               @Result(property = "wvo.name_sub", column = "name_sub"),
               @Result(property = "wvo.poster", column = "poster"),
               @Result(property = "wvo.price", column = "price")
               
            })
    // 장바구니 리스트
    @Select("SELECT MIN(bno) AS bno, sb.ino, MIN(id) AS id, sum(sb.account) AS account, SUM(total_price) AS total_price, MIN(TO_CHAR(regdate,'YYYY-MM-DD')) AS dbday, MAX(buy_ok) AS buy_ok, MAX(poster) AS poster, MAX(name) AS name, MAX(name_sub) AS name_sub, MAX(price) AS price "
                  + "FROM sul_buy_2_2 sb, sul_item_2_2 si "
                  + "WHERE sb.ino=si.ino AND id=#{id} "
                  + "GROUP BY sb.ino")
    public List<CartVO> wineCartListData(String id);
    // 장바구니 추가
    @Insert("INSERT INTO sul_buy_2_2 VALUES(sb_bno_seq.nextval,#{ino},#{id},#{account},#{total_price},'y',SYSDATE)")
    public void wineCartInsert(CartVO vo);
    // 장바구니 삭제
    @Delete("DELETE FROM sul_buy_2_2 WHERE bno=#{bno}")
    public void wineCartDelete(int bno);
            
    //장바구니 총계
    @Select("SELECT COALESCE(sum(total_price), 0) FROM sul_buy_2_2 WHERE id=#{id}")
    public int cartTotalPrice(String id);
    
    //찜하기 
    @Insert("INSERT INTO sul_like_2_2 VALUES(SELECT NVL(MAX(lno)+1,1) FROM sul_like_2_2),#{ino},#{id}")
    public void wineLikeInsert(LikeVO vo);
    
    //찜하기 개수
    @Select("SELECT COUNT(*) FROM sul_like_2_2")
    public int wineLikeCount(int ino);
    
    @Select("SELECT COUNT(*) FROM sul_like_2_2 WHERE ino=#{ino} AND id=#{id}")
    public int myLikeCount(int ino,String id);
    
    // 와인 검색 데이터
   @Select("SELECT ino,name,poster,price,nation,capacity,vintage from sul_item_2_2 where name LIKE '%'||#{ss}||'%' OR nation LIKE '%'||#{ss}||'%'")
   public List<WineVO> wineFindData(String ss);
   
   // 와인 검색 결과수
   @Select("SELECT COUNT(*) FROM sul_item_2_2 WHERE name LIKE '%'||#{ss}||'%' OR nation LIKE '%'||#{ss}||'%'")
   public int wineFindCount(String ss);
  
   //장바구니 count
   @Select("SELECT COUNT(*) FROM sul_buy_2_2 WHERE id=#{id}")
   public int cartCount(String id);

	// 전체 꼬냑 갯수 검색 - 기타
	@Select("SELECT COUNT(*) FROM sul_item_2_2 where icno=3")
	public int cognacCount();
	// 전체 위스키 갯수 검색 - 기타
	@Select("SELECT COUNT(*) FROM sul_item_2_2 where icno=2")
	public int whiskeyCount();
	
}