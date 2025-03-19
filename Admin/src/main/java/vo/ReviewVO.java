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
  private String id, cid, review;
  private Date regdate;
  
}
