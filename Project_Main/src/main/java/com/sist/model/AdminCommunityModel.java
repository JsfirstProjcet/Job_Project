package com.sist.model;

import com.sist.admin.dao.CommonDAO;
import com.sist.admin.dao.CommunityDAO;
import com.sist.admin.vo.CommunityVO;
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
public class AdminCommunityModel {

  @RequestMapping("admin/community.do")
  public String community_main(HttpServletRequest request,
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
    List<CommunityVO> vo = CommunityDAO.getCommunityBoardList(map);

    final int BLOCK = 5;
    int totalPage = CommonDAO.getTotalPage("COMMUNITY");
    int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    Map head = new LinkedHashMap();
    head.put("no", "No");
    head.put("bno", "ID");
    head.put("nickname", "Nickname");
    head.put("subject", "Title");
    head.put("regdate", "Date");
    head.put("boardDetail", "Detail");
    head.put("delete", "Delete");

    ArrayList detail = new ArrayList();
    for (CommunityVO v : vo) {
      detail.add(v.getBno());
    }

    request.setAttribute("vo", vo);
    request.setAttribute("thead", head);
    request.setAttribute("cur", curPage);
    request.setAttribute("detail", detail);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);
    request.setAttribute("color", "bg-lime-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", path.replace(".do", ""));

    return CommonDAO.login_checker(request, response);
  }

  @RequestMapping("admin/community/boardDetail.do")
  public String detail_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/community/", "");
    String id = request.getParameter("id");
    String page = request.getParameter("page");
    String pre = request.getParameter("pre");

    Map head = new LinkedHashMap();
    head.put("no", "No");
    head.put("bno", "ID");
    head.put("nickname", "Nickname");
    head.put("subject", "Title");
    head.put("regdate", "Date");

    List<CommunityVO> vo = CommunityDAO.getCommunityBoardDetail(id);

    request.setAttribute("vo", vo);
    request.setAttribute("pre", pre);
    request.setAttribute("page", page);
    request.setAttribute("thead", head);
    request.setAttribute("top", "user");

    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    return "../main.jsp";
  }

  @RequestMapping("admin/community/delete.do")
  public String delete_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/community/", "");
    String id = request.getParameter("id");

    CommunityDAO.communityBoardDelete(id);

    request.setAttribute("size", 1);
    request.setAttribute("path", path);
    request.setAttribute("origin", "community");

    return "../main.jsp";
  }

  @RequestMapping("admin/community/search.do")
  public String search_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/community/", "");
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

    List<CommunityVO> vo = CommunityDAO.getCommunityBoardSearch(map);

    final int BLOCK = 5;
    int totalPage = CommunityDAO.getCommunityBoardSearchCount(query);
    int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    Map head = new LinkedHashMap();
    head.put("no", "No");
    head.put("bno", "ID");
    head.put("nickname", "Nickname");
    head.put("subject", "Title");
    head.put("regdate", "Date");
    head.put("boardDetail", "Detail");
    head.put("delete", "Delete");

    ArrayList detail = new ArrayList();
    for (CommunityVO communityVO : vo) {
      detail.add(communityVO.getId());
    }

    request.setAttribute("vo", vo);
    request.setAttribute("thead", head);
    request.setAttribute("detail", detail);
    request.setAttribute("query", query);

    request.setAttribute("cur", curPage);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);

    request.setAttribute("color", "bg-lime-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    request.setAttribute("origin", "community");

    return "../main.jsp";
  }
}
