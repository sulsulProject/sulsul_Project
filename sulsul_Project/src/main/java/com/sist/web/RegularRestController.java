package com.sist.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.RegularDAO;
import com.sist.vo.RegularBoardVO;
import com.sist.vo.RegularVO;

@RestController
public class RegularRestController {
	@Autowired
	private RegularDAO dao;


	// regular 정기모임 생성 ver2 생성 후 해당 모임으로 진입 /////
	@GetMapping(value="regular/insert_vue.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String regular_insert_vue(RegularVO vo) {
	  dao.regularInsert(vo);
	  RegularVO rvo = dao.regularDetailNum();
	  JSONObject obj = new JSONObject();

	  obj.put("no", rvo.getNo());
	  obj.put("content", rvo.getContent());
	  obj.put("name", rvo.getName());
	  return obj.toJSONString();
	}



	// regular 정기모임 게시판 인서트 ///////////////
	@GetMapping(value="regular/board_insert_vue.do", produces = "text/plain;charset=utf-8")
	public String regularBoardInsert(RegularBoardVO vo, HttpSession session) {
//		List<MultipartFile> list = vo.getFiles();
//		if(list==null) { //업로드 안된상태
//			vo.setFilename("");
//			vo.setFilesize("");
//			vo.setFilecount(0);
//		}else { // 업로드가 된상태
//			String fn = "";
//			String fs = "";
//			for(MultipartFile mf:list) {
//				String of = mf.getOriginalFilename();
//				fn+=of+","; // 데이터베이스 첨부
//				File file = new File("c:\\download\\"+of);//업로드
//				fs+=mf.getSize()+",";
//				try {
//					mf.transferTo(file);
//				}catch(Exception e) {}
//			}
//			vo.setFilename(fn.substring(0,fn.lastIndexOf(","))); // 마지막에 있는 "," 지우기 위해 쓴것
//			vo.setFilesize(fs.substring(0,fs.lastIndexOf(",")));
//			vo.setFilecount(list.size());
//		}
		String id = (String)session.getAttribute("id");
		vo.setId(id);
		dao.regularBoardInsert(vo);
//		System.out.println("vo.getcontent:"+vo.getContent());
//		System.out.println("vo.getrno:"+vo.getRno());
//		System.out.println("vo.getFilecount:"+vo.getFilecount());
//		System.out.println("vo.getFilename:"+vo.getFilename());
//		System.out.println("vo.getRb_no:"+vo.getRb_no());
		System.out.println("vo.getId:"+vo.getId());
		System.out.println("id:"+id);
		
		return "rno:"+String.valueOf(vo.getRno());
	}
	
	// regular 정기모임 게시판 수정 ///////////////
		@GetMapping(value="regular/board_update_vue.do", produces = "text/plain;charset=utf-8")
		public String regularBoardUpdate(RegularBoardVO vo, HttpSession session) {
			String id = (String)session.getAttribute("id");
			if(dao.regular_board_update(vo, id)) {
				return "수정완료";
			}
			return "수정실패";
		}
		// regular 정기모임 게시판 글 삭제 ///////////////
		@GetMapping(value="regular/board_delete_vue.do", produces = "text/plain;charset=utf-8")
		public String regularBoardDelete(RegularBoardVO vo, HttpSession session) {
			String id = (String)session.getAttribute("id");
			dao.regular_board_delete(vo.getRb_no(), id);
			
			return "rno:"+String.valueOf(vo.getRno());
		}

	// regular 정기모임 게시판 리스트 ///////////////
	@GetMapping(value = "regular/boardList_vue.do", produces = "text/plain;charset=utf-8")
	public String regularBoardList(@RequestParam("page") int page, @RequestParam("rno")int rno) {
	    Map<String, Integer> map = new HashMap<>();
	    map.put("start", (page * 20) - 19);
	    map.put("end", page * 20);
	    map.put("rno", rno);
	    List<RegularBoardVO> list = dao.regularBoardListData(map);
	    int totalpage = dao.regularBoardTotalPage();
	    // json 변환
	    JSONArray arr = new JSONArray();
	    int i = 0;
	    if(list.size() == 0) {
	    	JSONObject obj = new JSONObject();
	    	obj.put("curpage", 0);
            obj.put("totalpage", 0);
            arr.add(obj);
	    }else {
		    for (RegularBoardVO vo : list) {
		        JSONObject obj = new JSONObject();
		        // rb_no, rno, id, hit, regdate, content
		        obj.put("rb_no", vo.getRb_no());
		        obj.put("id", vo.getId());
		        obj.put("rno", vo.getRno());
		        obj.put("hit", vo.getHit());
		        obj.put("dbday", vo.getDbday());
		        obj.put("content", vo.getContent());
		        if (i == 0) {
		            obj.put("curpage", page);
		            obj.put("totalpage", totalpage);
		        }
		        arr.add(obj);
		        i++;
		    }
	    }
	    return arr.toJSONString();
	}
	
	// regular detail페이지 게시글 상세페이지
	@GetMapping(value ="regular/boardDetail_vue.do", produces = "text/plain;charset=utf-8")
	public String regularBoardDetail(int rb_no) {
		System.out.println("rb_no:"+rb_no);
		RegularBoardVO vo = dao.regularBoardDetail(rb_no);
		JSONObject obj = new JSONObject();
		obj.put("rb_no", vo.getRb_no());
		obj.put("content", vo.getContent());
		obj.put("dbday", vo.getDbday());
		obj.put("hit", vo.getHit());
		obj.put("id", vo.getId());
		obj.put("rno", vo.getRno());
		return obj.toJSONString();
	}

	
	// regular main페이지 정기모임 리스트
	@GetMapping(value = "regular/regular_list_vue.do", produces = "text/plain;charset=utf-8")
	public String regularList(@RequestParam("rcate_no") int rcate_no) {
		List<RegularVO> list = dao.regularListData(rcate_no);
		JSONArray arr = new JSONArray();
		for(RegularVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("rcate_no", vo.getRcate_no());
			obj.put("poster", vo.getPoster());
			obj.put("name", vo.getName());
			obj.put("rno", vo.getNo());
			arr.add(obj);
		}


		return arr.toJSONString();
	}

	// regular 정기모임 검색창
		@GetMapping(value="regular/find_vue.do", produces = "text/plain;charset=utf-8")
		public String regular_find_list(@Param("name") String name, String page) {
			if (page == null) {
		        page = "1";
		    }
		    int curpage = Integer.parseInt(page);
		    Map<String, Object> map = new HashMap<>();
		    map.put("start", (curpage * 10) - 9);
		    map.put("end", curpage * 10);
		    map.put("name", name);
		    List<RegularVO> fList = dao.regularFindList(map);
		    int totalpage = dao.regularFindTotalPage(name);
		    final int BLOCK = 3;
		    int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		    int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		    if (endPage > totalpage) {
		        endPage = totalpage;
		    }

		    // 데이터 전송
		    int i=0;
			JSONArray arr = new JSONArray();
			for(RegularVO fvo:fList) {
				JSONObject obj = new JSONObject();
//				no, poster, head, rcate_no, tag, name, num
				obj.put("no", fvo.getNo());
				obj.put("poster", fvo.getPoster());
				obj.put("head", fvo.getHead());
				obj.put("rcate_no", fvo.getRcate_no());
				obj.put("tag", fvo.getTag());
				obj.put("name", fvo.getName());

				if(i == 0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
					obj.put("startPage", startPage);
					obj.put("endPage", endPage);
				}

				arr.add(obj);
				i++;
			}

			return arr.toJSONString();
		}

}
