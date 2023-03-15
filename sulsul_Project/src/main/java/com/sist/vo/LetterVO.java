package com.sist.vo;

import java.util.*;

import lombok.Getter;
import lombok.Setter;
/*
	LNO       NOT NULL NUMBER        
	SEND_TIME          DATE          
	RECV_TIME          DATE          
	TITLE     NOT NULL VARCHAR2(300) 
	CONTENT   NOT NULL CLOB          
	TYPE               NUMBER        
	READ_CHK           NUMBER        
	SEND_ID            VARCHAR2(30)  
	RECV_ID            VARCHAR2(30) 
 */
@Getter
@Setter
public class LetterVO {
	private int lno;
	private int type;
	private int read_chk;
	private Date send_time;
	private Date recv_time;
	private String title; 
	private String content;
	private String send_id;
	private String recv_id;
	private String dbday;
	
}
