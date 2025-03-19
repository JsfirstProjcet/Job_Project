package dao;

import commons.CreateSqlSessionFactory;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import vo.UserVO;

public class UserDAO {

  private static final SqlSessionFactory ssf;

  static {
    ssf = CreateSqlSessionFactory.getSsf();
  }

  public static List<UserVO> getUserList(Map map) {
    SqlSession session = ssf.openSession();
    List<UserVO> list = session.selectList("getUserList", map);
    session.close();
    return list;
  }

  public static List<UserVO> getUserDetail(String id) {
    SqlSession session = ssf.openSession();
    List<UserVO> list = session.selectList("getUserDetail", id);
    session.close();
    return list;
  }

  public static void userDelete(String id) {
    SqlSession session = ssf.openSession();
    session.delete("userDelete", id);
    session.commit();
    session.close();
  }

  public static void userInsert(UserVO vo) {
    SqlSession session = ssf.openSession();
    session.insert("userInsert", vo);
    session.commit();
    session.close();
  }

  public static void userUpdate(UserVO vo) {
    SqlSession session = ssf.openSession();
    session.update("userUpdate", vo);
    session.commit();
    session.close();
  }


}
