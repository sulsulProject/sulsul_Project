package com.sist.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class WineDAO {
   @Autowired
   private WineMapper mapper;
   
   
//   @Autowired
//   private LikeMapper lmapper;
   //메인페이지 와인슬라이드(선우)
   public List<WineVO> mainWineListData()
   {
      return mapper.mainWineListData();
   }
   //메인페이지 위스키 슬라이드(선우)
   public List<WineVO> mainWhiskeyListData()
   {
      return mapper.mainWhiskeyListData();
   }
   //메인페이지 꼬냑 슬라이드(선우)
   public List<WineVO> mainCognacListData()
   {
      return mapper.mainCognacListData();
   }
   public WineVO wineDetailData(int ino)
   {
	   mapper.sulHitIncrement(ino);
      return mapper.wineDetailData(ino);
   }
   //와인 상세페이지 상세정보 표(선우)
   public List<WineVO> wineDetailListData(int ino)
   {
      return mapper.wineDetailListData(ino);
   }
   //와인 상세페이지 연관상품(선우)
   public List<WineVO> wineRelatedProductsListData()
   {
      return mapper.wineRelatedProductsListData();
   }
    // 쿠키 : 최근본 상품
    
    public WineVO sulCookieDetailData(int ino)
    {
       return mapper.wineDetailData(ino);
    }
   
   // 민우:와인 리스트
      public List<WineVO> wineListData(Map map)
      {
         return mapper.wineListData(map);
      }
      // 민우:와인 총페이지
      public int wineTotalPage()
      {
         return mapper.wineTotalPage();
      }
      
      // 민우:위스키 리스트

      public List<WineVO> whiskeyListData(Map map)
      {
         return mapper.whiskeyListData(map);
      }
      // 민우:위스키 총페이지
      public int whiskeyTotalPage()
      {
         return mapper.whiskeyTotalPage();
      }
          
      // 민우:꼬냑 리스트

      public List<WineVO> cognacListData(Map map)
      {
         return mapper.cognacListData(map);
      }
      // 민우:꼬냑 총페이지

      public int cognacTotalPage()
      {
         return mapper.cognacTotalPage();
      }
   // 민우 : 전체 와인 갯수
      public int wineCount()
      {
         return mapper.wineCount();
      }
   // 민우 : 전체 위스키 갯수
      public int whiskeyCount()
      {
         return mapper.whiskeyCount();
      }
   // 민우 : 나라별 꼬냑 전체 갯수 
      public int cognacCount()
      {
         return mapper.cognacCount();
      }
      // 민우 : 와인 옵션 검색 - 인기순(조회수)
      public List<WineVO> WineHitSort(Map map)
      {
         return mapper.WineHitSort(map);
      }
      // 와인 인기순 총페이지 // 의미
      public int wineHitTotalPage()
      {
         return mapper.wineHitTotalPage();
      }
               
      // 민우 : 와인 옵션 검색 - 가격높은순(조회수)
      public List<WineVO> WineHighPriceSort(Map map)
      {
         return mapper.WineHighPriceSort(map);
      }
      // 민우 : 와인 가격높은순 총페이지 // 없는
      public int wineHighPricePage()
      {
         return mapper.wineHighPricePage();
      }
      // 민우 : 와인 옵션 검색 - 가격낮은순(조회수)
   
      public List<WineVO> WineLowPriceSort(Map map)
      {
         return mapper.WineLowPriceSort(map);
      }
      // 민우 : 와인 가격낮은순 총페이지 // 거지 이거?
      public int wineLowPricePage()
      {
         return mapper.wineLowPricePage();
      }
      
       // 민우 : 위스키 옵션 검색 - 인기순(조회수)

      public List<WineVO> whiskeyHitSort(Map map)
      {
         return mapper.whiskeyHitSort(map);
      }
      // 민우 : 위스키 옵션 검색 - 가격높은순()

      public List<WineVO> whiskeyHighPriceSort(Map map)
      {
         return mapper.whiskeyHighPriceSort(map);
      }
      // 민우 : 위스키 옵션 검색 - 가격낮은순()

      public List<WineVO> whiskeyLowPriceSort(Map map)
      {
         return mapper.whiskeyLowPriceSort(map);
      }
      // 민우 : 꼬냑 옵션 검색 - 인기순(조회수)

      public List<WineVO> cognacHitSort(Map map)
      {
         return mapper.cognacHitSort(map);
      }
      // 민우 : 꼬냑 옵션 검색 - 가격높은순()

      public List<WineVO> cognacHighPriceSort(Map map)
      {
         return mapper.cognacHighPriceSort(map);
      }
      // 민우 : 꼬냑 옵션 검색 - 가격낮은순()

      public List<WineVO> cognacLowPriceSort(Map map)
      {
         return mapper.cognacLowPriceSort(map);
      }
      // 장바구니리스트
      public List<CartVO> wineCartListData(String id)
      {
         return mapper.wineCartListData(id);
      }
      // 장바구니추가
      public void wineCartInsert(CartVO vo)
      {
          mapper.wineCartInsert(vo);
      }
      //장바구니 삭제
      public void wineCartDelete(int bno)
      {
          mapper.wineCartDelete(bno);
      }
      //장바구니 총계
      public int cartTotalPrice(String id)
      {
         return mapper.cartTotalPrice(id);
      }
      
      public void wineLikeInsert(LikeVO vo)
      {
    	   mapper.wineLikeInsert(vo);
      }
      public int wineLikeCount(int ino)
      {
    	return mapper.wineLikeCount(ino); 
      }
      public int myLikeCount(int ino,String id)
      {
    	  return mapper.myLikeCount(ino, id);
      }
      // 와인 검색 데이터
      public List<WineVO> wineFindData(String ss)
      {
         return mapper.wineFindData(ss);
      }
      
      // 와인 검색 결과수
      public int wineFindCount(String ss)
      {
         return mapper.wineFindCount(ss);
      }
      
      //장바구니 개수
      public int cartCount(String id)
      {
    	  return mapper.cartCount(id);
      }

         

   

}