package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	@GetMapping("notice/list.do")
	public String notice_list() {
		
		return "notice/list";
	}
	
	@GetMapping("notice/insert.do")
	public String notice_insert() {
		
		return "notice/insert";
	}
	@GetMapping("notice/update.do")
	public String notice_update(int no,Model model) {
		model.addAttribute("no",no);
		return "notice/update";
	}
	@GetMapping("notice/delete.do")
	public String notice_delete(int no,Model model) {
		model.addAttribute("no",no);
		return "notice/delete";
	}
	@GetMapping("notice/detail.do")
	public String notice_detail(int no,Model model) {
		model.addAttribute("no",no);
		return "notice/detail";
	}
}
