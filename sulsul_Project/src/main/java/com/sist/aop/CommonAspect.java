package com.sist.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sist.dao.WineDAO;
// 공통 모듈 => 공통으로 적용되는 기능을 모아서 관리 => 트랙잭션 , 보안 (제작되어 있다) 
/*
 *   트랜잭션 :  @Transactional
 *      conn.setAutoCommit(false)
 *        SQL
 *        SQL
 *        ...
 *      conn.commit()
 *      
 *      => conn.rollback()
 *   보안 : 인증 / 인가 
 *   => 사용자 정의 : 로그파일 => 빅데이터 (데이터 수집 , 데이터 전처리...) => 데이터 예측 
 *                           데이터 전처리 + 데이터 분석 
 *                           --------------------- 딥러닝
 *   어떤 메소드에서 처리 : PointCut
 *   어느 위치에서 대입 : JoinPoint
 *     
 *   --------------------------- Advice (여러개 : Aspect)
 *   
 *   public void display()
 *   {
 *       @Before
 *       try
 *       {
 *           ================@Around
 *             핵심 코딩
 *           ================
 *          
 *       }catch(Exception ex)
 *       {
 *          @After-Throwing
 *       }
 *       finally
 *       {
 *           @After
 *       }
 *       
 *       return @After-Returning
 *   }
 *                           
 *   
 */
import com.sist.vo.*;
import java.util.*;
@Aspect
@Component
public class CommonAspect {
  @Autowired
  private WineDAO dao;
  //@Autowired
  //private NaverNewsManager mgr;
  @Around("execution(* com.sist.web.*Controller.*(..))")
  public Object around(ProceedingJoinPoint jp) throws Throwable{
	  Object obj=null;
	  long start=System.currentTimeMillis();
	  System.out.println("==========================================");
	  System.out.println("클라이언트 요청전:"+jp.getSignature().getName());
	  obj=jp.proceed(); //메소드 호출 
	  System.out.println("클라이언트 요청 처리 종료");
	  long end=System.currentTimeMillis();
	  System.out.println("요청 처리에 걸린 시간:"+(end-start));
	  return obj;
  }
  @After("execution(* com.sist.web.*FController.*(..))")
  public void wineData()
  {
	  HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	  List<WineVO> wList=dao.wineTop5();
	  for(WineVO vo:wList)
	  request.setAttribute("wList", wList);
	  
	  //List<NewsVO> nList=mgr.newsListData("맛집");
	  //request.setAttribute("nList", nList);
	  
  }
}












