package com.sist.model;
import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

@Controller
public class JjimModel {
	
	@RequestMapping("jjim/jjim_insert.do")
	public String jjim_insert(HttpServletRequest request,HttpServletResponse response) {
		
		String bno=request.getParameter("bno");

		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		JjimVO vo=new JjimVO();
		vo.setId(id);
		vo.setBno(Integer.parseInt(bno));
		JjimDAO.jjimInsert(vo);
		
		return "redirect:../interview/commune_detail.do?bno="+bno;
	}
	
	@RequestMapping("jjim/jjim_cancel.do")
	public String jjim_cancel(HttpServletRequest request,HttpServletResponse response) {
		
		String no=request.getParameter("no");
		String bno=request.getParameter("bno");
		JjimDAO.jjim_Delete(Integer.parseInt(no));
		
		return "redirect:../interview/commune_detail.do?bno="+bno;
	}
}
