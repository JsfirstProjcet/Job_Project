package dao;

import commons.CreateSqlSessionFactory;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.CommunityVO;

public class CommunityDAO {

  private static final SqlSessionFactory ssf;

  static {
    ssf = CreateSqlSessionFactory.getSsf();
  }

  public static List<CommunityVO> getCommunityBoardList(Map map) {
    SqlSession session = ssf.openSession();
    List<CommunityVO> list = session.selectList("getCommunityBoardList", map);
    session.close();
    return list;
  }

  public static List<CommunityVO> getCommunityBoardDetail(String id) {
    SqlSession session = ssf.openSession();
    List<CommunityVO> list = session.selectList("getCommunityBoardDetail", id);
    session.close();
    return list;
  }

  public static void communityBoardDelete(String id) {
    SqlSession session = ssf.openSession();
    session.delete("communityBoardDelete", id);
    session.commit();
    session.close();
  }
}
