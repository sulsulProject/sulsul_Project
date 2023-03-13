package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.TradeDAO;
import com.sist.vo.TradeVO;

@RestController
public class TradeRestController {
	@Autowired
	private TradeDAO dao;
	
	@GetMapping(value="trade/trade_list_vue.do", produces = "text/plain;charset=UTF-8")
	public String trade_list(int page) {
		   Map map=new HashMap();
		   map.put("start", (page*20)-19);
		   map.put("end", (page*20));
		   
		   List<TradeVO> list=dao.tradeListData(map);
		   int totalpage = dao.tradeListTotalPage();
		   
		   final int BLOCK = 10;
		   int startPage = ((page-1)/BLOCK * BLOCK) + 1;
		   int endPage = ((page-1)/BLOCK * BLOCK) + BLOCK;
		   if(endPage > totalpage)
				endPage = totalpage;
		   
		   //JSON변환 
		   JSONArray arr=new JSONArray();
		   int i=0;
		   for(TradeVO vo:list) {
			   JSONObject obj=new JSONObject();
			   String title = vo.getTitle();
			   String t1 = title.substring(0, title.indexOf("^"));
			   if(t1.length() > 12) {
				   t1 = t1.substring(0, 12) + "...";
			   }
			   String t2 = title.substring(title.indexOf("^"));
			   obj.put("tdno", vo.getTdno());
			   obj.put("title", title);
			   obj.put("t1", t1);
			   obj.put("t2", t2);
			   obj.put("image", vo.getImage());
			   obj.put("loc", vo.getLoc());
			   obj.put("price", vo.getPrice());
			   obj.put("seller", vo.getSeller());
			   obj.put("hit", vo.getHit());
			   if(i==0) {
				   obj.put("curpage", page);
				   obj.put("totalpage", totalpage);
				   obj.put("startPage", startPage);
				   obj.put("endPage", endPage);
			   }
			   arr.add(obj);
			   i++;
		  }
		   return arr.toJSONString();
	 }
	
	@GetMapping(value = "trade/trade_detail_vue.do", produces = "text/plain;charset=UTF-8")
	public String trade_detail(int tdno) {
		
		TradeVO vo = dao.tradeDetailData(tdno);
		JSONObject obj = new JSONObject();
		String title = vo.getTitle();
		String t1 = title.substring(0, title.indexOf("^"));
		String t2 = title.substring(title.indexOf("^")+1);
		String pnum = vo.getPnum().substring(vo.getPnum().indexOf(":")+2);
		
		obj.put("tdno", vo.getTdno());
		obj.put("image", vo.getImage());
		obj.put("seller", vo.getSeller());
		obj.put("hit", vo.getHit());
		obj.put("t1", t1);
		obj.put("t2", t2);
		obj.put("price", vo.getPrice());
		obj.put("loc", vo.getLoc());
		obj.put("state", vo.getState());
		obj.put("pnum", pnum);
		obj.put("pdate", vo.getPdate());
		obj.put("method", vo.getMethod());
		obj.put("reason", vo.getReason());
		
		return obj.toJSONString();
	}
	
	
}
