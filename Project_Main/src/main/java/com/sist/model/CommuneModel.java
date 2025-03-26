package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class CommuneModel {
	
	@RequestMapping("interview/commune.do")
	public String commune(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curpage*5)-4);
		map.put("end", curpage*5);
		List<CommuneVO> list=CommuneDAO.communeListData(map);
		int totalpage=CommuneDAO.communeTotalPage();
		System.out.println("list.size(): " + list.size());

		if (list.isEmpty()) {
		    System.out.println("리스트가 비어있습니다.");
		} else {
		    System.out.println("리스트에 데이터가 있습니다.");
		}
		request.setAttribute("list", list);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("curpage", curpage);

		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		
		if (endPage > totalpage)
			endPage = totalpage;

		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		// 조회수 높은거 상단 고정 
		List<CommuneVO> topList = CommuneDAO.communeTop4();
		request.setAttribute("topList", topList);
		
		    
		request.setAttribute("main_jsp", "../interview/commune.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("interview/commune_insert.do")
	public String commune_insert(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		request.setAttribute("main_jsp", "../interview/commune_insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("interview/commune_insert_ok.do")
	public String qna_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String[] hashtag = request.getParameterValues("hashtag");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String nickname = (String) session.getAttribute("name");

		String hash = "";
		    if (hashtag != null) {
		        hash = String.join(",", hashtag); // 콤마(,)로 구분해서 저장
		    }
		    
		    
		// 데이터 유지 => 서버 자체 저장
		CommuneVO vo = new CommuneVO();
		vo.setId(id);
		vo.setNickname(nickname);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setHashtag(hash);

		CommuneDAO.communeInsert(vo);
		return "redirect:../interview/commune.do";
	}
	
	@RequestMapping("interview/commune_detail.do")
	public String commune_detail(HttpServletRequest request, HttpServletResponse response) {
		
		String bno=request.getParameter("bno");
		CommuneVO vo=CommuneDAO.communeDetailData(Integer.parseInt(bno));
		
		String[] hash=vo.getHashtag().split(",");
		CommuneVO pvo=CommuneDAO.communePoster(vo.getId());
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		// 아이디 세션으로 포스터 가져오기
		if(id != null) {
			String poster=CommuneDAO.communePoster1(id);
			request.setAttribute("poster", poster);
			System.out.println(poster);
		}
		
		//댓글 작업
		  ReplyVO rvo=new ReplyVO();
		  rvo.setRno(Integer.parseInt(bno));
		  List<ReplyVO> rlist=ReplyDAO.replyListData(Integer.parseInt(bno));
		  int count=ReplyDAO.replyCount(Integer.parseInt(bno));
		  request.setAttribute("count", count);
		  request.setAttribute("rList", rlist);
		 
		 //////////////////////////////////////////////////
		 //게시글 좋아요 누른 상태인지 아닌지 확인
		  if (id != null) {
			    // 좋아요 상태 확인 
			    JjimVO likeVO = new JjimVO();
			    likeVO.setId(id);
			    likeVO.setBno(Integer.parseInt(bno));
			    likeVO.setType("1");
			    int jcount1 = JjimDAO.jjimCheckCount(likeVO);
			    request.setAttribute("jcount1", jcount1);

			    // 찜하기 상태 확인 
			    JjimVO jjimVO = new JjimVO();
			    jjimVO.setId(id);
			    jjimVO.setBno(Integer.parseInt(bno));
			    jjimVO.setType("2");
			    int jcount2 = JjimDAO.jjimCheckCount(jjimVO);
			    request.setAttribute("jcount2", jcount2);

			}
		  /////////////////////////////////////////////
		
		request.setAttribute("hash", hash);
		request.setAttribute("vo", vo);
		request.setAttribute("pvo", pvo);
		request.setAttribute("main_jsp", "../interview/commune_detail.jsp");
		return "../main/main.jsp";
	}
	
	
	
	
	// 업데이트
	@RequestMapping("interview/commune_update.do")
	public String qna_update(HttpServletRequest request, HttpServletResponse response) {
		String bno=request.getParameter("bno");
		CommuneVO vo=CommuneDAO.CommuneUpdateData(Integer.parseInt(bno));
		String[] hashtag = vo.getHashtag().split(",");
		
		request.setAttribute("vo", vo);
		request.setAttribute("hashtag",hashtag);
		request.setAttribute("main_jsp", "../interview/commune_update.jsp");
		return "../main/main.jsp";
	}	
	
	//ajax로 처리 void 리다이렉트 없음 
	@RequestMapping("interview/commune_update_ok.do")
	public void commune_update_ok(HttpServletRequest request, HttpServletResponse response) {
		
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String bno=request.getParameter("bno");
		String[] hashtag =request.getParameterValues("hashtag");
		
		String hash = "";
	    if (hashtag != null) {
	        hash = String.join(",", hashtag); // 콤마(,)로 구분해서 저장
	    }
		
		CommuneVO vo=new CommuneVO();
		vo.setBno(Integer.parseInt(bno));
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setHashtag(hash);
		CommuneDAO.communeUpdate(vo);
		
	}
	
	// 삭제 
	@RequestMapping("interview/commune_delete.do")
	public String qna_delete(HttpServletRequest request, HttpServletResponse response) {
			
		String bno=request.getParameter("bno");
		CommuneDAO.communeDelete(Integer.parseInt(bno));
		
		return "redirect:../interview/commune.do?msg=delete";
	}
	
	  
}
