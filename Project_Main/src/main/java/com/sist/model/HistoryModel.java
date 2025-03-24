package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.vo.HistoryVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class HistoryModel {
	@RequestMapping("company/history_insert.do")
	public void com_history_insert(HttpServletRequest request, HttpServletResponse response) {
		String ym=request.getParameter("ym");
		String content=request.getParameter("content");
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		
		int year=Integer.parseInt(ym.substring(0,4));
		int month=Integer.parseInt(ym.substring(5,7));
		HistoryVO vo=new HistoryVO();
		
		vo.setYear(year);
		vo.setMonth(month);
		vo.setContent(content);
		vo.setCid(cid);
		
		int step=HistoryDAO.historyStep(vo);
		vo.setStep(step);
		
		HistoryDAO.insertHistory(vo);
	}
	@RequestMapping("company/history_delete.do")
	public void com_history_delete(HttpServletRequest request, HttpServletResponse response) {
		String hno=request.getParameter("hno");
		HistoryVO vo=HistoryDAO.historyDetail(Integer.parseInt(hno));
		HistoryDAO.deleteHistory(vo);
	}
	@RequestMapping("company/history_up.do")
	public void com_history_up(HttpServletRequest request, HttpServletResponse response) {
		String hno=request.getParameter("hno");
		HistoryVO vo=HistoryDAO.historyDetail(Integer.parseInt(hno));
		HistoryDAO.upHistory(vo);
	}
	@RequestMapping("company/history_down.do")
	public void com_history_down(HttpServletRequest request, HttpServletResponse response) {
		String hno=request.getParameter("hno");
		HistoryVO vo=HistoryDAO.historyDetail(Integer.parseInt(hno));
		HistoryDAO.downHistory(vo);
	}
	@RequestMapping("company/history_update.do")
	public void com_history_update(HttpServletRequest request, HttpServletResponse response) {
		String hno=request.getParameter("hno");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String content=request.getParameter("content");
		String ym=request.getParameter("ym");
		String mode=request.getParameter("mode");
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		HistoryVO vo=new HistoryVO();
		vo.setHno(Integer.parseInt(hno));
		vo.setYear(Integer.parseInt(year));
		vo.setMonth(Integer.parseInt(month));
		vo.setContent(content);
		vo.setCid(cid);
		
		if(Integer.parseInt(mode)==1) {
			HistoryDAO.updateHContent(vo);
		}else {
			HistoryVO hvo=HistoryDAO.historyDetail(vo.getHno());
			vo.setStep(hvo.getStep());
			HistoryDAO.deleteHistory(vo);
			vo.setYear(Integer.parseInt(ym.substring(0,4)));
			vo.setMonth(Integer.parseInt(ym.substring(5,7)));
			int step=HistoryDAO.historyStep(vo);
			vo.setStep(step);
			HistoryDAO.insertHistory(vo);
		}
	}
	@RequestMapping("company/history_print.do")
	public void com_history_print(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		
		List<HistoryVO> hList=HistoryDAO.comHistoryList(cid);
		List<HistoryVO> yList=HistoryDAO.comHistoryYMList(cid);
		
		JSONArray hArr=new JSONArray();
		JSONArray yArr=new JSONArray();
		
		for(HistoryVO vo:hList) {
			JSONObject obj=new JSONObject();
			obj.put("hno", vo.getHno());
			obj.put("year", vo.getYear());
			obj.put("month", vo.getMonth());
			obj.put("content", vo.getContent());
			obj.put("step", vo.getStep());
			obj.put("cid", vo.getCid());
			hArr.add(obj);
		}
		for(HistoryVO vo:yList) {
			JSONObject obj=new JSONObject();
			obj.put("year", vo.getYear());
			obj.put("month", vo.getMonth());
			obj.put("count", vo.getCount());
			yArr.add(obj);
		}
		
		JSONObject result = new JSONObject();
        result.put("hList", hArr);
        result.put("yList", yArr);
		
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(result.toJSONString());
		} catch (Exception e) {}
	}
}
