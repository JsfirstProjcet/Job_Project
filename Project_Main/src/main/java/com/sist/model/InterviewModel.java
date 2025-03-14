package com.sist.model;

import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class InterviewModel {

	@RequestMapping("interview/interview_list.do")
	public String interview_list(HttpServletRequest request, HttpServletResponse response) {

		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		map.put("start", (curpage * 12) - 11);
		map.put("end", (curpage * 12));
		List<InterviewVO> list = InterviewDAO.interviewListData(map);
		int totalpage=InterviewDAO.interviewTotalPage();
		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		
		if (endPage > totalpage)
			endPage = totalpage;

		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		request.setAttribute("main_jsp", "../interview/interview_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("interview/interview_detail.do")
	  public String food_detail(HttpServletRequest request,
			  HttpServletResponse response)
	  {	
		  String ino=request.getParameter("ino");
		  System.out.println(ino); 
		  InterviewVO vo=InterviewDAO.interviewDetailData(Integer.parseInt(ino));
		  
		  String idate=vo.getIdate();
		  vo.setIdate(idate.substring(2,10));

		  //년도 달 잘라서 양식별로 다르게 보이게 해야함.
		  int year =Integer.parseInt(idate.substring(2,4));
		  int month =Integer.parseInt(idate.substring(5,7));
		  System.out.println("year : "+year+" month : "+month);
		  
		  // 2018년 8월 이후꺼 양식
		  if((year >= 19) || (year >= 18 && month >= 8)) {

			  //System.out.println(vo.getQuestion());
			  String ques[]=vo.getQuestion().split("\\^");
			  String ans[]=vo.getAnswer().split("\\^");
			  
			  System.out.println(vo.getIdate());
			  
			  // 앞에 q1이런것도 자르기
			  String[] ques1 = new String[ques.length];
			  for (int i = 0; i < ques.length; i++) {
			      ques1[i] = ques[i].replaceFirst("^Q[0-9]+", "").trim();
			  }

			  request.setAttribute("ques1", ques1);
			  request.setAttribute("ans", ans);
		  }else { // 2018년 8월 이전 양식은 이미지만있음

			  // System.out.println(vo.getPastimg());
			  String pastimg[]=vo.getPastimg().split("\\^");
			  request.setAttribute("pastimg", pastimg);
			  
		  }
		  request.setAttribute("year", year);
		  request.setAttribute("month", month);
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../interview/interview_detail.jsp");
		  return "../main/main.jsp";
	  }
	

	@RequestMapping("interview/interview_find.do")
	public String interview_find(HttpServletRequest request, HttpServletResponse response) {

		List<String> category = Arrays.asList(
				"전체","IT개발·데이터","회계·세무·재무","총무·법무·사무","인사·노무·HRD",
				"의료","운전·운송·배송","영업·판매·무역","연구·R&D","서비스",
				"생산","상품기획·MD","미디어·문화·스포츠","마케팅·홍보·조사","디자인",
				"기획·전략","금융·보험","구매·자재·물류","교육","공공·복지",
				"고객상담·TM","건설·건축"
				);
		String mode=request.getParameter("mode");
		
		if (mode == null) {
			mode = "1";
		}
		List<InterviewVO> list;
		
		String key=request.getParameter("search");
		System.out.println(key);
		
		if(key != null) {
			list=InterviewDAO.interviewSearch(key);
			System.out.println("통과");
		}else if(mode.equals("1")) {
			list = InterviewDAO.interviewAll();
		}else {
			list = InterviewDAO.interviewFindData(Integer.parseInt(mode));
		}
		List<Integer> count=new ArrayList<>();
		
		int sum=0;
		for (int i = 1; i < category.size(); i++) {
			int c = InterviewDAO.categoryCount(i+1); 
			count.add(c);
			sum+=c; 
		}
		count.add(0,sum); // 전체갯수 추가
		
//		for(int a:count) {
//			System.out.print(a+" ");
//		}
		request.setAttribute("count", count);
		request.setAttribute("category", category);
		request.setAttribute("list", list);
		request.setAttribute("mode", mode);
		request.setAttribute("key", key);
		
		request.setAttribute("main_jsp", "../interview/interview_find.jsp");
		return "../main/main.jsp";
	}
	
	
}
