package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.ReplyDAO;
import com.sist.vo.AllReplyVO;

@Controller
public class AllReplyController {
	private String[] url = {"", "../board/freeboard_detail.do", "../customer/ask_detail.do"};


	@Autowired
	private ReplyDAO dao;
	
	@PostMapping("reply/freeboard_insert.do")
	   // forward => Model , redirect => RedirectAttributes
	   public String reply_insert(AllReplyVO vo,RedirectAttributes ra,HttpSession session)
	   {
		   // 객체 단위 => 커맨드 객체 
		   String id=(String)session.getAttribute("id");
		   String name=(String)session.getAttribute("name");
		   vo.setId(id);
		   vo.setName(name);
		   dao.sul_replyInsert(vo);
		   ra.addAttribute("fbno", vo.getRno());
		   ra.addAttribute("cate_no", vo.getCate_no());
		   return "redirect:"+url[vo.getCate_no()];
	   }
	
	@GetMapping("reply/freeboard_delete.do")
	   public String reply_delete(AllReplyVO vo, RedirectAttributes ra) {
		   dao.sul_replyDelete(vo.getNo());
		   ra.addAttribute("fbno", vo.getRno());
		   ra.addAttribute("cate_no", vo.getCate_no());
		   return "redirect:"+url[vo.getCate_no()];
	   }
	   
   @PostMapping("reply/freeboard_update.do")
   public String reply_update(AllReplyVO vo, RedirectAttributes ra) {
	   
	   dao.sul_replyUpdate(vo.getNo(), vo.getMsg());
	   ra.addAttribute("fbno", vo.getRno());
	   ra.addAttribute("cate_no", vo.getCate_no());
	   return "redirect:"+url[vo.getCate_no()];
   }
   
   // 고객센터
   @PostMapping("reply/ask_insert.do")
   public String reply_ask_insert(AllReplyVO vo,RedirectAttributes ra,HttpSession session)
   {
	   // 객체 단위 => 커맨드 객체 
	   String id=(String)session.getAttribute("id");
	   String name=(String)session.getAttribute("name");
	   vo.setId(id);
	   vo.setName(name);
	   dao.sul_replyInsert(vo);
	   ra.addAttribute("ano", vo.getRno()); //고객센터
	   ra.addAttribute("cate_no", vo.getCate_no());
	   return "redirect:"+url[vo.getCate_no()];
   }

   @GetMapping("reply/ask_delete.do")
   public String reply_ask_delete(AllReplyVO vo, RedirectAttributes ra) {
	   dao.sul_replyDelete(vo.getNo());
	   ra.addAttribute("ano", vo.getRno()); //고객센터
	   ra.addAttribute("cate_no", vo.getCate_no());
	   return "redirect:"+url[vo.getCate_no()];
   }
   
	@PostMapping("reply/ask_update.do")
	public String reply_ask_update(AllReplyVO vo, RedirectAttributes ra) {
   
	   dao.sul_replyUpdate(vo.getNo(), vo.getMsg());
	   ra.addAttribute("ano", vo.getRno()); //고객센터
	   ra.addAttribute("cate_no", vo.getCate_no());
	   return "redirect:"+url[vo.getCate_no()];
	}
}
