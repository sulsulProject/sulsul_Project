package com.sist.dao;

import java.util.Map;
import java.util.*;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.vo.*;
import com.sist.mapper.NoticeMapper;

@Repository
public class NoticeDAO {
 @Autowired
 private NoticeMapper mapper;
 
// @Select("SELECT no,name,subject,content,hit,TO_CHAR(regdate,'YYYY-MM-dd')as as dbday,num "
//			+ "FROM (SELECT no,name,subject,content,hit,dbday,rownum as num "
//			+ "FROM sul_notice))")
	 public List<NoticeVO> noticeListData(Map map)
	 {
		 return mapper.noticeListData(map);
	 }
	 
	 public int noticeTotalPage()
	 {
		 return mapper.noticeTotalPage();
	 }
}
