package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.WineDAO;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.*;
@Controller
public class WineController {
   @Autowired
   private WineDAO dao;
   
   
   @GetMapping("wine/list.do")
   public String wine_list(Model model)
   {
	   int count=dao.wineCount();
	   model.addAttribute("count",count);
      return "wine/list";
   }
      //와인 상세페이지(선우)
      @GetMapping("wine/detail.do")
      public String wine_detail(int ino,Model model)
      {
         List<WineVO> list=dao.wineDetailListData(ino);
         List<WineVO> alist=dao.wineRelatedProductsListData();
         WineVO vo=dao.wineDetailData(ino);
         model.addAttribute("ino",ino);
         model.addAttribute("list",list);
         model.addAttribute("alist",alist);
         model.addAttribute("vo",vo);
         return "wine/detail";

      }
      
      
      @RequestMapping("wine/like_insert.do")
      public String like_insert(HttpServletRequest request,HttpSession session)
      {
    	  String ino=request.getParameter("ino");
    	  String id=(String)session.getAttribute("id");
    	  LikeVO vo=new LikeVO();
    	  vo.setIno(Integer.parseInt(ino));
    	  vo.setId(id);
    	  dao.wineLikeInsert(vo);
    	  return "redirect:../wine/detail.do?ino="+ino;
      }
      
      // 장바구니 추가
      @RequestMapping("wine/cart_insert.do")
      public String wine_cart(HttpServletRequest request,HttpSession session)
      {
         String ino=request.getParameter("ino");

         String account=request.getParameter("account");

         String total=request.getParameter("total");

         String id=(String)session.getAttribute("id");

         CartVO vo=new CartVO();
         vo.setIno(Integer.parseInt(ino));
         vo.setId(id);
         vo.setAccount(Integer.parseInt(account));
         vo.setTotal_price(Integer.parseInt(total));
         dao.wineCartInsert(vo);
         return "redirect:cart_list.do";
      }
      // 장바구니 리스트
      @GetMapping("wine/cart_list.do")
      public String wine_cart_list(HttpServletRequest request,Model model)
      {
         HttpSession session=request.getSession();
         String id=(String)session.getAttribute("id");
         List<CartVO> list=dao.wineCartListData(id);
         int cCount=dao.cartCount(id);
         int tCount=dao.cartTotalPrice(id);
         
         if(cCount==0)
        	 tCount=0;
         
         if(list.size()>0)
         {
            request.setAttribute("count", list.size());
            request.setAttribute("list", list);
         }
         else
            request.setAttribute("count", 0);
         model.addAttribute("tCount",tCount);
         model.addAttribute("list",list);
         model.addAttribute("cCount",cCount);
         
         return "wine/cart_list";
      }
   // 장바구니 삭제
      @RequestMapping("wine/cart_delete.do")
      public String wine_cart_delete(HttpServletRequest request,HttpSession session)
      {
         String bno=request.getParameter("bno");
         dao.wineCartDelete(Integer.parseInt(bno));
         return "redirect:cart_list.do";
      }
      // 와인 최근본상품 페이지
      @GetMapping("wine/recent.do")
      public String wine_recent()
      {
         return "wine/recent";
      }
      // 와인 쿠키
      @GetMapping("wine/before_detail.do")
      public String wine_before_detail(int ino, HttpServletResponse response,RedirectAttributes ra)
      {
         Cookie cookie=new Cookie("sul_wine"+ino, String.valueOf(ino));
         cookie.setPath("/");
         cookie.setMaxAge(60*60*24);
         response.addCookie(cookie);
         ra.addAttribute("ino", ino);
         return "redirect:../wine/detail.do";
      }
      
   // 민우 - 위스키 리스트 -
      @GetMapping("wine/whiskey_list.do")
      public String whiskey_list(Model model)
      {
   	   int count=dao.whiskeyCount();
   	   model.addAttribute("count",count);
         return "wine/whiskey_list";
      }
      // 민우 - 꼬냑 리스트 -
      @GetMapping("wine/cognac_list.do")
      public String cognac_list(Model model)
      {
   	   int count=dao.cognacCount();
   	   model.addAttribute("count",count);
         return "wine/cognac_list";
      }
      @GetMapping("wine/cart.do")
      public String cart_list()
      {
         return "wine/cart";
      }
   // 와인 검색
      @GetMapping("wine/wine_find.do")
      public String wine_find()
      {
         return "wine/wine_find";
      }
// 와인 정렬 (조회수)
      @GetMapping("wine/hit.do")
      public String wine_hitSort(Map map)
      {
         return "redirect:../wine/list.do";
      }
   // 와인 정렬 (높은가격)
      @GetMapping("wine/highprice.do")
      public String wine_highprice(Map map)
      {
         return "wine/highprice";
      }
   // 와인 정렬 (조회수)
      @GetMapping("wine/lowprice.do")
      public String wine_lowprice(Map map)
      {
         return "wine/lowprice";
      }
      // 와인 검색
      @PostMapping("wine/find.do")
      public String wine_find(String ss,Model model)
      {
        Map map=new HashMap();
        map.put("ss", ss);
        List<WineVO> list=dao.wineFindData(ss);
        int count=dao.wineFindCount(ss);
        
        model.addAttribute("count", count);
        model.addAttribute("list", list);
         return "wine/find";
      }

}