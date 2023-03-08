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
	private InformationDAO idao;
	
	@GetMapping(value = "infomation/list_vue.do",produces = "text/plain;charset=UTF-8")
	public String board_list(int page)
	{
		Map map=new HashMap();
		map.put("start",(page*10)-9);
		map.put("end",page*10);
		
		List<InformationUseVO> list=idao.informationListData(map);
		int totalpage=idao.informationTotalPage();
		
		// JSON 변환
		JSONArray arr=new JSONArray();
		int i=0;
		for(InformationUseVO vo: list)
		{
			JSONObject obj=new JSONObject();
			obj.put("iuno", vo.getIuno());
			obj.put("subject", vo.getSubject());
			obj.put("image", vo.getImage());
			obj.put("dbday", vo.getDbday());
			obj.put("hit", vo.getHit());
			if(i==0) // 배열의 맨처음에만 curpage, totalpage를 추가
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
