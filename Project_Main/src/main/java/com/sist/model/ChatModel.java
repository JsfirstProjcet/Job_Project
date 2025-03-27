package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ChatDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ChatModel {
   @RequestMapping("chat/chat.do")
   public String chat_chat(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   HttpSession session=request.getSession();
	   String id = (String) session.getAttribute("id");
	   if(id!=null) {
	   String poster=ChatDAO.chatGetPoster(id);
	   request.setAttribute("poster", poster);
	   }
	   
	   
	   
	   request.setAttribute("main_jsp", "../chat/chat.jsp");
	   return "../main/main.jsp";
   }
}