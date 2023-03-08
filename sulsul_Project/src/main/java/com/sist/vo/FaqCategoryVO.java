package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/* FCNO NOT NULL NUMBER       
	CATE NOT NULL VARCHAR2(34)  
 */
@Getter
@Setter
public class FaqCategoryVO {
	private int fcno;
	private String cate;
}
