package com.sist.mapper;

import org.apache.ibatis.annotations.Select;

public interface sulMapper {
	// 나라별 위스키 갯수 검색 - 미국
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=2)WHERE nation Like '미국'")
		 public int whiskeyUSACount();
		// 나라별 위스키 갯수 검색 - 프랑스
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=2)WHERE nation Like '프랑스'")
		 public int whiskeyFranceCount();
		// 나라별 위스키 갯수 검색 - 이태리
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=2)WHERE nation Like '이태리'")
		 public int whiskeyItalyCount();
		// 나라별 위스키 갯수 검색 - 칠레
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=2)WHERE nation Like '칠레'")
		 public int whiskeyChileCount();
		// 나라별 위스키 갯수 검색 - 스페인
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=2)WHERE nation Like '스페인'")
		 public int whiskeySpainCount();
		// 나라별 위스키 갯수 검색 - 포르투갈
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=2)WHERE nation Like '포르투갈'")
		 public int whiskeyPortugalCount();
		// 나라별 위스키 갯수 검색 - 기타
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=2)WHERE nation Like '기타'")
		public int whiskeyEtcCount();
		// 전체 위스키 갯수 검색 - 기타
		@Select("SELECT COUNT(*) FROM sul_item_2_2 where icno=2")
		public int whiskeyCount();
		
		// 나라별 꼬냑 갯수 검색 - 미국
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=3)WHERE nation Like '미국'")
		 public int cognacUSACount();
		// 나라별 꼬냑 갯수 검색 - 프랑스
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=3)WHERE nation Like '프랑스'")
		 public int cognacFranceCount();
		// 나라별 꼬냑 갯수 검색 - 이태리
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=3)WHERE nation Like '이태리'")
		 public int cognacItalyCount();
		// 나라별 꼬냑 갯수 검색 - 칠레
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=3)WHERE nation Like '칠레'")
		 public int cognacChileCount();
		// 나라별 꼬냑 갯수 검색 - 스페인
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=3)WHERE nation Like '스페인'")
		 public int cognacSpainCount();
		// 나라별 꼬냑 갯수 검색 - 포르투갈
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=3)WHERE nation Like '포르투갈'")
		 public int cognacPortugalCount();
		// 나라별 꼬냑 갯수 검색 - 기타
		 @Select("SELECT COUNT(*)FROM (SELECT * from sul_item_2_2 where icno=3)WHERE nation Like '기타'")
		public int cognacEtcCount();
		// 전체 꼬냑 갯수 검색 - 기타
		@Select("SELECT COUNT(*) FROM sul_item_2_2 where icno=3")
		public int cognacCount();
}
