package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class OfficialModel {
	@RequestMapping("official/emailcheck.do") 
	public String official_emailcheck(HttpServletRequest request,HttpServletResponse response)
	{
		// include
		return "../member/emailcheck.jsp";
	}
	@RequestMapping("official/emailcheck_ok.do")
	public void official_idcheck_ok(HttpServletRequest request,HttpServletResponse response)
	{
		// void => 일반 데이터 (String , int)
		// => JSON
		// data:{"id":id.trim()} ?id=aaa
		String email=request.getParameter("email");
		int count=OfficialDAO.officialIdcheck(email);
		
		try 
		{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		}catch(Exception ex){}
		
	}
	@RequestMapping("official/join_ok.do")
	public String official_join_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String cname=request.getParameter("cname");
		String brnumber1=request.getParameter("brnumber1");
		String brnumber2=request.getParameter("brnumber2");
		String brnumber3=request.getParameter("brnumber3");
		
		OfficialVO vo=new OfficialVO();
		vo.setPw(pw);
		vo.setName(name);
		vo.setEmail(email);
		vo.setPhone(phone1+"-"+phone2);
		vo.setCname(cname);
		vo.setBrnumber(brnumber1+"-"+brnumber2+"-"+brnumber3);
		OfficialDAO.officialInsert(vo);
				
		return "redirect:../main/main.do";
	}
	@RequestMapping("official/login.do") 
	public String official_login(HttpServletRequest request,HttpServletResponse response) 
	{
		return "../member/login.jsp";
	}
	@RequestMapping("official/login_ok.do")
	public void official_login_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String email=request.getParameter("email");
		String pw=request.getParameter("pw");
		OfficialVO vo=OfficialDAO.officialLogin(email, pw);
		if(vo.getMsg().equals("OK"))
		{
			HttpSession session=request.getSession();
			session.setAttribute("cid", vo.getCid()); 
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", email);
			session.setAttribute("state", vo.getState());
			session.setAttribute("access_key", vo.getAccess_key());
			// phone, brnumber,state
		}
		try
		{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(vo.getMsg());
		}catch(Exception ex) {}
	}
	//로그아웃
	@RequestMapping("official/logout.do")
	public String official_logout(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:../main/main.do";
	}
	//계정정보 수정
	@RequestMapping("official/official_detail.do")
	public String official_detail(HttpServletRequest request,HttpServletResponse response) {
		String cno=request.getParameter("cno");
		CompanyVO vo=CompanyDAO.comDetailData(Integer.parseInt(cno));
		OfficialVO ovo=OfficialDAO.officialDetailData(vo.getCid());
		
		request.setAttribute("vo", vo);
		request.setAttribute("ovo", ovo);
		request.setAttribute("com_title", "계정 관리");
		request.setAttribute("com_jsp", "../official/official_detail.jsp");
		request.setAttribute("main_jsp", "../company/com_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("official/official_update.do")
	public String official_update(HttpServletRequest request,HttpServletResponse response) {
		String cno=request.getParameter("cno");
		CompanyVO vo=CompanyDAO.comDetailData(Integer.parseInt(cno));
		OfficialVO ovo=OfficialDAO.officialDetailData(vo.getCid());
		
		request.setAttribute("vo", vo);
		request.setAttribute("ovo", ovo);
		request.setAttribute("com_jsp", "../official/official_update.jsp");
		request.setAttribute("main_jsp", "../company/com_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("official/official_update_ok.do")
	public String official_update_ok(HttpServletRequest request,HttpServletResponse response) {
		String name=request.getParameter("name");
		String cname=request.getParameter("cname");
		String phone=request.getParameter("phone");
		String brnumber=request.getParameter("brnumber");
		
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		int cno=CompanyDAO.conByCid(cid);
		
		OfficialVO vo=new OfficialVO();
		vo.setName(name);
		vo.setCname(cname);
		vo.setPhone(phone);
		vo.setBrnumber(brnumber);
		vo.setCid(cid);
		
		OfficialDAO.officialUpdate(vo);
		
		return "redirect:../official/official_detail.do?cno="+cno;
	}
	@RequestMapping("official/emp_list.do")
	public String official_emp_list(HttpServletRequest request, HttpServletResponse response) {		
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		int cno=CompanyDAO.conByCid(cid);
		CompanyVO vo=CompanyDAO.comDetailData(cno);
		
		request.setAttribute("com_title", "공고 관리");
		request.setAttribute("vo", vo);
		request.setAttribute("cno", cno);
		request.setAttribute("com_jsp", "../official/emp_list.jsp");
		request.setAttribute("main_jsp", "../company/com_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("official/emp_list_print.do")
	public String official_emp_list_print(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		String filter=request.getParameter("filter");
		if(filter==null)
			filter="0";
		if(page==null)
			page="1";
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		int cno=CompanyDAO.conByCid(cid);
		
		int curpage=Integer.parseInt(page);
		final int BLOCK=10;
		
		Map map=new HashMap();
		map.put("cid", cid);
		map.put("filter", filter);
		map.put("start", (curpage*10)-9);
		map.put("end", (curpage*10));
		
		List<EmpVO> list=EmpDAO.empOfficialListData(map);
		int count=EmpDAO.empOfficialCount(cid);
		int totalpage=(int)(Math.ceil(count/10.0));

		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("cno", cno);
		request.setAttribute("filter", filter);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		return "../official/emp_list_print.jsp";
	}
	@RequestMapping("official/emp_close.do")
	public void official_emp_close(HttpServletRequest request, HttpServletResponse response) {
		String eno=request.getParameter("eno");
		
		EmpDAO.empCloseSeeker(Integer.parseInt(eno));
		EmpDAO.empClose(Integer.parseInt(eno));
	}
	@RequestMapping("official/seeker_list.do")
	public String official_seeker_list(HttpServletRequest request, HttpServletResponse response) {
		String eno=request.getParameter("eno");
		
		request.setAttribute("eno", eno);
		return "../official/seeker_list.jsp";
	}
	@RequestMapping("official/seeker_list_print.do")
	public String official_seeker_list_print(HttpServletRequest request, HttpServletResponse response) {
		String eno=request.getParameter("eno");
		String state=request.getParameter("state");
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		final int BLOCK=10;
		
		Map map=new HashMap();
		map.put("eno", eno);
		map.put("state", state);
		map.put("start", (curpage*10)-9);
		map.put("end", (curpage*10));
		
		List<SeekerVO> list=EmpDAO.empSeekerListData(map);
		int count=EmpDAO.empSeekerCount(map);
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
		return "../official/seeker_list_print.jsp";
	}
	@RequestMapping("official/seeker_update.do")
	public void official_seeker_update(HttpServletRequest request, HttpServletResponse response) {
		String jno=request.getParameter("jno");
		String state=request.getParameter("state");
		
		SeekerVO vo=new SeekerVO();
		vo.setJno(Integer.parseInt(jno));
		vo.setState(Integer.parseInt(state));
		EmpDAO.empSeekerUpdate(vo);
	}
	@RequestMapping("official/emp_insert.do")
	public String official_emp_insert(HttpServletRequest request, HttpServletResponse response) {		
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		int cno=CompanyDAO.conByCid(cid);
		CompanyVO vo=CompanyDAO.comDetailData(cno);

		
		request.setAttribute("com_title", "새 공고 등록");
		request.setAttribute("vo", vo);
		request.setAttribute("cno", cno);
		request.setAttribute("com_jsp", "../official/emp_insert.jsp");
		request.setAttribute("main_jsp", "../company/com_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("official/emp_insert_ok.do")
	public void official_emp_insert_ok(HttpServletRequest request, HttpServletResponse response) {	
		String name=request.getParameter("name");
		String title=request.getParameter("title");
		String personal_history=request.getParameter("personal_history");
		String salary=request.getParameter("salary");
		String salary_str=request.getParameter("salary_str");
		String education=request.getParameter("education");
		String emp_type=request.getParameter("emp_type");
		String loc=request.getParameter("loc");
		String deadline=request.getParameter("deadline");
		String content=request.getParameter("content");
		
		System.out.println(name);
		System.out.println(title);
		System.out.println(personal_history);
		System.out.println(salary);
		System.out.println(salary_str);
		System.out.println(education);
		System.out.println(emp_type);
		System.out.println(loc);
		System.out.println(deadline);
		System.out.println(content);
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		int cno=CompanyDAO.conByCid(cid);
		
		EmpVO vo=new EmpVO();
		vo.setCid(cid);
		vo.setName(name);
		vo.setTitle(title);
		vo.setPersonal_history(personal_history);
		vo.setSalary(Integer.parseInt(salary));
		vo.setSalary_str(salary_str);
		vo.setEducation(Integer.parseInt(education));
		vo.setEmp_type(emp_type);
		vo.setLoc(loc);
		vo.setContent(content);
		if(!deadline.equals("")) {
			vo.setDbdeadline(deadline);
		}
		EmpDAO.empInsert(vo);
	}
}
