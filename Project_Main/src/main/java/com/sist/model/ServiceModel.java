package com.sist.model;

import com.sist.admin.dao.ServiceDAO;
import com.sist.admin.dao.UserDAO;
import com.sist.admin.vo.ServiceVO;
import com.sist.admin.vo.UserVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ServiceModel {

  @RequestMapping("service/main.do")
  public String service_main(HttpServletRequest request,
      HttpServletResponse response) {
    String page = request.getParameter("page");
    if (page == null) {
      page = "1";
    }
    int curPage = Integer.parseInt(page);
    Map map = new HashMap();
    map.put("start", (curPage * 10) - 9);
    map.put("end", curPage * 10);
    List<ServiceVO> vo = ServiceDAO.getServiceMainList(map);

    final int BLOCK = 10;
    int totalPage = ServiceDAO.getServiceMainCount();
    int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    request.setAttribute("vo", vo);

    request.setAttribute("cur", curPage);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);
    request.setAttribute("main_jsp", "../service/main.jsp");

    return "../main/main.jsp";
  }

  @RequestMapping("service/detail.do")
  public String detail_main(HttpServletRequest request,
      HttpServletResponse response) {
    String id = request.getParameter("id");
    String page = request.getParameter("page");

    ServiceVO svo = ServiceDAO.getServiceDetail(id);
    UserVO uvo = UserDAO.getUserDetail(svo.getPid());

    request.setAttribute("svo", svo);
    request.setAttribute("uvo", uvo);
    request.setAttribute("page", page);

    request.setAttribute("main_jsp", "../service/detail.jsp?page=" + page + "&id=" + id);

    return "../main/main.jsp";
  }

  @RequestMapping("service/write.do")
  public String write_main(HttpServletRequest request,
      HttpServletResponse response) {
    String id = request.getParameter("id");

    request.setAttribute("id", id);
    request.setAttribute("main_jsp", "../service/write.jsp?id=" + id);

    return "../main/main.jsp";
  }

  @RequestMapping("service/write_submit.do")
  public String write_submit(HttpServletRequest request,
      HttpServletResponse response) {
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String radio = request.getParameter("visible");
    int visible = radio != null ? 0 : 1;

    Map map = new HashMap();
    map.put("pid", id);
    map.put("title", title);
    map.put("content", content);
    map.put("visible", visible);
    map.put("date", new Date());

    ServiceDAO.serviceQuestionInsert(map);

    request.setAttribute("id", id);
    request.setAttribute("main_jsp", "../service/main.jsp");

    return "redirect:/service/main.do";
  }

  @RequestMapping("service/delete.do")
  public String delete_main(HttpServletRequest request,
      HttpServletResponse response) {
    String id = request.getParameter("id");

    ServiceDAO.serviceDelete(id);

    request.setAttribute("main_jsp", "/service/main.jsp");
    return "../main/main.jsp";
  }
}
