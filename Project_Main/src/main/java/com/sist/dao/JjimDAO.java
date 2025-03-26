package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import java.util.*;
import com.sist.vo.*;
public class JjimDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	
	/*
	 * 
	 * 
	 * <select id="jjimCheckCount" resultType="int" parameterType="JjimVO">
			SELECT COUNT(*) FROM community_like
			WHERE id=#{id} AND bno=#{bno}
		</select>
		
		<insert id="jjimInsert" parameterType="JjimVO">
			INSERT INTO community_like VALUES(
			ji_no_seq.nextval,#{id},#{bno}
			)
		</insert> 
	 */
	
	public static int jjimCheckCount(JjimVO vo) {
		SqlSession session=null;
		int count=0;
		try {
			session=ssf.openSession();
			count=session.selectOne("jjimCheckCount",vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	public static void jjimInsert(JjimVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("jjimInsert",vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	
	/*
	 * <delete id="jjim_Delete" parameterType="int">
		DELETE FROM community_like
		WHERE no=#{no}
	</delete>
	 */
	
	public static void jjim_Delete(int no) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.delete("jjim_Delete",no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
}
