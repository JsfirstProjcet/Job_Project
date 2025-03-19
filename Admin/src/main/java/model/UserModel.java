package model;

import dao.CommonDAO;
import dao.UserDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import main.java.controller.Controller;
import main.java.controller.RequestMapping;
import vo.UserVO;

@Controller
public class UserModel {

  @RequestMapping("admin/user.do")
  public String user_main(HttpServletRequest request,
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

    List<UserVO> vo = UserDAO.getUserList(map);

    final int BLOCK = 5;
    int totalPage = CommonDAO.getTotalPage("PERSONAL");
    int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
    int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    Map head = new LinkedHashMap();
    head.put("no", "No");
    head.put("id", "ID");
    head.put("nickname", "Nickname");
    head.put("email", "Email");
    head.put("name", "Name");
    head.put("phone", "Phone");
    head.put("accountDetail", "Detail");
    head.put("delete", "Delete");

    ArrayList detail = new ArrayList();
    for (UserVO userVO : vo) {
      detail.add(userVO.getId());
    }

    request.setAttribute("vo", vo);
    request.setAttribute("thead", head);
    request.setAttribute("detail", detail);

    request.setAttribute("cur", curPage);
    request.setAttribute("total", totalPage);
    request.setAttribute("start", startPage);
    request.setAttribute("end", endPage);

    request.setAttribute("color", "bg-green-200");
    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);

    return "main.jsp";
  }

  @RequestMapping("admin/user/accountDetail.do")
  public String detail_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/user/", "");
    String id = request.getParameter("id");
    String page = request.getParameter("page");
    String pre = request.getParameter("pre");

    Map head = new LinkedHashMap();
    head.put("id", "ID");
    head.put("email", "Email");
    head.put("name", "Name");
    head.put("phone", "Phone");
    head.put("nickname", "Nickname");
    head.put("sex", "Gender");
    head.put("addr1", "Address1");
    head.put("addr2", "Address2");

    List<UserVO> vo = UserDAO.getUserDetail(id);

    request.setAttribute("vo", vo);
    request.setAttribute("pre", pre);
    request.setAttribute("page", page);
    request.setAttribute("thead", head);
    request.setAttribute("top", "user");

    request.setAttribute("size", vo.size());
    request.setAttribute("path", path);
    return "../main.jsp";
  }

  @RequestMapping("admin/user/delete.do")
  public String delete_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/user/", "");
    String id = request.getParameter("id");

    UserDAO.userDelete(id);

    request.setAttribute("size", 1);
    request.setAttribute("path", path);
    return "../main.jsp";
  }
}


