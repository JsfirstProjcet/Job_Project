package com.sist.admin.dao;

import com.sist.commons.CreateSqlSessionFactory;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.admin.vo.UserVO;

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
    SqlSession session = ssf.openSession(true);
    session.update("leaveUserServiceUpdate", id);
    session.delete("userDelete", id);
    session.close();
  }

  public static List<UserVO> getUserSearch(Map map) {
    SqlSession session = ssf.openSession();
    List<UserVO> list = session.selectList("getUserSearch", map);
    session.close();
    return list;
  }

  public static int getUserSearchCount(String id) {
    SqlSession session = ssf.openSession();
    int result = session.selectOne("getUserSearchCount", id);
    session.close();
    return result;
  }

  public static UserVO getAdminAccount(UserVO vo) {
    SqlSession session = ssf.openSession();
    UserVO result = session.selectOne("getAdminAccount", vo);
    session.close();
    return result;
  }
}
