package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TradeController {
	
	@GetMapping("trade/trade_list.do")
	public String trade_list() {
		
		return "trade/trade_list";
	}
	
	@GetMapping("trade/trade_detail.do")
	public String trade_detail(int tdno, Model model) {
		model.addAttribute("tdno", tdno);
		return "trade/trade_detail";
	}
	
	@GetMapping("chat/chat.do")
	public String chat_chat() {
		
		return "sul/chat/chat";
	}
}
