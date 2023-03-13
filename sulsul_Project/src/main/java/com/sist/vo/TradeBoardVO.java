package com.sist.vo;

import java.util.*;

import lombok.Getter;
import lombok.Setter;
/*
	TBNO      NOT NULL NUMBER         
	NAME      NOT NULL VARCHAR2(50)   
	SUBJECT   NOT NULL VARCHAR2(500)  
	CONTENT   NOT NULL CLOB           
	PRICE              VARCHAR2(500)  
	LOC                VARCHAR2(500)  
	REGDATE            DATE           
	HIT                NUMBER         
	FILENAME           VARCHAR2(4000) 
	FILESIZE           VARCHAR2(4000) 
	FILEIMAGE          VARCHAR2(500)  
	FILECOUNT          NUMBER         
	ID                 VARCHAR2(30)
 */
@Getter
@Setter
public class TradeBoardVO {
	private int tbno, hit, filecount;
	private String name, subject, content, price, loc, filename, filesize, fileimage, dbday, id;
	private Date regdate;
}
