package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class EmpDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	//////////////////////////////////////// 사용자
	public static EmpVO empMainHouseData()
	{
		SqlSession session=ssf.openSession();
		EmpVO vo=session.selectOne("empMainHouseData");
		session.close();
		return vo;
	}
	public static List<EmpVO> empMainHouseData8()
 	{
 		SqlSession session=ssf.openSession();
 		List<EmpVO> list=session.selectList("empMainHouseData8");
 		session.close();
 		return list;
 	}	
 	public static List<EmpVO> empListData(Map<String, Object> map)
	{
		SqlSession session=ssf.openSession();
		List<EmpVO> list=session.selectList("empListData",map);
		session.close();
		return list;
	}
	public static int empTotalPage(String tab)
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("empTotalPage",tab);
		session.close();
		return total;
	}
	public static EmpVO empDetailData(int eno)
	{
		SqlSession session=ssf.openSession();
		session.update("empHitIncrement",eno);
		session.commit();
		EmpVO vo=session.selectOne("empDetailData",eno);
		session.close();
		return vo;
	}
	public static List<JobVO> empDetailJobData(int eno) {
		SqlSession session=ssf.openSession();
		List<JobVO> list=session.selectList("empDetailJobData",eno);
		session.close();
		return list;
	}
	public static List<EmpVO> empFindData(Map map) {
		SqlSession session=ssf.openSession();
		List<EmpVO> list=session.selectList("empFindData",map);
		session.close();
		return list;
	}
	public static int empFindTotalPage(Map map) {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("empFindTotalPage",map);
		session.close();
		return total;
	}
	public static int empgetCategoryCount(Map map) {
		SqlSession session=ssf.openSession();
		int count=session.selectOne("empgetCategoryCount",map);
		session.close();
		return count;
	}
	//////////////////////////////////////// 기업
	public static List<EmpVO> empComListData(Map map) {
		SqlSession session = null;
		List<EmpVO> list = new ArrayList<EmpVO>();
		try {
			session = ssf.openSession();
			list = session.selectList("empComListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public static int empComCount(Map map) {
		SqlSession session = ssf.openSession();
		int count = session.selectOne("empComCount", map);
		session.close();
		return count;
	}
	public static List<EmpVO> empOfficialListData(Map map) {
		SqlSession session = ssf.openSession();
		List<EmpVO> list=session.selectList("empOfficialListData", map);
		session.close();
		return list;
	}
	public static int empOfficialCount(String cid) {
		SqlSession session = ssf.openSession();
		int count = session.selectOne("empOfficialCount", cid);
		session.close();
		return count;
	}
	public static void empClose(int eno) {
		SqlSession session = ssf.openSession(true);
		session.update("empClose", eno);
		session.close();
	}
	public static void empCloseSeeker(int eno) {
		SqlSession session = ssf.openSession(true);
		session.update("empCloseSeeker", eno);
		session.close();
	}
	public static List<SeekerVO> empSeekerListData(Map map){
		SqlSession session = ssf.openSession();
		List<SeekerVO> list=session.selectList("empSeekerListData", map);
		session.close();
		return list;
	}
	public static int empSeekerCount(int eno){
		SqlSession session = ssf.openSession();
		int count=session.selectOne("empSeekerCount", eno);
		session.close();
		return count;
	}
}
