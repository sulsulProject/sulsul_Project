package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.BoardDAO;
import com.sist.dao.ReplyDAO;
import com.sist.vo.AllReplyVO;
import com.sist.vo.FreeBoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardDAO dao;
	@Autowired
	private ReplyDAO rdao;
	
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
	public String freeboard_detail(HttpServletRequest request, String cate_no, Model model) {
		
		//System.out.println(request.getParameter("fbno"));
		//System.out.println(request.getParameter("cate_no"));
		
		FreeBoardVO vo=dao.freeboardDetailData(Integer.parseInt(request.getParameter("fbno")));
		model.addAttribute("vo", vo);
		model.addAttribute("fbno", Integer.parseInt(request.getParameter("fbno")));
		model.addAttribute("cate_no", Integer.parseInt(request.getParameter("cate_no")));
		
		
		List<AllReplyVO> rList = rdao.sul_replyList(Integer.parseInt(request.getParameter("fbno")), Integer.parseInt(request.getParameter("cate_no")));
		model.addAttribute("rList", rList);
		
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
	
	@GetMapping("board/eventboard_before_detail.do")
   public String food_before_detail(int ebno,HttpServletResponse response,RedirectAttributes ra) {
	   Cookie cookie=new Cookie("eventboard"+ebno, String.valueOf(ebno));
	   cookie.setPath("/");
	   cookie.setMaxAge(60*60*24);
	   response.addCookie(cookie);
	   ra.addAttribute("ebno", ebno);
	   return "redirect:../board/eventboard_detail.do";
   }
	
	// 이벤트게시판
	@GetMapping("board/eventboard_detail.do")
	public String eventboard_detail(int ebno, Model model) {
		
		model.addAttribute("ebno", ebno);
		return "board/eventboard_detail";
	}
	
}
