package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TradeController {
	@GetMapping("trade/list.do")
	public String trade_list() {

		return "trade/list";
	}
}
