package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

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
	
	@GetMapping(value = "customer/ask_detail_vue.do",produces = "text/plain;charset=UTF-8")
	public String  ask_detail(int ano)
	{
		AskVO vo = adao.askDetailData(ano);
		JSONObject obj=new JSONObject();
		obj.put("ano", vo.getAno());
		obj.put("subject", vo.getSubject());
		obj.put("id", vo.getId());
		obj.put("dbday", vo.getDbday());
		obj.put("content", vo.getContent());
		return obj.toJSONString();
	}
	
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



























