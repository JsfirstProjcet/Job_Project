package vo;

import java.util.Date;

/*
  "rno"	NUMBER		NOT NULL,
	"type"	NUMBER	DEFAULT 0	NULL,
	"regdate"	DATE	DEFAULT SYSDATE	NULL,
	"review"	VARCHAR2(4000 BYTE)		NULL,
	"id"	VARCHAR2(10 BYTE)		NOT NULL,
	"cid"	VARCHAR2(10 BYTE)		NOT NULL
 */
public class ReviewVO {

  private int rno, type;
  private String id;

  public String getCid() {
    return cid;
  }

  public void setCid(String cid) {
    this.cid = cid;
  }

  public int getRno() {
    return rno;
  }

  public void setRno(int rno) {
    this.rno = rno;
  }

  public int getType() {
    return type;
  }

  public void setType(int type) {
    this.type = type;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getReview() {
    return review;
  }

  public void setReview(String review) {
    this.review = review;
  }

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }

  private String cid;
  private String review;
  private Date regdate;

}
