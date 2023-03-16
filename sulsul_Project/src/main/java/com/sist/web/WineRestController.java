package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class WineRestController {
   @Autowired
   private WineDAO dao;
   // 민우 와인 리스트-뷰
   @GetMapping(value="wine/wine_list_vue.do",produces = "text/plain;charset=UTF-8")
   public String wine_list(String no, String page)
   {
      if(no==null)
         no="";
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      Map map=new HashMap();
      map.put("start", (curpage*6)-5); // 6개씩 출력
      map.put("end", curpage*6);
      List<WineVO> wList=dao.wineListData(map);
      int totalpage=dao.wineTotalPage();
      
      int winecount=dao.wineCount();
      
      final int BLOCK=5;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      
      if(endPage>totalpage)
         endPage=totalpage;
      
      int i=0;
      JSONArray arr=new JSONArray();
      for(WineVO vo:wList)
      {
         JSONObject obj=new JSONObject();
         obj.put("ino", vo.getIno());
         obj.put("name", vo.getName());
         obj.put("poster", vo.getPoster());
         obj.put("price", vo.getPrice());
         obj.put("nation", vo.getNation());
         obj.put("capacity", vo.getCapacity());
         obj.put("vintage", vo.getVintage());
         if(i==0)
         {
            obj.put("curpage", curpage);
            obj.put("totalpage", totalpage);
            obj.put("startPage", startPage);
            obj.put("endPage", endPage);
            obj.put("winecount", winecount);
         }
         arr.add(obj);
         i++;
      }
 
      return arr.toJSONString();
   }
   // 민우 위스키 리스트-뷰
   @GetMapping(value="wine/whiskey_list_vue.do",produces = "text/plain;charset=UTF-8")
   public String whiskey_list(String no, String page)
   {
      if(no==null)
         no="";
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      Map map=new HashMap();
      map.put("start", (curpage*6)-5);
      map.put("end", curpage*6);
      List<WineVO> wList=dao.whiskeyListData(map);
      int totalpage=dao.whiskeyTotalPage();
      int totalcount=dao.whiskeyCount();
      
      final int BLOCK=5;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      
      if(endPage>totalpage)
         endPage=totalpage;

      int i=0;
      JSONArray arr=new JSONArray();
      for(WineVO vo:wList)
      {
         JSONObject obj=new JSONObject();
         obj.put("ino", vo.getIno());
         obj.put("name", vo.getName());
         obj.put("poster", vo.getPoster());
         obj.put("price", vo.getPrice());
         obj.put("nation", vo.getNation());
         obj.put("capacity", vo.getCapacity());
         obj.put("vintage", vo.getVintage());
         if(i==0)
         {
            obj.put("curpage", curpage);
            obj.put("totalpage", totalpage);
            obj.put("startPage", startPage);
            obj.put("endPage", endPage);
            obj.put("totalcount", totalcount);
         }
         arr.add(obj);
         i++;
      }
      return arr.toJSONString();
   }
   // 민우 꼬냑 리스트-뷰
   @GetMapping(value="wine/cognac_list_vue.do",produces = "text/plain;charset=UTF-8")
   public String cognac_list(String no, String page)
   {
     if(no==null)
         no="";
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      Map map=new HashMap();
      map.put("start", (curpage*6)-5);
      map.put("end", curpage*6);
      List<WineVO> wList=dao.cognacListData(map);
      int totalpage=dao.cognacTotalPage();
      int totalcount=dao.cognacCount();
      
      final int BLOCK=5;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      
      if(endPage>totalpage)
         endPage=totalpage;

      int i=0;
      JSONArray arr=new JSONArray();
      for(WineVO vo:wList)
      {
         JSONObject obj=new JSONObject();
         obj.put("ino", vo.getIno());
         obj.put("name", vo.getName());
         obj.put("poster", vo.getPoster());
         obj.put("price", vo.getPrice());
         obj.put("nation", vo.getNation());
         obj.put("capacity", vo.getCapacity());
         obj.put("vintage", vo.getVintage());
         if(i==0)
         {
            obj.put("curpage", curpage);
            obj.put("totalpage", totalpage);
            obj.put("startPage", startPage);
            obj.put("endPage", endPage);
            obj.put("totalcount", totalcount);
         }
         arr.add(obj);
         i++;
      }
      return arr.toJSONString();
   }
   
   //와인 상세페이지-뷰(선우)
   @GetMapping(value="wine/detail_vue.do",produces = "text/plain;charset=UTF-8")
   public String wine_detail(int ino)
   {
      WineVO vo=dao.wineDetailData(ino);
      JSONObject obj=new JSONObject();
      obj.put("ino", vo.getIno());
      obj.put("name", vo.getName());
      obj.put("poster", vo.getPoster());
      obj.put("alcohol", vo.getAlcohol());
      obj.put("capacity", vo.getCapacity());
      obj.put("nation", vo.getNation());
      obj.put("price", vo.getPrice());
      obj.put("hit", vo.getHit());
      obj.put("icno", vo.getIcno());
      obj.put("name_sub", vo.getName_sub());
      obj.put("vintage", vo.getVintage());
      obj.put("place", vo.getPlace());
      obj.put("winery", vo.getWinery());
      obj.put("first_price", vo.getFirst_price());
      obj.put("discount", vo.getDiscount());
      return obj.toJSONString();
      
      
   }
   
   
   // 와인 Cookie
   @GetMapping(value="wine/cookie_data_vue.do",produces="text/plain;charset=utf-8")
   public String wine_cookie_data(HttpServletRequest request)
   {
      Cookie[] cookies=request.getCookies();
      List<WineVO> list=new ArrayList<WineVO>();
      if(cookies!=null)
      {
         for(int i=cookies.length-1;i>=0;i--)
         {
            if(cookies[i].getName().startsWith("sul_wine"))
            {
               String ino=cookies[i].getValue();
               WineVO vo=dao.sulCookieDetailData(Integer.parseInt(ino));
               list.add(vo);
            }
         }
      }
      
      JSONArray arr=new JSONArray();
      int i=0;
      for(WineVO vo:list)
      {
         if(i>50) break;
         JSONObject obj=new JSONObject();
         obj.put("ino", vo.getIno());
         obj.put("name", vo.getName());
         obj.put("poster", vo.getPoster());
         arr.add(obj);
         i++;
      }
      return arr.toJSONString();
   }
   // 민우 : 와인 조건 sort
   @GetMapping(value="wine/wine_hit_vue.do",produces = "text/plain;charset=UTF-8")
   public String wine_sort(String no, String page)
   {
      if(no==null)
         no="";
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      Map map=new HashMap();
      map.put("start", (curpage*6)-5); // 6개씩 출력
      map.put("end", curpage*6);
      List<WineVO> wList=dao.wineListData(map);
      int totalpage=dao.wineTotalPage();
      int winecount=dao.wineCount();
      if(Integer.parseInt(no)==1)
     {
        wList=dao.WineHitSort(map);
     }
     else if(Integer.parseInt(no)==2)
     {
        wList=dao.WineHighPriceSort(map);
     }
     else if(Integer.parseInt(no)==3)
     {
        wList=dao.WineLowPriceSort(map);
     }
      
      final int BLOCK=5;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      
      if(endPage>totalpage)
         endPage=totalpage;
      
      int i=0;
      JSONArray arr=new JSONArray();
      for(WineVO vo:wList)
      {
         JSONObject obj=new JSONObject();
         obj.put("ino", vo.getIno());
         obj.put("name", vo.getName());
         obj.put("poster", vo.getPoster());
         obj.put("price", vo.getPrice());
         obj.put("nation", vo.getNation());
         obj.put("capacity", vo.getCapacity());
         obj.put("vintage", vo.getVintage());
         if(i==0)
         {
            obj.put("curpage", curpage);
            obj.put("totalpage", totalpage);
            obj.put("startPage", startPage);
            obj.put("endPage", endPage);
            obj.put("winecount", winecount);
         }
         arr.add(obj);
         i++;
      }
 
      return arr.toJSONString();
   }
   
// 민우 위스키 조건 sort
   @GetMapping(value="wine/whiskey_hit_vue.do",produces = "text/plain;charset=UTF-8")
   public String whiskey_sort(String no, String page)
   {
     if(no==null)
         no="";
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      Map map=new HashMap();
      map.put("start", (curpage*6)-5);
      map.put("end", curpage*6);
      List<WineVO> wList=dao.whiskeyListData(map);
      int totalpage=dao.whiskeyTotalPage();
      int totalcount=dao.whiskeyCount();
      
    if(Integer.parseInt(no)==1)
     {
        wList=dao.whiskeyHitSort(map);
     }
     else if(Integer.parseInt(no)==2)
     {
        wList=dao.whiskeyHighPriceSort(map);
     }
     else if(Integer.parseInt(no)==3)
     {
        wList=dao.whiskeyLowPriceSort(map);
     }
      
      final int BLOCK=5;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      
      if(endPage>totalpage)
         endPage=totalpage;

      int i=0;
      JSONArray arr=new JSONArray();
      for(WineVO vo:wList)
      {
         JSONObject obj=new JSONObject();
         obj.put("ino", vo.getIno());
         obj.put("name", vo.getName());
         obj.put("poster", vo.getPoster());
         obj.put("price", vo.getPrice());
         obj.put("nation", vo.getNation());
         obj.put("capacity", vo.getCapacity());
         obj.put("vintage", vo.getVintage());
         if(i==0)
         {
            obj.put("curpage", curpage);
            obj.put("totalpage", totalpage);
            obj.put("startPage", startPage);
            obj.put("endPage", endPage);
            obj.put("totalcount", totalcount);
         }
         arr.add(obj);
         i++;
      }
      return arr.toJSONString();
   }
   
// 민우 꼬냑 조건 sort
   @GetMapping(value="wine/cognac_hit_vue.do",produces = "text/plain;charset=UTF-8")
   public String cognac_sort(String no, String page)
   {
     if(no==null)
         no="";
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      Map map=new HashMap();
      map.put("start", (curpage*6)-5);
      map.put("end", curpage*6);
      List<WineVO> wList=dao.cognacListData(map);
      int totalpage=dao.cognacTotalPage();
      int totalcount=dao.cognacCount();
      
      if(Integer.parseInt(no)==1)
        {
          wList=dao.cognacHitSort(map);
       }
       else if(Integer.parseInt(no)==2)
       {
          wList=dao.cognacHighPriceSort(map);
       }
       else if(Integer.parseInt(no)==3)
       {
          wList=dao.cognacLowPriceSort(map);
       }
      
      final int BLOCK=5;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      
      if(endPage>totalpage)
         endPage=totalpage;

      int i=0;
      JSONArray arr=new JSONArray();
      for(WineVO vo:wList)
      {
         JSONObject obj=new JSONObject();
         obj.put("ino", vo.getIno());
         obj.put("name", vo.getName());
         obj.put("poster", vo.getPoster());
         obj.put("price", vo.getPrice());
         obj.put("nation", vo.getNation());
         obj.put("capacity", vo.getCapacity());
         obj.put("vintage", vo.getVintage());
         if(i==0)
         {
            obj.put("curpage", curpage);
            obj.put("totalpage", totalpage);
            obj.put("startPage", startPage);
            obj.put("endPage", endPage);
            obj.put("totalcount", totalcount);
         }
         arr.add(obj);
         i++;
      }
      return arr.toJSONString();
   }
   
   
}