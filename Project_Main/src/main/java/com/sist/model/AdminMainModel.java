package com.sist.model;

import com.sist.admin.dao.CommonDAO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdminMainModel {

  @RequestMapping("admin/main.do")
  public String main_main(HttpServletRequest request,
      HttpServletResponse response) {
    String path = request.getServletPath().replace("/admin/", "");
    request.setAttribute("path", path);

    return CommonDAO.login_checker(request, response);
  }

}