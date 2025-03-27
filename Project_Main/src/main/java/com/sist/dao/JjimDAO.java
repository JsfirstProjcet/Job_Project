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
	
	/*
	 * <select id="jjimReplyCheckCount" resultType="int" parameterType="JjimVO">
		  SELECT COUNT(*) FROM community_like
		  WHERE id=#{id} AND rno=#{rno} AND type=3
		</select>
	 */
	
	public static int jjimReplyCheckCount(JjimVO vo) {
		SqlSession session=null;
		int count=0;
		try {
			session=ssf.openSession();
			count=session.selectOne("jjimReplyCheckCount",vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
//	<!-- 좋아요 commune테이블 likes+1 -->
//	<update id="communeLikeCountIncrement" parameterType="int">
//	
	public static void jjimInsert(JjimVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("jjimInsert",vo);
			session.update("communeLikeCountIncrement",vo.getBno());
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

//	<!-- 좋아요 취소 commune테이블 likes-1 -->
//	<update id="communeLikeCountDecrement" parameterType="int">
//	
	public static void jjim_Delete(int no,int bno) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.delete("jjim_Delete",no);
			session.update("communeLikeCountDecrement",bno);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
	}
	/*
	 * 
	<select id="jjimGetId" parameterType="JjimVO" resultType="int">
		SELECT no 
		FROM community_like
		WHERE id=#{id} AND bno=#{bno}
	</select>
	 */
	public static int jjimGetId(JjimVO vo) {
		SqlSession session=null;
		int count=0;
		try {
			session=ssf.openSession();
			count=session.selectOne("jjimGetId",vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	/*
	 * <select id="jjimReplyGetId" parameterType="JjimVO" resultType="int">
		SELECT no 
		FROM community_like
		WHERE id=#{id} AND rno=#{rno} AND type=#{type}
	</select>
	 */
	
	public static int jjimReplyGetId(JjimVO vo) {
		SqlSession session=null;
		int count=0;
		try {
			session=ssf.openSession();
			count=session.selectOne("jjimReplyGetId",vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	/*
	 * 	<select id="jjimReplyCurrent" parameterType="JjimVO" resultType="int">
		SELECT rno
		FROM community_like
		WHERE id=#{id} AND no=#{no} AND bno=#{bno} AND type=#{type}
		</select>
	 */
	
	public static int jjimReplyCurrent(JjimVO vo) {
		SqlSession session=null;
		int count=0;
		try {
			session=ssf.openSession();
			count=session.selectOne("jjimReplyCurrent",vo);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
}
