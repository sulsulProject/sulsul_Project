package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.NoticeVO;

public interface NoticeMapper {
 @Select("SELECT no,name,subject,content,hit,TO_CHAR(regdate,'YYYY-MM-dd') as dbday,num "
		+ "FROM (SELECT no,name,subject,content,hit,regdate,rownum as num "
		+ "FROM (SELECT /*+ INDEX_DESC(sul_notice_2_2 suln_no_pk)*/no,name,subject,content,hit,regdate "
		+ "FROM sul_notice_2_2)) "
		+ "WHERE num BETWEEN #{start} AND #{end}")
 public List<NoticeVO> noticeListData(Map map);
 
 @Select("SELECT CEIL(COUNT(*)/10.0) FROM sul_notice_2_2")
 public int noticeTotalPage();  
}
