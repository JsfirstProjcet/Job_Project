package dao;

import commons.CreateSqlSessionFactory;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.CompanyVO;

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

  public static List<CompanyVO> getAuthDetail(String id) {
    SqlSession session = ssf.openSession();
    List<CompanyVO> list = session.selectList("getAuthDetail", id);
    session.close();
    return list;
  }

  public static void authAllowUpdate(String id) {
    SqlSession session = ssf.openSession(true);
    session.update("authAllowUpdate", id);
    session.close();
  }
}
