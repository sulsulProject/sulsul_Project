package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WineVO {
	private int ino,icno,hit, account;
	private String poster,name,name_sub,price,first_price,discount,nation,alcohol,capacity,vintage,place,winery;
	private LikeVO lvo=new LikeVO();
}
