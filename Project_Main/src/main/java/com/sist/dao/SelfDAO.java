package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class SelfDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  ssf=CreateSqlSessionFactory.getSsf();
  }
  public static SelfVO selfMainHouseData()
	{
		SqlSession session=ssf.openSession();
		SelfVO vo=session.selectOne("selfMainHouseData");
		session.close();
		return vo;
	}
  public static List<SelfVO> selfListData(Map map)
  {
	  SqlSession session=ssf.openSession();
	  List<SelfVO> list=session.selectList("selfListData",map);
	  session.close();
	  return list;
  }
  public static int selfTotalPage()
  {
	  SqlSession session=ssf.openSession();
	  int total=session.selectOne("selfTotalPage");
	  session.close();
	  return total;
  }
  public static SelfVO selfDetailData(int sno)
  {
	  SqlSession session=ssf.openSession(true);
	  session.update("selfHitIncrement",sno);
	  //session.commit();
	  SelfVO vo=session.selectOne("selfDetailData",sno);
	  session.close();
	  return vo;
  }
  public static List<SelfVO> selfFindData(Map map)
  {
	  SqlSession session=ssf.openSession();
	  List<SelfVO> list=session.selectList("selfFindData",map);
	  session.close();
	  return list;
  }
  // SQL
  public static int selfFindTotalPage(Map map)
  {
	  SqlSession session=ssf.openSession();
	  int total=session.selectOne("selfFindTotalPage",map);
	  session.close();
	  return total;
  }
}
