package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.dao.BoardDAO;
import com.sist.vo.FreeBoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardDAO dao;
	
	@GetMapping("board/freeboard_list.do")
	public String freeboard_list() {
		
		return "board/freeboard_list";
	}
	
	@GetMapping("board/freeboard_insert.do")
	public String freeboard_insert(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		model.addAttribute(id);
		return "board/freeboard_insert";
	}
	
	@GetMapping("board/freeboard_detail.do")
	public String freeboard_detail(int fbno, Model model) {
		model.addAttribute("fbno", fbno);
		return "board/freeboard_detail";
	}
	
	@GetMapping("board/freeboard_update.do")
	public String freeboard_update(int fbno, Model model) {
		model.addAttribute("fbno", fbno);
		return "board/freeboard_update";
	}
	
	@GetMapping("board/freeboard_delete.do")
	public String freeboard_delete(int fbno, Model model) {
		model.addAttribute("fbno", fbno);
		return "board/freeboard_delete";
	}
	
	@PostMapping("board/freeboard_find.do")
	public String freeboard_find(String[] fs, String ss, Model model) {
		Map map = new HashMap();
		map.put("fsArr", fs);
		map.put("ss", ss);
		// DAO연동 = 검색데이터 읽기
		List<FreeBoardVO> list = dao.freeboardFindData(map);
		int count = dao.findCount(map);
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		return "board/freeboard_find";
	}
	
	// 이벤트게시판
	@GetMapping("board/eventboard_list.do")
	public String eventboard_list() {
		
		return "board/eventboard_list";
	}
	
	// 이벤트게시판
	@GetMapping("board/eventboard_detail.do")
	public String eventboard_detail(int ebno, Model model) {
		
		model.addAttribute("ebno", ebno);
		return "board/eventboard_detail";
	}
	
}
