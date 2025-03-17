package com.sist.model;
import java.util.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.CommuneDAO;
import com.sist.vo.CommuneVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class CommuneModel {
	
	@RequestMapping("interview/commune.do")
	public String commune(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curpage*10)-9);
		map.put("end", curpage*10);
		List<CommuneVO> list=CommuneDAO.communeListData(map);
		int totalpage=CommuneDAO.communeTotalPage();
		System.out.println("list.size(): " + list.size());

		if (list.isEmpty()) {
		    System.out.println("리스트가 비어있습니다.");
		} else {
		    System.out.println("리스트에 데이터가 있습니다.");
		}
		request.setAttribute("list", list);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("curpage", curpage);
		
		request.setAttribute("main_jsp", "../interview/commune.jsp");
		return "../main/main.jsp";
	}
}
