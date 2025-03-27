package com.sist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.*;
import com.sist.commons.*;
import com.sist.vo.*;

public class MypageDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	//<select id="myFollowListData" resultType="FollowVO" parameterType="hashmap">
	public static List<FollowVO> myFollowListData(Map map) {
		SqlSession session=ssf.openSession();
		List<FollowVO> list=session.selectList("myFollowListData",map);
		session.close();
		return list;
	}
	//<select id="followTotalCount" resultType="hashmap">
	public static int followTotalCount(Map map) {
		SqlSession session=ssf.openSession();
		int count=session.selectOne("followTotalCount",map);
		session.close();
		return count;
	}
	//<delete id="mypageFollowDelete" parameterType="int">
	public static void mypageFollowDelete(int fno) {
		SqlSession session=ssf.openSession(true);
		session.delete("mypageFollowDelete",fno);
		session.close();
	}
	//<select id="mypageRecruitListDat" resultType="SeekerVO" parameterType="hashmap">
	public static List<SeekerVO> mypageRecruitListDat(Map map) {
		SqlSession session=ssf.openSession();
		List<SeekerVO> list=session.selectList("mypageRecruitListDat",map);
		session.close();
		return list;
	}
	//<select id="mypageRecruitTotalCount" resultType="int" parameterType="hashmap">
	public static int mypageRecruitTotalCount(Map map) {
		SqlSession session=ssf.openSession();
		int count=session.selectOne("mypageRecruitTotalCount",map);
		session.close();
		return count;
	}
	//<delete id="mypageRecruitDelete" parameterType="int">
	public static void mypageRecruitDelete(int jno) {
		SqlSession session=ssf.openSession(true);
		session.delete("mypageRecruitDelete",jno);
		session.close();
	}
}
