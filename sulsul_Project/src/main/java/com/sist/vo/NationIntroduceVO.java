package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
/*  NINO       NOT NULL NUMBER        
	NATION     NOT NULL VARCHAR2(30)  
	TITLE      NOT NULL VARCHAR2(30)  
	IMAGE      NOT NULL VARCHAR2(260) 
	TIME                DATE          
	WORK_STATE          VARCHAR2(20) 
 */
@Getter
@Setter
public class NationIntroduceVO {
	private int nino;
	private String nation,title,image,work_state;
	private Date time;
}
