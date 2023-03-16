package com.sist.dao;

import org.springframework.stereotype.Repository;

import com.sist.vo.AllReplyVO;

import oracle.jdbc.OracleType;
import oracle.jdbc.OracleTypes;

import java.util.*;
import java.sql.*;


@Repository
public class ReplyDAO {
	private Connection conn;
	private CallableStatement cs;
	private final String URL ="jdbc:oracle:thin:@211.63.89.131:1521:XE";
	
	public ReplyDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL,"hr","happy");
		} catch (Exception e) {}
	}
	
	public void disConnection() {
		try {
			if(cs != null)
				cs.close();
			if(conn != null)
				conn.close();
		} catch (Exception e) {}
	}
	
	// CRUD (SELECT, INSERT, UPDATE, DELETE
	
	
/*
 *  create or replace NONEDITIONABLE PROCEDURE sul_replyList(
	   pRno sul_all_reply_2_2.rno%TYPE,
	   pCate_no sul_all_reply_2_2.cate_no%TYPE,
	   pResult OUT SYS_REFCURSOR
	)
	IS
	BEGIN
	  OPEN pResult FOR
	    SELECT no,rno,cate_no,id,name,msg,regdate,TO_CHAR(regdate,'YYYY-MM-DD') as dbday
	    FROM sul_all_reply_2_2
	    WHERE rno=pRno AND cate_no=pCate_no
	    ORDER BY no DESC;
	END;
*/
	public List<AllReplyVO> sul_replyList(int rno, int cate_no) {
		List<AllReplyVO> list = new ArrayList<AllReplyVO>();
		try {
			getConnection();
			String sql = "{CALL sul_replyList(?,?,?)}";
			cs = conn.prepareCall(sql);
			cs.setInt(1, rno); // 카테고리 (맛집, 레시피).. 
			cs.setInt(2, cate_no); // 맛집, 번호(고유번호), 타입
			cs.registerOutParameter(3, OracleTypes.CURSOR);
			cs.executeQuery();
			ResultSet rs = (ResultSet)cs.getObject(3);
			// CURSOR = ResultSet
			while(rs.next()) {
				AllReplyVO rvo = new AllReplyVO();
				rvo.setNo(rs.getInt(1));
				rvo.setRno(rs.getInt(2));
				rvo.setCate_no(rs.getInt(3));
				rvo.setId(rs.getString(4));
				rvo.setName(rs.getString(5));
				rvo.setMsg(rs.getString(6));
				rvo.setRegdate(rs.getDate(7));
				rvo.setDbday(rs.getString(8));
				list.add(rvo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	
/*
	create or replace NONEDITIONABLE PROCEDURE sul_replyInsert(
	   pRno sul_all_reply_2_2.rno%TYPE,
	   pCate_no sul_all_reply_2_2.cate_no%TYPE,
	   pId sul_all_reply_2_2.id%TYPE,
	   pName sul_all_reply_2_2.name%TYPE,
	   pMsg sul_all_reply_2_2.msg%TYPE
	)
	IS
	BEGIN 
	  INSERT INTO sul_all_reply_2_2 VALUES(sar_no_seq.nextval,pRno,pCate_no,pName,pMsg,SYSDATE, pId);
	  COMMIT;
	END;
 */
	public void sul_replyInsert(AllReplyVO vo) {
		try {
			getConnection();
			String sql = "{CALL sul_replyInsert(?,?,?,?,?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getRno());
			cs.setInt(2, vo.getCate_no());
			cs.setString(3, vo.getId());
			cs.setString(4, vo.getName());
			cs.setString(5, vo.getMsg());
			cs.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
		
/*
	create or replace NONEDITIONABLE PROCEDURE sul_replyUpdate(
	   pNo sul_all_reply_2_2.no%TYPE,
	   pMsg sul_all_reply_2_2.msg%TYPE
	)
	IS
	BEGIN
	  UPDATE sul_all_reply_2_2 SET 
	  msg=pMsg
	  WHERE no=pNo;
	  COMMIT;
	END;
 */
	public void sul_replyUpdate(int no, String msg) {
		try {
			getConnection();
			String sql = "{CALL sul_replyUpdate(?,?)}";
			cs = conn.prepareCall(sql);
			cs.setInt(1, no);
			cs.setString(2, msg);
			cs.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
/*
	create or replace NONEDITIONABLE PROCEDURE sul_replyDelete(
	   pNo sul_all_reply_2_2.no%TYPE
	)
	IS
	BEGIN
	  DELETE FROM sul_all_reply_2_2 
	  WHERE no=pNo;
	  COMMIT;
	END;
 */
	public void sul_replyDelete(int no) {
		try {
			getConnection();
			String sql = "{CALL sul_replyDelete(?)}";
			cs = conn.prepareCall(sql);
			cs.setInt(1, no);
			cs.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
}
