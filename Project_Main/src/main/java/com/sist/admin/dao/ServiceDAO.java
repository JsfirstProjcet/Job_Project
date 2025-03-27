package com.sist.admin.dao;

import com.sist.commons.CreateSqlSessionFactory;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.admin.vo.ServiceVO;

public class ServiceDAO {

  private static final SqlSessionFactory ssf;

  static {
    ssf = CreateSqlSessionFactory.getSsf();
  }

  public static List<ServiceVO> getServiceList(Map map) {
    SqlSession session = ssf.openSession();
    List<ServiceVO> list = session.selectList("getServiceList", map);
    session.close();
    return list;
  }

  public static List<ServiceVO> getServiceDetail(String id) {
    SqlSession session = ssf.openSession();
    List<ServiceVO> list = session.selectList("getServiceDetail", id);
    session.close();
    return list;
  }

  public static void serviceAnswerInsert(Map map) {
    SqlSession session = ssf.openSession(true);
    session.update("serviceAnswerInsert", map);
    session.close();
  }

  public static void serviceDelete(String id) {
    SqlSession session = ssf.openSession(true);
    session.delete("serviceDelete", id);
    session.close();
  }

  public static List<ServiceVO> getServiceSearch(Map map) {
    SqlSession session = ssf.openSession();
    List<ServiceVO> list = session.selectList("getServiceSearch", map);
    session.close();
    return list;
  }

  public static int getServiceSearchCount(String id) {
    SqlSession session = ssf.openSession();
    int result = session.selectOne("getServiceSearchCount", id);
    session.close();
    return result;
  }
}
