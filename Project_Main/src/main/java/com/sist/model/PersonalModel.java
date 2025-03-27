package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONObject;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class PersonalModel {
	@RequestMapping("personal/join.do")
	public String personal_join(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp","../member/join.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("personal/emailcheck.do") 
	public String personal_emailcheck(HttpServletRequest request,HttpServletResponse response)
	{
		// include
		return "../member/emailcheck.jsp";
	}
	@RequestMapping("personal/emailcheck_ok.do")
	public void personal_idcheck_ok(HttpServletRequest request,HttpServletResponse response)
	{
		// void => 일반 데이터 (String , int)
		// => JSON
		// data:{"id":id.trim()} ?id=aaa
		String email=request.getParameter("email");
		int count=PersonalDAO.personalIdcheck(email);
		
		try 
		{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		}catch(Exception ex){}
		
	}
	@RequestMapping("personal/join_ok.do")
	public String personal_join_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String pw=request.getParameter("pw");
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String poster=request.getParameter("poster");
		if(poster==null)
			poster="";
		else
			poster="c:\\uploads\\"+poster;
		String sex=request.getParameter("sex");
		String birth=request.getParameter("birth");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		
		PersonalVO vo=new PersonalVO();
		vo.setPw(pw);
		vo.setName(name);
		vo.setPoster(poster);
		vo.setSex(sex);
		vo.setBirth(birth);
		vo.setEmail(email);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setPhone(phone1+"-"+phone2);
		PersonalDAO.personalInsert(vo);
				
		return "redirect:../main/main.do";
	}
	@RequestMapping("personal/login.do") 
	public String personal_login(HttpServletRequest request,HttpServletResponse response) 
	{
		return "../member/login.jsp";
	}
	@RequestMapping("personal/login_ok.do")
	public void personal_login_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String email=request.getParameter("email");
		String pw=request.getParameter("pw");
		PersonalVO vo=PersonalDAO.personalLogin(email, pw);
		if(vo.getMsg().equals("OK"))
		{
			HttpSession session=request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", email);
			session.setAttribute("sex", vo.getSex());
			session.setAttribute("isadmin", vo.getIsadmin());
			// post, addr1, addr2
		}
		try
		{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(vo.getMsg());
		}catch(Exception ex) {}
	}
	//로그아웃
	 	@RequestMapping("personal/logout.do")
	 	public String personal_logout(HttpServletRequest request,HttpServletResponse response)
	 	{
	 		String mode=request.getParameter("mode");
	 		String no=request.getParameter("no");
	 		HttpSession session=request.getSession();
	 		session.invalidate();
	 		if(mode!=null) {
	 			if(Integer.parseInt(mode)==1) {
	 				return "redirect:../company/com_detail.do?cno="+no;
	 			}else if(Integer.parseInt(mode)==2) {
	 				return "redirect:../emp/emp_detail.do?no="+no;
	 			}
	 		}
	 		return "redirect:../main/main.do";
	 	}
	 	//공고 지원하기
	 	@RequestMapping("personal/recruit.do") 
	 	public String personal_recruit(HttpServletRequest request,HttpServletResponse response){
	 		String eno=request.getParameter("eno");
	 		HttpSession session=request.getSession();
	 		String id=(String)session.getAttribute("id");
	 		
	 		List<ResumeVO> list=ResumeDAO.myResumeListData(id);
	 		request.setAttribute("list", list);
	 		request.setAttribute("eno", eno);
	 		return "../personal/recruit.jsp";
	 	}
	 	@RequestMapping("personal/recruit_detail.do") 
	 	public void personal_recruit_detail(HttpServletRequest request,HttpServletResponse response){
	 		String eno=request.getParameter("eno");
	 		String rno=request.getParameter("rno");
	 		
	 		ResumeVO vo=ResumeDAO.resumeDetailData(Integer.parseInt(rno));
	 		/*
	 		 * private int rno,num;
	 			private String id,name,email,phone,birth,disclosure,scholar,skill,career,self_intro,title;
	 			private String address,sex,poster;
	 			private char isbasic;
	 		 */
	 		JSONObject obj=new JSONObject();
	 		obj.put("rno", vo.getRno());
	 		obj.put("id", vo.getId());
	 		obj.put("name", vo.getName());
	 		obj.put("email", vo.getEmail());
	 		obj.put("phone", vo.getPhone());
	 		obj.put("birth", vo.getBirth());
	 		obj.put("disclosure", vo.getDisclosure());
	 		obj.put("scholar", vo.getScholar());
	 		obj.put("skill", vo.getSkill());
	 		obj.put("carreer", vo.getCareer());
	 		obj.put("self_intro", vo.getSelf_intro());
	 		obj.put("title", vo.getTitle());
	 		obj.put("address", vo.getAddress());
	 		obj.put("sex", vo.getSex());
	 		obj.put("poster", vo.getPoster());
	 		obj.put("isbasic", Character.toString(vo.getIsbasic()));
	 		
	 		try {
	 			response.setContentType("text/plain;charset=UTF-8");
	 			PrintWriter out=response.getWriter();
	 			out.write(obj.toJSONString());
	 		} catch (Exception e) {}
	 	}
	 	@RequestMapping("personal/recruit_insert.do") 
	 	public String personal_recruit_insert(HttpServletRequest request,HttpServletResponse response){
	 		String eno=request.getParameter("eno");
	 		String rno=request.getParameter("rno");
	 		
	 		HttpSession session=request.getSession();
	 		String id=(String)session.getAttribute("id");
	 		
	 		SeekerVO vo=new SeekerVO();
	 		vo.setId(id);
	 		vo.setRno(Integer.parseInt(rno));
	 		vo.setEno(Integer.parseInt(eno));
	 		
	 		PersonalDAO.personalInsertSeeker(vo);
	 		return "redirect:../emp/emp_detail.do?no="+eno;
	 	}
}
