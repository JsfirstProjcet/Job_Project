package com.sist.admin.dao;

import com.sist.commons.CreateSqlSessionFactory;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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

  public static String login_checker(HttpServletRequest request,
      HttpServletResponse response) {
    HttpSession session = request.getSession(false);
    if (session == null) {
      return "page/login.jsp";
    }
    Object vo = session.getAttribute("isadmin");
    if (vo == null) {
      return "page/login.jsp";
    }
    return "main.jsp";
  }

}
