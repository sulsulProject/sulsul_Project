package com.sist.vo;
import java.util.*;
import lombok.Getter;
import lombok.Setter;
/*
 *  ANO        NOT NULL NUMBER         
	SUBJECT    NOT NULL VARCHAR2(1000) 
	CONTENT    NOT NULL CLOB           
	PWD        NOT NULL VARCHAR2(20)   
	REGDATE             DATE           
	ASK_STATE           VARCHAR2(20)   
	HIT                 NUMBER         
	GROUP_ID            NUMBER         
	GROUP_STEP          NUMBER         
	GROUP_TAB           NUMBER         
	MSG                 CLOB           
	ID                  VARCHAR2(20)   
 */

@Getter
@Setter
public class AskVO {
	private int ano,hit,group_id,group_step,group_tab;
	private String subject,content,pwd,ask_state,id,dbday;
	private Date regdate;
}
