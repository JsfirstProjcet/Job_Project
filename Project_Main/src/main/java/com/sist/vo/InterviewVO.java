package com.sist.vo;

import java.util.Date;
import java.util.List;

/*
INO	NUMBER
TITLE	VARCHAR2(200 BYTE)
SUB_TITLE	VARCHAR2(500 BYTE)
COMPANY	VARCHAR2(500 BYTE)
DEPARTMENT	VARCHAR2(500 BYTE)
NAME	VARCHAR2(200 BYTE)
IDATE	DATE
HIT	NUMBER
POSTER	VARCHAR2(500 BYTE)
MAIN_POSTER	VARCHAR2(500 BYTE)
SUB_POSTER	VARCHAR2(500 BYTE)
CID	VARCHAR2(10 BYTE)
QUESTION	CLOB
ANSWER	CLOB
PASTIMG	CLOB
 */

public class InterviewVO {
	private int ino,hit;
	private String title,sub_title,company,department,name,poster,main_poster,sub_poster,cid,question,answer,pastimg;
	private String idate;
	private List<String> categoryList; 
	public List<String> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<String> categoryList) {
		this.categoryList = categoryList;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSub_title() {
		return sub_title;
	}
	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getMain_poster() {
		return main_poster;
	}
	public void setMain_poster(String main_poster) {
		this.main_poster = main_poster;
	}
	public String getSub_poster() {
		return sub_poster;
	}
	public void setSub_poster(String sub_poster) {
		this.sub_poster = sub_poster;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getIdate() {
		return idate;
	}
	public void setIdate(String idate) {
		this.idate = idate;
	}
	public String getPastimg() {
		return pastimg;
	}
	public void setPastimg(String pastimg) {
		this.pastimg = pastimg;
	}
	
	
}
