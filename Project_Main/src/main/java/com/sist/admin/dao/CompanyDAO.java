package com.sist.admin.dao;

import com.sist.commons.CreateSqlSessionFactory;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.admin.vo.CompanyVO;

public class CompanyDAO {

  private static final SqlSessionFactory ssf;

  static {
    ssf = CreateSqlSessionFactory.getSsf();
  }

  public static List<CompanyVO> getCompanyList(Map map) {
    SqlSession session = ssf.openSession();
    List<CompanyVO> list = session.selectList("getCompanyList", map);
    session.close();
    return list;
  }

  public static List<CompanyVO> getCompanyDetail(String id) {
    SqlSession session = ssf.openSession();
    List<CompanyVO> list = session.selectList("getCompanyDetail", id);
    session.close();
    return list;
  }

  public static void companyDelete(String id) {
    SqlSession session = ssf.openSession(true);
    session.delete("companyDelete", id);
    session.close();
  }

  public static List<CompanyVO> getCompanySearch(Map map) {
    SqlSession session = ssf.openSession();
    List<CompanyVO> list = session.selectList("getCompanySearch", map);
    session.close();
    return list;
  }

  public static int getCompanySearchCount(String id) {
    SqlSession session = ssf.openSession();
    int result = session.selectOne("getCompanySearchCount", id);
    session.close();
    return result;
  }
}
