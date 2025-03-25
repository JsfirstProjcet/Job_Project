package model;

import dao.CommonDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import main.java.controller.Controller;
import main.java.controller.RequestMapping;

@Controller
public class MainModel {

  @RequestMapping("admin/main.do")
  public String main_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/", "");
    request.setAttribute("path", path);

    return CommonDAO.login_checker(request, response);
  }

}