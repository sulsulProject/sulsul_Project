package com.sist.web;
import com.sist.vo.*;
import com.sist.dao.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {
	
	
	
	//faq관련 내용
	@GetMapping("customer/faq.do")
	public String customerservice_faq()
	{
		return "customer/customer_faq";
	}
	
	//이용 안내 관련 내용
	@GetMapping("customer/iu.do")
	public String customerservice_introduce()
	{
		return "customer/customer_infomation";
	}
	
	//1:1 문의관련 내용
	@GetMapping("customer/ask.do")
	public String customerservice_ask()
	{
		return "customer/customer_ask";
	}
}
