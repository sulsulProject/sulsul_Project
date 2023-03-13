package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 *  TDNO   NOT NULL NUMBER        
	TITLE           VARCHAR2(500) 
	IMAGE           VARCHAR2(500) 
	LOC             VARCHAR2(100) 
	PRICE           VARCHAR2(100) 
	PNUM            VARCHAR2(100) 
	STATE           VARCHAR2(50)  
	PDATE           VARCHAR2(100) 
	REASON          VARCHAR2(50)  
	METHOD          VARCHAR2(30)  
	TYPE            NUMBER        
	SELLER          VARCHAR2(30)
 */

@Getter
@Setter
public class TradeVO {
	private int tdno;
	private int type;
	private int hit;
	private String title;
	private String image;
	private String loc;
	private String price;
	private String pnum;
	private String state;
	private String pdate;
	private String reason;
	private String method;
	private String seller;
}
