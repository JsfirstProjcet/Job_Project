package com.sist.vo;

import java.util.*;

public class CompanyVO {
	private int ecount,take,cno,fo_count,jo,uk,man;
	private String cid,name,introduction,c_type,industry,
				representative,homepage,bu_details,address,history,
				access_key,poster,sample,dbestdate;
	private Date estdate;
	private OfficialVO vo=new OfficialVO();
	
	
	public int getJo() {
		return jo;
	}
	public void setJo(int jo) {
		this.jo = jo;
	}
	public int getUk() {
		return uk;
	}
	public void setUk(int uk) {
		this.uk = uk;
	}
	public int getMan() {
		return man;
	}
	public void setMan(int man) {
		this.man = man;
	}
	public int getFo_count() {
		return fo_count;
	}
	public void setFo_count(int fo_count) {
		this.fo_count = fo_count;
	}
	public OfficialVO getVo() {
		return vo;
	}
	public void setVo(OfficialVO vo) {
		this.vo = vo;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public Date getEstdate() {
		return estdate;
	}
	public void setEstdate(Date estdate) {
		this.estdate = estdate;
	}
	public String getDbestdate() {
		return dbestdate;
	}
	public void setDbestdate(String dbestdate) {
		this.dbestdate = dbestdate;
	}
	public int getEcount() {
		return ecount;
	}
	public void setEcount(int ecount) {
		this.ecount = ecount;
	}
	public int getTake() {
		return take;
	}
	public void setTake(int take) {
		this.take = take;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getC_type() {
		return c_type;
	}
	public void setC_type(String c_type) {
		this.c_type = c_type;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getRepresentative() {
		return representative;
	}
	public void setRepresentative(String representative) {
		this.representative = representative;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getBu_details() {
		return bu_details;
	}
	public void setBu_details(String bu_details) {
		this.bu_details = bu_details;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public String getAccess_key() {
		return access_key;
	}
	public void setAccess_key(String access_key) {
		this.access_key = access_key;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getSample() {
		return sample;
	}
	public void setSample(String sample) {
		this.sample = sample;
	}

}
