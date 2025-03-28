package com.sist.model;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.dao.*;

@Controller
public class CompanyModel {
	//								  0 지원금/보험	  1 급여 2 선물  3 교육/생활  4 근무환경		5 조직 문화		6 출퇴근		7 리프레시
	List<String> icons=Arrays.asList("inboxes-fill","coin","gift","book","building-check","emoji-laughing","bus-front","airplane",
	//		8 지도	9 연혁			10 기업형태	11 사원수				12 매출
			"map","clock-history","buildings","person-plus-fill","currency-exchange");
	List<String> ctype=Arrays.asList("1000대기업","대기업","중견기업","중소기업","스타트업","개인사업자","기타");
	@RequestMapping("company/com_list.do")
	public String com_list(HttpServletRequest request, HttpServletResponse response) {

		String page=request.getParameter("page");
		if(page==null){
 			page="1";
 		}
		int curpage=Integer.parseInt(page);

 		String tab=request.getParameter("tab");
 		if(tab==null) {
 			tab="all";
 		}
 
 		Map<String , Object> map=new HashMap<>();
		map.put("start", (curpage*12)-11);
		map.put("end",curpage*12);
		map.put("tab", tab);
		List<CompanyVO> list=CompanyDAO.companyListData(map);
		int totalpage=CompanyDAO.companyTotalPage(tab);
	  
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  
		if(endPage>totalpage)
			endPage=totalpage;
	  
		request.setAttribute("list", list);
		request.setAttribute("tab", tab);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../company/com_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("company/com_detail_before.do")
	public String com_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		String cno=request.getParameter("cno");
		Cookie cookie=new Cookie("com_"+cno, cno);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		// 전송	 
		response.addCookie(cookie);
  
		// 화면 이동 
		return "redirect:com_detail.do?cno="+cno;
	}
	@RequestMapping("company/com_detail.do")
	public String com_detail(HttpServletRequest request, HttpServletResponse response) {
		
		String cno=request.getParameter("cno");
		CompanyVO vo=CompanyDAO.comDetailData(Integer.parseInt(cno));
		if(vo.getIntroduction()!=null) {
			String str=vo.getIntroduction().replaceAll("다\\.", "다.<br>");
			vo.setIntroduction(str);
		}
		List<HistoryVO> hList=HistoryDAO.comHistoryList(vo.getCid());
		List<HistoryVO> yList=HistoryDAO.comHistoryYMList(vo.getCid());
		
		try {
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat newDtFormat = new SimpleDateFormat("YYYY년MM월dd일");
			
			Date formatDate = dtFormat.parse(vo.getDbestdate());
			
			vo.setDbestdate(newDtFormat.format(formatDate));
		} catch (Exception e) {
		}
		List<WelfareVO> wList=CompanyDAO.comDetailWelfareData(vo.getCid());
		List<WelfareVO> wTag=CompanyDAO.comDetailWelfareTag(vo.getCid());
		
		request.setAttribute("vo", vo);
		request.setAttribute("icons", icons);
		request.setAttribute("hList", hList);
		request.setAttribute("yList", yList);
		request.setAttribute("wList", wList);
		request.setAttribute("wTag", wTag);
		request.setAttribute("com_title", "기업 상세");
		request.setAttribute("com_jsp", "../company/com_detail.jsp");
		request.setAttribute("main_jsp", "../company/com_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("company/com_emp_list.do")
	public String com_emp_list(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		CompanyVO vo=CompanyDAO.comDetailData(Integer.parseInt(cno));
		
		request.setAttribute("vo", vo);
		request.setAttribute("com_title", "공고 목록");
		request.setAttribute("com_jsp", "../company/com_emp_list.jsp");
		request.setAttribute("main_jsp", "../company/com_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("company/com_emp_list_print.do")
	public void com_emp_list_print(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		String type=request.getParameter("type");
		String ph=request.getParameter("ph");
		String page=request.getParameter("page");
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		
		int mode=0;//0 진행중 1//마감된
		if(Integer.parseInt(type)==-1&&Integer.parseInt(ph)==-1) {
			mode=1;
		}
		
		Map map=new HashMap();
		map.put("cno", Integer.parseInt(cno));
		map.put("type", Integer.parseInt(type));
		map.put("ph", Integer.parseInt(ph));
		map.put("start",(curpage*5)-4);
		map.put("end",curpage*5);
		map.put("mode", mode);
		
		List<EmpVO> list=EmpDAO.empComListData(map);
		int count=EmpDAO.empComCount(map);
		
		
		int totalpage=(int)(Math.ceil(count/5.0));
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage) endPage=totalpage;
		
		for(EmpVO vo:list) {
			// D-day 표시
			int d=vo.getDtype();
			if(mode==0&&d<0) {
				vo.setDbdeadline("상시 채용");
			}else if(mode==0&&d==0) {
				vo.setDbdeadline("D-day");
			}else if(d>0&&d<=7) {
				vo.setDbdeadline("D-"+d);
			}else {
				try {
					SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat newDtFormat = new SimpleDateFormat("MM월dd일(E)");
					
					Date formatDate = dtFormat.parse(vo.getDbdeadline());
					
					vo.setDbdeadline("~"+newDtFormat.format(formatDate));
				} catch (Exception e) {
				}
			}
			
			// 근무지가 복수일경우 처리
			if(vo.getLoc()!=null) {
				vo.setLoc(vo.getLoc().replaceAll(",", " |"));
			}
		}
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		// JSON변경
		JSONArray arr=new JSONArray();
		//eno,name,title,personal_history,loc,emp_type,hit,dbregdate,dbdeadline,fo_count,se_count,dtype,rtype
		for(EmpVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("eno", vo.getEno());
			obj.put("name", vo.getName());
			obj.put("title", vo.getTitle());
			obj.put("personal_history", vo.getPersonal_history());
			obj.put("loc", vo.getLoc());
			obj.put("emp_type", vo.getEmp_type());
			obj.put("hit", vo.getHit());
			obj.put("dbregdate", vo.getDbregdate());
			obj.put("dbdeadline", vo.getDbdeadline());
			obj.put("fo_count", vo.getFo_count());
			obj.put("se_count", vo.getSe_count());
			if(arr.size()==0) {
				obj.put("mode",mode);
				obj.put("curpage",curpage);
				obj.put("totalpage",totalpage);
				obj.put("startPage",startPage);
				obj.put("endPage",endPage);
				if(mode==0) {
					map.put("ph", 0);
					int e_count0=EmpDAO.empComCount(map);
					map.put("ph", 1);
					int e_count1=EmpDAO.empComCount(map);
					map.put("ph", 2);
					int e_count2=EmpDAO.empComCount(map);
					
					obj.put("e_count0",e_count0);
					obj.put("e_count1",e_count1);
					obj.put("e_count2",e_count2);
				}else if(mode==1) {
					obj.put("ed_count",count);
				}
			}
			int check=0;
			int fCount=0;
			FollowVO fvo=new FollowVO();
			fvo.setId(id);
			fvo.setNo(vo.getEno());
			fvo.setType(1);
			fCount=FollowDAO.followCount(fvo);
			if(id!=null) {
				try {
					check=FollowDAO.followCheck(fvo);
				} catch (Exception e) {
				}
			}
			obj.put("check", check);
			obj.put("fCount", fCount);
			arr.add(obj);
		}
		// 전송
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		} catch (Exception e) {}
	}
	@RequestMapping("company/com_find.do")
	public String com_find(HttpServletRequest request, HttpServletResponse response) {
	    String page = request.getParameter("page");
	    if (page == null) {
	        page = "1";
	    }
	    
	    int curpage = Integer.parseInt(page);
 
	    String keyword = request.getParameter("keyword"); 
	    if (keyword == null || keyword.isEmpty()) {
	        keyword = "";
	    }
	    String c_type = request.getParameter("c_type");
	    if (c_type == null || c_type.isEmpty()) {
	    	c_type = null;
	    }	    
	    String address = request.getParameter("address");
	    if (address == null || address.isEmpty()) {
	    	address = null;
	    }	    

	    Map map = new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end",curpage*12);
	    map.put("keyword", keyword);           
	    map.put("c_type", c_type);            
	    map.put("address", address);           

		List<CompanyVO> list=CompanyDAO.companyFindData(map);
		int totalpage=CompanyDAO.companyFindTotalPage(map);
	  
	    final int BLOCK = 10;  
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;

	    if (endPage > totalpage) {
	        endPage = totalpage;
	    }
	    
	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../company/com_find.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("company/com_main.do")
	public String com_main(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cid=(String)session.getAttribute("cid");
		int state=-1;
		if(session.getAttribute("state")!=null) {
			state=(int)session.getAttribute("state");
		}
		
		int cno=0;
		
		try {
			cno=CompanyDAO.conByCid(cid);
		} catch (Exception e) {}
		if(state==-1) {//기업계정이 아닌 경우
			String msg="기업계정으로 로그인 후 이용해주세요";
			request.setAttribute("msg", msg);
			request.setAttribute("main_jsp", "../company/com_error.jsp");
			return "../main/main.jsp";
		}else if(state==0) {//승인받지 못한 기업계정
			String msg="승인 후 이용해주세요";
			request.setAttribute("msg", msg);
			request.setAttribute("main_jsp", "../company/com_error.jsp");
			return "../main/main.jsp";
		}else if(state==2) {//정지당한 기업계정
			String msg="정지된 계정입니다<br>관리자에게 문의해주세요";
			request.setAttribute("msg", msg);
			request.setAttribute("main_jsp", "../company/com_error.jsp");
			return "../main/main.jsp";
		}else if(state==1&&cno==0) {
			String msg="등록된 기업정보가 없습니다";
			request.setAttribute("msg", msg);
			request.setAttribute("main_jsp", "../company/com_error.jsp");
			return "../main/main.jsp";
		}
		return "redirect:../company/com_detail.do?cno="+cno;
	}
	@RequestMapping("company/com_insert.do")
	public String com_insert(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		String cname=OfficialDAO.officialDetailData(cid).getCname();
		
		CompanyVO vo=new CompanyVO();
		vo.setCid(cid);
		vo.setName(cname);
		
		CompanyDAO.comInsert(vo);
		
		int cno=CompanyDAO.conByCid(cid);
		
		return "redirect:../company/com_detail.do?cno="+cno;
	}
	@RequestMapping("company/com_update.do")
	public String com_update(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		
		CompanyVO vo=CompanyDAO.comDetailData(Integer.parseInt(cno));
		List<WelfareVO> wList=CompanyDAO.comUpdateWelfareData(vo.getCid());
		List<WelfareVO> tList=CompanyDAO.comUpdateWelfareTag();
		
		request.setAttribute("com_title", "기업 정보 수정");
		request.setAttribute("vo", vo);
		request.setAttribute("icons", icons);
		request.setAttribute("wList", wList);
		request.setAttribute("tList", tList);
		request.setAttribute("ctype", ctype);
		request.setAttribute("com_jsp", "../company/com_update.jsp");
		request.setAttribute("main_jsp", "../company/com_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("company/com_update_ok.do")
	public String com_update_ok(HttpServletRequest request, HttpServletResponse response) {
		String estdate=request.getParameter("estdate");
		String representative=request.getParameter("representative").trim();
		String c_type=request.getParameter("c_type");
		String homepage=request.getParameter("homepage").trim();
		String ecount=request.getParameter("ecount");
		String jo=request.getParameter("jo");
		String uk=request.getParameter("uk");
		String man=request.getParameter("man");
		String address=request.getParameter("address").trim();
		String industry=request.getParameter("industry").trim();
		String bu_details=request.getParameter("bu_details").trim();
		String introduction=request.getParameter("introduction").trim();
		
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		int cno=CompanyDAO.conByCid(cid);
		
		CompanyVO vo=new CompanyVO();
		vo.setCid(cid);
		vo.setDbestdate(estdate);
		vo.setRepresentative(representative);
		vo.setC_type(c_type);
		vo.setHomepage(homepage);
		vo.setEcount(Integer.parseInt(ecount));
		vo.setJo(Integer.parseInt(jo));
		vo.setUk(Integer.parseInt(uk));
		vo.setMan(Integer.parseInt(man));
		vo.setAddress(address);
		vo.setIndustry(industry);
		vo.setBu_details(bu_details);
		vo.setIntroduction(introduction);
		
		CompanyDAO.comUpdate(vo);
		
		return "redirect:../company/com_update.do?cno="+cno;
	}
	@RequestMapping("company/com_wel_insert.do")
	public void com_wel_insert(HttpServletRequest request, HttpServletResponse response) {
		String wno=request.getParameter("wno");
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		
		WelfareVO vo=new WelfareVO();
		vo.setCid(cid);
		vo.setWno(Integer.parseInt(wno));
		
		CompanyDAO.comWelfareInsert(vo);
	}
	@RequestMapping("company/com_wel_delete.do")
	public void com_wel_delete(HttpServletRequest request, HttpServletResponse response) {
		String wno=request.getParameter("wno");
		HttpSession session=request.getSession();
		String cid=(String)session.getAttribute("cid");
		
		WelfareVO vo=new WelfareVO();
		vo.setCid(cid);
		vo.setWno(Integer.parseInt(wno));
		
		CompanyDAO.comWelfareDelete(vo);
	}
}
