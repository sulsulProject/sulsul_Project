package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.dao.LetterDAO;
import com.sist.vo.LetterVO;

@Controller
public class LetterController {
	@Autowired
	private LetterDAO dao;

	
	@GetMapping("letter/recv_letter_list.do")
	public String recv_letter_list() {
		
		return "letter/recv_letter_list";
	}
	
	@GetMapping("letter/recv_letter_detail.do")
	public String recv_letter_detail(int lno, Model model) {
		model.addAttribute("lno", lno);
		return "letter/recv_letter_detail";
	}
	
	@GetMapping("letter/send_letter_detail.do")
	public String send_letter_detail(int lno, Model model) {
		model.addAttribute("lno", lno);
		return "letter/send_letter_detail";
	}
	
	@GetMapping("letter/letter_insert.do")
	public String letter_insert(String recv_id, HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		model.addAttribute("send_id",id);
		model.addAttribute("recv_id", recv_id);
		return "letter/letter_insert";
	}
	
	@PostMapping("letter/letter_insert_ok.do")
	public String freeboard_insert(LetterVO vo) {
		dao.letterInsert(vo);
		return "redirect:../letter/recv_letter_list.do";
	}
	
	// 쪽지 삭제
	@GetMapping("letter/recv_letter_delete.do")
	public String recv_letter_delete(HttpServletRequest request) {
		int lno = Integer.parseInt(request.getParameter("lno"));
		String recv_id = request.getParameter("recv_id");
		
		Map map = new HashMap();
		map.put("lno", lno);
		map.put("recv_id", recv_id);
		dao.recv_letter_Delete(map);
		return "redirect:../letter/recv_letter_list.do";
	}
}
