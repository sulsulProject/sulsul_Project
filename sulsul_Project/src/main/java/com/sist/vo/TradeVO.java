package com.sist.vo;

<<<<<<< HEAD
import java.util.Date;

=======
>>>>>>> upstream/develop
import lombok.Getter;
import lombok.Setter;

/*
<<<<<<< HEAD
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
=======
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
>>>>>>> upstream/develop
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
