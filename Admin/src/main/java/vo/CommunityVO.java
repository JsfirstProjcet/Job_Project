package vo;

import java.util.Date;
import lombok.Data;

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
@Data
public class CommunityVO {

  private int bno, hit, type, reply, likes;
  private String id, nickname, subject, content;
  private Date regdate;

}
