package com.sist.model;

import java.io.PrintWriter;
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
	public String jjim_insert(HttpServletRequest request, HttpServletResponse response) {

		String bno = request.getParameter("bno");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String rno=request.getParameter("rno");
		
		JjimVO vo = new JjimVO();
		vo.setId(id);
		vo.setBno(Integer.parseInt(bno));
		vo.setType(type);
		
		if(rno==null|| rno.isEmpty()) {
			vo.setRno(0);
		}else {
			vo.setRno(Integer.parseInt(rno));
		}
		JjimDAO.jjimInsert(vo);

		return "redirect:../interview/commune_detail.do?bno=" + bno;
	}

	@RequestMapping("jjim/jjim_cancel.do")
	public String jjim_cancel(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		String bno = request.getParameter("bno");
		String type = request.getParameter("type");

		JjimVO vo = new JjimVO();

		vo.setId(id);
		vo.setBno(Integer.parseInt(bno));
		vo.setType(type);

		int no = JjimDAO.jjimGetId(vo);
		JjimDAO.jjim_Delete(no, Integer.parseInt(bno));

		return "redirect:../interview/commune_detail.do?bno=" + bno;
	}

	// 댓글 좋아요는 ajax로 해보자구
	@RequestMapping("jjim/jjim_insert_ajax.do")
	public void jjim_insert_ajax(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain;charset=UTF-8");

			String bno = request.getParameter("bno");
			String rno = request.getParameter("rno");
			String type = request.getParameter("type");

			System.out.println("bno"+bno+"rno"+rno+"type"+type);

			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");

			PrintWriter out = response.getWriter();

			if (id == null) {
				out.write("nologin");
				return;
			}

			JjimVO vo = new JjimVO();
			vo.setBno(Integer.parseInt(bno));
			vo.setId(id);
			vo.setType(type);
			vo.setRno(Integer.parseInt(rno));

			
			int count = JjimDAO.jjimReplyCheckCount(vo);

			if (count == 0) {
				JjimDAO.jjimInsert(vo);
				CommuneDAO.communeReplyLikeIncrement(Integer.parseInt(rno));
				out.write("liked");
			} else {
				int no = JjimDAO.jjimReplyGetId(vo);
				JjimDAO.jjim_Delete(no, Integer.parseInt(bno));
				CommuneDAO.communeReplyLikeDecrement(Integer.parseInt(rno));
				out.write("unliked");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
