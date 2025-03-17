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
	public static int companyTotalPage()
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("companyTotalPage");
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
}
