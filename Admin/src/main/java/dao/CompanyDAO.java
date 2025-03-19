package dao;

import commons.CreateSqlSessionFactory;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.CompanyVO;

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
    SqlSession session = ssf.openSession();
    session.delete("companyDelete", id);
    session.commit();
    session.close();
  }
}
