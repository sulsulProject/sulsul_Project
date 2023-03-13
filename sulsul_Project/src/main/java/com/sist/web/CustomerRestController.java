package com.sist.web;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CustomerRestController {
	
	@Autowired
	private AskDAO adao;
	
	@GetMapping(value="customer/ask_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String ask_list(String id)
	{
		AskVO avo=new AskVO();
		List<AskVO> list=adao.askListData(avo.getId());
		//JSON 변환
		JSONArray arr=new JSONArray();
		//int i=0;
		for(AskVO vo:list)
		{
			JSONObject obj=new JSONObject();
			obj.put("ano", vo.getAno());
			obj.put("subject", vo.getSubject());
			obj.put("content", vo.getContent());
			obj.put("dbday", vo.getDbday());
					
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	@GetMapping("customer/ask_insert_vue.do")
	public String ask_insert(AskVO vo)
	{
		adao.askInsert(vo);
		return "";
	}
	 
}
