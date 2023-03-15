package com.sist.vo;

import java.util.*;
/*
 *  NO      NOT NULL NUMBER       
	RNO              NUMBER       
	CATE_NO          NUMBER       
	NAME             VARCHAR2(34) 
	MSG              CLOB         
	REGDATE          DATE         
	ID               VARCHAR2(30)
 */

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AllReplyVO {
	private int no;
	private int rno;
	private int cate_no;
	private String name;
	private String msg;
	private String dbday;
	private String id;
	private Date regdate;
}
