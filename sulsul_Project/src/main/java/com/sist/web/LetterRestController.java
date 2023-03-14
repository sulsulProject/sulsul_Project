package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.LetterDAO;
import com.sist.vo.LetterVO;

@RestController
public class LetterRestController {
	@Autowired
	private LetterDAO dao;
	
	// 쪽지 리스트
	@GetMapping(value="letter/recv_letter_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String recv_letterList(int page, HttpServletRequest request) {
		
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id"); 
		   System.out.println(id);
		   Map map=new HashMap();
		   map.put("id",id);
		   map.put("start", (page*10)-9);
		   map.put("end", page*10);
		   List<LetterVO> list = dao.recv_letterList(map);
		   int totalpage=dao.recv_letterTotalPage(id);
		   System.out.println(totalpage);
		   final int BLOCK = 5;
		   int startPage = ((page-1)/BLOCK * BLOCK) + 1;
		   int endPage = ((page-1)/BLOCK * BLOCK) + BLOCK;
		   if(endPage > totalpage)
				endPage = totalpage;
		   
		   //JSON변환 
		   JSONArray arr=new JSONArray();
		   int i=0;
		   for(LetterVO vo:list) {
			   JSONObject obj=new JSONObject();
			   obj.put("lno", vo.getLno());
			   obj.put("dbday", vo.getDbday());
			   obj.put("title", vo.getTitle());
			   obj.put("type", vo.getType());
			   obj.put("read_chk", vo.getRead_chk());
			   obj.put("send_id", vo.getSend_id());
			   obj.put("recv_id", vo.getRecv_id());
			   
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
	
	// 쪽지 상세
	@GetMapping(value="letter/recv_letter_detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String recv_letter_detail(int lno) {
		
		LetterVO vo = dao.letter_Detail(lno);
		JSONObject obj = new JSONObject();
		obj.put("lno", vo.getLno());
		obj.put("dbday", vo.getDbday());
		obj.put("title", vo.getTitle());
		obj.put("content", vo.getContent());
		obj.put("send_id", vo.getSend_id());
		obj.put("recv_id", vo.getRecv_id());
		System.out.println(obj.toJSONString());
		return obj.toJSONString();
	}
	
}
