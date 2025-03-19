package model;

import dao.AuthDAO;
import dao.CompanyDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import main.java.controller.Controller;
import main.java.controller.RequestMapping;
import vo.CompanyVO;

@Slf4j
@Controller
public class AuthModel {

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

    Map thead = new LinkedHashMap();
    thead.put("no", "No");
    thead.put("cid", "ID");
    thead.put("email", "Email");
    thead.put("cname", "Company");
    thead.put("name", "Manager");
    thead.put("phone", "Phone");
    thead.put("brnumber", "BRN");
    thead.put("access_key", "Key");
    thead.put("allow", "Allow");
    thead.put("accountDetail", "Detail");
    thead.put("delete", "Delete");

    request.setAttribute("vo", vo);
    request.setAttribute("thead", thead);
    request.setAttribute("detail", detail);

    request.setAttribute("cur", curPage);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);

    request.setAttribute("color", "bg-red-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);

    return "main.jsp";
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
}
