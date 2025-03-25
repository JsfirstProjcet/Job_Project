package vo;

import java.util.Date;

/*
  "rno"	NUMBER		NOT NULL,
	"bno"	NUMBER		NOT NULL,
	"msg"	CLOB		NOT NULL,
	"regdate"	DATE	DEFAULT SYSDATE	NULL,
	"group_id"	NUMBER		NULL,
	"group_step"	NUMBER	DEFAULT 0	NULL,
	"group_tap"	NUMBER	DEFAULT 0	NULL,
	"id"	VARCHAR2(10 BYTE)		NOT NULL,
	"nickname"	VARCHAR2(60 BYTE)		NULL
 */
public class ReplyVO {

  private int rno;
  private int bno;

  public int getGroup_id() {
    return group_id;
  }

  public void setGroup_id(int group_id) {
    this.group_id = group_id;
  }

  public int getRno() {
    return rno;
  }

  public void setRno(int rno) {
    this.rno = rno;
  }

  public int getBno() {
    return bno;
  }

  public void setBno(int bno) {
    this.bno = bno;
  }

  public int getGroup_step() {
    return group_step;
  }

  public void setGroup_step(int group_step) {
    this.group_step = group_step;
  }

  public int getGroup_tap() {
    return group_tap;
  }

  public void setGroup_tap(int group_tap) {
    this.group_tap = group_tap;
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

  public String getMsg() {
    return msg;
  }

  public void setMsg(String msg) {
    this.msg = msg;
  }

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }

  private int group_id;
  private int group_step;
  private int group_tap;
  private String id, nickname, msg;
  private Date regdate;

}
