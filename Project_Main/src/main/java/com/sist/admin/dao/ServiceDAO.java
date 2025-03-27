package com.sist.admin.dao;

import com.sist.admin.vo.ServiceVO;
import com.sist.commons.CreateSqlSessionFactory;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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

  public static ServiceVO getServiceDetail(String id) {
    SqlSession session = ssf.openSession();
    ServiceVO list = session.selectOne("getServiceDetail", id);
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

  public static List<ServiceVO> getServiceMainList(Map map) {
    SqlSession session = ssf.openSession();
    List<ServiceVO> list = session.selectList("getServiceMainList", map);
    session.close();
    return list;
  }

  public static int getServiceMainCount() {
    SqlSession session = ssf.openSession();
    int page = session.selectOne("getMainPageCount");
    session.close();
    return page;
  }

  public static void serviceQuestionInsert(Map map) {
    SqlSession session = ssf.openSession(true);
    session.insert("serviceQuestionInsert", map);
    session.close();
  }

  public static void serviceQuestionDelete(String id) {
    SqlSession session = ssf.openSession(true);
    session.delete("serviceQuestionDelete", id);
    session.close();
  }

  public static void serviceQuestionUpdate(Map map) {
    SqlSession session = ssf.openSession(true);
    session.update("serviceQuestionUpdate", map);
    session.close();
  }
}
