package com.sist.web;
import com.sist.vo.*; 
import com.sist.dao.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {
	@Autowired
	private InformationDAO idao;
	@Autowired
	private FaqDAO fdao;
	@Autowired
	private AskDAO adao;
	@Autowired
	private ReplyDAO rdao;
	//faq관련 내용
	@RequestMapping("customer/faq.do")
	public String customerservice_faq(String subject,Model model)
	{
		int count=0;
		List<FaqVO> sList=new ArrayList<FaqVO>();
		
		if(subject==null) {
			subject="ALL";
			count=78;
			sList=fdao.faqSearchFindData1();
		}
		else if(subject.equals("")) {
			subject="ALL";
			count=78;
			sList=fdao.faqSearchFindData1();
		}
		else { // null이 아닌 경우
			count=fdao.askFindCount2(subject);
			if(count>0) {
				sList=fdao.faqSearchFindData2(subject);
			}
		}
		// 나라별 센터 소개
		List<NationIntroduceVO> nList=fdao.nationListData();
		
		model.addAttribute("subject",subject);
		model.addAttribute("sList",sList);
		model.addAttribute("count",sList.size());
		model.addAttribute("nList",nList);
		
		return "customer/customer_faq";
	}

	//faq_detail
	@GetMapping("customer/faq_detail.do")
	public String customerservice_faq_detail(int fno, Model model)
	{
		model.addAttribute("fno",fno);
		return "customer/faq_detail";
	}
	
	
	//////////////////////////////////////////////////////////
	
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
	
	// 이용안내 상세페이지 전환
	@GetMapping("customer/iuDetail.do")
	public String customerservice_introduce_detail(int iuno,Model model)
	{
		InformationUseVO vo=idao.informationDetailData(iuno);
		String image=vo.getImage();
		// TO_DO : 이미지가 여러개일경우 여러개 출력되게 하기
		List<String> list=new ArrayList<String>();
		if(!image.contains(","))
		{
			list.add(image);
		}
		else 
		{
			String[] images=image.split(",");
			for(int i=0; i<images.length-1;i++)
			 {
				 list.add(images[i]);
			 }
		}
				
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
		model.addAttribute("iuno",iuno);
		return "customer/customer_information_detail";
	}
	
	
	
	
	/////////////////////////////////////////////////////////////
	//1:1 문의관련 내용
	@GetMapping("customer/ask.do")
	public String customerservice_ask(HttpSession session,Model model)
	{
		String id=(String)session.getAttribute("id");
		System.out.println("컨트롤러 아이디"+id);
		int count=0;
		if(id==null)
		{
			count=adao.asknotTotalData();
		}
		else
		{
		    count =adao.askTotalData(id);
		}
		model.addAttribute("count",count);
		System.out.println("모델"+count);
		return "customer/customer_ask";
	}
	
	@GetMapping("customer/ask_insert.do")
	public String ask_insert()
	{
		return "customer/ask_insert";
	}
	
	@GetMapping("customer/ask_detail.do")
	public String ask_detail(HttpServletRequest request,String cate_no,Model model)
	{
		AskVO vo=adao.askDetailData(Integer.parseInt(request.getParameter("ano")));
		model.addAttribute("vo", vo);
		model.addAttribute("ano", Integer.parseInt(request.getParameter("ano")));
		model.addAttribute("cate_no", Integer.parseInt(request.getParameter("cate_no")));
		
		
		List<AllReplyVO> rList = rdao.sul_replyList(Integer.parseInt(request.getParameter("ano")), Integer.parseInt(request.getParameter("cate_no")));
		
		model.addAttribute("rList", rList);
		return "customer/ask_detail";
	}
	
	@GetMapping("customer/ask_update.do")
	public String ask_update(int ano,Model model)
	{
		model.addAttribute("ano",ano);
		return "customer/ask_update";
	}
	
	@GetMapping("customer/ask_delete.do")
	public String ask_delete(int ano,Model model)
	{
		model.addAttribute("ano",ano);
		return "customer/ask_delete";
	}
	
	
}