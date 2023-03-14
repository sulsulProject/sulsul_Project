package com.sist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.LetterMapper;
import com.sist.vo.FreeBoardVO;
import com.sist.vo.LetterVO;

@Repository
public class LetterDAO {
	@Autowired
	private LetterMapper mapper;
	
	// 쪽지 리스트
	/*
	@Select("SELECT lno, recv_time, title, type, read_chk, send_id, recv_id, num "
		  + "FROM (SELECT lno, recv_time, title, type, read_chk, send_id, recv_id, rownum as num "
		  + "FROM (SELECT lno, recv_time, title, type, read_chk, send_id, recv_id "
		  + "FROM sul_letter_2_2 WHERE recv_id = #{id})) "
		  + "WHERE num BETWEEN #{start} AND #{end}") */
	public List<LetterVO> recv_letterList(Map map) {
		return mapper.recv_letterList(map);
	}
	
	// 쪽지 총 페이지
	/*
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM sul_letter_2_2 WHERE recv_id = #{id}") */
	public int recv_letterTotalPage(String id) {
		return mapper.recv_letterTotalPage(id);
	}
	
	// 쪽지 보내기
	/*
	@SelectKey(keyProperty = "lno", resultType = int.class , before = true, 
				statement = "SELECT NVL(MAX(fbno)+1,1) as lno FROM sul_letter_2_2")
	@Insert("INSERT INTO sul_letter_2_2 "
		  + "VALUES (#{lno}, SYSDATE, '-', #{title}, #{content}, '1', '1', #{send_id}, #{recv_id}") */
	public void letterInsert(LetterVO vo) {
		mapper.letterInsert(vo);
	}
	
	// 쪽지 읽음
	/*
	@Update("UPDATE sul_letter_2_2 "
		  + "SET read_chk = 1 "
		  + "WHERE lno = #{lno}")
	public void letter_read_chk(int lno);
	
	// 쪽지 상세페이지
	@Select("SELECT lno, TO_CHAR(SEND_TIME, 'YYYY-MM-DD') as dbday, title, content, send_id, recv_id "
		  + "FROM sul_letter_2_2 "
		  + "WHERE lno = #{lno}") */
	public LetterVO letter_Detail(int lno) {
		mapper.letter_read_chk(lno);
		return mapper.letter_Detail(lno);
	}
	
	// 쪽지 삭제
	/*
	@Delete("DELETE FROM sul_letter_2_2 "
		  + "WHERE lno = #{lno}") */
	public void recv_letter_Delete(int lno, String recv_id) {
		mapper.recv_letter_Delete(lno, recv_id);
	}
	
}
