package vo;

import java.util.Date;

/*
  "bno"	NUMBER		NOT NULL,
	"subject"	VARCHAR2(200 BYTE)		NOT NULL,
	"content"	CLOB		NOT NULL,
	"regdate"	DATE	DEFAULT SYSDATE	NULL,
	"hit"	NUMBER	DEFAULT 0	NULL,
	"type"	NUMBER	DEFAULT 0	NULL,
	"reply"	NUMBER	DEFAULT 0	NULL,
	"like"	NUMBER	DEFAULT 0	NULL,
	"id"	VARCHAR2(10 BYTE)		NOT NULL,
	"nickname"	VARCHAR2(60 BYTE)		NULL
 */
public class CommunityVO {

  private int bno;
  private int hit;
  private int type;

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

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }

  private int reply;
  private int likes;
  private String id, nickname, subject, content;
  private Date regdate;

}
