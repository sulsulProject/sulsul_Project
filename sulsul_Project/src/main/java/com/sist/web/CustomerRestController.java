package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Select;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.server.header.XFrameOptionsServerHttpHeadersWriter.Mode;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CustomerRestController {
	
	@Autowired
	private AskDAO adao;
	@Autowired
	private FaqDAO fdao;
	
	// faq 관련 
	//customer/faq_list_vue.do
	@GetMapping(value="customer/faq_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String faq_list(int page) 
	{
		Map map=new HashMap();
		map.put("start", (page*10)-9);
	    map.put("end", page*10);
	    List<FaqVO> list=fdao.faqList1(map);
	    int totalpage=fdao.faqTotalPage1();
	    //System.out.println("컨트롤러 totalpage"+totalpage);
	    
	    final int BLOCK = 5;
		int startPage = ((page-1)/BLOCK * BLOCK) + 1;
		int endPage = ((page-1)/BLOCK * BLOCK) + BLOCK;
		if(endPage > totalpage)
		endPage = totalpage;
		
		//JSON변환 
		JSONArray arr=new JSONArray();
	    int i=0;
	    for(FaqVO vo:list) 
	    {
	    	JSONObject obj=new JSONObject();
	    	obj.put("fno", vo.getFno());
	    	obj.put("type", vo.getType());
	    	obj.put("subject", vo.getSubject());
	    	obj.put("content", vo.getContent());
	    	obj.put("hit", vo.getHit());
	    	//obj.put("fcno", vo.getFcno());
			   
	    	if(i==0) {
			  obj.put("curpage", page);
			  obj.put("totalpage", totalpage);
			  obj.put("startPage", startPage);
			  obj.put("endPage", endPage);
	    	}
			arr.add(obj);
			i++;
		}
		return arr.toJSONString();
	}
		
	
	// faq 카테고리별 변경
	//customer/faq_change_vue.do
	@GetMapping(value="customer/faq_change_vue.do", produces = "text/plain;charset=UTF-8")
	public String faq_change(String no,String page) 
	{
		if(no==null)
			no="1";
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		Map map=new HashMap();
		map.put("start", (curpage*10)-9); // 10개씩 출력
		map.put("end", curpage*10);
		
		List<FaqVO> list=fdao.faqList1(map);
	    int totalpage=fdao.faqTotalPage1();
	    if(Integer.parseInt(no)==1) 
	    {
	    	list=fdao.faqList1(map);
	    	totalpage=fdao.faqTotalPage1();
		} 
	    else if(Integer.parseInt(no)==2) 
		{
			list=fdao.faqList2(map);
	    	totalpage=fdao.faqTotalPage2();
	    }
	    else if(Integer.parseInt(no)==3) 
	    {
			list=fdao.faqList3(map);
	    	totalpage=fdao.faqTotalPage3();
	    }
	    else if(Integer.parseInt(no)==4) 
	    {
			list=fdao.faqList4(map);
	    	totalpage=fdao.faqTotalPage4();
	    }
	    else if(Integer.parseInt(no)==5) 
	    {
	    	list=fdao.faqList5(map);
	    	totalpage=fdao.faqTotalPage5();
	    }
	    else if(Integer.parseInt(no)==6) 
	    {
			list=fdao.faqList6(map);
	    	totalpage=fdao.faqTotalPage6();
	    }
	    else if(Integer.parseInt(no)==7) 
	    {
			list=fdao.faqList7(map);
	    	totalpage=fdao.faqTotalPage7();
	    }
	    else if(Integer.parseInt(no)==8) 
	    {
			list=fdao.faqList8(map);
	    	totalpage=fdao.faqTotalPage8();
	    }
	    final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	      
		if(endPage>totalpage)
			endPage=totalpage;
		//JSON변환 
		JSONArray arr=new JSONArray();
		int i=0;
		for(FaqVO vo:list) {
			JSONObject obj=new JSONObject();
	    	obj.put("fno", vo.getFno());
	    	obj.put("type", vo.getType());
	    	obj.put("subject", vo.getSubject());
	    	obj.put("content", vo.getContent());
	    	obj.put("hit", vo.getHit());
	    	//obj.put("fcno", vo.getFcno());
			   
	    	if(i==0) {
	    		obj.put("curpage", page);
	    		obj.put("totalpage", totalpage);
	    		obj.put("startPage", startPage);
	    		obj.put("endPage", endPage);
	    	}
			arr.add(obj);
			i++;
		   }
		
		return arr.toJSONString();
	}
	//customer/faq_detail_vue.do
	@GetMapping(value="customer/faq_detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String ask_detail_vue(int fno) {
		
		FaqVO vo = fdao.faq_Detail(fno);
		JSONObject obj = new JSONObject();
		obj.put("fno", vo.getFno());
		obj.put("type", vo.getType());
		obj.put("subject", vo.getSubject());
		obj.put("content", vo.getContent());
		return obj.toJSONString();
	}
	//customer/faq_find_vue.do
	/*@GetMapping(value="customer/faq_find_vue.do", produces = "text/plain;charset=UTF-8")
	public String ask_find_vue(String subject) {
		
		if(subject==null)
			subject="";
		List<FaqVO> list=fdao.askSearchFindData(subject);
		//int count=fdao.askFindCount(subject);
		// 데이터 전송
		JSONArray arr= new JSONArray();
		for(FaqVO vo:list)
		{//fno,type,subject, content
			JSONObject obj=new JSONObject();
			obj.put("fno", vo.getFno());
			obj.put("type", vo.getType());
			obj.put("content", vo.getContent()); 
			obj.put("subject", vo.getSubject());
			arr.add(obj);
		}
		
		return arr.toJSONString();
	}*/
	
	
	
	///////////////////////////////////////////////////////////////
	// ask 관련
	@GetMapping(value="customer/ask_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String ask_list(HttpSession session)
	{
		
		//HttpSession session= request.getSession();
		String id=(String)session.getAttribute("id");
		List<AskVO> list=new ArrayList<AskVO>();
		if(id==null)
		{
			list=adao.asknotListData();
		}
		else 
		{
			list=adao.askListData(id);
			//JSON 변환
		}	
		JSONArray arr=new JSONArray();
		  //int i=0;
			for(AskVO vo:list)
			{
				JSONObject obj=new JSONObject();
				obj.put("ano", vo.getAno());
				obj.put("subject", vo.getSubject());
				obj.put("content", vo.getContent());
				obj.put("dbday", vo.getDbday());
				obj.put("id", vo.getId());
						
				arr.add(obj);
			}
		
		return arr.toJSONString();
	}
	@GetMapping("customer/ask_insert_vue.do")
	public String ask_insert(AskVO vo,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		vo.setId(id);
		adao.askInsert(vo);
		return "";
	}
	
//	@GetMapping(value = "customer/ask_detail_vue.do",produces = "text/plain;charset=UTF-8")
//	public String  ask_detail(int ano)
//	{
//		AskVO vo = adao.askDetailData(ano);
//		JSONObject obj=new JSONObject();
//		obj.put("ano", vo.getAno());
//		obj.put("subject", vo.getSubject());
//		obj.put("id", vo.getId());
//		obj.put("dbday", vo.getDbday());
//		obj.put("content", vo.getContent());
//		return obj.toJSONString();
//	}
	
	// 수정하기
	@GetMapping(value = "customer/ask_update_vue.do",produces = "text/plain;charset=UTF-8")
	public String board_update_vue(int ano)
	{
		AskVO vo=adao.askDetailData(ano);
		JSONObject obj=new JSONObject();
		obj.put("ano", vo.getAno());
		obj.put("subject", vo.getSubject());
		obj.put("content", vo.getContent());
		
		return obj.toJSONString();
	}
	@GetMapping("customer/ask_update_ok_vue.do") // 한글을 보내는게 없어서 produces를 안해도 된다
	public String board_update_ok_vue(AskVO vo) // 보낼 값이 많을 때 BoardVO를 사용해서 한다
	{
		String res=adao.askUpdate(vo);
		return res;
	}
	
	@GetMapping("customer/ask_delete_vue.do")
	public String board_delete_vue(int ano,String pwd) 
	{ 
		String res=adao.askDelete(ano, pwd);
		System.out.println("컨트롤러 res"+res); 
		return res; 
	}
	 
	 
}



























