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
	   public String notice_list(Integer page) {
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
	 @GetMapping("notice/insert_vue.do")
	   public String notice_insert(NoticeVO vo)
	   {
		   dao.noticeInsert(vo);
		   return "";
	   }
	   
	   @GetMapping(value = "notice/detail_vue.do",produces = "text/plain;charset=UTF-8" )
	   public String notice_detail(int no)
	   {
		   NoticeVO vo=dao.noticeDetailData(no);
		   JSONObject obj=new JSONObject();
		   obj.put("no", vo.getNo());
		   obj.put("subject", vo.getSubject());
		   obj.put("name", vo.getName());
		   obj.put("dbday", vo.getDbday());
		   obj.put("hit", vo.getHit());
		   obj.put("content", vo.getContent());
		   return obj.toJSONString();
	   }
	   
	   @GetMapping(value = "notice/update_vue.do",produces = "text/plain;charset=UTF-8")
	   public String notice_update(int no)
	   {
		   NoticeVO vo=dao.noticeDetailData(no);
		   JSONObject obj=new JSONObject();
		   obj.put("no", vo.getNo());
		   obj.put("subject", vo.getSubject());
		   obj.put("name", vo.getName());
		   obj.put("content", vo.getContent());
		   return obj.toJSONString();
	   }
	   
	   @GetMapping("notice/update_ok_vue.do")
	   public String notice_update_ok(NoticeVO vo)
	   {
		   String res=dao.noticeUpdate(vo);
		   return res;
	   }
	   
	   @GetMapping("notice/delete_vue.do")
	   public String notice_delete_ok(int no,String pwd)
	  {
		   String res=dao.noticeDelete(no, pwd);
		   return res;
	  }
}
