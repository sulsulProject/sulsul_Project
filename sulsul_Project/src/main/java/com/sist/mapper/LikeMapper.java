package com.sist.mapper;
import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

public interface LikeMapper {
	@Results({
		@Result(property = "lvo.lno",column = "lno")
	})
	@Select("SELECT s1.ino,poster,name,price,id,lno "
	   		+ "FROM sul_item_2_2 s1,sul_like_2_2 s2 "
	   		+ "WHERE s1.ino=s2.ino AND id=#{id} "
	   		+ "ORDER BY lno DESC")
   public List<WineVO> mypageLikeData(Map map);
   
   @Select("SELECT CEIL(COUNT(*)/10.0) FROM sul_item_2_2 s1,sul_like_2_2 s2 "
		   +"WHERE s1.ino=s2.ino AND id=#{id}")
   public int likeTotalPage(String id); 
	   		
   @Delete("DELETE FROM sul_like_2_2 "
	         +"WHERE lno=#{lno}")
	   public void likeListDelete(int lno);
}
