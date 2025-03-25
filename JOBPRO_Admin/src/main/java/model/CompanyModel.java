package model;

import dao.CommonDAO;
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
public class CompanyModel {

  @RequestMapping("admin/company.do")
  public String company_main(HttpServletRequest request,
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
    List<CompanyVO> vo = CompanyDAO.getCompanyList(map);

    final int BLOCK = 5;
    int totalPage = CommonDAO.getTotalPage("OFFICIAL");
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
    head.put("accountDetail", "Detail");
    head.put("delete", "Delete");

    ArrayList detail = new ArrayList();
    for (CompanyVO companyVO : vo) {
      detail.add(companyVO.getCid());
    }

    request.setAttribute("vo", vo);
    request.setAttribute("thead", head);
    request.setAttribute("detail", detail);
    request.setAttribute("cur", curPage);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);
    request.setAttribute("color", "bg-orange-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", path.replace(".do", ""));

    return CommonDAO.login_checker(request, response);
  }

  @RequestMapping("admin/company/accountDetail.do")
  public String detail_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/company/", "");
    String id = request.getParameter("id");
    String page = request.getParameter("page");
    String pre = request.getParameter("pre");

    Map head = new LinkedHashMap();
    head.put("cid", "ID");
    head.put("name", "Manager");
    head.put("brnumber", "Phone");
    head.put("access_key", "Key");
    head.put("email", "Email");
    head.put("cname", "Company");
    head.put("phone", "Phone");

    List<CompanyVO> vo = CompanyDAO.getCompanyDetail(id);

    request.setAttribute("vo", vo);
    request.setAttribute("pre", pre);
    request.setAttribute("page", page);
    request.setAttribute("thead", head);
    request.setAttribute("top", "company");

    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", "company");

    return "../main.jsp";
  }

  @RequestMapping("admin/company/delete.do")
  public String delete_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/company/", "");
    String id = request.getParameter("id");

    CompanyDAO.companyDelete(id);

    request.setAttribute("size", 1);
    request.setAttribute("path", path);
    return "../main.jsp";
  }

  @RequestMapping("admin/company/search.do")
  public String search_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/company/", "");
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

    List<CompanyVO> vo = CompanyDAO.getCompanySearch(map);

    final int BLOCK = 5;
    int totalPage = CompanyDAO.getCompanySearchCount(query);
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

    request.setAttribute("color", "bg-orange-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", "company");

    return "../main.jsp";
  }
}
