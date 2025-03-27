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
		String eno=request.getParameter("no");
		Cookie cookie=new Cookie("emp_"+eno, eno);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		// 전송	 
		response.addCookie(cookie);
  
		// 화면 이동 
		return "redirect:emp_detail.do?no="+eno;
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
	    String page = request.getParameter("page");
	    if (page == null) {
	        page = "1";
	    }
	    
	    int curpage = Integer.parseInt(page);

	    String keyword = request.getParameter("keyword"); 
	    if (keyword == null || keyword.isEmpty()) {
	        keyword = "";
	    }
	    String loc = request.getParameter("loc");
	    if (loc == null || loc.isEmpty()) {
	        loc = null;
	    }	    
	    Integer jno = null;

	    String jnoParam = request.getParameter("jno");
	    if (jnoParam != null && !jnoParam.isEmpty()) {
	        try {
	            jno = Integer.parseInt(jnoParam);
	        } catch (NumberFormatException e) {
	            jno = null;
	        }
	    }

	    Map map = new HashMap();
	    map.put("start", (curpage * 12) - 11);  
	    map.put("end", curpage * 12);           
	    map.put("keyword", keyword);           
	    map.put("jno", jno);                    
	    map.put("loc", loc);                   

	    List<EmpVO> list = EmpDAO.empFindData(map);
	    
	    int totalpage = EmpDAO.empFindTotalPage(map); 

	    final int BLOCK = 10;  
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;

	    if (endPage > totalpage) {
	        endPage = totalpage;
	    }
	    
	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
	    request.setAttribute("main_jsp", "../emp/emp_find.jsp");

	    return "../main/main.jsp";
	}
	@RequestMapping("emp/emp_calendar.do")
	public String emp_calendar(HttpServletRequest request,
		  HttpServletResponse response)
	{
	    String strYear = request.getParameter("year");
	    String strMonth = request.getParameter("month");
	    String strDay = request.getParameter("day");

	    // 기본 날짜값 설정: 오늘 날짜를 기준으로
	    Calendar todayCal = Calendar.getInstance();  // 오늘 날짜를 가져옴
	    if (strYear == null || strYear.isEmpty()) {
	        strYear = String.valueOf(todayCal.get(Calendar.YEAR)); // 오늘 년도
	    }
	    if (strMonth == null || strMonth.isEmpty()) {
	        strMonth = String.format("%02d", todayCal.get(Calendar.MONTH) + 1); // 오늘 월
	    }
	    if (strDay == null || strDay.isEmpty()) {
	        strDay = String.format("%02d", todayCal.get(Calendar.DAY_OF_MONTH)); // 오늘 날짜
	    }

	    int year = Integer.parseInt(strYear);
	    int month = Integer.parseInt(strMonth);
	    int day = Integer.parseInt(strDay);

	    // 날짜 설정
	    Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.YEAR, year);
	    cal.set(Calendar.MONTH, month - 1); // 월은 0부터 시작
	    cal.set(Calendar.DATE, 1); // 1일로 설정

	    // 첫째 주의 요일(1: 일요일, 2: 월요일 등)
	    int week = cal.get(Calendar.DAY_OF_WEEK) - 1; 
	    int lastday = cal.getActualMaximum(Calendar.DATE); // 마지막 날짜

	    // 날짜 배열 설정
	    int[] rday = new int[lastday + 1];  // lastday 날짜 범위에 맞는 배열
	    Arrays.fill(rday, 1);

	    // 날짜, 공고 목록 정보 설정
	    Map<String, Object> dateMap = new HashMap<>();
	    dateMap.put("year", year);
	    dateMap.put("month", month);
	    dateMap.put("day", strDay);
	    dateMap.put("rday", rday);
	    
	    // 공고 목록 조회
	    List<EmpVO> list = EmpDAO.getEmpListByDate(dateMap);

	    // JSP로 전달할 데이터 설정
	    request.setAttribute("rday", rday);
	    request.setAttribute("year", year);
	    request.setAttribute("month", month);
	    request.setAttribute("week", week);
	    request.setAttribute("lastday", lastday);
	    request.setAttribute("day", day);
	    request.setAttribute("emp_list", list);
	    
	    String[] weeks = {"일", "월", "화", "수", "목", "금", "토"};
	    request.setAttribute("weeks", weeks);
	    request.setAttribute("main_jsp", "../emp/emp_calendar.jsp");
		return "../main/main.jsp";
	}
}
