package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;


@RestController
public class BoardRestController {
	@Autowired
	private BCryptPasswordEncoder encoder;
	
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
		
		String res = "no";
		
		try {
			res="yes";
			String pwd = encoder.encode(vo.getPwd()); // 암호화
			vo.setPwd(pwd);
			dao.freeboardInsert(vo);
		} catch (Exception e) {
			res="no";
		}
		return res;
		
		
	}
	/*
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
	*/
	
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
		   
		   final int BLOCK = 5;
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
	
	
	// 이벤트게시판 타입변경
	@GetMapping(value="board/event_change_vue.do", produces = "text/plain;charset=UTF-8")
	public String letter_changeMode(String no, String page, HttpServletRequest request) {
			HttpSession session = request.getSession();
			String id=(String)session.getAttribute("id");
			if(no==null)
				no="0";
			if(page==null)
				page="1";
			
			int curpage=Integer.parseInt(page);
			Map map=new HashMap();
			map.put("id", id);
			map.put("start", (curpage*20)-19); // 10개씩 출력
			map.put("end", curpage*20);
			
			List<EventBoardVO> lList = dao.eventboardListData(map);
			int totalpage = dao.eventboardTotalPage();
			if(Integer.parseInt(no)==1) {
				lList = dao.eventboard_sell_ListData(map);
				totalpage = dao.eventboard_sell_TotalPage(); 
			} else if(Integer.parseInt(no)==2) {
		        lList = dao.eventboard_dinner_ListData(map);
		        totalpage = dao.eventboard_dinner_TotalPage(); 
		    } else if(Integer.parseInt(no)==3) {
		        lList = dao.eventboard_edu_ListData(map);
		        totalpage = dao.eventboard_edu_TotalPage(); 
		    } else if(Integer.parseInt(no)==4) {
		        lList = dao.eventboard_si_ListData(map);
		        totalpage = dao.eventboard_si_TotalPage(); 
		    } else if(Integer.parseInt(no)==5) {
		        lList = dao.eventboard_other_ListData(map);
		        totalpage = dao.eventboard_other_TotalPage(); 
		    }
		     
		      
			final int BLOCK = 5;
			   int startPage = ((curpage-1)/BLOCK * BLOCK) + 1;
			   int endPage = ((curpage-1)/BLOCK * BLOCK) + BLOCK;
			   if(endPage > totalpage)
					endPage = totalpage;
			   
			   //JSON변환 
			   JSONArray arr=new JSONArray();
			   int i=0;
			   for(EventBoardVO vo:lList) {
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
	
	// Cookie전송
	@GetMapping(value="board/event_cookie_data_vue.do", produces = "text/plain;charset=UTF-8")
	public String event_cookie_data(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		List<EventBoardVO> list = new ArrayList<EventBoardVO>();
		if(cookies != null) {
			for(int i=cookies.length-1; i>=0; i--) {
				if(cookies[i].getName().startsWith("eventboard")) {
					String ebno = cookies[i].getValue();
					EventBoardVO vo = dao.eventboardDetailData(Integer.parseInt(ebno));
					list.add(vo);
				}
			}
		}
		// JSON 변환
				JSONArray arr = new JSONArray();
				int i = 0;
				for(EventBoardVO vo : list) {
					if(i>9) break;
					JSONObject obj = new JSONObject();
					obj.put("ebno", vo.getEbno());
					obj.put("title", vo.getTitle());
					obj.put("image", vo.getImage());
					arr.add(obj);
					i++;
				}
				return arr.toJSONString();
			}

}
