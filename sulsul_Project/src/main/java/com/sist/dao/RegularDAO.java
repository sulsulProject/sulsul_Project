package com.sist.dao;

import java.util.List;
import java.util.Map;

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
	public List<RegularVO> regularListData(){
		return mapper.regularListData();
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

	// regular 디테일 페이지 board 리스트
	public List<RegularBoardVO> regularBoardListData(Map map){
		return mapper.regularBoardListData(map);
	}
	//총페이지
	public int regularBoardTotalPage() {
		return mapper.regularBoardTotalPage();
	}
}
