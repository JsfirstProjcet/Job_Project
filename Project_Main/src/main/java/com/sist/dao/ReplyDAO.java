package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.CommuneVO;
import com.sist.vo.ReplyVO;

public class ReplyDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	<select id="replyListData" resultType="ReplyVO" parameterType="int">
		SELECT rno,bno,id,nickname,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday
		FROM community_reply
		WHERE rno=#{rno} 
		ORDER BY bno DESC
	</select>
	 */
	
	public static List<ReplyVO> replyListData(int bno){
		SqlSession session=null;
		List<ReplyVO> list=null;
		try {
			session=ssf.openSession();
			list=session.selectList("replyListData",bno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
}
