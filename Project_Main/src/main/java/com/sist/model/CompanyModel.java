package com.sist.model;

import java.util.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.sist.vo.*;
import com.sist.dao.*;

@Controller
public class CompanyModel {
	//								  0 지원금/보험	  1 급여 2 선물  3 교육/생활  4 근무환경		5 조직 문화		6 출퇴근		7 리프레시
	List<String> icons= Arrays.asList("inboxes-fill","coin","gift","book","building-check","emoji-laughing","bus-front","airplane",
	//		8 지도	9 연혁			10 기업형태	11 사원수				12 매출
			"map","clock-history","buildings","person-plus-fill","currency-exchange");
	@RequestMapping("company/com_list.do")
	public String com_list(HttpServletRequest request, HttpServletResponse response) {

		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end",curpage*12);
		List<CompanyVO> list=CompanyDAO.companyListData(map);
		int totalpage=CompanyDAO.companyTotalPage();
	  
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  
		if(endPage>totalpage)
			endPage=totalpage;
	  
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../company/com_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("company/com_detail_before.do")
	public String com_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		String cno=request.getParameter("cno");
		Cookie cookie=new Cookie("com_"+cno, cno);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		// 전송	 
		response.addCookie(cookie);
  
		// 화면 이동 
		return "redirect:com_detail.do?cno="+cno;
	}
	@RequestMapping("company/com_detail.do")
	public String com_detail(HttpServletRequest request, HttpServletResponse response) {
		
		String cno=request.getParameter("cno");
		CompanyVO vo=CompanyDAO.comDetailData(Integer.parseInt(cno));
		String str=vo.getIntroduction().replaceAll("\\.", ".<br>");
		vo.setIntroduction(str);
		String[] history= {};
		List<String> hList=new ArrayList<String>();
		List<String> yList=new ArrayList<String>();
		List<Integer> cList=new ArrayList<Integer>();
		try {
			history=vo.getHistory().split(";");
			int count=0;
			for(int i=0; i<history.length; i++) {
				String[] his=history[i].split("\\|");
				for(int j=0; j<his.length; j++) {
					if(j!=0) {
						hList.add(his[j]);
						count++;
					}else {
						yList.add(his[j]);
						cList.add(count);
					}
				}
			}
		} catch (Exception e) {}
		List<WelfareVO> wList=CompanyDAO.comDetailWelfareData(vo.getCid());
		List<WelfareVO> wTag=CompanyDAO.comDetailWelfareTag(vo.getCid());
		
		request.setAttribute("vo", vo);
		request.setAttribute("icons", icons);
		request.setAttribute("hList", hList);
		request.setAttribute("yList", yList);
		request.setAttribute("cList", cList);
		request.setAttribute("wList", wList);
		request.setAttribute("wTag", wTag);
		request.setAttribute("com_jsp", "../company/com_detail.jsp");
		request.setAttribute("main_jsp", "../company/com_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("com/map.do")
	public String com_map(HttpServletRequest request, HttpServletResponse response) {
		
		return "../company/com_map.jsp";
	}
	@RequestMapping("company/com_find.do")
	public String com_find(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../company/com_find.jsp");
		return "../main/main.jsp";
	}
}
