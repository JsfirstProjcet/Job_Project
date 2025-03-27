package com.sist.model;

import com.sist.admin.dao.CommonDAO;
import com.sist.admin.dao.ServiceDAO;
import com.sist.admin.vo.ServiceVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminServiceModel {

  @RequestMapping("admin/service.do")
  public String service_main(HttpServletRequest request,
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
    List<ServiceVO> vo = ServiceDAO.getServiceList(map);

    final int BLOCK = 5;
    int totalPage = CommonDAO.getTotalPage("SERVICE");
    int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    Map head = new LinkedHashMap();
    head.put("no", "No");
    head.put("id", "ID");
    head.put("pid", "PID");
    head.put("qtitle", "Title");
    head.put("visible", "Secret");
    head.put("ok", "AOK");
    head.put("qdate", "Date");
    head.put("serviceDetail", "Detail");
    head.put("delete", "Delete");

    ArrayList detail = new ArrayList();
    for (ServiceVO serviceVO : vo) {
      detail.add(serviceVO.getId());
    }

    request.setAttribute("vo", vo);
    request.setAttribute("thead", head);
    request.setAttribute("detail", detail);

    request.setAttribute("cur", curPage);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);

    request.setAttribute("color", "bg-violet-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", path.replace(".do", ""));

    return CommonDAO.login_checker(request, response);
  }

  @RequestMapping("admin/service/serviceDetail.do")
  public String detail_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/service/", "");
    String id = request.getParameter("id");
    String page = request.getParameter("page");
    String pre = request.getParameter("pre");

    Map head = new LinkedHashMap();
    head.put("no", "No");
    head.put("id", "ID");
    head.put("pid", "PID");
    head.put("visible", "S");
    head.put("qtitle", "Title");
    head.put("qcontent", "Content");
    head.put("qdate", "Date");

    List<ServiceVO> vo = ServiceDAO.getServiceDetail(id);

    request.setAttribute("vo", vo);
    request.setAttribute("pre", pre);
    request.setAttribute("page", page);
    request.setAttribute("thead", head);
    request.setAttribute("id", id);
    request.setAttribute("submit", "answer.do");

    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", "service");

    return "../main.jsp";
  }

  @RequestMapping("admin/service/answer.do")
  public String answer_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/service/", "");
    String id = request.getParameter("id");
    String page = request.getParameter("page");
    String pre = request.getParameter("pre");

    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Map map = new HashMap();
    map.put("id", id);
    map.put("title", title);
    map.put("content", content);
    map.put("date", new Date());

    ServiceDAO.serviceAnswerInsert(map);

    request.setAttribute("size", 1);
    request.setAttribute("path", path);
    request.setAttribute("pre", pre);
    request.setAttribute("page", page);
    request.setAttribute("id", id);

    return "redirect:serviceDetail.do?pre=" + pre + "&page=" + page + "&id= + " + id;
  }

  @RequestMapping("admin/service/delete.do")
  public String delete_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/service/", "");
    String id = request.getParameter("id");

    ServiceDAO.serviceDelete(id);

    request.setAttribute("size", 1);
    request.setAttribute("path", path);
    return "../main.jsp";
  }

  @RequestMapping("admin/service/search.do")
  public String search_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/service/", "");
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

    List<ServiceVO> vo = ServiceDAO.getServiceSearch(map);

    final int BLOCK = 5;
    int totalPage = ServiceDAO.getServiceSearchCount(query);
    int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    Map head = new LinkedHashMap();
    head.put("no", "No");
    head.put("id", "ID");
    head.put("pid", "PID");
    head.put("qtitle", "Title");
    head.put("visible", "Secret");
    head.put("ok", "AOK");
    head.put("qdate", "Date");
    head.put("serviceDetail", "Detail");
    head.put("delete", "Delete");

    ArrayList detail = new ArrayList();
    for (ServiceVO serviceVO : vo) {
      detail.add(serviceVO.getId());
    }

    request.setAttribute("vo", vo);
    request.setAttribute("thead", head);
    request.setAttribute("detail", detail);
    request.setAttribute("query", query);

    request.setAttribute("cur", curPage);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);

    request.setAttribute("color", "bg-violet-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", "service");

    return "../main.jsp";
  }
}
