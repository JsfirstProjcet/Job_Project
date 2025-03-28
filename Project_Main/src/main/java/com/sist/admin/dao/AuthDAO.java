package com.sist.admin.dao;

import com.sist.admin.vo.CompanyVO;
import com.sist.commons.CreateSqlSessionFactory;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class AuthDAO {

  private static final SqlSessionFactory ssf;

  static {
    ssf = CreateSqlSessionFactory.getSsf();
  }

  public static List<CompanyVO> getAuthList(Map map) {
    SqlSession session = ssf.openSession();
    List<CompanyVO> list = session.selectList("getAuthList", map);
    session.close();
    return list;
  }

  public static CompanyVO getAuthDetail(String id) {
    SqlSession session = ssf.openSession();
    CompanyVO result = session.selectOne("getAuthDetail", id);
    session.close();
    return result;
  }

  public static void authAllowUpdate(String id) {
    SqlSession session = ssf.openSession(true);
    session.update("authAllowUpdate", id);
    session.close();
  }

  public static void authDelete(String id) {
    SqlSession session = ssf.openSession(true);
    session.delete("authDelete", id);
    session.close();
  }

  public static List<CompanyVO> getAuthSearch(Map map) {
    SqlSession session = ssf.openSession();
    List<CompanyVO> list = session.selectList("getAuthSearch", map);
    session.close();
    return list;
  }

  public static int getAuthSearchCount(String id) {
    SqlSession session = ssf.openSession();
    int result = session.selectOne("getAuthSearchCount", id);
    session.close();
    return result;
  }
}
