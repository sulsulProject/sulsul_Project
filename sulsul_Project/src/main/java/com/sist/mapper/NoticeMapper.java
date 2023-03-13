package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

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
   
   @SelectKey(keyProperty = "no",resultType = int.class,before = true,
         statement = "SELECT NVL(MAX(no)+1,1) as no FROM sul_notice_2_2") //시퀀스
    @Insert("INSERT INTO sul_notice_2_2 VALUES("
         + "#{no},'관리자',#{subject},#{content},SYSDATE,0,#{pwd})")
   public void noticeInsert(NoticeVO vo);
   
   @Update("UPDATE sul_notice_2_2 SET "
         +"hit=hit+1 "
         +"WHERE no=#{no}")
   public void noticeHitIncrement(int no);
   
   @Select("SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit "
         +"FROM sul_notice_2_2 "
         +"WHERE no=#{no}")
   public NoticeVO noticeDetailData(int no);
   
   @Select("SELECT pwd FROM sul_notice_2_2 "
	         +"WHERE no=#{no}")
	   public String noticeGetPassword(int no);
	   
	   @Update("UPDATE sul_notice_2_2 SET "
	         +"name='관리자',subject=#{subject},content=#{content} "
	         +"WHERE no=#{no}")
	   public void noticeUpdate(NoticeVO vo);
	   
	   @Delete("DELETE FROM sul_notice_2_2 "
	         +"WHERE no=#{no}")
	   public void noticeDelete(int no);
   
}
