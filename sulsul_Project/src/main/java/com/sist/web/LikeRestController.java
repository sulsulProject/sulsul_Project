package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.LikeDAO;
import com.sist.vo.*;

@RestController
public class LikeRestController {
	@Autowired
  private LikeDAO dao;
	
	 @GetMapping(value="mypage/mypage_like_list_vue.do",produces = "text/plain;charset=UTF-8")
	 public String mypage_like(int page,HttpSession session)
	 {
		   String id=(String)session.getAttribute("id");
		   
		   Map map=new HashMap();
		   map.put("id", id);
		   map.put("start", (page*10)-9);
		   map.put("end", page*10);
		   List<WineVO> list=dao.mypageLikeData(map);
		   int totalpage=dao.likeTotalPage(id);
		   JSONArray arr=new JSONArray();
		   int i=0;
		   for(WineVO vo:list)
		   {
			   JSONObject obj=new JSONObject();
			   obj.put("lno", vo.getLvo().getLno());
			   obj.put("ino", vo.getIno());
			   obj.put("poster", vo.getPoster());
			   obj.put("name", vo.getName());
			   obj.put("price", vo.getPrice());
			   obj.put("id", id);
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
	 @GetMapping(value = "mypage/like_list_delete_vue.do",produces ="text/plain;charset=UTF-8" )
	 public String like_list_delete(int lno)
	 {
		 dao.likeListDelete(lno);
		  return  "";
	 }
}
