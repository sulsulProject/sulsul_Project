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
	
	@Autowired
	private sulMapper smapper;
	
//	@Autowired
//	private LikeMapper lmapper;
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
				return smapper.whiskeyCount();
			}
			// 민우 : 나라별 꼬냑 전체 갯수 
			public int cognacCount()
			{
				return smapper.cognacCount();
			}
			// 민우 : 와인 검색
			public List<WineVO> wineFindData(Map map)
			{
				return mapper.wineFindData(map);
			}
			
			// 와인 : 검색창 총페이지
			public int wineFindPage(String name)
			{
				return mapper.wineFindPage(name);
			}
			// 민우 : 위스키 검색
			public List<WineVO> whiskeyFindData(Map map)
			{
				return mapper.whiskeyFindData(map);
			}
					
			// 와인 : 검색창 총페이지
			public int whiskeyFindPage(String name)
			{
				return mapper.whiskeyFindPage(name);
			}	
			// 민우 : 와인 검색
			public List<WineVO> cognacFindData(Map map)
			{
				return mapper.cognacFindData(map);
			}
					
			// 와인 : 검색창 총페이지
			public int cognacFindPage(String name)
			{
				return mapper.cognacFindPage(name);
			}

	

}
