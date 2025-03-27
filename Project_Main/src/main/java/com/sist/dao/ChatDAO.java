package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.CommuneVO;

public class ChatDAO {
	private static SqlSessionFactory ssf;
	static {
		
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	 * 
	 * 	<select id="chatGetPoster" parameterType="string" resultType="string">
		SELECT poster
		FROM PERSONAL
		WHERE id=#{id}
	</select>
	 */
	public static String chatGetPoster(String string)
	{
	SqlSession session=null;
	String id="";
	try {
		session=ssf.openSession();
		id=session.selectOne("chatGetPoster",string);
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally {
		if(session!=null)
			session.close();
	}
	return id;
	}
}
