package com.sist.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.*;
import com.sist.vo.*;
public interface OrderMapper {
	@Results({
		@Result(property = "wvo.poster",column = "poster"),
		@Result(property = "wvo.name",column = "name"),
		@Result(property = "wvo.ino",column = "ino")
	})
	@Select("  SELECT bno,ino, id,account,total_price, dbday,buy_ok,poster,name, name_sub,price,num "
			+ "			FROM(SELECT bno, ino, id, account, total_price, dbday, buy_ok,poster, name,name_sub, price,rownum as num "
			+ "        FROM(SELECT /*+INDEX_DESC sul_buy_2_2 sb_bno_pk*/MIN(bno) AS bno, sb.ino, MIN(id) AS id, sum(sb.account) AS account, SUM(total_price) AS total_price, MIN(TO_CHAR(regdate,'YYYY-MM-DD')) AS dbday, MAX(buy_ok) AS buy_ok, MAX(poster) AS poster, MAX(name) AS name, MAX(name_sub) AS name_sub, MAX(price) AS price "
			+ "            FROM sul_buy_2_2 sb, sul_item_2_2 si where sb.ino=si.ino AND id=#{id}  GROUP BY sb.ino "
			+ "            ORDER BY bno DESC)) "
			+ "            WHERE num BETWEEN #{start} AND #{end}")
    public List<CartVO> orderListData(Map map);
    
    @Select("SELECT CEIL(COUNT(*)/10.0) FROM sul_item_2_2 s1,sul_buy_2_2 s2 "
 		   +"WHERE s1.ino=s2.ino AND id=#{id}")
    public int orderTotalPage(String id); 
    
    @Results({
		@Result(property = "wvo.poster",column = "poster"),
		@Result(property = "wvo.name",column = "name"),
		@Result(property = "wvo.ino",column = "ino")
	})
    @Select("SELECT bno,ino,id,account,total_price,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num,poster,buy_ok "
    		+ "FROM(SELECT bno,ino,id,account,total_price,regdate,poster,name,buy_ok,rownum as num "
    		+ "FROM(SELECT /*+ INDEX_DESC(sul_buy_2_2 sb_bno_pk)*/bno,sb.ino,sb.id,sb.account,total_price,regdate,name,poster,buy_ok "
    		+ "FROM sul_buy_2_2 sb , sul_item_2_2 si WHERE sb.ino=si.ino AND sb.id !='shim' ORDER BY bno DESC)) "
    		+ "WHERE num BETWEEN #{start} AND #{end}")
    public List<CartVO> adminorderListData(Map map);
    
    @Select("SELECT CEIL(COUNT(*)/10.0) FROM sul_item_2_2 sb,sul_buy_2_2 si "
  		   +"WHERE sb.ino=si.ino")
     public int adminOrderTotalPage(); 
    @Update("UPDATE sul_buy_2_2 SET buy_ok='y' WHERE bno=#{bno}")
	   public void orderOkUpdate(int bno);
}
