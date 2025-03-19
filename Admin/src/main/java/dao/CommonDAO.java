package dao;

import commons.CreateSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class CommonDAO {

  private static final SqlSessionFactory ssf;

  static {
    ssf = CreateSqlSessionFactory.getSsf();
  }

  public static int getTotalPage(String table) {
    SqlSession session = ssf.openSession();
    int page = session.selectOne("getTotalPage", table);
    session.close();
    return page;
  }
}
