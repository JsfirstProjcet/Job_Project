package com.sist.vo;
/*
 * 
 * BNO      NOT NULL NUMBER        
SUBJECT  NOT NULL VARCHAR2(200) 
CONTENT  NOT NULL CLOB          
REGDATE           DATE          
HIT               NUMBER        
TYPE              NUMBER        
REPLY             NUMBER        
LIKES             NUMBER        
ID       NOT NULL VARCHAR2(10)  
NICKNAME          VARCHAR2(60)  
 */

import java.util.*;

import lombok.Data;

@Data
public class CommuneVO {
	private int bno,hit,type,reply,likes;
	private String subject,content,id,nickname,dbday,hashtag,poster,like_count;
	private Date regdate;
	 
	
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
