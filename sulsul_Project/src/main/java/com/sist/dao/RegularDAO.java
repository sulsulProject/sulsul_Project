package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.RegularMapper;
import com.sist.vo.RegularBoardVO;
import com.sist.vo.RegularVO;
@Repository
public class RegularDAO {
	@Autowired
	private RegularMapper mapper;

//	@SelectKey(keyProperty = "no", resultType = int.class, before = true,
//			statement = "select nvl(max(no)+1,1) as no from sul_regular_2_2") // 시퀀스
//	@Insert("insert into sul_regular_2_2 values("
//			+ "#{no}, #{content}, #{poster}, #{head}, #{BCATE_NO}, #{TAG}, #{REGDATE}, #{name}")
	public void regularInsert(RegularVO vo) {
		mapper.regularInsert(vo);
	}

	// regular 메인페이지 정기모임 리스트 ////////////
//	@Select("select no, regdate, poster, content, head, rcate_no, tag, name "
//			+ "from sul_regular_2_2")
	public List<RegularVO> regularListData(int rcate_no){
		if (rcate_no == 99) {
			return mapper.regularAllListData();
		}
		return mapper.regularListData(rcate_no);
	}
	
// popularList
	public List<RegularVO> regularPopularListData(){
		return mapper.regularPopularListData();
	}
	
	// popularList
	public List<RegularVO> regularNewListData(){
		return mapper.regularNewListData();
	}

	// regularList no값 구하기(마지막 넘버)
		// 		=> 방금 생성 된 디테일 페이지 가져오기위해서
//	@Select("select max(no) from sul_regular_2_2")
	public RegularVO regularDetailNum() {
		return mapper.regularDetailData(mapper.regularMaxNum());
	}


	// regular 정기모임 디테일 ////////////
//	@Select("select no, regdate, poster, content, head, rcate_no, tag, name "
//	+ "from sul_regular_2_2 "
//	+ "where no = #{no}")
	public RegularVO regularDetailData(int no) {
	return mapper.regularDetailData(no);
	}


	// retular 정기모임 글쓰기 ////////////
//	@SelectKey(keyProperty = "rb_no", resultType = int.class, before = true,
//			statement = "select nvl(Max(no)+1,1) as rb_no from sul_regular_board_2_2")
//	@Insert("insert into sul_regular_board_2_2(rb_no, content, filename, filesize, filecount, id, rno) "
//			+ "values(#{rb_no}, #{content}, #{filename}, #{filesize}, #{filecount}, #{id}, #{rno})")
	public void regularBoardInsert(RegularBoardVO vo) {
		mapper.regularBoardInsert(vo);
	}
	
	// regular 정기모임 글 수정 ////////////
	public boolean regular_board_update(RegularBoardVO vo, String sessionId) {
		String boardId = mapper.regularBoardDetail(vo.getRb_no()).getId();
		System.out.println("sessionId + boardId:"+sessionId + boardId);
		if(boardId.equals(sessionId)) {
			System.out.println("if 안에 들어옴");
			mapper.regular_board_update(vo);
			return true;
		}
		return false;
		
	}
	
	// regular 정기모임 글 삭제 ////////////
	public void regular_board_delete(int rb_no, String sessionId) {
		System.out.println("rb_no:"+rb_no);
		String boardId = mapper.regularBoardDetail(rb_no).getId();
		if(boardId.equals(sessionId)) {
			mapper.regular_board_delete(rb_no);
			}
		
	}

	// regular 디테일 페이지 board 리스트
	public List<RegularBoardVO> regularBoardListData(Map map){
		return mapper.regularBoardListData(map);
	}
	//총페이지
	public int regularBoardTotalPage() {
		return mapper.regularBoardTotalPage();
	}
	
	
	// regular board detail(글 상세)
//	@Select("select rb_no, content, to_char(regdate, 'YYYY-MM-DD') as dbday, hit, id, rno "
//			+ "from sul_regular_board_2_2 "
//			+ "where rb_no=#{rb_no}")
	public RegularBoardVO regularBoardDetail(int rb_no) {
		mapper.regularBoardHitUp(rb_no);
		return mapper.regularBoardDetail(rb_no);
	}

	// 정기모임 검색 ////////////
//	@Select("select no, poster, head, rcate_no, tag, name, num "
//			+ "from(select no, poster, head, rcate_no, tag, name, rownum as num "
//			+ "from(select no, poster, head, rcate_no, tag, name "
//			+ "from sul_regular_2_2 "
//			+ "where name LIKE '%'||#{name}||'%' order by head asc)) "
//			+ "where num between #{start} and #{end}")
	public List<RegularVO> regularFindList(Map map){
		return mapper.regularFindList(map);
	}
//	// 정기모임 검색 총 페이지
//		@Select("select ceil(count(*)/20.0) "
//				+ "from sul_regular_2_2 "
//				+ "where name LIKE '%'||#{name}||'%'")
		public int regularFindTotalPage(String name) {
			return mapper.regularFindTotalPage(name);
		}
}
