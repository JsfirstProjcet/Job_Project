package com.sist.model;

import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
		int totalpage=EmpDAO.empTotalPage(tab);
	  
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
		
		EmpVO evo=EmpDAO.empDetailData(Integer.parseInt(eno));
		int cno=CompanyDAO.conByCid(evo.getCid());
		CompanyVO cvo=CompanyDAO.comDetailData(cno);
		
		List<JobVO> jList=EmpDAO.empDetailJobData(evo.getEno());
		
		////////// follow + seeker 정보
		int cCheck=0;//기업 팔로우
		int eCheck=0;//공고 팔로우
		int sCheck=0;//공고 지원
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		if(id!=null) {
			FollowVO fvo=new FollowVO();
			SeekerVO svo=new SeekerVO();
			fvo.setId(id);
			try {
				fvo.setNo(cno);
				fvo.setType(0);
				cCheck=FollowDAO.followCheck(fvo);
				fvo.setNo(Integer.parseInt(eno));
				fvo.setType(1);
				eCheck=FollowDAO.followCheck(fvo);
				svo.setEno(Integer.parseInt(eno));
				svo.setId(id);
				sCheck=PersonalDAO.personalSeekerCheck(svo);
			} catch (Exception e) {
			}
		}
		request.setAttribute("cCheck", cCheck);
		request.setAttribute("eCheck", eCheck);
		request.setAttribute("sCheck", sCheck);
		//////////
		
		request.setAttribute("evo", evo);
		request.setAttribute("cvo", cvo);
		request.setAttribute("jList", jList);
		request.setAttribute("main_jsp", "../emp/emp_detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("emp/emp_find_home.do")
	public String emp_find_home(HttpServletRequest request, HttpServletResponse response) {		
		request.setAttribute("main_jsp", "../emp/emp_find_home.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("emp/emp_find.do")
	public String emp_find(HttpServletRequest request, HttpServletResponse response) {
	    // 현재 페이지 정보 처리
	    String page = request.getParameter("page");
	    if (page == null) {
	        page = "1";
	    }
	    int curpage = Integer.parseInt(page);

	    // 탭 정보 처리
	    String tab = request.getParameter("tab");
	    if (tab == null) {
	        tab = "all";
	    }

	    // 검색어 처리
	    String fd = request.getParameter("fd"); // 검색 필드 (예: name, title 등)
	    String ss = request.getParameter("keyword"); // 검색어

	    // 직업 코드(jno)와 위치(loc) 처리
	    Integer jno = null;
	    String loc = null;

	    try {
	        jno = request.getParameter("jno") != null ? Integer.parseInt(request.getParameter("jno")) : null;
	        loc = request.getParameter("loc") != null ? request.getParameter("loc") : null;
	    } catch (NumberFormatException e) {
	        jno = null;
	        loc = null;
	    }

	    // 검색 범위 및 조건 설정
	    Map<String, Object> map = new HashMap<>();
	    map.put("start", (curpage * 12) - 11);  // 시작 페이지
	    map.put("end", curpage * 12);           // 끝 페이지
	    map.put("tab", tab);                    // 탭
	    map.put("fd", fd);                      // 검색 필드
	    map.put("keyword", ss);                      // 검색어
	    map.put("jno", jno);                    // 직업 코드
	    map.put("loc", loc);                    // 위치

	    // DB에서 직원 목록을 조회
	    List<EmpVO> list = EmpDAO.empListData(map);
	    int totalpage = EmpDAO.empTotalPage(tab);

	    // 페이징 처리
	    final int BLOCK = 10;  // 한 화면에 표시할 페이지 블록 개수
	    int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
	    int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

	    if (endPage > totalpage) {
	        endPage = totalpage;
	    }

	    // 요청 속성 설정
	    request.setAttribute("list", list);
	    request.setAttribute("tab", tab);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../emp/emp_find.jsp");
		return "../main/main.jsp";
	}
}
