package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RegularController {
	@GetMapping("regular/regular.do")
	public String regular() {
		System.out.println("regularrr");
		return "regular/regular";
	}
}
