package com.sist.model;


import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MainModel {
	List<String> icons=Arrays.asList("","","fa-globe","fa-file-invoice-dollar",
			"fa-user-tie","fa-user-plus","fa-medkit",
			"fa-truck","fa-hands-helping","fa-flask",
			"fa-comments","fa-industry","fa-lightbulb",
			"fa-trophy","fa-mail-bulk","fa-edit",
			"fa-chart-pie","fa-university","fa-shopping-cart",
			"fa-book-reader","fa-wheelchair","fa-headset",
			"fa-wrench");
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {

 		EmpVO vo=EmpDAO.empMainHouseData();
 		List<EmpVO> eList=EmpDAO.empMainHouseData8();
 		List<JobVO> tList=EmpDAO.empTab();
 		
 		request.setAttribute("evo", vo);
 		request.setAttribute("eList", eList);
 		request.setAttribute("tList", tList);
 		request.setAttribute("icons", icons);
 		
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
