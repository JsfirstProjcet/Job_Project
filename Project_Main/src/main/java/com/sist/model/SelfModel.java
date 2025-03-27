package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
// JSP (디자인) => Model => DAO => Model => JSP
//             | Conroller         |Controller
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.vo.*;
import com.sist.dao.*;
@Controller
/*
 *          JSP .do
 *           |
 *   DispatcherServlet (Controller) ***
 *           |
 *         (Model) ******* DAO
 *           | request
 *   DispatcherServlet  ***
 *           | request
 *          (JSP) 
 */
public class SelfModel {
  @RequestMapping("self/self_list.do")
  public String self_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  Map map=new HashMap();
	  map.put("start", (curpage*12)-11);
	  map.put("end",curpage*12);
	  List<SelfVO> list=SelfDAO.selfListData(map);
	  int totalpage=SelfDAO.selfTotalPage();
	  
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
	  
	  request.setAttribute("main_jsp", "../self/self_list.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("self/self_detail_before.do")
  public String self_detail_before(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String sno=request.getParameter("sno");
	  Cookie cookie=new Cookie("self_"+sno, sno);
	  cookie.setPath("/");
	  cookie.setMaxAge(60*60*24);
	  // 전송 
	  response.addCookie(cookie);
	  
	  // 화면 이동 
	  return "redirect:self_detail.do?sno="+sno;
  }
  @RequestMapping("self/self_detail.do")
  public String self_detail(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String sno=request.getParameter("sno");
	  SelfVO vo=SelfDAO.selfDetailData(Integer.parseInt(sno));
	  
	  String title=vo.getTitle();
	  title=title.substring(title.trim().indexOf(" "));
	  
	  String title1=title.trim();
	  title1=title1.substring(title1.trim().indexOf(" "));
	  
	  String title2=title1.trim();
	  title2=title1.substring(0,title2.indexOf(" ")+1);
	  request.setAttribute("title", title2);
	  request.setAttribute("vo", vo);
	  request.setAttribute("main_jsp", "../self/self_detail.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("self/self_find.do")
  public String self_find(HttpServletRequest request,
  		HttpServletResponse response)
  {
  	request.setAttribute("main_jsp", "../self/self_find.jsp");
  	return "../main/main.jsp";
  }
  @RequestMapping("self/self_find_ajax.do")
  public void recipe_find_ajax(HttpServletRequest request,
  		HttpServletResponse response)
  {
	  // data:{"fd":fd,"ss":ss,"page":1}
	  String page=request.getParameter("page");
	  String fd=request.getParameter("fd");
	  String ss=request.getParameter("ss");
	  int curpage=Integer.parseInt(page);
	  Map map=new HashMap();
	  map.put("start", (12*curpage)-11);
	  map.put("end", 12*curpage);
	  map.put("ss", ss);
	  map.put("fd",fd);
	  List<SelfVO> list=SelfDAO.selfFindData(map);
	  int totalpage=SelfDAO.selfFindTotalPage(map);
	  
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  
	  if(endPage>totalpage)
		 endPage=totalpage;
	  
	  // JSON변경 
	  JSONArray arr=new JSONArray();
	  int i=0;
	  for(SelfVO vo:list)
	  {
		  JSONObject obj=new JSONObject();
		  obj.put("sno", vo.getSno());
		  obj.put("title", vo.getTitle());
		  obj.put("poster", vo.getPoster());
		  obj.put("content", vo.getContent());
		  obj.put("content", vo.getContent());
		  if(i==0)
		  {
			  obj.put("curpage", curpage);
			  obj.put("totalpage", totalpage);
			  obj.put("startPage", startPage);
			  obj.put("endPage",endPage);
		  }
		  
		  arr.add(obj);
		  i++;
	  }
	  
	  // 전송
	  try
	  {
		  response.setContentType("text/plain;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  out.write(arr.toJSONString());
	  }catch(Exception ex) {}
	  
	  
  }
}


