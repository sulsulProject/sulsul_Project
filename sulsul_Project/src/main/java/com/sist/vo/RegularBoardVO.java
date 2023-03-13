package com.sist.vo;
//------------------------------------------------------------------------------------
//CREATE TABLE sul_regular_board_2_2
//(
//	rb_no         NUMBER  ,
//	content    VARCHAR2(4000),
//	regdate    DATE,
//	hit        NUMBER  ,
//	filename   VARCHAR2(4000),
//	filesize   VARCHAR2(4000),
//	filecount  NUMBER ,
//	group_id   NUMBER  ,
//	group_step NUMBER ,
//	group_tab  NUMBER ,
//	msg        VARCHAR2(4000),
//	id   VARCHAR2(30),
//    rno number,
//    constraint rboard_no_pk PRIMARY KEY (rb_no),
//    constraint mem_id_fk foreign key(id)
//    references sul_member_2_2(id)
//);
//
//drop table sul_regular_board_2_2;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class RegularBoardVO {
	private int rb_no, hit, filecount, group_id, group_step, group_tab, rno, page;
	private String content, filename, filesize, msg, id, dbday;
	private Date regdate;
	private List<MultipartFile> files; // 업로드 파일 받는 거

}
