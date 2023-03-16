package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.FreeBoardVO;
import com.sist.vo.LetterVO;

public interface LetterMapper {
	
	// 받은쪽지 갯수
	@Select("SELECT COUNT(*) FROM sul_letter_2_2 WHERE recv_id = #{id} AND read_chk = 0")
	public int recv_letter_count(String id);
	
	// 받은쪽지 리스트
	@Select("SELECT lno, TO_CHAR(recv_time, 'YYYY-MM-DD') as dbday, title, type, read_chk, send_id, recv_id, num "
		  + "FROM (SELECT lno, recv_time, title, type, read_chk, send_id, recv_id, rownum as num "
		  + "FROM (SELECT /*+INDEX_DESC(sul_letter_2_2 sle_lno_pk )*/lno, recv_time, title, type, read_chk, send_id, recv_id "
		  + "FROM sul_letter_2_2 WHERE recv_id = #{id,jdbcType=VARCHAR})) "
		  + "WHERE num BETWEEN #{start,jdbcType=INTEGER} AND #{end,jdbcType=INTEGER}")
	public List<LetterVO> recv_letterList(Map map);
	
	// 받은쪽지 총 페이지
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM sul_letter_2_2 WHERE recv_id = #{id, jdbcType=VARCHAR}")
	public int recv_letterTotalPage(String id); 
	
	// 보낸쪽지 리스트
	@Select("SELECT lno, TO_CHAR(recv_time, 'YYYY-MM-DD') as dbday, title, type, read_chk, send_id, recv_id, num "
			+ "FROM (SELECT lno, recv_time, title, type, read_chk, send_id, recv_id, rownum as num "
			+ "FROM (SELECT /*+INDEX_DESC(sul_letter_2_2 sle_lno_pk )*/lno, recv_time, title, type, read_chk, send_id, recv_id "
			+ "FROM sul_letter_2_2 WHERE send_id = #{id,jdbcType=VARCHAR})) "
			+ "WHERE num BETWEEN #{start,jdbcType=INTEGER} AND #{end,jdbcType=INTEGER}")
	public List<LetterVO> send_letterList(Map map);
	
	// 보낸쪽지 총 페이지
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM sul_letter_2_2 WHERE send_id = #{id, jdbcType=VARCHAR}")
	public int send_letterTotalPage(String id); 
	
	// 쪽지 보내기
	@SelectKey(keyProperty = "lno", resultType = int.class , before = true, 
			statement = "SELECT NVL(MAX(lno)+1,1) as lno FROM sul_letter_2_2")
	@Insert("INSERT INTO sul_letter_2_2 "
		  + "VALUES(#{lno, jdbcType=INTEGER}, SYSDATE, SYSDATE, #{title, jdbcType=VARCHAR}, #{content, jdbcType=VARCHAR}, 0, 0, #{send_id, jdbcType=VARCHAR}, #{recv_id, jdbcType=VARCHAR})")
	public void letterInsert(LetterVO vo);
	
	// 쪽지 읽음
	@Update("UPDATE sul_letter_2_2 "
		  + "SET read_chk = 1 "
		  + "WHERE lno = #{lno} AND recv_id = #{id}")
	public void letter_read_chk(Map map);
	
	// 쪽지 상세페이지
	@Select("SELECT lno, TO_CHAR(SEND_TIME, 'YYYY-MM-DD') as dbday, title, content, send_id, recv_id "
		  + "FROM sul_letter_2_2 "
		  + "WHERE lno = #{lno}")
	public LetterVO letter_Detail(int lno);
	
	// 받은쪽지 아이디확인
	@Select("SELECT recv_id FROM sul_letter_2_2 WHERE lno = #{lno}")
	public String send_getid_letter(int lno);
	
	// 보낸쪽지 아이디확인
	@Select("SELECT send_id FROM sul_letter_2_2 WHERE lno = #{lno}")
	public String recv_getid_letter(int lno);
	
	// 받은쪽지 삭제
	@Delete("DELETE FROM sul_letter_2_2 "
		  + "WHERE lno = #{lno} AND recv_id = #{recv_id}")
	public void recv_letter_Delete(Map map);
}
