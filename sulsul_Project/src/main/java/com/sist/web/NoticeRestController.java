package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;


@RestController
public class NoticeRestController {
	@Autowired
    private NoticeDAO dao;
	 @GetMapping(value="notice/list_vue.do",produces = "text/plain;charset=UTF-8")
	   public String notice_list(int page) {
		   Map map=new HashMap();
		   map.put("start", (page*10)-9);
		   map.put("end", page*10);
		   List<NoticeVO> list=dao.noticeListData(map);
		   int totalpage=dao.noticeTotalPage();
		  
		   //JSON변환 
		   JSONArray arr=new JSONArray();
		   int i=0;
		   for(NoticeVO vo:list)
		   {
			   JSONObject obj=new JSONObject();
			   obj.put("no", vo.getNo());
			   obj.put("subject", vo.getSubject());
			   obj.put("name", vo.getName());
			   obj.put("dbday", vo.getDbday());
			   obj.put("hit", vo.getHit());
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
