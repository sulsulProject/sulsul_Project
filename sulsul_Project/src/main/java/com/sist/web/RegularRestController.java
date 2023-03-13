package com.sist.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.RegularDAO;
import com.sist.vo.RegularBoardVO;
import com.sist.vo.RegularVO;

@RestController
public class RegularRestController {
	@Autowired
	private RegularDAO dao;

	// regular 정기모임 생성 ////////////
	@GetMapping(value="regular/insert_vue.do", produces = "text/plain;charset=utf-8")
	public String regular_insert_vue(RegularVO vo) {
		dao.regularInsert(vo);
		return "";
	}

	// regular 메인페이지 정기모임 리스트 ////////////
//	@GetMapping(value= "regular/list_vue.do", produces = "text/plain;charset=utf-8")
//	public String regular_list_vue() {
//		List<RegularVO> list = dao.regularListData();
//		JSONArray arr = new JSONArray();
//		for(RegularVO vo:list) {
//			JSONObject obj = new JSONObject();
//			obj.put("no", vo.getNo());
//			obj.put("regdate", vo.getRegdate());
//			obj.put("poster", vo.getPoster());
//			obj.put("content", vo.getContent());
//			obj.put("head", vo.getHead());
//			obj.put("rcate_no", vo.getRcate_no());
//			obj.put("tag", vo.getTag());
//			obj.put("name", vo.getName());
//			// no, regdate, poster, content, head, rcate_no, tag, name
//			arr.add(obj);
//		}
//		return arr.toJSONString();
//	}


	// regular 정기모임 게시판 인서트 ///////////////
	@GetMapping(value="regular/board_insert_vue.do", produces = "text/plain;charset=utf-8")
	public String regularBoardInsert(RegularBoardVO vo) {
		System.out.println(vo.toString());
		List<MultipartFile> list = vo.getFiles();
		if(list==null) { //업로드 안된상태
			vo.setFilename("");
			vo.setFilesize("");
			vo.setFilecount(0);
		}else { // 업로드가 된상태
			String fn = "";
			String fs = "";
			for(MultipartFile mf:list) {
				String of = mf.getOriginalFilename();
				fn+=of+","; // 데이터베이스 첨부
				File file = new File("c:\\download\\"+of);//업로드
				fs+=mf.getSize()+",";
				try {
					mf.transferTo(file);
				}catch(Exception e) {}
			}
			vo.setFilename(fn.substring(0,fn.lastIndexOf(","))); // 마지막에 있는 "," 지우기 위해 쓴것
			vo.setFilesize(fs.substring(0,fs.lastIndexOf(",")));
			vo.setFilecount(list.size());
		}
		dao.regularBoardInsert(vo);
		System.out.println("vo.getcontent:"+vo.getContent());
		System.out.println("vo.getrno:"+vo.getRno());
		System.out.println("vo.getFilecount:"+vo.getFilecount());
		System.out.println("vo.getFilename:"+vo.getFilename());
		System.out.println("vo.getRb_no:"+vo.getRb_no());
		return "rno:"+String.valueOf(vo.getRno());
	}

	// regular 정기모임 게시판 리스트 ///////////////
	@GetMapping(value = "regular/detail_vue.do", produces = "text/plain;charset=utf-8")
	public String regularBoardList(@RequestParam("page") int page, @RequestParam("rno")int rno) {
	    System.out.println("board_list_vue=========================================");
	    Map<String, Integer> map = new HashMap<>();
	    map.put("start", (page * 20) - 19);
	    map.put("end", page * 20);
	    List<RegularBoardVO> list = dao.regularBoardListData(map);
	    int totalpage = dao.regularBoardTotalPage();
	    // json 변환
	    JSONArray arr = new JSONArray();
	    int i = 0;
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
	    System.out.println("asdasdasd=========================================");
	    System.out.println("arr.toJSONString()" + arr.toJSONString());
	    return arr.toJSONString();
	}
//	// regular 정기모임 게시판 리스트 ///////////////
//	@GetMapping(value="regular/detail_vue.do", produces = "text/plain;charset=utf-8")
////	public String regularBoardList(int page, int rno) {
//	public String regularBoardList(@RequestBody RegularBoardVO rvo) {
//		int page=0;
//		int rno=0;
//		System.out.println("board_list_vue=========================================");
//		Map map = new HashMap<>();
//		map.put("start", (page*20)-19);
//		map.put("end", page*20);
//		List<RegularBoardVO> list = dao.regularBoardListData(map);
//		int totalpage = dao.regularBoardTotalPage();
//		//json 변환
//		JSONArray arr = new JSONArray();
//		int i = 0;
//		for(RegularBoardVO vo:list) {
//			JSONObject obj = new JSONObject();
//			//rb_no, rno, id, hit, regdate, content
//			obj.put("rb_no", vo.getRb_no());
//			obj.put("id", vo.getId());
//			obj.put("rno", vo.getRno());
//			obj.put("hit", vo.getHit());
//			obj.put("dbday", vo.getDbday());
//			obj.put("content", vo.getContent());
//			if(i==0) {
//				obj.put("curpage", page);
//				obj.put("totalpage", totalpage);
//			}
//			arr.add(obj);
//			i++;
//		}
//		System.out.println("asdasdasd=========================================");
//		System.out.println("arr.toJSONString()"+arr.toJSONString());
//		return arr.toJSONString();
//	}
}
