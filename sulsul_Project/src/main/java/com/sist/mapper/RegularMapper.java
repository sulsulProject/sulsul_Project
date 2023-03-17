package com.sist.mapper;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.RegularBoardVO;
import com.sist.vo.RegularVO;
public interface RegularMapper {

	// regular 정기모임 생성 ////////////
	@Insert("insert into sul_regular_2_2(no,content, rcate_no, name) values("
			+ "sul_regular_seq.nextval, #{content}, #{rcate_no}, #{name})")
	public void regularInsert(RegularVO vo);

	// regular 메인페이지 정기모임 카테고리별 리스트 ////////////
	@Select("select no, regdate, poster, content, head, rcate_no, tag, name "
			+ "from sul_regular_2_2 "
			+ "where rcate_no = #{rcate_no}")
	public List<RegularVO> regularListData(int rcate_no);

	// regularList no값 구하기(마지막 넘버)
	// 		=> 방금 생성 된 디테일 페이지 가져오기위해서
	@Select("select max(no) from sul_regular_2_2")
	public int regularMaxNum();

	// regular 메인페이지 정기모임 리스트 All////////////
		@Select("select no, regdate, poster, content, head, rcate_no, tag, name "
				+ "from sul_regular_2_2 ")
	public List<RegularVO> regularAllListData();

	// regular 메인페이지 정기모임 디테일페이지 ////////////
	@Select("select no, to_char(regdate, 'YYYY-MM-DD') as dbday , poster, content, head, rcate_no, tag, name "
			+ "from sul_regular_2_2 "
			+ "where no = #{no}")
	public RegularVO regularDetailData(int no);


	// retular 정기모임 글쓰기 ////////////
	@SelectKey(keyProperty = "rb_no", resultType = int.class, before = true,
			statement = "select nvl(Max(rb_no)+1,1) as rb_no from sul_regular_board_2_2")
	@Insert("insert into sul_regular_board_2_2(rb_no, content, filename, filesize, filecount, id, rno) "
			+ "values(#{rb_no}, #{content}, #{filename , jdbcType=VARCHAR }, #{filesize , jdbcType=VARCHAR }, #{filecount , jdbcType=VARCHAR }, #{id , jdbcType=VARCHAR }, #{rno})")
	public void regularBoardInsert(RegularBoardVO vo);
	
	
	// regular 정기모임 글 수정 ////////////
	@Update("update sul_regular_board_2_2 set "
			+ "content=#{content} "
			+ "where rb_no=#{rb_no}")
	public void regular_board_update(RegularBoardVO vo);
	
	// regular 정기모임 글 삭제 ////////////
	@Delete("delete from sul_regular_board_2_2 "
			+ "where rb_no=#{rb_no}")
	public void regular_board_delete(int rb_no);
	
	// regular 디테일 페이지 board 리스트
//	RB_NO
//	CONTENT
//	REGDATE
//	HIT
//	FILENAME,	FILESIZE,	FILECOUNT,	GROUP_ID,	GROUP_STEP,	GROUP_TAB,	MSG, ID,	RNO
	@SelectKey(keyProperty = "rb_no", resultType = int.class, before = true,
			statement = "select nvl(Max(rb_no)+1,1) as rb_no from sul_regular_board_2_2")
	@Select("select rb_no, content, to_char(regdate, 'YYYY-MM-DD') as dbday, hit, filecount,id, rno, num "
			+ "from (select rb_no, content, regdate, hit, filecount, id, rno, rownum as num "
			+ "from (select rb_no, content, regdate, hit, filecount, id, rno "
			+ "from sul_regular_board_2_2)) "
			+ "where rno=#{rno} and num between #{start} and #{end}")
	public List<RegularBoardVO> regularBoardListData(Map map);
	
	// popularList
	@Select("select no, regdate, poster, content, head, rcate_no, tag, name, rownum "
			+ "from sul_regular_2_2  "
			+ "where rownum <= 5 order by head desc")
	public List<RegularVO> regularPopularListData();
	
	// newList
	@Select("select no, regdate, poster, content, head, rcate_no, tag, name, rownum "
			+ "from sul_regular_2_2  "
			+ "where rownum <= 5 order by regdate desc")
	public List<RegularVO> regularNewListData();

	//총페이지 ////////////////////
		@Select("select ceil(count(*)/20.0) from sul_regular_board_2_2")
		public int regularBoardTotalPage();
		
		
	
	// regular board detail
	@Select("select rb_no, content, to_char(regdate, 'YYYY-MM-DD') as dbday, hit, id, rno "
			+ "from sul_regular_board_2_2 "
			+ "where rb_no=#{rb_no}")
	public RegularBoardVO regularBoardDetail(int rb_no);
	
	// regular board hit update
	@Update("update sul_regular_board_2_2 set "
            + "hit=hit+1 "
            + "where rb_no=#{rb_no}")
	public void regularBoardHitUp(int rb_no);
	
	
	/////////////////////////////
	

	// 정기모임 검색 ////////////////////
	@Select("select no, poster, head, rcate_no, tag, name, num "
			+ "from(select no, poster, head, rcate_no, tag, name, rownum as num "
			+ "from(select no, poster, head, rcate_no, tag, name "
			+ "from sul_regular_2_2 "
			+ "where name LIKE '%'||#{name}||'%' order by head asc)) "
			+ "where num between #{start} and #{end}")
	public List<RegularVO> regularFindList(Map map);

	// 정기모임 검색 총 페이지
	@Select("select ceil(count(*)/20.0) "
			+ "from sul_regular_2_2 "
			+ "where name LIKE '%'||#{name}||'%'")
	public int regularFindTotalPage(String name);
}
