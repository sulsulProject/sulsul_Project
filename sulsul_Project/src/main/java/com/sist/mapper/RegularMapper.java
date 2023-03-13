package com.sist.mapper;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.sist.vo.RegularBoardVO;
import com.sist.vo.RegularVO;
public interface RegularMapper {

	// regular 정기모임 생성 ////////////
	@Insert("insert into sul_regular_2_2(no,content, name) values("
			+ "sul_regular_seq.nextval, #{content}, #{name})")
	public void regularInsert(RegularVO vo);

	// regular 메인페이지 정기모임 리스트 ////////////
	@Select("select no, regdate, poster, content, head, rcate_no, tag, name "
			+ "from sul_regular_2_2")
	public List<RegularVO> regularListData();


	// regular 메인페이지 정기모임 리스트 ////////////
	@Select("select no, regdate, poster, content, head, rcate_no, tag, name "
			+ "from sul_regular_2_2 "
			+ "where no = #{no}")
	public RegularVO regularDetailData(int no);


	// retular 정기모임 글쓰기 ////////////
	@SelectKey(keyProperty = "rb_no", resultType = int.class, before = true,
			statement = "select nvl(Max(rb_no)+1,1) as rb_no from sul_regular_board_2_2")
	@Insert("insert into sul_regular_board_2_2(rb_no, content, filename, filesize, filecount, id, rno) "
			+ "values(#{rb_no}, #{content}, #{filename  , jdbcType=VARCHAR }, #{filesize , jdbcType=VARCHAR }, #{filecount , jdbcType=VARCHAR }, #{id , jdbcType=VARCHAR }, #{rno})")
	public void regularBoardInsert(RegularBoardVO vo);
//	@SelectKey(keyProperty = "rb_no", resultType = int.class, before = true,
//			statement = "select nvl(Max(rb_no)+1,1) as rb_no from sul_regular_board_2_2")
//	@Insert("insert into sul_regular_board_2_2(rb_no, content, rno) "
//			+ "values(#{rb_no}, #{content}, #{rno})")
//	public void regularBoardInsert(RegularBoardVO vo);

	// regular 디테일 페이지 board 리스트
//	RB_NO
//	CONTENT
//	REGDATE
//	HIT
//	FILENAME,	FILESIZE,	FILECOUNT,	GROUP_ID,	GROUP_STEP,	GROUP_TAB,	MSG, ID,	RNO
	@SelectKey(keyProperty = "rb_no", resultType = int.class, before = true,
			statement = "select nvl(Max(rb_no)+1,1) as rb_no from sul_regular_board_2_2")
	@Select("select rb_no, content, to_char(regdate, 'YYYY-MM-DD') as dbday, hit, filecount, num "
			+ "from (select rb_no, content, regdate, hit, filecount, rownum as num "
			+ "from (select rb_no, content, regdate, hit, filecount "
			+ "from sul_regular_board_2_2)) "
			+ "where num between #{start} and #{end}")
	public List<RegularBoardVO> regularBoardListData(Map map);
	/////////////////////////////
	//총페이지
	@Select("select ceil(count(*)/20.0) from sul_regular_board_2_2")
	public int regularBoardTotalPage();

}
