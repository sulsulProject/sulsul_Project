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

import com.sist.dao.MemberDAO;
import com.sist.dao.OrderDAO;
import com.sist.vo.CartVO;
import com.sist.vo.MemberVO;

@RestController
public class AdminRestController {
	@Autowired
	private OrderDAO odao;
	@Autowired
	private MemberDAO mdao;
	 @GetMapping(value = "adminpage/admin_order_list_vue.do",produces = "text/plain;charset=UTF-8")
	   public String admin_order_list(Integer page)
	   {
		 Map map=new HashMap();
		 map.put("start", (page*10)-9);
		 map.put("end", page*10);
		 List<CartVO> list=odao.adminorderListData(map);
		 int totalpage=odao.adminOrderTotalPage();
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
			   obj.put("id", vo.getId());
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
	 
	@GetMapping(value = "adminpage/adminpage_member_list_vue.do",produces = "text/plain;charset=UTF-8")
	public String admin_member_list(Integer page,HttpSession session)
	{
			 Map map=new HashMap();
			 String id=(String)session.getAttribute("id");
			 map.put("id", id);
			 map.put("start", (page*10)-9);
			 map.put("end", page*10);
			 List<MemberVO> list=mdao.admin_member_info(map);
			 int totalpage=mdao.adminMemberTotalPage();
		     JSONArray arr=new JSONArray();
		     int i=0;
		     for(MemberVO vo:list) {
			   JSONObject obj=new JSONObject();
			    obj.put("id", vo.getId());
			    obj.put("email", vo.getEmail());
				obj.put("sex", vo.getSex());
				obj.put("name", vo.getName());
				obj.put("Bday", vo.getBday());
				obj.put("tel", vo.getTel());
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
	@GetMapping(value = "adminpage/admin_member_delete_vue.do",produces = "text/plain;charset=UTF-8")
	public String admin_member_delete(String id) 
	{
		  mdao.adminMemberDelete(id);
		  return "";
	}
}
