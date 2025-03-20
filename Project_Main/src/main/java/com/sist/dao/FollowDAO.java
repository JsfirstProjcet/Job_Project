package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class FollowDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	<insert id="followInsert" parameterType="FollowVO">
		INSERT into FOLLOW VALUES(
			(SELECT NVL(MAX(fno)+1,1) FROM follow),
			#{id},
			#{no},
			#{type}
		)
	</insert>
	*/
	public static void followInsert(FollowVO vo) {
		SqlSession session=ssf.openSession(true);
		session.insert("followInsert",vo);
		session.close();
	}
	/*
	<delete id="followDelete" parameterType="int">
		DELETE FROM follow
		WHERE fno=#{fno}
	</delete>
	 */
	public static void followDelete(int fno) {
		SqlSession session=ssf.openSession(true);
		session.delete("followDelete",fno);
		session.close();
	}
	/*
	<select id="followCheck" resultType="int" parameterType="FollowVO">
		SELECT COUNT(*)
		FROM FOLLOW
		WHERE id=#{id} AND no=#{no} AND type=#{type}
	</select>
	 */
	public static int followCheck(FollowVO vo) {
		SqlSession session=ssf.openSession();
		int res=session.selectOne("followCheck",vo);
		session.close();
		return res;
	}
	/*
	<select id="followCount" resultMap="int" parameterType="hashmap">
		SELECT COUNT(*)
		FROM FOLLOW
		WHERE no=#{no} AND type=#{type}
	</select>
	 */
	public static int followCount(FollowVO vo) {
		SqlSession session=ssf.openSession();
		int count=session.selectOne("followCount",vo);
		session.close();
		return count;
	}
	/*
	<select id="followFno" resultType="int" parameterType="FollowVO">
		SELECT fno
		FROM FOLLOW
		WHERE id=#{id} AND no=#{no} AND type=#{type}
	</select>
	 */
	public static int followFno(FollowVO vo) {
		SqlSession session=ssf.openSession();
		int fno=session.selectOne("followFno",vo);
		session.close();
		return fno;
	}
}
