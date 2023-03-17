package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.CartVO;
import com.sist.vo.WineVO;
@RestController
public class OrderRestController {
 @Autowired 
 private OrderDAO dao;
 
   @GetMapping(value = "mypage/mypage_order_list_vue.do",produces = "text/plain;charset=UTF-8")
   public String order_list(int page,HttpSession session)
   {
	   String id=(String)session.getAttribute("id");
	   
	   Map map=new HashMap();
	   map.put("id", id);
	   map.put("start", (page*10)-9);
	   map.put("end", page*10);
	   List<CartVO> list=dao.orderListData(map);
	   int totalpage=dao.orderTotalPage(id);
	   JSONArray arr=new JSONArray();
	   int i=0;
	   for(CartVO vo:list)
	   {
		   JSONObject obj=new JSONObject();
		   obj.put("bno", vo.getBno());
		   obj.put("poster", vo.getWvo().getPoster());
		   obj.put("dbday", vo.getDbday());
		   obj.put("name", vo.getWvo().getName());
		   obj.put("total_price", vo.getTotal_price());
		   obj.put("account", vo.getAccount());
		   obj.put("ino", vo.getWvo().getIno());
		   obj.put("buy_ok", vo.getBuy_ok());
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
   
   @GetMapping(value = "adminpage/admin_order_ok_vue.do",produces = "text/plain;charset=UTF-8")
   public String buy_ok(int bno)
   {
	   dao.orderOkUpdate(bno);
	  return "";
   }
}
