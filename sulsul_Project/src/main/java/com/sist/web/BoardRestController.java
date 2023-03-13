package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;


@RestController
public class BoardRestController {
	@Autowired
	private BoardDAO dao;
	@GetMapping(value="board/freeboard_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String freeboard_list(int page) {
		   Map map=new HashMap();
		   map.put("start", (page*10)-9);
		   map.put("end", page*10);
		   List<FreeBoardVO> list=dao.freeboardListData(map);
		   int totalpage=dao.freeboardTotalPage();
		   
		   final int BLOCK = 5;
		   int startPage = ((page-1)/BLOCK * BLOCK) + 1;
		   int endPage = ((page-1)/BLOCK * BLOCK) + BLOCK;
		   if(endPage > totalpage)
				endPage = totalpage;
		   
		   //JSON변환 
		   JSONArray arr=new JSONArray();
		   int i=0;
		   for(FreeBoardVO vo:list) {
			   JSONObject obj=new JSONObject();
			   obj.put("fbno", vo.getFbno());
			   obj.put("subject", vo.getSubject());
			   obj.put("name", vo.getName());
			   obj.put("dbday", vo.getDbday());
			   obj.put("hit", vo.getHit());
			   
			   if(i==0) {
				   obj.put("curpage", page);
				   obj.put("totalpage", totalpage);
				   obj.put("startPage", startPage);
				   obj.put("endPage", endPage);
			   }
			   arr.add(obj);
			   i++;
		  }
		   return arr.toJSONString();
	   }
	
	
	@GetMapping("board/freeboard_insert_vue.do")
	public String freeboard_insert(FreeBoardVO vo) {
		dao.freeboardInsert(vo);
		return "";
	}
	
	@GetMapping(value = "board/freeboard_detail_vue.do",produces = "text/plain;charset=UTF-8" )
	public String freeboard_detail(int fbno) {
		FreeBoardVO vo=dao.freeboardDetailData(fbno);
		JSONObject obj=new JSONObject();
		obj.put("fbno", vo.getFbno());
		obj.put("subject", vo.getSubject());
		obj.put("name", vo.getName());
		obj.put("dbday", vo.getDbday());
		obj.put("hit", vo.getHit());
		obj.put("content", vo.getContent());
		obj.put("id", vo.getId());
		return obj.toJSONString();
	}
	
	@GetMapping(value = "board/freeboard_update_vue.do", produces = "text/plain;charset=UTF-8")
	public String freeboard_update(int fbno) {
		FreeBoardVO vo=dao.freeboardDetailData(fbno);
		JSONObject obj=new JSONObject();
		obj.put("fbno", vo.getFbno());
		obj.put("subject", vo.getSubject());
		obj.put("name", vo.getName());
		obj.put("content", vo.getContent());
		return obj.toJSONString();
	}
	
	@GetMapping("board/freeboard_update_ok_vue.do")
	public String board_update_ok(FreeBoardVO vo) {
		String res=dao.freeboardUpdate(vo);
		return res;
	}
	
	@GetMapping("board/freeboard_delete_vue.do")
	public String freeboard_delete(int fbno, String pwd) {
		String res = dao.freeboardDelete(fbno, pwd);
		return res;
	}
	
	// 이벤트게시판 리스트
	@GetMapping(value="board/eventboard_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String eventboard_list(int page) {
		   Map map=new HashMap();
		   map.put("start", (page*20)-19);
		   map.put("end", page*20);
		   List<EventBoardVO> list=dao.eventboardListData(map);
		   int totalpage=dao.eventboardTotalPage();
		   
		   final int BLOCK = 10;
		   int startPage = ((page-1)/BLOCK * BLOCK) + 1;
		   int endPage = ((page-1)/BLOCK * BLOCK) + BLOCK;
		   if(endPage > totalpage)
				endPage = totalpage;
		   
		   //JSON변환 
		   JSONArray arr=new JSONArray();
		   int i=0;
		   for(EventBoardVO vo:list) {
			   JSONObject obj=new JSONObject();
			   obj.put("ebno", vo.getEbno());
			   obj.put("title", vo.getTitle());
			   obj.put("image", vo.getImage());
			   obj.put("rdate", vo.getRdate());
			   obj.put("loc", vo.getLoc());
			   obj.put("kind", vo.getKind());
			   obj.put("hit", vo.getHit());
			   if(i==0) {
				   obj.put("curpage", page);
				   obj.put("totalpage", totalpage);
				   obj.put("startPage", startPage);
				   obj.put("endPage", endPage);
			   }
			   arr.add(obj);
			   i++;
		  }
		   return arr.toJSONString();
	}
	
	// 이벤트게시판 상세페이지
	@GetMapping(value = "board/eventboard_detail_vue.do",produces = "text/plain;charset=UTF-8" )
	public String evenetboard_detail(int ebno) {
		EventBoardVO vo=dao.eventboardDetailData(ebno);
		JSONObject obj=new JSONObject();
		obj.put("ebno", vo.getEbno());
		obj.put("title", vo.getTitle());
		obj.put("kind", vo.getKind());
		obj.put("rdate", vo.getRdate());
		obj.put("loc", vo.getLoc());
		obj.put("host", vo.getHost());
		obj.put("image", vo.getImage());
		obj.put("images", vo.getImages());
		obj.put("content", vo.getContent());
		obj.put("hash", vo.getHash());
		obj.put("hit", vo.getHit());
		return obj.toJSONString();
	}
	
}
