package com.sist.model;

import com.sist.admin.dao.AuthDAO;
import com.sist.admin.dao.CommonDAO;
import com.sist.admin.dao.CompanyDAO;
import com.sist.admin.vo.CompanyVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminAuthModel {

  @RequestMapping("admin/auth.do")
  public String auth_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/", "");
    String page = request.getParameter("page");
    if (page == null) {
      page = "1";
    }
    int curPage = Integer.parseInt(page);
    Map map = new HashMap();
    map.put("start", (curPage * 15) - 14);
    map.put("end", curPage * 15);
    List<CompanyVO> vo = AuthDAO.getAuthList(map);

    final int BLOCK = 5;
    int totalPage = (int) Math.ceil(vo.size() / 15.0);
    int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    ArrayList detail = new ArrayList();
    for (CompanyVO companyVO : vo) {
      detail.add(companyVO.getCid());
    }

    Map head = new LinkedHashMap();
    head.put("no", "No");
    head.put("cid", "ID");
    head.put("email", "Email");
    head.put("cname", "Company");
    head.put("name", "Manager");
    head.put("phone", "Phone");
    head.put("brnumber", "BRN");
    head.put("access_key", "Key");
    head.put("allow", "Allow");
    head.put("accountDetail", "Detail");
    head.put("delete", "Delete");

    request.setAttribute("vo", vo);
    request.setAttribute("thead", head);
    request.setAttribute("detail", detail);

    request.setAttribute("cur", curPage);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);

    request.setAttribute("color", "bg-red-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", path.replace(".do", ""));

    return CommonDAO.login_checker(request, response);
  }

  @RequestMapping("admin/auth/accountDetail.do")
  public String detail_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/auth/", "");
    String page = request.getParameter("page");
    String id = request.getParameter("id");
    String pre = request.getParameter("pre");

    Map head = new LinkedHashMap();
    head.put("cid", "ID");
    head.put("name", "Manager");
    head.put("brnumber", "Phone");
    head.put("access_key", "Key");
    head.put("email", "Email");
    head.put("cname", "Company");
    head.put("phone", "Phone");

    List<CompanyVO> vo = AuthDAO.getAuthDetail(id);

    request.setAttribute("vo", vo);
    request.setAttribute("pre", pre);
    request.setAttribute("page", page);
    request.setAttribute("thead", head);

    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    return "../main.jsp";
  }

  @RequestMapping("admin/auth/allow.do")
  public String allow_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/auth/", "");
    String page = request.getParameter("page");
    String id = request.getParameter("id");
    String pre = request.getParameter("pre");

    AuthDAO.authAllowUpdate(id);

    request.setAttribute("pre", pre);
    request.setAttribute("page", page);

    request.setAttribute("id", id);
    request.setAttribute("size", id);
    request.setAttribute("path", path);
    request.setAttribute("origin", "auth");

    return "../main.jsp";
  }

  @RequestMapping("admin/auth/delete.do")
  public String delete_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/auth/", "");
    String id = request.getParameter("id");

    CompanyDAO.companyDelete(id);

    request.setAttribute("size", 1);
    request.setAttribute("path", path);
    return "../main.jsp";
  }

  @RequestMapping("admin/auth/search.do")
  public String search_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/auth/", "");
    String page = request.getParameter("page");
    String query = request.getParameter("query");
    if (page == null) {
      page = "1";
    }
    int curPage = Integer.parseInt(page);
    Map map = new HashMap();
    map.put("start", (curPage * 15) - 14);
    map.put("end", curPage * 15);
    map.put("id", query);

    List<CompanyVO> vo = AuthDAO.getAuthSearch(map);

    final int BLOCK = 5;
    int totalPage = AuthDAO.getAuthSearchCount(query);
    int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    Map head = new LinkedHashMap();
    head.put("no", "No");
    head.put("cid", "ID");
    head.put("email", "Email");
    head.put("cname", "Company");
    head.put("name", "Manager");
    head.put("phone", "Phone");
    head.put("brnumber", "BRN");
    head.put("access_key", "Key");
    head.put("allow", "Allow");
    head.put("accountDetail", "Detail");
    head.put("delete", "Delete");

    ArrayList detail = new ArrayList();
    for (CompanyVO companyVO : vo) {
      detail.add(companyVO.getCid());
    }

    request.setAttribute("vo", vo);
    request.setAttribute("thead", head);
    request.setAttribute("detail", detail);
    request.setAttribute("query", query);

    request.setAttribute("cur", curPage);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);

    request.setAttribute("color", "bg-red-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", "auth");

    return "../main.jsp";
  }
}
