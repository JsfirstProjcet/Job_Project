package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class CompanyDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static CompanyVO companyMainHouseData()
	{
		SqlSession session=ssf.openSession();
		CompanyVO vo=session.selectOne("companyMainHouseData");
		session.close();
		return vo;
	}
	public static List<CompanyVO> companyListData(Map<String, Object> map)
	{
		SqlSession session=ssf.openSession();
		List<CompanyVO> list=session.selectList("companyListData",map);
		session.close();
		return list;
	}
	public static List<CompanyVO> companyFindData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<CompanyVO> list=session.selectList("companyFindData",map);
		session.close();
		return list;
	}
	public static int companyTotalPage(String tab)
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("companyTotalPage",tab);
		session.close();
		return total;
	}
	public static int companyFindTotalPage(Map map)
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("companyFindTotalPage",map);
		session.close();
		return total;
	}
	public static CompanyVO comDetailData(int cno)
	{
		SqlSession session=ssf.openSession();
		CompanyVO vo=session.selectOne("comDetailData",cno);
		session.close();
		return vo;
	}
	public static List<WelfareVO> comDetailWelfareData(String cid)
	{
		SqlSession session=ssf.openSession();
		List<WelfareVO> list=session.selectList("comDetailWelfareData",cid);
		session.close();
		return list;
	}
	public static List<WelfareVO> comDetailWelfareTag(String cid)
	{
		SqlSession session=ssf.openSession();
		List<WelfareVO> list=session.selectList("comDetailWelfareTag",cid);
		session.close();
		return list;
	}
	public static int conByCid(String cid) {
		SqlSession session=ssf.openSession();
		int cno=session.selectOne("cnoByCid",cid);
		session.close();
		return cno;
	}
	public static void comInsert(CompanyVO vo) {
		SqlSession session=ssf.openSession(true);
		session.insert("comInsert",vo);
		session.close();
	}
	public static void comUpdate(CompanyVO vo) {
		SqlSession session=ssf.openSession(true);
		try {
			session.insert("comUpdate",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
	}
	public static List<WelfareVO> comUpdateWelfareData(String cid)
	{
		SqlSession session=ssf.openSession();
		List<WelfareVO> list=session.selectList("comUpdateWelfareData",cid);
		session.close();
		return list;
	}
	public static List<WelfareVO> comUpdateWelfareTag()
	{
		SqlSession session=ssf.openSession();
		List<WelfareVO> list=session.selectList("comUpdateWelfareTag");
		session.close();
		return list;
	}
	public static void comWelfareInsert(WelfareVO vo) {
		SqlSession session=ssf.openSession(true);
		session.insert("comWelfareInsert",vo);
		session.close();
	}
	public static void comWelfareDelete(WelfareVO vo) {
		SqlSession session=ssf.openSession(true);
		session.insert("comWelfareDelete",vo);
		session.close();
	}
}
