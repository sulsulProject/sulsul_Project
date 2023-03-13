package com.sist.web;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.InformationDAO;
import com.sist.vo.InformationUseVO;

@Controller
public class CustomerController {
	@Autowired
	private InformationDAO idao;

	//faq관련 내용
	@GetMapping("customer/faq.do")
	public String customerservice_faq()
	{
		return "customer/customer_faq";
	}

	//이용 안내 관련 내용
	@GetMapping("customer/iu.do")
	public String customerservice_introduce(String page,Model model)
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);

		Map map=new HashMap();
		int start=(curpage*10)-9;
		int end=(curpage*10);
		map.put("start",start);
		map.put("end",end);

		List<InformationUseVO> list=idao.informationListData(map);
		int totalpage=idao.informationTotalPage();

		model.addAttribute("list",list);
		model.addAttribute("curpage",curpage);
		model.addAttribute("totalpage",totalpage);
		return "customer/customer_infomation";
	}

	//1:1 문의관련 내용
	@GetMapping("customer/ask.do")
	public String customerservice_ask()
	{
		return "customer/customer_ask";
	}
}
