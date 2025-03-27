package com.sist.model;

import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.EmpDAO;
import com.sist.dao.MypageDAO;
import com.sist.vo.EmpVO;
import com.sist.vo.FollowVO;
import com.sist.vo.SeekerVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageModel {
	@RequestMapping("mypage/mypage_info.do")
	public String mypage_info(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("my_jsp", "../mypage/mypage_info.jsp");
		request.setAttribute("main_jsp", "../mypage/my_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/mypage_info_print.do")
	public String mypage_info_print(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		return "../mypage/mypage_info_print.jsp";
	}
	@RequestMapping("mypage/mypage_follow.do")
	public String mypage_follow(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("my_jsp", "../mypage/mypage_follow.jsp");
		request.setAttribute("main_jsp", "../mypage/my_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/mypage_follow_print.do")
	public String mypage_follow_print(HttpServletRequest request, HttpServletResponse response) {
		String type=request.getParameter("type");
		String page=request.getParameter("page");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		final int BLOCK=10;
		
		Map map=new HashMap();
		map.put("id", id);
		map.put("type", type);
		map.put("start", (curpage*10)-9);
		map.put("end", (curpage*10));
		List<FollowVO> list=MypageDAO.myFollowListData(map);
		int count=MypageDAO.followTotalCount(map);
		int totalpage=(int)(Math.ceil(count/10.0));

		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		return "../mypage/mypage_follow_print.jsp";
	}
	@RequestMapping("mypage/mypage_follow_delete.do")
	public void mypage_follow_delete(HttpServletRequest request, HttpServletResponse response) {
		String fno=request.getParameter("fno");
		MypageDAO.mypageFollowDelete(Integer.parseInt(fno));
	}
	@RequestMapping("mypage/mypage_recruit.do")
	public String mypage_recruit(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("my_jsp", "../mypage/mypage_recruit.jsp");
		request.setAttribute("main_jsp", "../mypage/my_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/mypage_recruit_print.do")
	public String mypage_recruit_print(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		final int BLOCK=10;
		
		Map map=new HashMap();
		map.put("id", id);
		map.put("start", (curpage*10)-9);
		map.put("end", (curpage*10));
		List<SeekerVO> list=MypageDAO.mypageRecruitListDat(map);
		int count=MypageDAO.mypageRecruitTotalCount(map);
		int totalpage=(int)(Math.ceil(count/10.0));

		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		return "../mypage/mypage_recruit_print.jsp";
	}
	@RequestMapping("mypage/mypage_recruit_delete.do")
	public void mypage_recruit_delete(HttpServletRequest request, HttpServletResponse response) {
		String jno=request.getParameter("jno");
		MypageDAO.mypageRecruitDelete(Integer.parseInt(jno));
	}
}
