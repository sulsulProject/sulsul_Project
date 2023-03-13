package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.WineDAO;
import com.sist.vo.WineVO;
@RestController
public class WineRestController {
	@Autowired
	private WineDAO dao;

	@GetMapping(value="wine/wine_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String wine_list(int page)
	{
		Map map=new HashMap();
		map.put("start", (page*5)-4);
		map.put("end", page*5);
		List<WineVO> list=dao.wineListData(map);
		int totalpage=dao.wineTotalPage();
		JSONArray arr=new JSONArray();
		int i=0;
		for(WineVO vo:list)
		{
			JSONObject obj=new JSONObject();
			obj.put("name", vo.getName());
			obj.put("poster", vo.getPoster());
			obj.put("price", vo.getPrice());
			if(i==0)
			{
				obj.put("curpage", page);
				obj.put("totalpage", totalpage);
			}
			arr.add(obj);
			i++;
		}
		return arr.toJSONString();
	}

}
