package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class CompanyModel {
	@RequestMapping("company/com_list.do")
	public String com_list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../company/com_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("company/com_detail.do")
	public String com_detail(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../company/com_detail.jsp");
		return "../main/main.jsp";
	}
}
