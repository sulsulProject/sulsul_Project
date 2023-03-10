package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
ID       NOT NULL VARCHAR2(30)  
PASSWORD NOT NULL VARCHAR2(50)  
NAME     NOT NULL VARCHAR2(50)  
SEX               VARCHAR2(10)  
EMAIL             VARCHAR2(100) 
TEL      NOT NULL VARCHAR2(30)  
BDAY     NOT NULL VARCHAR2(20)  
POSTCODE          VARCHAR2(20)  
ADDR1             VARCHAR2(300) 
ADDR2             VARCHAR2(50)  
ADMIN             CHAR(1)
*/
@Getter
@Setter
public class MemberVO {
	private String id,password,name,sex,email,tel,bday,postcode,addr1,addr2,admin,msg;
}
