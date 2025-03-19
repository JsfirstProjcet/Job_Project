package com.sist.model;

import java.io.PrintWriter;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FollowDAO;
import com.sist.vo.FollowVO;
import java.util.*;

import org.json.simple.JSONObject;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FollowModel {
	@RequestMapping("follow/follow_insert.do")
	public void follow_insert(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String id=request.getParameter("id");
		String type=request.getParameter("type");
		
		FollowVO vo=new FollowVO();
		vo.setNo(Integer.parseInt(no));
		vo.setId(id);
		vo.setType(Integer.parseInt(type));
		
		FollowDAO.followInsert(vo);
	}
	@RequestMapping("follow/follow_delete.do")
	public void follow_delete(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String id=request.getParameter("id");
		String type=request.getParameter("type");
		
		FollowVO vo=new FollowVO();
		vo.setNo(Integer.parseInt(no));
		vo.setId(id);
		vo.setType(Integer.parseInt(type));
		int fno=FollowDAO.followFno(vo);
		
		FollowDAO.followDelete(fno);
	}
	@RequestMapping("follow/follow_print.do")
	public void follow_print(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String id=request.getParameter("id");
		String type=request.getParameter("type");
		
		FollowVO vo=new FollowVO();
		vo.setNo(Integer.parseInt(no));
		vo.setId(id);
		vo.setType(Integer.parseInt(type));
		
		int check=0;
		int fCount=0;
		fCount=FollowDAO.followCount(vo);
		try {
			check=FollowDAO.followCheck(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONObject obj=new JSONObject();
		obj.put("check", check);
		obj.put("fCount", fCount);
		
		try {
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(obj.toString());
		} catch (Exception e) {
		}
	}
}
