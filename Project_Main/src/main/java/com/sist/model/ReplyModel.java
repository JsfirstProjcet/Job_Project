package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReplyDAO;
import com.sist.vo.ReplyVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@Controller
public class ReplyModel {
	
	@RequestMapping("reply/reply_insert.do")
	public String reply_insert(HttpServletRequest request,HttpServletResponse response) {
		
		String bno=request.getParameter("bno");
		String msg=request.getParameter("msg");
		String poster=request.getParameter("poster");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String nickname=(String)session.getAttribute("name");
		
		ReplyVO vo=new ReplyVO();
		
		vo.setBno(Integer.parseInt(bno));
		vo.setId(id);
		vo.setMsg(msg);
		vo.setNickname(nickname);
		vo.setPoster(poster);
	    System.out.println(bno +" "+id +" "+msg +" "+nickname +" "+poster);
		ReplyDAO.replyInsert(vo);
		
		return "redirect:../interview/commune_detail.do?bno=" + bno;
	}
	
	
	@RequestMapping("reply/reply_delete.do")
	public String reply_delete(HttpServletRequest request,HttpServletResponse response) {
		
		String bno=request.getParameter("bno");
		String rno=request.getParameter("rno");
		
		ReplyDAO.replyDelete(Integer.parseInt(rno));
		return "redirect:../interview/commune_detail.do?bno=" + bno;
	}
	
	@RequestMapping("reply/reply_update.do")
	public String reply_update(HttpServletRequest request,HttpServletResponse response) {
		
		String bno=request.getParameter("bno");
		String rno=request.getParameter("rno");
		String msg=request.getParameter("msg");
		
		ReplyVO vo=new ReplyVO();
		vo.setRno(Integer.parseInt(rno));
		vo.setMsg(msg);
		
		ReplyDAO.replyUpdate(vo);
		
		return "redirect:../interview/commune_detail.do?bno=" + bno;
	}
}
