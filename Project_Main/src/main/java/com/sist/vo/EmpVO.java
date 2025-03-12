package com.sist.vo;

import java.util.*;

public class EmpVO {
	private int eno,salary,education,hit,fo_count,se_count;
	private String name,title,personal_history,loc,emp_type,cid,content,dbregdate,dbdeadline;
	public String getDbregdate() {
		return dbregdate;
	}
	public void setDbregdate(String dbregdate) {
		this.dbregdate = dbregdate;
	}
	public String getDbdeadline() {
		return dbdeadline;
	}
	public void setDbdeadline(String dbdeadline) {
		this.dbdeadline = dbdeadline;
	}
	private Date regdate,deadline;
	private CompanyVO vo=new CompanyVO();
	
	public int getFo_count() {
		return fo_count;
	}
	public void setFo_count(int fo_count) {
		this.fo_count = fo_count;
	}
	public int getSe_count() {
		return se_count;
	}
	public void setSe_count(int se_count) {
		this.se_count = se_count;
	}
	public CompanyVO getVo() {
		return vo;
	}
	public void setVo(CompanyVO vo) {
		this.vo = vo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getEducation() {
		return education;
	}
	public void setEducation(int education) {
		this.education = education;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPersonal_history() {
		return personal_history;
	}
	public void setPersonal_history(String personal_history) {
		this.personal_history = personal_history;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getEmp_type() {
		return emp_type;
	}
	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	
}
