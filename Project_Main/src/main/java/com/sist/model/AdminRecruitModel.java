package com.sist.model;

import com.sist.admin.dao.CommonDAO;
import com.sist.admin.dao.RecruitDAO;
import com.sist.admin.vo.RecruitVO;
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
public class AdminRecruitModel {

  @RequestMapping("admin/recruit.do")
  public String recruit_main(HttpServletRequest request,
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
    List<RecruitVO> vo = RecruitDAO.getRecruitList(map);

    final int BLOCK = 5;
    int totalPage = CommonDAO.getTotalPage("EMPLOYMENT");
    int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    Map head = new LinkedHashMap();
    head.put("no", "No");
    head.put("cid", "CID");
    head.put("name", "Company");
    head.put("eno", "BID");
    head.put("title", "Title");
    head.put("recruitDetail", "Detail");
    head.put("delete", "Delete");

    ArrayList detail = new ArrayList();
    for (RecruitVO recruitVO : vo) {
      detail.add(recruitVO.getEno());
    }

    request.setAttribute("vo", vo);
    request.setAttribute("thead", head);
    request.setAttribute("detail", detail);
    request.setAttribute("cur", curPage);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);
    request.setAttribute("color", "bg-yellow-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", path.replace(".do", ""));

    return CommonDAO.login_checker(request, response);
  }

  @RequestMapping("admin/recruit/recruitDetail.do")
  public String detail_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/recruit/", "");
    String id = request.getParameter("id");
    String page = request.getParameter("page");
    String pre = request.getParameter("pre");

    Map head = new LinkedHashMap();
    head.put("cid", "CID");
    head.put("name", "Company");
    head.put("eno", "BID");
    head.put("title", "Title");
    head.put("education", "Education");
    head.put("hit", "Hit");
    head.put("salary", "Salary");
    head.put("loc", "Location");
    head.put("emp_type", "Type");
    List<RecruitVO> vo = RecruitDAO.getRecruitDetail(id);

    request.setAttribute("vo", vo);
    request.setAttribute("pre", pre);
    request.setAttribute("page", page);
    request.setAttribute("thead", head);
    request.setAttribute("top", "detail");

    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", "recruit");

    return "../main.jsp";
  }

  @RequestMapping("admin/user/delete.do")
  public String delete_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/recruit/", "");
    String id = request.getParameter("id");

    RecruitDAO.recruitDelete(id);

    request.setAttribute("size", 1);
    request.setAttribute("path", path);
    return "../main.jsp";
  }

  @RequestMapping("admin/recruit/search.do")
  public String search_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/recruit/", "");
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

    List<RecruitVO> vo = RecruitDAO.getRecruitSearch(map);

    final int BLOCK = 5;
    int totalPage = RecruitDAO.getRecruitSearchCount(query);
    int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    Map head = new LinkedHashMap();
    head.put("no", "No");
    head.put("cid", "CID");
    head.put("name", "Company");
    head.put("eno", "BID");
    head.put("title", "Title");
    head.put("recruitDetail", "Detail");
    head.put("delete", "Delete");

    ArrayList detail = new ArrayList();
    for (RecruitVO recruitVO : vo) {
      detail.add(recruitVO.getEno());
    }

    request.setAttribute("vo", vo);
    request.setAttribute("thead", head);
    request.setAttribute("detail", detail);
    request.setAttribute("query", query);

    request.setAttribute("cur", curPage);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);

    request.setAttribute("color", "bg-yellow-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", "recruit");

    return "../main.jsp";
  }

}
