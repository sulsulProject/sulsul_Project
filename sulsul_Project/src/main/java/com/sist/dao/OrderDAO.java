package com.sist.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.CartVO;
@Repository
public class OrderDAO {
@Autowired 
private OrderMapper mapper;
 
//@Select("SELECT bno,name,poster,account,total_price,TO_CHAR(regdate,'YYYY-MM-DD') as dbday "
//		+ "FROM sul_item_2_2 s1,sul_buy_2_2 s2 "
//		+ "WHERE s1.ino=s2.ino AND id=#{id}")
public List<CartVO> orderListData(Map map)
{
	return mapper.orderListData(map);
}

//@Select("SELECT CEIL(COUNT(*)/10.0) FROM sul_item_2_2 s1,sul_buy_2_2 s2 "
		//   +"WHERE s1.ino=s2.ino AND id=#{id}")
public int orderTotalPage(String id)
{
	return mapper.orderTotalPage(id);
}

public List<CartVO> adminorderListData(Map map)
{
	return mapper.adminorderListData(map);
}
public int adminOrderTotalPage()
{
	return mapper.adminOrderTotalPage();
}
public void orderOkUpdate(int bno)
{
	 mapper.orderOkUpdate(bno);
}
}
