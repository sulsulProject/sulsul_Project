package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*  FNO     NOT NULL NUMBER         
	TYPE    NOT NULL VARCHAR2(20)   
	SUBJECT NOT NULL VARCHAR2(1000) 
	CONTENT NOT NULL CLOB           
	HIT              NUMBER         
	FCNO             NUMBER      
*/
@Getter
@Setter
public class FaqVO {
	private int fno,hit,fcno;
	private String type,subject,content;
}
