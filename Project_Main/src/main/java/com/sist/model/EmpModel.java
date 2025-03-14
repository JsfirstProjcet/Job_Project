package com.sist.model;

import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class EmpModel {
	@RequestMapping("emp/emp_list.do")
	public String emp_list(HttpServletRequest request, HttpServletResponse response) {

		String page=request.getParameter("page");
		if(page==null) {
 			page="1";
 		}
		int curpage=Integer.parseInt(page);

 		String tab=request.getParameter("tab");
 		if(tab==null) {
 			tab="all";
 		}
 		
 		Map<String , Object> map=new HashMap<>();
		map.put("start", (curpage*12)-11);
		map.put("end",curpage*12);
		map.put("tab", tab);
		List<EmpVO> list=EmpDAO.empListData(map);
		int totalpage=EmpDAO.empTotalPage();
	  
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  
		if(endPage>totalpage)
			endPage=totalpage;
	  
		request.setAttribute("list", list);
		request.setAttribute("tab", tab);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../emp/emp_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("emp/emp_detail_before.do")
	public String emp_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		String eno=request.getParameter("eno");
		Cookie cookie=new Cookie("emp_"+eno, eno);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		// 전송	 
		response.addCookie(cookie);
  
		// 화면 이동 
		return "redirect:emp_detail.do?eno="+eno;
	}
	@RequestMapping("emp/emp_detail.do")
	public String emp_detail(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../emp/emp_detail.jsp");
		String eno=request.getParameter("no");
		EmpVO vo=EmpDAO.empDetailData(Integer.parseInt(eno));
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../emp/emp_detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("emp/emp_find.do")
	public String emp_find(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../emp/emp_find.jsp");
		return "../main/main.jsp";
	}
}
