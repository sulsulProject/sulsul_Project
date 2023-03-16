package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface BoardMapper {
	
	// 자유게시판 목록
	@Select("SELECT fbno, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit, num "
		  + "FROM (SELECT fbno, subject, name, regdate, hit, rownum as num "
		  + "FROM (SELECT /*+INDEX_DESC(sul_freeboard_2_2 sf_fbno_pk)*/fbno, subject, name, regdate, hit "
		  + "FROM sul_freeboard_2_2)) "
		  + "WHERE num BETWEEN #{start} AND #{end}")
	public List<FreeBoardVO> freeboardListData(Map map);
	
	// 자유게시판 총 페이지
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM sul_freeboard_2_2")
	public int freeboardTotalPage(); 
	  
	// 자유게시판 sequence + 글 쓰기
	@SelectKey(keyProperty = "fbno", resultType = int.class , before = true, 
			   statement = "SELECT NVL(MAX(fbno)+1,1) as fbno FROM sul_freeboard_2_2")
	@Insert("INSERT INTO sul_freeboard_2_2 "
		  + "VALUES(#{fbno}, #{name}, #{subject}, #{content}, #{pwd}, SYSDATE, 0, #{id})")
	public void freeboardInsert(FreeBoardVO vo);
	
	// 자유게시판 조회수 증가
	@Update("UPDATE sul_freeboard_2_2 "
		  + "SET hit = hit + 1 "
		  + "WHERE fbno = #{fbno}")
	public void freeboardHitIncrement(int fbno);
	
	// 자유게시판 상세페이지
	@Select("SELECT fbno, name, subject, content, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit, id "
		  + "FROM sul_freeboard_2_2 "
		  + "WHERE fbno = #{fbno}")
	public FreeBoardVO freeboardDetailData(int fbno);
	  
	// 자유게시판 비밀번호 확인 (수정 / 삭제시 필요)
	@Select("SELECT pwd FROM sul_freeboard_2_2 "
		  + "WHERE fbno = #{fbno}")
	public String freeboardGetPassword(int fbno);
	  
	// 자유게시판 글 수정
	@Update("UPDATE sul_freeboard_2_2 "
		  + "SET name = #{name}, subject = #{subject}, content = #{content} "
		  + "WHERE fbno = #{fbno}")
	public void freeboardUpdate(FreeBoardVO vo);
	  
	// 자유게시판 글 삭제
	@Delete("DELETE FROM sul_freeboard_2_2 "
		  + "WHERE fbno = #{fbno}")
	public void freeboardDelete(int fbno);
	
	
	// 자유게시판 검색 데이터
	// <select id="freeboardFindData" resultType="FreeBoardVO" parameterType="hashmap">
	public List<FreeBoardVO> freeboardFindData(Map map);
	
	// 자유게시판 검색 결과수
	// <select id="findCount" resultType="int" parameterType="hashmap">
	public int findCount(Map map);
	
	// 자유게시판 검색 결과 총 페이지
	// <select id="findTotalPage" resultType="int">
	public int findTotalPage();

	// 이벤트게시판 목록
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
		  + "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
		  + "FROM (SELECT /*+INDEX_ASC(sul_eventboard_2_2 seb_ebno_pk)*/ebno, title, image, rdate, loc, kind, hit "
		  + "FROM sul_eventboard_2_2)) "
		  + "WHERE num BETWEEN #{start} AND #{end}")
	public List<EventBoardVO> eventboardListData(Map map);
	
	// 이벤트게시판 총 페이지
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2")
	public int eventboardTotalPage(); 
	
	// 이벤트게시판 조회수 증가
	@Update("UPDATE sul_eventboard_2_2 "
		  + "SET hit = hit + 1 "
		  + "WHERE ebno = #{ebno}")
	public void eventboardHitIncrement(int ebno);
	
	// 이벤트게시판 상세페이지
	@Select("SELECT * "
		  + "FROM sul_eventboard_2_2 "
		  + "WHERE ebno = #{ebno}")
	public EventBoardVO eventboardDetailData(int ebno);
	
	
	// 이벤트게시판 판매행사 목록
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
		  + "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
		  + "FROM (SELECT /*+INDEX_ASC(sul_eventboard_2_2 seb_ebno_pk)*/ebno, title, image, rdate, loc, kind, hit "
		  + "FROM sul_eventboard_2_2 WHERE kind = '판매행사')) "
		  + "WHERE num BETWEEN #{start} AND #{end}")
	public List<EventBoardVO> eventboard_sell_ListData(Map map);
	// 이벤트게시판 총 페이지
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2 WHERE kind = '판매행사'")
	public int eventboard_sell_TotalPage(); 
	
	// 이벤트게시판 디너 목록
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
			+ "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(sul_eventboard_2_2 seb_ebno_pk)*/ebno, title, image, rdate, loc, kind, hit "
			+ "FROM sul_eventboard_2_2 WHERE kind = '디너')) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<EventBoardVO> eventboard_dinner_ListData(Map map);
	
	// 이벤트게시판 디너 총 페이지
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2 WHERE kind = '디너'")
	public int eventboard_dinner_TotalPage(); 
	
	// 이벤트게시판 판매행사 목록
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
			+ "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(sul_eventboard_2_2 seb_ebno_pk)*/ebno, title, image, rdate, loc, kind, hit "
			+ "FROM sul_eventboard_2_2 WHERE kind = '교육')) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<EventBoardVO> eventboard_edu_ListData(Map map);
	
	// 이벤트게시판 총 페이지
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2 WHERE kind = '교육'")
	public int eventboard_edu_TotalPage(); 
	
	// 이벤트게시판 시음회 목록
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
			+ "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(sul_eventboard_2_2 seb_ebno_pk)*/ebno, title, image, rdate, loc, kind, hit "
			+ "FROM sul_eventboard_2_2 WHERE kind = '시음회')) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<EventBoardVO> eventboard_si_ListData(Map map);
	
	// 이벤트게시판 총 페이지
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2 WHERE kind = '시음회'")
	public int eventboard_si_TotalPage(); 
	
	// 이벤트게시판 판매행사 목록
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
			+ "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(sul_eventboard_2_2 seb_ebno_pk)*/ebno, title, image, rdate, loc, kind, hit "
			+ "FROM sul_eventboard_2_2 WHERE kind = '기타')) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<EventBoardVO> eventboard_other_ListData(Map map);
	
	// 이벤트게시판 총 페이지
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2 WHERE kind = '기타'")
	public int eventboard_other_TotalPage(); 
	
	
	/*
	// 거래게시판 목록
	@Select("SELECT tbno, name, subject, content, price, loc, TO_CHAR(regdate,'YYYY-MM-DD') as dbday, hit, fileimage, filecount, id, num "
	   		+ "FROM (SELECT tbno, name, subject, content, price, loc, regdate, hit, fileimage, filecount, id, rownum as num "
	   		+ "FROM (SELECT /*+ INDEX_DESC(sul_tradeBoard_2_2 st_tbno_pk)tbno, name, subject, content, price, loc, regdate, hit, fileimage, filecount, id "
	   		+ "FROM sul_tradeBoard_2_2)) "
	   		+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<TradeBoardVO> tradeboardListData(Map map);
	   
	// 거래게시판 총 페이지
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM sul_tradeBoard_2_2")
	public int databoardTotalPage(); */
}
