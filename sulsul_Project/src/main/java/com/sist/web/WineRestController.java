package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class WineRestController {
	@Autowired
	private WineDAO dao;
	
//	@GetMapping(value="wine/wine_main_vue.do", produces = "text/plain;charset=UTF-8")
//	public String wine_main_vue()
//	{
//		List<WineVO> list=dao.wineListData();
//		JSONArray arr=new JSONArray();
//		for(WineVO vo:list)
//		{
//			JSONObject obj=new JSONObject();
//			obj.put("name", vo.getName());
//			obj.put("poster", vo.getPoster());
//			obj.put("price", vo.getPrice());
//			arr.add(obj);
//		}
//		
//		return arr.toJSONString();
//	}
}
