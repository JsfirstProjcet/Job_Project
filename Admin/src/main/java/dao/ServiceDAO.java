package dao;

import commons.CreateSqlSessionFactory;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.ServiceVO;

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

  public static void serviceDelete(String id) {
    SqlSession session = ssf.openSession();
    session.delete("serviceDelete", id);
    session.commit();
    session.close();
  }
}
