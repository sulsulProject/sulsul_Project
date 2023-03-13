package com.sist.vo;

import java.util.*;
/*
	FBNO    NOT NULL NUMBER        
	NAME    NOT NULL VARCHAR2(50)  
	SUBJECT NOT NULL VARCHAR2(500) 
	CONTENT NOT NULL CLOB          
	PWD              VARCHAR2(10)  
	REGDATE          DATE          
	HIT              NUMBER        
	ID               VARCHAR2(30)
 */

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FreeBoardVO {
	private int fbno;
	private int hit;
	private String name;
	private String subject;
	private String content;
	private String pwd;
	private String id;
	private String dbday;
	private Date regdate;
}
