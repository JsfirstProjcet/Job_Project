package com.sist.model;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
@Controller
public class WriteModel {
	@RequestMapping("write/write_list.do")
	   public String write_list(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   
		   int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   map.put("start", (10*curpage)-9);
		   map.put("end",10*curpage);
		   List<WriteVO> list=WriteDAO.writeListData(map);
		   int totalpage=WriteDAO.writeTotalPage();
		   request.setAttribute("list", list);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("curpage", curpage);
		   
		   request.setAttribute("main_jsp", "../write/write_list.jsp");
		   return "../main/main.jsp";
	   }
	   // ../board/board_detail.do?no=${vo.no }
	   @RequestMapping("write/write_detail.do") // if동일 
	   public String write_detail(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String sno=request.getParameter("sno");
		   String page=request.getParameter("page");
		   WriteVO vo=WriteDAO.writeDetailData(Integer.parseInt(sno));
		   request.setAttribute("vo", vo);
		   request.setAttribute("page", page);
		   request.setAttribute("main_jsp", "../write/write_detail.jsp");
		   return "../main/main.jsp";
	   }
	   
	   @RequestMapping("write/write_pwd_ajax.do")
	   public void write_pwd_ajax(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String sno=request.getParameter("sno");
		   String pwd=request.getParameter("pwd");
		   String db_pwd=WriteDAO.writeGetPassword(Integer.parseInt(sno));
		   int res=0;
		   if(db_pwd.equals(pwd))
		   {
			   res=1;
		   }
		   try
		   {
			   response.setContentType("text/html;charset=UTF-8");
			   PrintWriter out=response.getWriter();
			   out.write(String.valueOf(res));
		   }catch(Exception ex) {}
			   
	   }
	   @RequestMapping("write/write_delete_ajax.do")
	   public void write_delete_ajax(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String sno=request.getParameter("sno");
		   PrintWriter out=null;
		   try
		   {
			   
			   response.setContentType("text/html;charset=UTF-8");
			   out=response.getWriter();
			   
			   WriteDAO.writeDelete(Integer.parseInt(sno));
			   out.write("yes");
		   }catch(Exception ex) {
			   out.write("no");
		   }
	   }
	   @RequestMapping("write/write_update.do")
	   public String write_update(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   // public String board_update(int no,int page,Model model)
		   //                            BoardVO vo
		   String sno=request.getParameter("sno");
		   String page=request.getParameter("page");
		   WriteVO vo=WriteDAO.writeUpdateData(Integer.parseInt(sno));
		   
		   request.setAttribute("vo", vo);
		   request.setAttribute("page", page);
		   request.setAttribute("main_jsp", "../write/write_update.jsp");
		   return "../main/main.jsp";
	   }
	   @RequestMapping("write/write_update_ok.do")
	   public String write_update_ok(HttpServletRequest request, HttpServletResponse response) {
	       String sno = request.getParameter("sno");
	       String page = request.getParameter("page");  // page 값을 받아옵니다.
	       String name = request.getParameter("name");
	       String text1 = request.getParameter("text1");
	       String text2 = request.getParameter("text2");
	       String text3 = request.getParameter("text3");
	       String text4 = request.getParameter("text4");
	       String text5 = request.getParameter("text5");
	       String pwd = request.getParameter("pwd");

	       WriteVO vo = new WriteVO();
	       vo.setSno(Integer.parseInt(sno));
	       vo.setName(name);
	       vo.setText1(text1);
	       vo.setText2(text2);
	       vo.setText3(text3);
	       vo.setText4(text4);
	       vo.setText5(text5);

	       int res = 0;
	       String db_pwd = WriteDAO.writeGetPassword(Integer.parseInt(sno));

	       if (db_pwd.equals(pwd)) {
	           WriteDAO.writeUpdate(vo);
	           res = 1;
	       } else {
	           res = 0;
	       }

	       // page 값이 제대로 전달되는지 확인
	       if (page == null || page.isEmpty()) {
	           page = "1";  // 만약 page 값이 없다면 기본값으로 1을 설정
	       }

	       // 리다이렉트 URL에 page 값을 추가
	       String redirectUrl = "../write/write_list.do?page=" + page;
	       
	       // 리다이렉트 처리: 글 수정 후 목록 페이지로 이동
	       return "redirect:" + redirectUrl;
	   }


}