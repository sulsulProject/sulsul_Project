package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
public class NoticeVO {
private int no,hit;
private String name,subject,content,dbday;
private Date regdate;
}
