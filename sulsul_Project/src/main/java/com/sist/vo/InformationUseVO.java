package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
/*	IUNO    NOT NULL NUMBER         
	SUBJECT NOT NULL VARCHAR2(1000) 
	IMAGE            VARCHAR2(600)  
	REGDATE          DATE           
	HIT              NUMBER       
 */
@Getter
@Setter
public class InformationUseVO {
	private int iuno,hit;
	private String subject,image,dbday;
	private Date regdate;
}
