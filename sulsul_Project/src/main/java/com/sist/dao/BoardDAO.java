package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BoardMapper;
import com.sist.vo.EventBoardVO;
import com.sist.vo.FreeBoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private BoardMapper mapper;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	// 자유게시판 목록
	/*
	@Select("SELECT fbno, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit, num "
		  + "FROM (SELECT fbno, subject, name, regdate, hit, rownum as num "
		  + "FROM (SELECT /*+INDEX_DESC(sul_freeboard_2_2 sf_fbno_pk) /fbno, subject, name, regdate, hit "
		  + "FROM sul_freeboard_2_2)) "
		  + "WHERE num BETWEEN #{start} AND #{end}") */
	public List<FreeBoardVO> freeboardListData(Map map) {
		return mapper.freeboardListData(map);
	}
	
	// 자유게시판 총 페이지
	/*
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM sul_freeboard_2_2") */
	public int freeboardTotalPage() {
		return mapper.freeboardTotalPage();
	}
	  
	// 자유게시판 sequence + 글 쓰기
	/*
	@SelectKey(keyProperty = "fbno", resultType = int.class , before = true, 
			   statement = "SELECT NVL(MAX(fbno)+1,1) as fbno FROM sul_freeboard_2_2")
	@Insert("INSERT INTO sul_freeboard_2_2 "
		  + "VALUES(#{fbno}, #{name}, #{subject}, #{content}, #{pwd}, SYSDATE, 0)") */
	public void freeboardInsert(FreeBoardVO vo) {
		mapper.freeboardInsert(vo);
	}
	
	// 자유게시판 조회수 증가
	/*
	@Update("UPDATE sul_freeboard_2_2 "
		  + "SET hit = hit + 1 "
		  + "WHERE fbno = #{fbno}")
	public void freeboardHitIncrement(int fbno);
	
	// 자유게시판 상세페이지
	@Select("SELECT fbno, name, subject, content, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit, id "
		  + "FROM sul_freeboard_2_2 "
		  + "WHERE fbno = #{fbno}") */
	public FreeBoardVO freeboardDetailData(int fbno) {
		mapper.freeboardHitIncrement(fbno);
		return mapper.freeboardDetailData(fbno);
	}
	  
	// 자유게시판 비밀번호 확인 (수정 / 삭제시 필요)
	/*
	@Select("SELECT pwd FROM sul_freeboard_2_2 "
		  + "WHERE fbno = #{fbno}")
	public String freeboardGetPassword(int fbno) {
		return mapper.freeboardGetPassword(fbno);
	}  */
	  
	// 자유게시판 글 수정
	/*
	@Update("UPDATE sul_freeboard_2_2 "
		  + "SET name = #{name}, subject = #{subject}, content = #{content} "
		  + "WHERE fbno = #{fbno}") */
	public String freeboardUpdate(FreeBoardVO vo) {
		String res = "no";
		String db_pwd = mapper.freeboardGetPassword(vo.getFbno());
		if(db_pwd.equals(vo.getPwd())) {
			mapper.freeboardUpdate(vo);
			res = "yes";
		}
		return res;
	}
	  
	// 자유게시판 글 삭제
	/*
	@Delete("DELETE FROM sul_freeboard_2_2 "
		  + "WHERE fbno = #{fbno}") */
	public String freeboardDelete(int fbno, String pwd) {
		String res = "no";
		String db_pwd = mapper.freeboardGetPassword(fbno);
		if(encoder.matches(pwd, db_pwd)) {
			mapper.freeboardDelete(fbno);
			res = "yes";
		}
		return res;
	}
	
	// 자유게시판 검색 데이터
	// <select id="freeboardFindData" resultType="FreeBoardVO" parameterType="hashmap">
	public List<FreeBoardVO> freeboardFindData(Map map) {
		return mapper.freeboardFindData(map);
	}
	
	// 자유게시판 검색 결과수
	// <select id="findCount" resultType="int" parameterType="hashmap">
	public int findCount(Map map) {
		return mapper.findCount(map);
	}
	
	// 자유게시판 검색 결과 총 페이지
	// <select id="findTotalPage" resultType="int">
	public int findTotalPage() {
		return mapper.findTotalPage();
	}
	
	
	
	// 이벤트게시판 목록
	/*
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
		  + "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
		  + "FROM (SELECT /*+INDEX_DESC(sul_eventboard_2_2 seb_ebno_pk)/ebno, title, image, rdate, loc, kind, hit "
		  + "FROM sul_eventboard_2_2)) "
		  + "WHERE num BETWEEN #{start} AND #{end}") */
	public List<EventBoardVO> eventboardListData(Map map) {
		return mapper.eventboardListData(map);
	}
	
	// 이벤트게시판 총 페이지
	/*
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2") */
	public int eventboardTotalPage() {
		return mapper.eventboardTotalPage();
	}
	// 이벤트게시판 판매행사 목록
	/*
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
		  + "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
		  + "FROM (SELECT /*+INDEX_ASC(sul_eventboard_2_2 seb_ebno_pk)ebno, title, image, rdate, loc, kind, hit "
		  + "FROM sul_eventboard_2_2 WHERE kind = '판매행사')) "
		  + "WHERE num BETWEEN #{start} AND #{end}") */
	public List<EventBoardVO> eventboard_sell_ListData(Map map) {
		return mapper.eventboard_sell_ListData(map);
	}
	// 이벤트게시판 총 페이지
	//@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2 WHERE kind = '판매행사'")
	public int eventboard_sell_TotalPage() {
		return mapper.eventboard_sell_TotalPage();
	}
	
	
	// 이벤트게시판 디너 목록
	/*
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
			+ "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(sul_eventboard_2_2 seb_ebno_pk/ebno, title, image, rdate, loc, kind, hit "
			+ "FROM sul_eventboard_2_2 WHERE kind = '디너')) "
			+ "WHERE num BETWEEN #{start} AND #{end}") */
	public List<EventBoardVO> eventboard_dinner_ListData(Map map) {
		return mapper.eventboard_dinner_ListData(map);
	}
	
	// 이벤트게시판 디너 총 페이지
	//@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2 WHERE kind = '디너'")
	public int eventboard_dinner_TotalPage() {
		return mapper.eventboard_dinner_TotalPage();
	}
	
	// 이벤트게시판 판매행사 목록
	/*
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
			+ "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(sul_eventboard_2_2 seb_ebno_pk)ebno, title, image, rdate, loc, kind, hit "
			+ "FROM sul_eventboard_2_2 WHERE kind = '교육')) "
			+ "WHERE num BETWEEN #{start} AND #{end}") */
	public List<EventBoardVO> eventboard_edu_ListData(Map map) {
		return mapper.eventboard_edu_ListData(map);
	}
	
	// 이벤트게시판 총 페이지
	//@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2 WHERE kind = '교육'")
	public int eventboard_edu_TotalPage() {
		return mapper.eventboard_edu_TotalPage();
	}
	
	// 이벤트게시판 시음회 목록
	/*
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
			+ "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(sul_eventboard_2_2 seb_ebno_pk)ebno, title, image, rdate, loc, kind, hit "
			+ "FROM sul_eventboard_2_2 WHERE kind = '시음회')) "
			+ "WHERE num BETWEEN #{start} AND #{end}") */
	public List<EventBoardVO> eventboard_si_ListData(Map map) {
		return mapper.eventboard_si_ListData(map);
	}
	
	// 이벤트게시판 총 페이지
	//@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2 WHERE kind = '시음회'")
	public int eventboard_si_TotalPage() {
		return mapper.eventboard_si_TotalPage();
	}
	
	// 이벤트게시판 판매행사 목록
	/*
	@Select("SELECT ebno, title, image, rdate, loc, kind, hit, num "
			+ "FROM (SELECT ebno, title, image, rdate, loc, kind, hit, rownum as num "
			+ "FROM (SELECT /*+INDEX_ASC(sul_eventboard_2_2 seb_ebno_pk)ebno, title, image, rdate, loc, kind, hit "
			+ "FROM sul_eventboard_2_2 WHERE kind = '기타')) "
			+ "WHERE num BETWEEN #{start} AND #{end}") */
	public List<EventBoardVO> eventboard_other_ListData(Map map) {
		return mapper.eventboard_other_ListData(map);
	}
	
	// 이벤트게시판 총 페이지
	//@Select("SELECT CEIL(COUNT(*)/20.0) FROM sul_eventboard_2_2 WHERE kind = '기타'")
	public int eventboard_other_TotalPage() {
		return mapper.eventboard_other_TotalPage();
	}
	
	
	
	
	// 이벤트게시판 조회수 증가
	/*
	@Update("UPDATE sul_eventboard_2_2 "
		  + "SET hit = hit + 1 "
		  + "WHERE ebno = #{ebno}")
	public void eventboardHitIncrement(int ebno);
	
	// 이벤트게시판 상세페이지
	@Select("SELECT * "
		  + "FROM sul_eventboard_2_2 "
		  + "WHERE ebno = #{ebno}") */
	public EventBoardVO eventboardDetailData(int ebno) {
		mapper.eventboardHitIncrement(ebno);;
		return mapper.eventboardDetailData(ebno);
	}
	
}


