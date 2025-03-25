package dao;

import commons.CreateSqlSessionFactory;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.RecruitVO;

public class RecruitDAO {

  private static final SqlSessionFactory ssf;

  static {
    ssf = CreateSqlSessionFactory.getSsf();
  }

  public static List<RecruitVO> getRecruitList(Map map) {
    SqlSession session = ssf.openSession();
    List<RecruitVO> list = session.selectList("getRecruitList", map);
    session.close();
    return list;
  }

  public static List<RecruitVO> getRecruitDetail(String id) {
    SqlSession session = ssf.openSession();
    List<RecruitVO> list = session.selectList("getRecruitDetail", id);
    session.close();
    return list;
  }

  public static void recruitDelete(String id) {
    SqlSession session = ssf.openSession(true);
    session.delete("recruitDelete", id);
    session.close();
  }

  public static List<RecruitVO> getRecruitSearch(Map map) {
    SqlSession session = ssf.openSession();
    List<RecruitVO> list = session.selectList("getRecruitSearch", map);
    session.close();
    return list;
  }

  public static int getRecruitSearchCount(String id) {
    SqlSession session = ssf.openSession();
    int result = session.selectOne("getRecruitSearchCount", id);
    session.close();
    return result;
  }
}
